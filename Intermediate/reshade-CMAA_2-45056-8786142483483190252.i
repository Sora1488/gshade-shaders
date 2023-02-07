#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\CMAA_2.fx"
#line 74
static const uint c_maxLineLength = 128;
#line 125
static const float c_symmetryCorrectionOffset = float( 0.22 );
#line 129
static const float c_dampeningEffect          = float( 0.15 );
#line 137
uniform bool bSharp <
ui_label = "Extra Sharpness";
ui_category = "General Settings";
ui_tooltip = "This settings makes the effect of the AA more sharp overall.";
ui_bind = "CMAA2_EXTRA_SHARPNESS";
> = 0;
#line 144
uniform int iPreset <
ui_type = "slider";
ui_min = 0;
ui_max = 4;
ui_label = "Strength";
ui_category = "General Settings";
ui_tooltip = "This setting adjusts the strength of the edge detection, higher "
"settings come at a performance cost. \n"
"0 - LOW, 1 - MEDIUM, 2 - HIGH, 3 - ULTRA, 4 - SUFFER (default of 2)";
ui_bind = "CMAA2_STATIC_QUALITY_PRESET";
> = 2;
#line 166
uniform bool bDebugEdges <
ui_label = "Debug Edges";
ui_category = "Debugging";
ui_tooltip = "This setting enables an overlay showing the edges detected "
"by the shader.";
ui_bind = "g_CMAA2_DebugEdges";
> = false;
#line 174
namespace CMAA_2
{
texture ZShapes <pooled = true;>{Width = 1920; Height = 1080; Format = RGBA8;};
texture BackBuffer : COLOR;
texture Edges <pooled = true;>{Width = 1920; Height = 1080; Format = R8;};
texture ProcessedCandidates <pooled = true;>{Width = 1920; Height = 1080; Format = RGBA16f;};
#line 181
sampler sZShapes {Texture = ZShapes;};
sampler sBackBuffer {Texture = BackBuffer;};
sampler sEdges {Texture = Edges;};
sampler sProcessedCandidates{Texture = ProcessedCandidates;};
#line 195
texture Sum {Width = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x; Height = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y; Format = RG8;};
texture StackAlloc {Width = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x; Height = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y; Format = R32f;};
texture ZShapeCoords {Width = 1920; Height = (((1080) + (48) - 1) / (48)); Format = R32f;};
#line 199
sampler sSum {Texture = Sum;};
sampler sStackAlloc {Texture = StackAlloc;};
sampler sZShapeCoords {Texture = ZShapeCoords;};
#line 203
storage wSum {Texture = Sum;};
storage wStackAlloc {Texture = StackAlloc;};
storage wZShapeCoords {Texture = ZShapeCoords;};
#line 227
float PackEdges( float4 edges, bool isCandidate )   
{
return (dot( edges, float4( 1, 2, 4, 8 )) + 16 * isCandidate)  / 255;
}
uint4 UnpackEdges( uint value )
{
uint4 ret;
#line 240
ret.x = (value & 0x1) != 0;
ret.y = (value & 0x2) != 0;
ret.z = (value & 0x4) != 0;
ret.w = (value & 0x8) != 0;
#line 245
return uint4(ret);
}
#line 248
float4 UnpackEdgesFlt( uint value )
{
return float4(UnpackEdges(value));
}
#line 253
float4 packZ(bool horizontal, bool invertedZ, float shapeQualityScore, float lineLengthLeft, float lineLengthRight)
{
#line 256
float4 temp;
temp.x = lineLengthLeft;
temp.y = lineLengthRight;
temp.z = shapeQualityScore;
temp.w = horizontal * 2 + invertedZ + 4;
return temp / 255;
}
#line 264
void unpackZ(float4 packedZ, out bool horizontal, out bool invertedZ, out float shapeQualityScore, out float lineLengthLeft, out float lineLengthRight)
{
uint4 temp = packedZ * 255.5;
horizontal = temp.w / 2 % 2;
invertedZ = temp.w % 2;
shapeQualityScore = temp.z;
lineLengthLeft = temp.x;
lineLengthRight = temp.y;
}
#line 275
float2 packSum(uint value)
{
float2 temp;
temp.x = (value & 0xFF00) >> 8;
temp.y = (value & 0xFF);
return (temp) / 255;
}
#line 283
uint unpackSum(float2 value)
{
uint2 temp = value * 255.5;
return ((temp.x << 8) | temp.y);
}
#line 294
float3 LoadSourceColor( uint2 pixelPos, int2 offset )
{
float3 color = tex2Dfetch(sBackBuffer, (pixelPos + offset)).rgb;
return color;
}
#line 305
float GetActualEdgeThreshold( )
{
float retVal = float(0.07);
return retVal;
}
#line 312
float EdgeDetectColorCalcDiff( float3 colorA, float3 colorB )
{
const float3 LumWeights = float3( 0.299, 0.587, 0.114 );
float3 diff = abs( (colorA.rgb - colorB.rgb) );
return dot( diff.rgb, LumWeights.rgb );
}
#line 321
float3 ProcessColorForEdgeDetect( float3 color )
{
#line 325
return sqrt( color ); 
}
#line 333
float RGBToLumaForEdges( float3 linearRGB )
{
#line 342
float luma = dot( sqrt( linearRGB.rgb ), float3( 0.299, 0.587, 0.114 ) );  
#line 344
return luma;
#line 346
}
#line 349
float4 PSComputeEdge(float3 pixelColor,float3 pixelColorRight,float3 pixelColorBottom, float3 pixelColorLeft, float3 pixelColorTop)
{
const float3 LumWeights = float3( 0.299, 0.587, 0.114 );
float4 temp;
temp.x = EdgeDetectColorCalcDiff(pixelColor, pixelColorRight);
temp.y = EdgeDetectColorCalcDiff(pixelColor, pixelColorBottom);
temp.z = EdgeDetectColorCalcDiff(pixelColor, pixelColorLeft);
temp.w = EdgeDetectColorCalcDiff(pixelColor, pixelColorTop);
return temp;    
}
#line 361
float2 PSComputeEdgeLuma(float pixelLuma, float pixelLumaRight, float pixelLumaBottom)
{
float2 temp;
temp.x = abs(pixelLuma - pixelLumaRight);
temp.y = abs(pixelLuma - pixelLumaBottom);
return temp;
}
#line 370
float PSComputeLocalContrast(float leftTop, float rightTop, float leftBottom, float rightBottom)
{
return max(max(max(rightTop, rightBottom), leftTop), leftBottom) * float(float(0.10));
}
#line 377
float4 ComputeSimpleShapeBlendValues( float4 edges, float4 edgesLeft, float4 edgesRight, float4 edgesTop, float4 edgesBottom, const bool dontTestShapeValidity )
{
#line 381
float fromRight   = edges.r;
float fromBelow   = edges.g;
float fromLeft    = edges.b;
float fromAbove   = edges.a;
#line 386
float blurCoeff = float( float(0.10) );
#line 388
float numberOfEdges = dot( edges, float4( 1, 1, 1, 1 ) );
#line 390
float numberOfEdgesAllAround = dot(edgesLeft.bga + edgesRight.rga + edgesTop.rba + edgesBottom.rgb, float3( 1, 1, 1 ) );
#line 393
if( !dontTestShapeValidity )
{
#line 396
if( numberOfEdges == 1 )
blurCoeff = 0;
#line 400
if( numberOfEdges == 2 )
blurCoeff *= ( ( float(1.0) - fromBelow * fromAbove ) * ( float(1.0) - fromRight * fromLeft ) );
}
#line 406
if( numberOfEdges == 2 )
{
blurCoeff *= 0.75;
#line 410
float k = 0.9f;
fromRight   += k * (edges.g * edgesTop.r     * (1.0-edgesLeft.g)   +     edges.a * edgesBottom.r   * (1.0-edgesLeft.a)      );
fromBelow   += k * (edges.b * edgesRight.g   * (1.0-edgesTop.b)    +     edges.r * edgesLeft.g     * (1.0-edgesTop.r)       );
fromLeft    += k * (edges.a * edgesBottom.b  * (1.0-edgesRight.a)  +     edges.g * edgesTop.b      * (1.0-edgesRight.g)     );
fromAbove   += k * (edges.r * edgesLeft.a    * (1.0-edgesBottom.r) +     edges.b * edgesRight.a   *  (1.0-edgesBottom.b)    );
}
#line 424
blurCoeff *= saturate( 1.30 - numberOfEdgesAllAround / 10.0 );
#line 427
return float4( fromLeft, fromAbove, fromRight, fromBelow ) * blurCoeff;
}
#line 430
uint LoadEdge( int2 pixelPos, int2 offset)
{
#line 437
uint edge   = (uint)(tex2Dfetch(sEdges, pixelPos + offset).x * 255.5);
#line 439
return edge;
}
#line 449
void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
texcoord.x = (id == 2) ? 2.0 : 0.0;
texcoord.y = (id == 1) ? 2.0 : 0.0;
position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}
#line 456
void EdgesPS(float4 position : SV_Position, float2 texcoord : TEXCOORD, out float output : SV_TARGET0)
{
float2 coord = position.xy;
float3 a = tex2Dfetch(sBackBuffer, coord + float2(-1, -1)).rgb;
float3 b = tex2Dfetch(sBackBuffer, coord + float2(0, -1)).rgb;
float3 c = tex2Dfetch(sBackBuffer, coord + float2(1, -1)).rgb;
float3 d = tex2Dfetch(sBackBuffer, coord + float2(-1, 0)).rgb;
float3 e = tex2Dfetch(sBackBuffer, coord + float2(0, 0)).rgb;
float3 f = tex2Dfetch(sBackBuffer, coord + float2(1, 0)).rgb;
float3 g = tex2Dfetch(sBackBuffer, coord + float2(-1, 1)).rgb;
float3 h = tex2Dfetch(sBackBuffer, coord + float2(0, 1)).rgb;
float3 i = tex2Dfetch(sBackBuffer, coord + float2(1, 1)).rgb;
#line 469
float4 edges = PSComputeEdge(e, f, h, d, b);
#line 472
float ab = EdgeDetectColorCalcDiff(a, b);
float bc = EdgeDetectColorCalcDiff(b, c);
float de = EdgeDetectColorCalcDiff(d, e);
float gh = EdgeDetectColorCalcDiff(g, h);
float hi = EdgeDetectColorCalcDiff(h, i);
#line 478
float4 localContrast;
localContrast.x = PSComputeLocalContrast(de, edges.y, gh, hi);
localContrast.z = PSComputeLocalContrast(ab, bc, de, edges.y);
#line 483
float ad = EdgeDetectColorCalcDiff(a, d);
float be = EdgeDetectColorCalcDiff(b, e);
float dg = EdgeDetectColorCalcDiff(d, g);
float cf = EdgeDetectColorCalcDiff(c, f);
float fi = EdgeDetectColorCalcDiff(f, i);
#line 490
localContrast.y = PSComputeLocalContrast(be, cf, edges.x, fi);
localContrast.w = PSComputeLocalContrast(ad, be, dg, edges.x);
edges -= localContrast;
#line 495
edges = (edges > GetActualEdgeThreshold()) ? float4(1, 1, 1, 1) : float4(0, 0, 0, 0);
#line 498
bool isCandidate = ( edges.x * edges.y + edges.y * edges.z + edges.z * edges.w + edges.w * edges.x ) != 0;
#line 500
output = PackEdges(edges, isCandidate);
if(!(output > 0))
discard;
}
#line 505
void FindZLineLengths( out float lineLengthLeft, out float lineLengthRight, uint2 screenPos, bool horizontal, bool invertedZShape, const float2 stepRight)
{
#line 511
uint maskLeft, bitsContinueLeft, maskRight, bitsContinueRight;
{
#line 518
uint maskTraceLeft, maskTraceRight;
#line 522
if( horizontal )
{
maskTraceLeft = 0x08; 
maskTraceRight = 0x02; 
#line 530
}
else
{
maskTraceLeft = 0x04; 
maskTraceRight = 0x01; 
#line 539
}
if( invertedZShape )
{
uint temp = maskTraceLeft;
maskTraceLeft = maskTraceRight;
maskTraceRight = temp;
}
maskLeft = maskTraceLeft;
bitsContinueLeft = maskTraceLeft;
maskRight = maskTraceRight;
#line 553
bitsContinueRight = maskTraceRight;
}
#line 557
bool continueLeft = true;
bool continueRight = true;
float maxLR;
lineLengthLeft = 1;
lineLengthRight = 1;
[loop]
while(true)
{
uint edgeLeft =     LoadEdge( screenPos.xy - stepRight * float(lineLengthLeft)          , int2( 0, 0 ));
uint edgeRight =    LoadEdge( screenPos.xy + stepRight * ( float(lineLengthRight) + 1 ) , int2( 0, 0 ));
#line 574
continueLeft    = continueLeft  && ( edgeLeft & maskLeft );
continueRight   = continueRight && ( edgeRight & maskRight  );
#line 578
lineLengthLeft += continueLeft;
lineLengthRight += continueRight;
#line 581
maxLR = max( lineLengthRight, lineLengthLeft );
#line 584
if( !continueLeft && !continueRight )
maxLR = (float)c_maxLineLength;
#line 592
if( maxLR >= min( (float)c_maxLineLength, (1.25 * min( lineLengthRight, lineLengthLeft ) - 0.25) ) )
#line 594
break;
#line 596
}
}
#line 599
void DetectZsHorizontal( in float4 edges, in float4 edgesM1P0, in float4 edgesP1P0, in float4 edgesP2P0, out float invertedZScore, out float normalZScore )
{
#line 605
{
invertedZScore  = edges.r * edges.g *                edgesP1P0.a;
invertedZScore  *= 2.0 + ((edgesM1P0.g + edgesP2P0.a) ) - (edges.a + edgesP1P0.g) - 0.7 * (edgesP2P0.g + edgesM1P0.a + edges.b + edgesP1P0.r);
}
#line 614
{
normalZScore    = edges.r * edges.a *                edgesP1P0.g;
normalZScore    *= 2.0 + ((edgesM1P0.a + edgesP2P0.g) ) - (edges.g + edgesP1P0.a) - 0.7 * (edgesP2P0.a + edgesM1P0.g + edges.b + edgesP1P0.r);
}
}
#line 620
void ProcessEdges0PS(float4 position : SV_Position, float2 texcoord : TEXCOORD, out float4 output : SV_TARGET0, out float4 ZShapes : SV_TARGET1)
{
float2 coord = position.xy;
uint center = LoadEdge(coord, int2(0, 0));
output = 0;
ZShapes = 0;
if(center < 16)
discard;
if(center > 16)
{
#line 631
float4 edges = UnpackEdges(center);
float4 edgesLeft = UnpackEdgesFlt(LoadEdge(coord, int2(-1, 0)));
float4 edgesRight = UnpackEdgesFlt(LoadEdge(coord, int2(1, 0)));
float4 edgesBottom = UnpackEdgesFlt(LoadEdge(coord, int2(0, 1)));
float4 edgesTop = UnpackEdgesFlt(LoadEdge(coord, int2(0, -1)));
#line 637
float4 blendVal = ComputeSimpleShapeBlendValues(edges, edgesLeft, edgesRight, edgesTop, edgesBottom, true);
#line 639
const float fourWeightSum = dot(blendVal, 1);
const float centerWeight = 1 - fourWeightSum;
#line 642
float3 outColor = LoadSourceColor(coord, int2(0, 0)).rgb * centerWeight;
#line 644
float3 pixel;
#line 647
pixel = LoadSourceColor(coord, int2(-1, 0)).rgb;
outColor.rgb += (blendVal.x > 0) ? blendVal.x * pixel : 0;
#line 651
pixel = LoadSourceColor(coord, int2(0, -1)).rgb;
outColor.rgb += (blendVal.y > 0) ? blendVal.y * pixel : 0;
#line 655
pixel = LoadSourceColor(coord, int2(1, 0)).rgb;
outColor.rgb += (blendVal.z > 0) ? blendVal.z * pixel : 0;
#line 659
pixel = LoadSourceColor(coord, int2(0, 1)).rgb;
outColor.rgb += (blendVal.w > 0) ? blendVal.w * pixel : 0;
#line 662
output = float4(outColor.rgb, 1);
#line 665
{
float invertedZScore;
float normalZScore;
float maxScore;
bool horizontal = true;
bool invertedZ = false;
#line 675
{
float4 edgesM1P0 = edgesLeft;
float4 edgesP1P0 = edgesRight;
float4 edgesP2P0 = UnpackEdges( tex2Dfetch(sEdges, coord + int2(  2, 0 )).x * 255.5 );
#line 680
DetectZsHorizontal( edges, edgesM1P0, edgesP1P0, edgesP2P0, invertedZScore, normalZScore );
maxScore = max( invertedZScore, normalZScore );
#line 683
if( maxScore > 0 )
{
invertedZ = invertedZScore > normalZScore;
}
}
#line 692
{
#line 700
float4 edgesM1P0 = edgesBottom;
float4 edgesP1P0 = edgesTop;
float4 edgesP2P0 =  UnpackEdges( tex2Dfetch(sEdges, coord + int2( 0, -2 )).x * 255.5 );
#line 704
DetectZsHorizontal( edges.argb, edgesM1P0.argb, edgesP1P0.argb, edgesP2P0.argb, invertedZScore, normalZScore );
float vertScore = max( invertedZScore, normalZScore );
#line 707
if( vertScore > maxScore )
{
maxScore = vertScore;
horizontal = false;
invertedZ = invertedZScore > normalZScore;
#line 713
}
}
#line 717
if( maxScore > 0 )
{
#line 722
float shapeQualityScore = floor( clamp(4.0 - maxScore, 0.0, 3.0) );    
#line 725
const float2 stepRight = ( horizontal ) ? ( float2( 1, 0 ) ) : ( float2( 0, -1 ) );
float lineLengthLeft, lineLengthRight;
FindZLineLengths( lineLengthLeft, lineLengthRight, coord, horizontal, invertedZ, stepRight);
#line 729
lineLengthLeft  -= shapeQualityScore;
lineLengthRight -= shapeQualityScore;
bool isZShape = ( lineLengthLeft + lineLengthRight ) >= (5.0);
if( ( lineLengthLeft + lineLengthRight ) >= (5.0) )
{
#line 735
float4 store = packZ(horizontal, invertedZ, shapeQualityScore, lineLengthLeft, lineLengthRight);
ZShapes = (store);
return;
}
}
#line 741
}
}
}
#line 746
groupshared uint count;
void SumCS(uint3 id : SV_DispatchThreadID, uint3 gid : SV_GroupID, uint3 gtid : SV_GroupThreadID)
{
if(all(gtid.xy == 0))
count = 0;
barrier();
#line 753
uint2 coord = id.xy * 2;
float4 values = tex2DgatherA(sZShapes, float2(coord + 1) / float2(1920, 1080));
float4 candidates = (values > (3.9f / 255.0f)) ? float4(1, 1, 1, 1) : float4(0, 0, 0, 0);
uint localSum = dot(candidates, 1);
atomicAdd(count, localSum);
barrier();
#line 760
if(all(gtid.xy == 0))
{
tex2Dstore(wSum, gid.xy, packSum(count).xyxx);
}
}
#line 766
void StackAllocCS(uint3 id : SV_DispatchThreadID, uint3 gid : SV_GroupID, uint3 gtid : SV_GroupThreadID)
{
if(all(gtid.xy == 0))
count = 0;
barrier();
uint index = id.x * (((((uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x * uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y)) + ((1024)) - 1) / ((1024))));
uint localPrefixSum[(((((uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x * uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y)) + ((1024)) - 1) / ((1024))))];
localPrefixSum[0] = unpackSum(tex2Dfetch(sSum, uint2(index % uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x, index / uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x)).xy);
[unroll]
for(int i = 1; i < (((((uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x * uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y)) + ((1024)) - 1) / ((1024)))); i++)
{
uint2 sampleCoord = uint2((index + i) % uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x, (index + i) / uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x);
localPrefixSum[i] = unpackSum(tex2Dfetch(sSum, sampleCoord).xy) + localPrefixSum[i - 1];
}
#line 781
uint baseCount = atomicAdd(count, localPrefixSum[(((((uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x * uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y)) + ((1024)) - 1) / ((1024)))) - 1]);
#line 783
tex2Dstore(wStackAlloc, uint2(index % uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x, index / uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x), asfloat(baseCount).xxxx);
[unroll]
for(int i = 1; i < (((((uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x * uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y)) + ((1024)) - 1) / ((1024)))); i++)
{
uint2 sampleCoord = uint2((index + i) % uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x, (index + i) / uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x);
tex2Dstore(wStackAlloc, sampleCoord, asfloat(baseCount + localPrefixSum[i - 1]).xxxx);
}
}
#line 792
void StackInsertionCS(uint3 id : SV_DispatchThreadID, uint3 gid : SV_GroupID, uint3 gtid : SV_GroupThreadID)
{
if(all(gtid.xy == 0))
count = 0;
barrier();
#line 798
uint writeAddress = asuint(tex2Dfetch(sStackAlloc, gid.xy).x);
#line 800
uint2 coord = id.xy * 2;
float4 values = tex2DgatherA(sZShapes, float2(coord + 1) / float2(1920, 1080));
float4 candidates = (values > (3.9f / 255.0f)) ? float4(1, 1, 1, 1) : float4(0, 0, 0, 0);
uint localSum = dot(candidates, 1);
uint localOffset = atomicAdd(count, localSum);
uint j = 0;
[unroll]
for(int i = 0; i < 4; i++)
{
if(bool(candidates[i]))
{
uint address = writeAddress + localOffset + j;
uint2 currCoord = (i == 0) ? uint2(coord.x, coord.y + 1) :
(i == 1) ? uint2(coord.x + 1, coord.y + 1) :
(i == 2) ? uint2(coord.x + 1, coord.y) : coord;
uint packedCoord = (currCoord.x << 16 | currCoord.y);
tex2Dstore(wZShapeCoords, uint2(address % 1920, address / 1920), asfloat(packedCoord).xxxx);
j++;
}
}
}
#line 823
void LongEdgeVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0, out float4 data : TANGENT0)
{
#line 826
uint packedCoord = asuint(tex2Dfetch(sZShapeCoords, uint2((id / 2) % 1920, (id / 2) / 1920))).x;
uint2 coord = uint2((packedCoord >> 16), (packedCoord & 0xFFFF));
#line 853
data = tex2Dfetch(sZShapes, coord);
#line 856
if(!(data.w > (3.9f / 255.0f)))
{
position = -10;
texcoord = -10;
return;
}
else
{
bool horizontal;
bool invertedZ;
float shapeQualityScore;
float lineLengthLeft;
float lineLengthRight;
unpackZ(data, horizontal, invertedZ, shapeQualityScore, lineLengthLeft, lineLengthRight);
float loopFrom = -floor( ( lineLengthLeft + 1 ) / 2 ) + 1.0;
float loopTo = floor( ( lineLengthRight + 1 ) / 2 );
const float2 stepRight = ( horizontal ) ? ( float2( 1, 0 ) ) : ( float2( 0, -1 ) );
float2 offset = (id % 2) ? stepRight * loopTo : stepRight * loopFrom;
texcoord.xy = (float2(coord + offset) + 0.5) / float2(1920, 1080);
position = float4(texcoord.xy * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
texcoord = (id % 2) ? loopTo : loopFrom;
}
}
#line 880
void LongEdgePS(float4 position : SV_Position, float2 texcoord : TEXCOORD0, float4 info : TANGENT0, out float4 output : SV_TARGET0)
{
output = 1;
bool horizontal;
bool invertedZShape;
float shapeQualityScore;
float lineLengthLeft;
float lineLengthRight;
unpackZ(info, horizontal, invertedZShape, shapeQualityScore, lineLengthLeft, lineLengthRight);
float2 blendDir = ( horizontal ) ? ( float2( 0, -1 ) ) : ( float2( -1, 0 ) );
float i = (horizontal) ? texcoord.x : texcoord.y;
if( invertedZShape )
blendDir = -blendDir;
#line 894
float leftOdd = c_symmetryCorrectionOffset * float( lineLengthLeft % 2 );
float rightOdd = c_symmetryCorrectionOffset * float( lineLengthRight % 2 );
#line 897
float dampenEffect = saturate( float(lineLengthLeft + lineLengthRight - shapeQualityScore) * c_dampeningEffect ) ;
#line 899
float loopFrom = -floor( ( lineLengthLeft + 1 ) / 2 ) + 1.0;
float loopTo = floor( ( lineLengthRight + 1 ) / 2 );
#line 902
float totalLength = float(loopTo - loopFrom) + 1 - leftOdd - rightOdd;
float lerpStep = float(1.0) / totalLength;
#line 905
float lerpFromK = (0.5 - leftOdd - loopFrom) * lerpStep;
#line 907
float lerpVal = lerpStep * (i) + lerpFromK;
#line 909
float secondPart = (i > 0);
float srcOffset = 1.0 - (secondPart * 2.0);
#line 912
float lerpK = (lerpStep * i + lerpFromK) * srcOffset + secondPart;
lerpK *= dampenEffect;
float3 colorCenter = LoadSourceColor(position.xy, int2(0, 0));
float3 colorFrom = LoadSourceColor(position.xy + blendDir * float(srcOffset).xx, int2( 0, 0 )).rgb;
output.rgb = lerp(colorCenter.rgb, colorFrom.rgb, lerpK);
output *= 2.25;
}
#line 920
void ApplyPS(float4 position : SV_Position, float2 texcoord : TEXCOORD, out float4 output : SV_TARGET)
{
float2 coord = position.xy;
output = tex2Dfetch(sProcessedCandidates, coord);
#line 931
output.rgb /= output.a;
#line 937
}
#line 940
void ClearVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
position = -3;
texcoord = -1;
}
#line 946
void ClearPS(float4 position : SV_Position, float2 texcoord : TEXCOORD, out float4 output : SV_TARGET)
{
output = 0;
discard;
}
#line 954
technique CMAA_2 < ui_tooltip = "A port of Intel's CMAA 2.0 (Conservative Morphological Anti-Aliasing) to ReShade\n\n"
"Ported to ReShade by: Lord Of Lunacy";>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = EdgesPS;
RenderTarget = Edges;
ClearRenderTargets = true;
StencilEnable = true;
StencilPass = REPLACE;
StencilRef = 1;
}
#line 968
pass
{
VertexShader = PostProcessVS;
PixelShader = ProcessEdges0PS;
RenderTarget0 = ProcessedCandidates;
RenderTarget1 = ZShapes;
ClearRenderTargets = true;
#line 976
StencilEnable = true;
StencilPass = KEEP;
StencilFunc = EQUAL;
StencilRef = 1;
#line 981
}
#line 983
pass
{
VertexShader = ClearVS;
PixelShader = ClearPS;
RenderTarget = ZShapeCoords;
ClearRenderTargets = true;
}
#line 993
pass
{
ComputeShader = SumCS<uint2(32, 32).x, uint2(32, 32).y>;
DispatchSizeX = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x;
DispatchSizeY = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y;
}
#line 1000
pass
{
ComputeShader = StackAllocCS<(1024), 1>;
DispatchSizeX = 1;
DispatchSizeY = 1;
}
#line 1007
pass
{
ComputeShader = StackInsertionCS<uint2(32, 32).x, uint2(32, 32).y>;
DispatchSizeX = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).x;
DispatchSizeY = uint2((((1920) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).x)), (((1080) + (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y) - 1) / (uint2(uint2(32, 32).x * uint2(2, 2).x, uint2(32, 32).y * uint2(2, 2).y).y))).y;
}
#line 1015
pass
{
VertexShader = LongEdgeVS;
PixelShader = LongEdgePS;
PrimitiveTopology = LINELIST;
#line 1021
VertexCount = (1920 *  (((1080) + (48) - 1) / (48)) * 2);
#line 1027
ClearRenderTargets = false;
#line 1029
BlendEnable = true;
#line 1031
BlendOp = ADD;
BlendOpAlpha = ADD;
#line 1034
SrcBlend = ONE;
SrcBlendAlpha = ONE;
DestBlend = ONE;
DestBlendAlpha = ONE;
#line 1040
RenderTarget = ProcessedCandidates;
}
#line 1043
pass
{
VertexShader = PostProcessVS;
PixelShader = ApplyPS;
#line 1048
BlendEnable = true;
#line 1050
BlendOp = ADD;
BlendOpAlpha = ADD;
#line 1053
SrcBlend = SRCALPHA;
DestBlend = INVSRCALPHA;
#line 1056
StencilEnable = true;
StencilPass = KEEP;
StencilFunc = EQUAL;
StencilRef = 1;
#line 1061
}
#line 1063
}
}

