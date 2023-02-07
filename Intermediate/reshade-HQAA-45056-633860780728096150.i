#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\HQAA.fx"
#line 15
uniform float EdgeThreshold <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
ui_label = "Edge Detection Threshold";
ui_tooltip = "Local contrast required to run shader";
ui_category = "Normal Usage";
> = 0.075;
#line 23
uniform float Subpix <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
ui_label = "Subpixel Effects Strength";
ui_tooltip = "Lower = sharper image, Higher = more AA effect";
ui_category = "Normal Usage";
> = 0.375;
#line 31
uniform int PmodeWarning <
ui_type = "radio";
ui_label = " ";
ui_text ="\n>>>> WARNING <<<<\n\nVirtual Photography mode allows HQAA to exceed its normal\nlimits when processing subpixel aliasing and will probably\nresult in too much blurring for everyday usage.\n\nIt is only intended for virtual photography purposes where\nthe game's UI is typically not present on the screen.";
ui_category = "Virtual Photography";
>;
#line 38
uniform bool Overdrive <
ui_label = "Enable Virtual Photography Mode";
ui_category = "Virtual Photography";
> = false;
#line 43
uniform float SubpixBoost <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
ui_label = "Extra Subpixel Effects Strength";
ui_tooltip = "Additional boost to subpixel aliasing processing";
ui_category = "Virtual Photography";
> = 0.00;
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\HQAA.fxh"
#line 708
float FxaaLuma(float4 rgba) { return rgba.y; }
#line 721
float4 FxaaPixelShader(
#line 725
float2 pos,
#line 731
float4 fxaaConsolePosPos,
#line 737
sampler2D tex,
#line 743
sampler2D fxaaConsole360TexExpBiasNegOne,
#line 749
sampler2D fxaaConsole360TexExpBiasNegTwo,
#line 755
float2 fxaaQualityRcpFrame,
#line 767
float4 fxaaConsoleRcpFrameOpt,
#line 776
float4 fxaaConsoleRcpFrameOpt2,
#line 785
float4 fxaaConsole360RcpFrameOpt2,
#line 797
float fxaaQualitySubpix,
#line 808
float fxaaQualityEdgeThreshold,
#line 823
float fxaaQualityEdgeThresholdMin,
#line 837
float fxaaConsoleEdgeSharpness,
#line 851
float fxaaConsoleEdgeThreshold,
#line 870
float fxaaConsoleEdgeThresholdMin,
#line 877
float4 fxaaConsole360ConstDir
) {
#line 880
float2 posM;
posM.x = pos.x;
posM.y = pos.y;
#line 885
float4 rgbyM = tex2Dlod(tex, float4(posM, 0.0, 0.0));
#line 896
float4 luma4A = tex2DgatherG(tex, posM);
float4 luma4B = tex2DgatherG(tex, posM, float2(-1, -1));
#line 921
float maxSM = max(luma4A.x, rgbyM.y);
float minSM = min(luma4A.x, rgbyM.y);
float maxESM = max(luma4A.z, maxSM);
float minESM = min(luma4A.z, minSM);
float maxWN = max(luma4B.z, luma4B.x);
float minWN = min(luma4B.z, luma4B.x);
float rangeMax = max(maxWN, maxESM);
float rangeMin = min(minWN, minESM);
float rangeMaxScaled = rangeMax * fxaaQualityEdgeThreshold;
float range = rangeMax - rangeMin;
float rangeMaxClamped = max(fxaaQualityEdgeThresholdMin, rangeMaxScaled);
bool earlyExit = range < rangeMaxClamped;
#line 934
if(earlyExit)
#line 938
return rgbyM;
#line 947
float lumaNE = FxaaLuma(tex2Dlod(tex, float4(posM + (float2(1, -1) * fxaaQualityRcpFrame.xy), 0, 0)));
float lumaSW = FxaaLuma(tex2Dlod(tex, float4(posM + (float2(-1, 1) * fxaaQualityRcpFrame.xy), 0, 0)));
#line 951
float lumaNS = luma4B.z + luma4A.x;
float lumaWE = luma4B.x + luma4A.z;
float subpixRcpRange = 1.0/range;
float subpixNSWE = lumaNS + lumaWE;
float edgeHorz1 = (-2.0 * rgbyM.y) + lumaNS;
float edgeVert1 = (-2.0 * rgbyM.y) + lumaWE;
#line 958
float lumaNESE = lumaNE + luma4A.y;
float lumaNWNE = luma4B.w + lumaNE;
float edgeHorz2 = (-2.0 * luma4A.z) + lumaNESE;
float edgeVert2 = (-2.0 * luma4B.z) + lumaNWNE;
#line 963
float lumaNWSW = luma4B.w + lumaSW;
float lumaSWSE = lumaSW + luma4A.y;
float edgeHorz4 = (abs(edgeHorz1) * 2.0) + abs(edgeHorz2);
float edgeVert4 = (abs(edgeVert1) * 2.0) + abs(edgeVert2);
float edgeHorz3 = (-2.0 * luma4B.x) + lumaNWSW;
float edgeVert3 = (-2.0 * luma4A.x) + lumaSWSE;
float edgeHorz = abs(edgeHorz3) + edgeHorz4;
float edgeVert = abs(edgeVert3) + edgeVert4;
#line 972
float subpixNWSWNESE = lumaNWSW + lumaNESE;
float lengthSign = fxaaQualityRcpFrame.x;
bool horzSpan = edgeHorz >= edgeVert;
float subpixA = subpixNSWE * 2.0 + subpixNWSWNESE;
#line 977
if(!horzSpan) luma4B.z = luma4B.x;
if(!horzSpan) luma4A.x = luma4A.z;
if(horzSpan) lengthSign = fxaaQualityRcpFrame.y;
float subpixB = (subpixA * (1.0/12.0)) - rgbyM.y;
#line 982
float gradientN = luma4B.z - rgbyM.y;
float gradientS = luma4A.x - rgbyM.y;
float lumaNN = luma4B.z + rgbyM.y;
float lumaSS = luma4A.x + rgbyM.y;
bool pairN = abs(gradientN) >= abs(gradientS);
float gradient = max(abs(gradientN), abs(gradientS));
if(pairN) lengthSign = -lengthSign;
float subpixC = saturate(abs(subpixB) * subpixRcpRange);
#line 991
float2 posB;
posB.x = posM.x;
posB.y = posM.y;
float2 offNP;
if (!horzSpan)
offNP.x = 0.0;
else
offNP.x = fxaaQualityRcpFrame.x;
if ( horzSpan)
offNP.y = 0.0;
else
offNP.y = fxaaQualityRcpFrame.y;
if(!horzSpan) posB.x += lengthSign * 0.5;
if( horzSpan) posB.y += lengthSign * 0.5;
#line 1006
float2 posN;
posN.x = posB.x - offNP.x * 1.0;
posN.y = posB.y - offNP.y * 1.0;
float2 posP;
posP.x = posB.x + offNP.x * 1.0;
posP.y = posB.y + offNP.y * 1.0;
float subpixD = ((-2.0)*subpixC) + 3.0;
float lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN, 0.0, 0.0)));
float subpixE = subpixC * subpixC;
float lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP, 0.0, 0.0)));
#line 1017
if(!pairN) lumaNN = lumaSS;
float gradientScaled = gradient * 1.0/4.0;
float lumaMM = rgbyM.y - lumaNN * 0.5;
float subpixF = subpixD * subpixE;
bool lumaMLTZero = lumaMM < 0.0;
#line 1023
lumaEndN -= lumaNN * 0.5;
lumaEndP -= lumaNN * 0.5;
bool doneN = abs(lumaEndN) >= gradientScaled;
bool doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 1.0;
if(!doneN) posN.y -= offNP.y * 1.0;
bool doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 1.0;
if(!doneP) posP.y += offNP.y * 1.0;
#line 1033
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 1.0;
if(!doneN) posN.y -= offNP.y * 1.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 1.0;
if(!doneP) posP.y += offNP.y * 1.0;
#line 1047
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 1.0;
if(!doneN) posN.y -= offNP.y * 1.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 1.0;
if(!doneP) posP.y += offNP.y * 1.0;
#line 1061
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 1.0;
if(!doneN) posN.y -= offNP.y * 1.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 1.0;
if(!doneP) posP.y += offNP.y * 1.0;
#line 1075
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 1.5;
if(!doneN) posN.y -= offNP.y * 1.5;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 1.5;
if(!doneP) posP.y += offNP.y * 1.5;
#line 1089
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 2.0;
if(!doneN) posN.y -= offNP.y * 2.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 2.0;
if(!doneP) posP.y += offNP.y * 2.0;
#line 1103
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 2.0;
if(!doneN) posN.y -= offNP.y * 2.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 2.0;
if(!doneP) posP.y += offNP.y * 2.0;
#line 1117
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 2.0;
if(!doneN) posN.y -= offNP.y * 2.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 2.0;
if(!doneP) posP.y += offNP.y * 2.0;
#line 1131
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 2.0;
if(!doneN) posN.y -= offNP.y * 2.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 2.0;
if(!doneP) posP.y += offNP.y * 2.0;
#line 1145
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 4.0;
if(!doneN) posN.y -= offNP.y * 4.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 4.0;
if(!doneP) posP.y += offNP.y * 4.0;
#line 1159
if(doneNP) {
if(!doneN) lumaEndN = FxaaLuma(tex2Dlod(tex, float4(posN.xy, 0.0, 0.0)));
if(!doneP) lumaEndP = FxaaLuma(tex2Dlod(tex, float4(posP.xy, 0.0, 0.0)));
if(!doneN) lumaEndN = lumaEndN - lumaNN * 0.5;
if(!doneP) lumaEndP = lumaEndP - lumaNN * 0.5;
doneN = abs(lumaEndN) >= gradientScaled;
doneP = abs(lumaEndP) >= gradientScaled;
if(!doneN) posN.x -= offNP.x * 8.0;
if(!doneN) posN.y -= offNP.y * 8.0;
doneNP = (!doneN) || (!doneP);
if(!doneP) posP.x += offNP.x * 8.0;
if(!doneP) posP.y += offNP.y * 8.0;
#line 1189
}
#line 1192
}
#line 1195
}
#line 1198
}
#line 1201
}
#line 1204
}
#line 1207
}
#line 1210
}
#line 1213
}
#line 1216
}
#line 1218
float dstN = posM.x - posN.x;
float dstP = posP.x - posM.x;
if(!horzSpan) dstN = posM.y - posN.y;
if(!horzSpan) dstP = posP.y - posM.y;
#line 1223
bool goodSpanN = (lumaEndN < 0.0) != lumaMLTZero;
float spanLength = (dstP + dstN);
bool goodSpanP = (lumaEndP < 0.0) != lumaMLTZero;
float spanLengthRcp = 1.0/spanLength;
#line 1228
bool directionN = dstN < dstP;
float dst = min(dstN, dstP);
bool goodSpan;
if (directionN)
goodSpan = goodSpanN;
else
goodSpan = goodSpanP;
float subpixG = subpixF * subpixF;
float pixelOffset = (dst * (-spanLengthRcp)) + 0.5;
float subpixH = subpixG * fxaaQualitySubpix;
#line 1239
float pixelOffsetGood;
if (goodSpan)
pixelOffsetGood = pixelOffset;
else
pixelOffsetGood = 0.0;
float pixelOffsetSubpix = max(pixelOffsetGood, subpixH);
if(!horzSpan) posM.x += pixelOffsetSubpix * lengthSign;
if( horzSpan) posM.y += pixelOffsetSubpix * lengthSign;
#line 1250
return float4(tex2Dlod(tex, float4(posM, 0.0, 0.0)).xyz, rgbyM.y);
#line 1252
}
#line 2693
float3 HQ_SMAAGatherNeighbours(float2 texcoord,
float4 offset[3],
sampler tex) {
#line 2697
return tex2DgatherR(tex, texcoord + float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy * float2(-0.5, -0.5)).grb;
#line 2704
}
#line 2709
float2 SMAACalculatePredicatedThreshold(float2 texcoord,
float4 offset[3],
sampler predicationTex) {
const float3 neighbours = HQ_SMAAGatherNeighbours(texcoord, offset, predicationTex);
const float2 delta = abs(neighbours.xx - neighbours.yz);
const float2 edges = step(0.01, delta);
return 2.0 * max(0.05, EdgeThreshold) * (1.0 - 0.4 * edges);
}
#line 2721
void SMAAMovc(bool2 cond, inout float2 variable, float2 value) {
[flatten] if (cond.x) variable.x = value.x;
[flatten] if (cond.y) variable.y = value.y;
}
#line 2726
void SMAAMovc(bool4 cond, inout float4 variable, float4 value) {
SMAAMovc(cond.xy, variable.xy, value.xy);
SMAAMovc(cond.zw, variable.zw, value.zw);
}
#line 2739
void SMAAEdgeDetectionVS(float2 texcoord,
out float4 offset[3]) {
offset[0] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4(-1.0, 0.0, 0.0, -1.0), texcoord.xyxy);
offset[1] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4( 1.0, 0.0, 0.0,  1.0), texcoord.xyxy);
offset[2] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4(-2.0, 0.0, 0.0, -2.0), texcoord.xyxy);
}
#line 2749
void SMAABlendingWeightCalculationVS(float2 texcoord,
out float2 pixcoord,
out float4 offset[3]) {
pixcoord = texcoord * float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).zw;
#line 2755
offset[0] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4(-0.25, -0.125,  1.25, -0.125), texcoord.xyxy);
offset[1] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4(-0.125, -0.25, -0.125,  1.25), texcoord.xyxy);
#line 2759
offset[2] = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xxyy,
float4(-2.0, 2.0, -2.0, 2.0) * float(112),
float4(offset[0].xz, offset[1].yw));
}
#line 2767
void SMAANeighborhoodBlendingVS(float2 texcoord,
out float4 offset) {
offset = mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, float4( 1.0, 0.0, 0.0,  1.0), texcoord.xyxy);
}
#line 2783
float2 SMAALumaEdgeDetectionPS(float2 texcoord,
float4 offset[3],
sampler colorTex
) {
#line 2788
const float2 threshold = float2(max(0.05, EdgeThreshold), max(0.05, EdgeThreshold));
#line 2791
const float3 weights = float3(0.2126, 0.7152, 0.0722);
const float L = dot(tex2D(colorTex, texcoord).rgb, weights);
#line 2794
const float Lleft = dot(tex2D(colorTex, offset[0].xy).rgb, weights);
const float Ltop  = dot(tex2D(colorTex, offset[0].zw).rgb, weights);
#line 2798
float4 delta;
delta.xy = abs(L - float2(Lleft, Ltop));
float2 edges = step(threshold, delta.xy);
#line 2803
if (dot(edges, float2(1.0, 1.0)) == 0.0)
discard;
#line 2807
const float Lright = dot(tex2D(colorTex, offset[1].xy).rgb, weights);
const float Lbottom  = dot(tex2D(colorTex, offset[1].zw).rgb, weights);
delta.zw = abs(L - float2(Lright, Lbottom));
#line 2812
float2 maxDelta = max(delta.xy, delta.zw);
#line 2815
const float Lleftleft = dot(tex2D(colorTex, offset[2].xy).rgb, weights);
const float Ltoptop = dot(tex2D(colorTex, offset[2].zw).rgb, weights);
delta.zw = abs(float2(Lleft, Ltop) - float2(Lleftleft, Ltoptop));
#line 2820
maxDelta = max(maxDelta.xy, delta.zw);
const float finalDelta = max(maxDelta.x, maxDelta.y);
#line 2824
edges.xy *= step(finalDelta, (1.1 + (0.65 * Subpix)) * delta.xy);
#line 2826
return edges;
}
#line 2829
float2 SMAALumaEdgePredicationDetectionPS(float2 texcoord,
float4 offset[3],
sampler colorTex
, sampler predicationTex
) {
#line 2835
const float2 threshold = SMAACalculatePredicatedThreshold(texcoord, offset, predicationTex);
#line 2838
const float3 weights = float3(0.2126, 0.7152, 0.0722);
const float L = dot(tex2D(colorTex, texcoord).rgb, weights);
#line 2841
const float Lleft = dot(tex2D(colorTex, offset[0].xy).rgb, weights);
const float Ltop  = dot(tex2D(colorTex, offset[0].zw).rgb, weights);
#line 2845
float4 delta;
delta.xy = abs(L - float2(Lleft, Ltop));
float2 edges = step(threshold, delta.xy);
#line 2850
if (dot(edges, float2(1.0, 1.0)) == 0.0)
discard;
#line 2854
const float Lright = dot(tex2D(colorTex, offset[1].xy).rgb, weights);
const float Lbottom  = dot(tex2D(colorTex, offset[1].zw).rgb, weights);
delta.zw = abs(L - float2(Lright, Lbottom));
#line 2859
float2 maxDelta = max(delta.xy, delta.zw);
#line 2862
const float Lleftleft = dot(tex2D(colorTex, offset[2].xy).rgb, weights);
const float Ltoptop = dot(tex2D(colorTex, offset[2].zw).rgb, weights);
delta.zw = abs(float2(Lleft, Ltop) - float2(Lleftleft, Ltoptop));
#line 2867
maxDelta = max(maxDelta.xy, delta.zw);
const float finalDelta = max(maxDelta.x, maxDelta.y);
#line 2871
edges.xy *= step(finalDelta, (1.1 + (0.65 * Subpix)) * delta.xy);
#line 2873
return edges;
}
#line 2882
float2 SMAAColorEdgeDetectionPS(float2 texcoord,
float4 offset[3],
sampler colorTex
) {
#line 2887
const float2 threshold = float2(max(0.05, EdgeThreshold), max(0.05, EdgeThreshold));
#line 2890
float4 delta;
const float3 C = tex2D(colorTex, texcoord).rgb;
#line 2893
const float3 Cleft = tex2D(colorTex, offset[0].xy).rgb;
float3 t = abs(C - Cleft);
delta.x = max(max(t.r, t.g), t.b);
#line 2897
const float3 Ctop  = tex2D(colorTex, offset[0].zw).rgb;
t = abs(C - Ctop);
delta.y = max(max(t.r, t.g), t.b);
#line 2902
float2 edges = step(threshold, delta.xy);
#line 2905
if (dot(edges, float2(1.0, 1.0)) == 0.0)
discard;
#line 2909
const float3 Cright = tex2D(colorTex, offset[1].xy).rgb;
t = abs(C - Cright);
delta.z = max(max(t.r, t.g), t.b);
#line 2913
const float3 Cbottom  = tex2D(colorTex, offset[1].zw).rgb;
t = abs(C - Cbottom);
delta.w = max(max(t.r, t.g), t.b);
#line 2918
float2 maxDelta = max(delta.xy, delta.zw);
#line 2921
const float3 Cleftleft  = tex2D(colorTex, offset[2].xy).rgb;
t = abs(Cleft - Cleftleft);
delta.z = max(max(t.r, t.g), t.b);
#line 2925
const float3 Ctoptop = tex2D(colorTex, offset[2].zw).rgb;
t = abs(Ctop - Ctoptop);
delta.w = max(max(t.r, t.g), t.b);
#line 2930
maxDelta = max(maxDelta.xy, delta.zw);
const float finalDelta = max(maxDelta.x, maxDelta.y);
#line 2934
edges.xy *= step(finalDelta, (1.1 + (0.65 * Subpix)) * delta.xy);
#line 2936
return edges;
}
#line 2939
float2 SMAAColorEdgePredicationDetectionPS(float2 texcoord,
float4 offset[3],
sampler colorTex
, sampler predicationTex
) {
#line 2945
const float2 threshold = SMAACalculatePredicatedThreshold(texcoord, offset, predicationTex);
#line 2948
float4 delta;
const float3 C = tex2D(colorTex, texcoord).rgb;
#line 2951
const float3 Cleft = tex2D(colorTex, offset[0].xy).rgb;
float3 t = abs(C - Cleft);
delta.x = max(max(t.r, t.g), t.b);
#line 2955
const float3 Ctop  = tex2D(colorTex, offset[0].zw).rgb;
t = abs(C - Ctop);
delta.y = max(max(t.r, t.g), t.b);
#line 2960
float2 edges = step(threshold, delta.xy);
#line 2963
if (dot(edges, float2(1.0, 1.0)) == 0.0)
discard;
#line 2967
const float3 Cright = tex2D(colorTex, offset[1].xy).rgb;
t = abs(C - Cright);
delta.z = max(max(t.r, t.g), t.b);
#line 2971
const float3 Cbottom  = tex2D(colorTex, offset[1].zw).rgb;
t = abs(C - Cbottom);
delta.w = max(max(t.r, t.g), t.b);
#line 2976
float2 maxDelta = max(delta.xy, delta.zw);
#line 2979
const float3 Cleftleft  = tex2D(colorTex, offset[2].xy).rgb;
t = abs(Cleft - Cleftleft);
delta.z = max(max(t.r, t.g), t.b);
#line 2983
const float3 Ctoptop = tex2D(colorTex, offset[2].zw).rgb;
t = abs(Ctop - Ctoptop);
delta.w = max(max(t.r, t.g), t.b);
#line 2988
maxDelta = max(maxDelta.xy, delta.zw);
const float finalDelta = max(maxDelta.x, maxDelta.y);
#line 2992
edges.xy *= step(finalDelta, (1.1 + (0.65 * Subpix)) * delta.xy);
#line 2994
return edges;
}
#line 3000
float2 SMAADepthEdgeDetectionPS(float2 texcoord,
float4 offset[3],
sampler depthTex) {
const float3 neighbours = HQ_SMAAGatherNeighbours(texcoord, offset, depthTex);
const float2 delta = abs(neighbours.xx - float2(neighbours.y, neighbours.z));
const float2 edges = step((0.1 * max(0.05, EdgeThreshold)), delta);
#line 3007
if (dot(edges, float2(1.0, 1.0)) == 0.0)
discard;
#line 3010
return edges;
}
#line 3021
float2 SMAADecodeDiagBilinearAccess(float2 e) {
#line 3035
e.r = e.r * abs(5.0 * e.r - 5.0 * 0.75);
return round(e);
}
#line 3039
float4 SMAADecodeDiagBilinearAccess(float4 e) {
e.rb = e.rb * abs(5.0 * e.rb - 5.0 * 0.75);
return round(e);
}
#line 3047
float2 SMAASearchDiag1(sampler edgesTex, float2 texcoord, float2 dir, out float2 e) {
float4 coord = float4(texcoord, -1.0, 1.0);
const float3 t = float3(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, 1.0);
while (coord.z < float(20 - 1) &&
coord.w > 0.9) {
coord.xyz = mad(t, float3(dir, 1.0), coord.xyz);
e = tex2Dlod(edgesTex, float4(coord.xy, coord.xy)).rg;
coord.w = dot(e, float2(0.5, 0.5));
}
return coord.zw;
}
#line 3059
float2 SMAASearchDiag2(sampler edgesTex, float2 texcoord, float2 dir, out float2 e) {
float4 coord = float4(texcoord, -1.0, 1.0);
coord.x += 0.25 * float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).x; 
const float3 t = float3(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, 1.0);
while (coord.z < float(20 - 1) &&
coord.w > 0.9) {
coord.xyz = mad(t, float3(dir, 1.0), coord.xyz);
#line 3069
e = tex2Dlod(edgesTex, float4(coord.xy, coord.xy)).rg;
e = SMAADecodeDiagBilinearAccess(e);
#line 3076
coord.w = dot(e, float2(0.5, 0.5));
}
return coord.zw;
}
#line 3085
float2 SMAAAreaDiag(sampler areaTex, float2 dist, float2 e, float offset) {
float2 texcoord = mad(float2(20, 20), e, dist);
#line 3089
texcoord = mad((1.0 / float2(160.0, 560.0)), texcoord, 0.5 * (1.0 / float2(160.0, 560.0)));
#line 3092
texcoord.x += 0.5;
#line 3095
texcoord.y += (1.0 / 7.0) * offset;
#line 3098
return tex2Dlod(areaTex, float4(texcoord, texcoord)).rg;
}
#line 3104
float2 SMAACalculateDiagWeights(sampler edgesTex, sampler areaTex, float2 texcoord, float2 e, float4 subsampleIndices) {
float2 weights = float2(0.0, 0.0);
#line 3108
float4 d;
float2 end;
if (e.r > 0.0) {
d.xz = SMAASearchDiag1(edgesTex, texcoord, float2(-1.0,  1.0), end);
d.x += float(end.y > 0.9);
} else
d.xz = float2(0.0, 0.0);
d.yw = SMAASearchDiag1(edgesTex, texcoord, float2(1.0, -1.0), end);
#line 3117
[branch]
if (d.x + d.y > 2.0) { 
#line 3120
const float4 coords = mad(float4(-d.x + 0.25, d.x, d.y, -d.y - 0.25), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, texcoord.xyxy);
float4 c;
c.xy = tex2Dlod(edgesTex, float4(coords.xy, coords.xy), int2(-1, 0)).rg;
c.zw = tex2Dlod(edgesTex, float4(coords.zw, coords.zw), int2( 1, 0)).rg;
c.yxwz = SMAADecodeDiagBilinearAccess(c.xyzw);
#line 3135
float2 cc = mad(float2(2.0, 2.0), c.xz, c.yw);
#line 3138
SMAAMovc(bool2(step(0.9, d.zw)), cc, float2(0.0, 0.0));
#line 3141
weights += SMAAAreaDiag(areaTex, d.xy, cc, subsampleIndices.z);
}
#line 3145
d.xz = SMAASearchDiag2(edgesTex, texcoord, float2(-1.0, -1.0), end);
if (tex2Dlod(edgesTex, float4(texcoord, texcoord), int2(1, 0)).r > 0.0) {
d.yw = SMAASearchDiag2(edgesTex, texcoord, float2(1.0, 1.0), end);
d.y += float(end.y > 0.9);
} else
d.yw = float2(0.0, 0.0);
#line 3152
[branch]
if (d.x + d.y > 2.0) { 
#line 3155
const float4 coords = mad(float4(-d.x, -d.x, d.y, d.y), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xyxy, texcoord.xyxy);
float4 c;
c.x  = tex2Dlod(edgesTex, float4(coords.xy, coords.xy), int2(-1, 0)).g;
c.y  = tex2Dlod(edgesTex, float4(coords.xy, coords.xy), int2( 0, -1)).r;
c.zw = tex2Dlod(edgesTex, float4(coords.zw, coords.zw), int2( 1, 0)).gr;
float2 cc = mad(float2(2.0, 2.0), c.xz, c.yw);
#line 3163
SMAAMovc(bool2(step(0.9, d.zw)), cc, float2(0.0, 0.0));
#line 3166
weights += SMAAAreaDiag(areaTex, d.xy, cc, subsampleIndices.w).gr;
}
#line 3169
return weights;
}
#line 3182
float SMAASearchLength(sampler searchTex, float2 e, float offset) {
#line 3185
float2 scale = float2(66.0, 33.0) * float2(0.5, -1.0);
float2 bias = float2(66.0, 33.0) * float2(offset, 1.0);
#line 3189
scale += float2(-1.0,  1.0);
bias  += float2( 0.5, -0.5);
#line 3194
scale *= 1.0 / float2(64.0, 16.0);
bias *= 1.0 / float2(64.0, 16.0);
#line 3198
return tex2Dlod(searchTex, float4(mad(scale, e, bias), mad(scale, e, bias))).r;
}
#line 3204
float SMAASearchXLeft(sampler edgesTex, sampler searchTex, float2 texcoord, float end) {
#line 3212
float2 e = float2(0.0, 1.0);
while (texcoord.x > end &&
e.g > 0.8281 && 
e.r == 0.0) { 
e = tex2Dlod(edgesTex, float4(texcoord, texcoord)).rg;
texcoord = mad(-float2(2.0, 0.0), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, texcoord);
}
#line 3220
const float offset = mad(-(255.0 / 127.0), SMAASearchLength(searchTex, e, 0.0), 3.25);
return mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).x, offset, texcoord.x);
#line 3234
}
#line 3236
float SMAASearchXRight(sampler edgesTex, sampler searchTex, float2 texcoord, float end) {
float2 e = float2(0.0, 1.0);
while (texcoord.x < end &&
e.g > 0.8281 && 
e.r == 0.0) { 
e = tex2Dlod(edgesTex, float4(texcoord, texcoord)).rg;
texcoord = mad(float2(2.0, 0.0), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, texcoord);
}
const float offset = mad(-(255.0 / 127.0), SMAASearchLength(searchTex, e, 0.5), 3.25);
return mad(-float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).x, offset, texcoord.x);
}
#line 3248
float SMAASearchYUp(sampler edgesTex, sampler searchTex, float2 texcoord, float end) {
float2 e = float2(1.0, 0.0);
while (texcoord.y > end &&
e.r > 0.8281 && 
e.g == 0.0) { 
e = tex2Dlod(edgesTex, float4(texcoord, texcoord)).rg;
texcoord = mad(-float2(0.0, 2.0), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, texcoord);
}
const float offset = mad(-(255.0 / 127.0), SMAASearchLength(searchTex, e.gr, 0.0), 3.25);
return mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).y, offset, texcoord.y);
}
#line 3260
float SMAASearchYDown(sampler edgesTex, sampler searchTex, float2 texcoord, float end) {
float2 e = float2(1.0, 0.0);
while (texcoord.y < end &&
e.r > 0.8281 && 
e.g == 0.0) { 
e = tex2Dlod(edgesTex, float4(texcoord, texcoord)).rg;
texcoord = mad(float2(0.0, 2.0), float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, texcoord);
}
const float offset = mad(-(255.0 / 127.0), SMAASearchLength(searchTex, e.gr, 0.5), 3.25);
return mad(-float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).y, offset, texcoord.y);
}
#line 3276
float2 SMAAArea(sampler areaTex, float2 dist, float e1, float e2, float offset) {
#line 3278
float2 texcoord = mad(float2(16, 16), round(4.0 * float2(e1, e2)), dist);
#line 3281
texcoord = mad((1.0 / float2(160.0, 560.0)), texcoord, 0.5 * (1.0 / float2(160.0, 560.0)));
#line 3284
texcoord.y = mad((1.0 / 7.0), offset, texcoord.y);
#line 3287
return tex2Dlod(areaTex, float4(texcoord, texcoord)).rg;
}
#line 3293
void SMAADetectHorizontalCornerPattern(sampler edgesTex, inout float2 weights, float4 texcoord, float2 d) {
#line 3295
const float2 leftRight = step(d.xy, d.yx);
float2 rounding = (1.0 - (float(0) / 100.0)) * leftRight;
#line 3298
rounding /= leftRight.x + leftRight.y; 
#line 3300
float2 factor = float2(1.0, 1.0);
factor.x -= rounding.x * tex2Dlod(edgesTex, float4(texcoord.xy, texcoord.xy), int2(0, 1)).r;
factor.x -= rounding.y * tex2Dlod(edgesTex, float4(texcoord.zw, texcoord.zw), int2(1, 1)).r;
factor.y -= rounding.x * tex2Dlod(edgesTex, float4(texcoord.xy, texcoord.xy), int2(0, -2)).r;
factor.y -= rounding.y * tex2Dlod(edgesTex, float4(texcoord.zw, texcoord.zw), int2(1, -2)).r;
#line 3306
weights *= saturate(factor);
#line 3308
}
#line 3310
void SMAADetectVerticalCornerPattern(sampler edgesTex, inout float2 weights, float4 texcoord, float2 d) {
#line 3312
const float2 leftRight = step(d.xy, d.yx);
float2 rounding = (1.0 - (float(0) / 100.0)) * leftRight;
#line 3315
rounding /= leftRight.x + leftRight.y;
#line 3317
float2 factor = float2(1.0, 1.0);
factor.x -= rounding.x * tex2Dlod(edgesTex, float4(texcoord.xy, texcoord.xy), int2( 1, 0)).g;
factor.x -= rounding.y * tex2Dlod(edgesTex, float4(texcoord.zw, texcoord.zw), int2( 1, 1)).g;
factor.y -= rounding.x * tex2Dlod(edgesTex, float4(texcoord.xy, texcoord.xy), int2(-2, 0)).g;
factor.y -= rounding.y * tex2Dlod(edgesTex, float4(texcoord.zw, texcoord.zw), int2(-2, 1)).g;
#line 3323
weights *= saturate(factor);
#line 3325
}
#line 3330
float4 SMAABlendingWeightCalculationPS(float2 texcoord,
float2 pixcoord,
float4 offset[3],
sampler edgesTex,
sampler areaTex,
sampler searchTex,
float4 subsampleIndices) { 
float4 weights = float4(0.0, 0.0, 0.0, 0.0);
#line 3339
float2 e = tex2D(edgesTex, texcoord).rg;
#line 3341
[branch]
if (e.g > 0.0) { 
#line 3346
weights.rg = SMAACalculateDiagWeights(edgesTex, areaTex, texcoord, e, subsampleIndices);
#line 3350
[branch]
if (weights.r == -weights.g) { 
#line 3354
float2 d;
#line 3357
float3 coords;
coords.x = SMAASearchXLeft(edgesTex, searchTex, offset[0].xy, offset[2].x);
coords.y = offset[1].y; 
d.x = coords.x;
#line 3365
const float e1 = tex2Dlod(edgesTex, float4(coords.xy, coords.xy)).r;
#line 3368
coords.z = SMAASearchXRight(edgesTex, searchTex, offset[0].zw, offset[2].y);
d.y = coords.z;
#line 3373
d = abs(round(mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).zz, d, -pixcoord.xx)));
#line 3377
const float2 sqrt_d = sqrt(d);
#line 3380
const float e2 = tex2Dlod(edgesTex, float4(coords.zy, coords.zy), int2(1, 0)).r;
#line 3384
weights.rg = SMAAArea(areaTex, sqrt_d, e1, e2, subsampleIndices.y);
#line 3387
coords.y = texcoord.y;
SMAADetectHorizontalCornerPattern(edgesTex, weights.rg, coords.xyzy, d);
#line 3391
} else
e.r = 0.0; 
#line 3394
}
#line 3396
[branch]
if (e.r > 0.0) { 
float2 d;
#line 3401
float3 coords;
coords.y = SMAASearchYUp(edgesTex, searchTex, offset[1].xy, offset[2].z);
coords.x = offset[0].x; 
d.x = coords.y;
#line 3407
const float e1 = tex2Dlod(edgesTex, float4(coords.xy, coords.xy)).g;
#line 3410
coords.z = SMAASearchYDown(edgesTex, searchTex, offset[1].zw, offset[2].w);
d.y = coords.z;
#line 3414
d = abs(round(mad(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).ww, d, -pixcoord.yy)));
#line 3418
const float2 sqrt_d = sqrt(d);
#line 3421
const float e2 = tex2Dlod(edgesTex, float4(coords.xz, coords.xz), int2(0, 1)).g;
#line 3424
weights.ba = SMAAArea(areaTex, sqrt_d, e1, e2, subsampleIndices.x);
#line 3427
coords.x = texcoord.x;
SMAADetectVerticalCornerPattern(edgesTex, weights.ba, coords.xyxz, d);
}
#line 3431
return weights;
}
#line 3437
float4 SMAANeighborhoodBlendingPS(float2 texcoord,
float4 offset,
sampler colorTex,
sampler blendTex
#line 3444
) {
#line 3446
float4 a;
a.x = tex2D(blendTex, offset.xy).a; 
a.y = tex2D(blendTex, offset.zw).g; 
a.wz = tex2D(blendTex, texcoord).xz; 
#line 3452
[branch]
if (dot(a, float4(1.0, 1.0, 1.0, 1.0)) < 1e-5) {
float4 color = tex2Dlod(colorTex, float4(texcoord, texcoord));
#line 3463
return color;
} else {
bool h = max(a.x, a.z) > max(a.y, a.w); 
#line 3468
float4 blendingOffset = float4(0.0, a.y, 0.0, a.w);
float2 blendingWeight = a.yw;
SMAAMovc(bool4(h, h, h, h), blendingOffset, float4(a.x, 0.0, a.z, 0.0));
SMAAMovc(bool2(h, h), blendingWeight, a.xz);
blendingWeight /= dot(blendingWeight, float2(1.0, 1.0));
#line 3475
const float4 blendingCoord = mad(blendingOffset, float4(float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy, -float4((1.0 / 1920), (1.0 / 1080), 1920, 1080).xy), texcoord.xyxy);
#line 3479
float4 color = blendingWeight.x * tex2Dlod(colorTex, float4(blendingCoord.xy, blendingCoord.xy));
color += blendingWeight.y * tex2Dlod(colorTex, float4(blendingCoord.zw, blendingCoord.zw));
#line 3491
return color;
}
}
#line 3498
float4 SMAAResolvePS(float2 texcoord,
sampler currentColorTex,
sampler previousColorTex
#line 3504
) {
#line 3524
const float4 current = tex2D(currentColorTex, texcoord);
const float4 previous = tex2D(previousColorTex, texcoord);
return lerp(current, previous, 0.5);
#line 3528
}
#line 198 "C:\Program Files\GShade\gshade-shaders\Shaders\HQAA.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ReShade.fxh"
#line 50
namespace ReShade
{
float GetAspectRatio() { return 1920 * (1.0 / 1080); }
float2 GetPixelSize() { return float2((1.0 / 1920), (1.0 / 1080)); }
float2 GetScreenSize() { return float2(1920, 1080); }
#line 60
texture BackBufferTex : COLOR;
texture DepthBufferTex : DEPTH;
#line 63
sampler BackBuffer { Texture = BackBufferTex; };
sampler DepthBuffer { Texture = DepthBufferTex; };
#line 67
float GetLinearizedDepth(float2 texcoord)
{
#line 72
texcoord.x /= 1;
texcoord.y /= 1;
#line 77
texcoord.x -= 0 / 2.000000001;
#line 82
texcoord.y += 0 / 2.000000001;
#line 84
float depth = tex2Dlod(DepthBuffer, float4(texcoord, 0, 0)).x * 1;
#line 93
const float N = 1.0;
depth /= 1000.0 - depth * (1000.0 - N);
#line 96
return depth;
}
}
#line 101
void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
if (id == 2)
texcoord.x = 2.0;
else
texcoord.x = 0.0;
#line 108
if (id == 1)
texcoord.y = 2.0;
else
texcoord.y = 0.0;
#line 113
position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}
#line 199 "C:\Program Files\GShade\gshade-shaders\Shaders\HQAA.fx"
#line 230
texture edgesTex < pooled = true; >
{
Width = 1920;
Height = 1080;
Format = RG8;
};
texture blendTex < pooled = true; >
{
Width = 1920;
Height = 1080;
Format = RGBA8;
};
#line 243
texture areaTex < source = "AreaTex.png"; >
{
Width = 160;
Height = 560;
Format = RG8;
};
texture searchTex < source = "SearchTex.png"; >
{
Width = 64;
Height = 16;
Format = R8;
};
#line 258
sampler colorGammaSampler
{
Texture = ReShade::BackBufferTex;
AddressU = Clamp; AddressV = Clamp;
MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
SRGBTexture = false;
};
sampler colorLinearSampler
{
Texture = ReShade::BackBufferTex;
AddressU = Clamp; AddressV = Clamp;
MipFilter = Point; MinFilter = Linear; MagFilter = Linear;
SRGBTexture = true;
};
sampler edgesSampler
{
Texture = edgesTex;
AddressU = Clamp; AddressV = Clamp;
MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
SRGBTexture = false;
};
sampler blendSampler
{
Texture = blendTex;
AddressU = Clamp; AddressV = Clamp;
MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
SRGBTexture = false;
};
sampler areaSampler
{
Texture = areaTex;
AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
MipFilter = Linear; MinFilter = Linear; MagFilter = Linear;
SRGBTexture = false;
};
sampler searchSampler
{
Texture = searchTex;
AddressU = Clamp; AddressV = Clamp; AddressW = Clamp;
MipFilter = Point; MinFilter = Point; MagFilter = Point;
SRGBTexture = false;
};
sampler FXAATexture
{
Texture = ReShade::BackBufferTex;
MinFilter = Linear; MagFilter = Linear;
};
#line 308
void SMAAEdgeDetectionWrapVS(
in uint id : SV_VertexID,
out float4 position : SV_Position,
out float2 texcoord : TEXCOORD0,
out float4 offset[3] : TEXCOORD1)
{
PostProcessVS(id, position, texcoord);
SMAAEdgeDetectionVS(texcoord, offset);
}
void SMAABlendingWeightCalculationWrapVS(
in uint id : SV_VertexID,
out float4 position : SV_Position,
out float2 texcoord : TEXCOORD0,
out float2 pixcoord : TEXCOORD1,
out float4 offset[3] : TEXCOORD2)
{
PostProcessVS(id, position, texcoord);
SMAABlendingWeightCalculationVS(texcoord, pixcoord, offset);
}
void SMAANeighborhoodBlendingWrapVS(
in uint id : SV_VertexID,
out float4 position : SV_Position,
out float2 texcoord : TEXCOORD0,
out float4 offset : TEXCOORD1)
{
PostProcessVS(id, position, texcoord);
SMAANeighborhoodBlendingVS(texcoord, offset);
}
#line 340
float2 SMAAEdgeDetectionWrapPS(
float4 position : SV_Position,
float2 texcoord : TEXCOORD0,
float4 offset[3] : TEXCOORD1) : SV_Target
{
float2 color = SMAAColorEdgeDetectionPS(texcoord, offset, colorGammaSampler);
float2 luma = SMAALumaEdgeDetectionPS(texcoord, offset, colorGammaSampler);
float2 result = float2(sqrt(color.r * luma.r), sqrt(color.g * luma.g));
return result;
}
float4 SMAABlendingWeightCalculationWrapPS(
float4 position : SV_Position,
float2 texcoord : TEXCOORD0,
float2 pixcoord : TEXCOORD1,
float4 offset[3] : TEXCOORD2) : SV_Target
{
return SMAABlendingWeightCalculationPS(texcoord, pixcoord, offset, edgesSampler, areaSampler, searchSampler, 0.0);
}
float3 SMAANeighborhoodBlendingWrapPS(
float4 position : SV_Position,
float2 texcoord : TEXCOORD0,
float4 offset : TEXCOORD1) : SV_Target
{
return SMAANeighborhoodBlendingPS(texcoord, offset, colorLinearSampler, blendSampler).rgb;
}
#line 366
float4 FXAAPixelShaderCoarse(float4 vpos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target
{
float TotalSubpix = 0.0;
if (Overdrive)
{
TotalSubpix += SubpixBoost;
TotalSubpix = TotalSubpix * 0.25;
}
#line 376
return FxaaPixelShader(texcoord,0,FXAATexture,FXAATexture,FXAATexture,float2((1.0 / 1920), (1.0 / 1080)),0,0,0,TotalSubpix,0.925 - (Subpix * 0.125),0.004,0,0,0,0); 
}
#line 379
float4 FXAAPixelShaderMid(float4 vpos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target
{
float TotalSubpix = 0.0;
if (Overdrive)
{
TotalSubpix += SubpixBoost;
TotalSubpix = TotalSubpix * 0.5;
}
#line 389
return FxaaPixelShader(texcoord,0,FXAATexture,FXAATexture,FXAATexture,float2((1.0 / 1920), (1.0 / 1080)),0,0,0,TotalSubpix,0.85 - (Subpix * 0.15),0.004,0,0,0,0); 
}
#line 392
float4 FXAAPixelShaderFine(float4 vpos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target
{
float TotalSubpix = 0.0;
if (Overdrive)
{
TotalSubpix += SubpixBoost;
TotalSubpix = TotalSubpix * 0.875;
}
TotalSubpix += Subpix * 0.125;
#line 403
return FxaaPixelShader(texcoord,0,FXAATexture,FXAATexture,FXAATexture,float2((1.0 / 1920), (1.0 / 1080)),0,0,0,TotalSubpix,max(0.1,0.7 * EdgeThreshold),0.004,0,0,0,0); 
}
#line 408
technique HQAA <
ui_tooltip = "Hybrid high-Quality AA combines techniques of both SMAA and FXAA to\n"
"produce best possible image quality from using both.";
>
{
pass SMAAEdgeDetection
{
VertexShader = SMAAEdgeDetectionWrapVS;
PixelShader = SMAAEdgeDetectionWrapPS;
RenderTarget = edgesTex;
ClearRenderTargets = true;
StencilEnable = true;
StencilPass = REPLACE;
StencilRef = 1;
}
pass SMAABlendWeightCalculation
{
VertexShader = SMAABlendingWeightCalculationWrapVS;
PixelShader = SMAABlendingWeightCalculationWrapPS;
RenderTarget = blendTex;
ClearRenderTargets = true;
StencilEnable = true;
StencilPass = KEEP;
StencilFunc = EQUAL;
StencilRef = 1;
}
pass SMAANeighborhoodBlending
{
VertexShader = SMAANeighborhoodBlendingWrapVS;
PixelShader = SMAANeighborhoodBlendingWrapPS;
StencilEnable = false;
SRGBWriteEnable = true;
}
pass FXAA1
{
VertexShader = PostProcessVS;
PixelShader = FXAAPixelShaderCoarse;
}
pass FXAA2
{
VertexShader = PostProcessVS;
PixelShader = FXAAPixelShaderMid;
}
pass FXAA3
{
VertexShader = PostProcessVS;
PixelShader = FXAAPixelShaderFine;
}
}

