#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\TiltShift.fx"
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
#line 23 "C:\Program Files\GShade\gshade-shaders\Shaders\TiltShift.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ColorAndDither.fxh"
#line 53
static const float3x3 YCbCrMtx =
float3x3(
float3(0.299, 1f-0.299-0.114, 0.114), 
float3(-0.5*0.299/(1f-0.114), -0.5*(1f-0.299-0.114)/(1f-0.114), 0.5), 
float3(0.5, -0.5*(1f-0.299-0.114)/(1f-0.299), -0.5*0.114/(1f-0.299))  
);
#line 60
static const float3 LumaMtx = float3(0.299, 1f-0.299-0.114, 0.114); 
#line 62
static const float3x2 ChromaMtx =
float3x2(
float3(-0.5*0.299/(1f-0.114), -0.5*(1f-0.299-0.114)/(1f-0.114), 0.5), 
float3(0.5, -0.5*(1f-0.299-0.114)/(1f-0.299), -0.5*0.114/(1f-0.299))  
);
#line 68
static const float3x3 RgbMtx =
float3x3(
float3(1f, 0f, 2f-2f*0.299), 
float3(1f, -0.114/(1f-0.299-0.114)*(2f-2f*0.114), -0.299/(1f-0.299-0.114)*(2f-2f*0.299)), 
float3(1f, 2f-2f*0.114, 0f) 
);
#line 82
float  to_display_gamma(float  g) { return pow(abs(g), rcp(2.2)); }
float2 to_display_gamma(float2 g) { return pow(abs(g), rcp(2.2)); }
float3 to_display_gamma(float3 g) { return pow(abs(g), rcp(2.2)); }
float4 to_display_gamma(float4 g) { return pow(abs(g), rcp(2.2)); }
#line 87
float  to_linear_gamma(float  g) { return pow(abs(g), 2.2); }
float2 to_linear_gamma(float2 g) { return pow(abs(g), 2.2); }
float3 to_linear_gamma(float3 g) { return pow(abs(g), 2.2); }
float4 to_linear_gamma(float4 g) { return pow(abs(g), 2.2); }
#line 97
float  to_display_gamma_hq(float  g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float2 to_display_gamma_hq(float2 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float3 to_display_gamma_hq(float3 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float4 to_display_gamma_hq(float4 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
#line 102
float  to_linear_gamma_hq(float  g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float2 to_linear_gamma_hq(float2 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float3 to_linear_gamma_hq(float3 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float4 to_linear_gamma_hq(float4 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
#line 108
namespace BlueNoise
{
#line 113
texture BlueNoiseTex
<
source = "fubax_bluenoise.png";
pooled = true;
>{
Width = 64u;
Height = 64u;
Format = RGBA8;
};
#line 123
sampler BlueNoiseTexSmp
{
Texture = BlueNoiseTex;
#line 127
AddressU = REPEAT;
AddressV = REPEAT;
};
#line 137
float dither(int2 pixelPos, float gradient)
{
#line 140
gradient *= 255;
#line 142
float noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u).r;
#line 144
gradient = frac(gradient) >= noise? ceil(gradient) : floor(gradient);
#line 146
return gradient/255;
}
float3 dither(int2 pixelPos, float3 color)
{
#line 151
color *= 255;
#line 153
float3 noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u).rgb;
#line 155
float3 slope = frac(color);
#line 157
[unroll]
for (uint i=0u; i<3u; i++)
color[i] = slope[i] >= noise[i]? ceil(color[i]) : floor(color[i]);
#line 161
return color/255;
}
float4 dither(int2 pixelPos, float4 color)
{
#line 166
color *= 255;
#line 168
float4 noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u);
#line 170
float4 slope = frac(color);
#line 172
[unroll]
for (uint i=0u; i<4u; i++)
color[i] = slope[i] >= noise[i]? ceil(color[i]) : floor(color[i]);
#line 176
return color/255;
}
}
#line 24 "C:\Program Files\GShade\gshade-shaders\Shaders\TiltShift.fx"
#line 29
uniform float4 K <
ui_type = "drag";
ui_min = -0.2; ui_max = 0.2;
ui_label = "Distortion profile 'k'";
ui_tooltip = "Distortion coefficients K1, K2, K3, K4";
ui_category = "Tilt-shift blur";
> = float4(0.025, 0f, 0f, 0f);
#line 37
uniform int BlurAngle <
ui_type = "slider";
ui_min = -90; ui_max = 90;
ui_label = "Tilt angle";
ui_tooltip = "Tilt the blur line.";
ui_category = "Tilt-shift blur";
> = 0;
#line 45
uniform float BlurOffset <
ui_type = "slider";
ui_min = -1f; ui_max = 1f; ui_step = 0.01;
ui_label = "Line offset";
ui_tooltip = "Offset the blur center line.";
ui_category = "Tilt-shift blur";
> = 0f;
#line 55
uniform bool VisibleLine <
ui_type = "input";
ui_label = "Visualize center line";
ui_tooltip = "Visualize blur center line.";
ui_category = "Blur line";
ui_category_closed = true;
> = false;
#line 63
uniform uint BlurLineWidth <
ui_type = "slider";
ui_min = 2u; ui_max = 64u;
ui_label = "Visualized line width";
ui_tooltip = "Tilt-shift line thickness in pixels.";
ui_category = "Blur line";
> = 32u;
#line 74
sampler BackBuffer
{
Texture = ReShade::BackBufferTex;
#line 78
SRGBTexture = true;
#line 81
AddressU = MIRROR;
AddressV = MIRROR;
};
#line 90
float bellWeight(float2 position)
{ return exp(-dot(position, position)*5f); }
#line 94
float2x2 get2dRotationMatrix(int angle)
{
#line 97
float angleRad = radians(angle);
#line 99
float rotSin = sin(angleRad), rotCos = cos(angleRad);
#line 101
return float2x2(
rotCos, rotSin, 
-rotSin, rotCos  
);
}
#line 107
float getBlurRadius(float2 viewCoord)
{
#line 110
const float2x2 rotationMtx = get2dRotationMatrix(BlurAngle);
#line 112
float2 offsetDir = mul(rotationMtx, float2(0f, BlurOffset)); 
offsetDir.x *= -(1920 * (1.0 / 1080)); 
#line 115
viewCoord = mul(rotationMtx, viewCoord+offsetDir);
#line 117
float4 radius;
radius[0] = viewCoord.y*viewCoord.y; 
radius[1] = radius[0]*radius[0]; 
radius[2] = radius[1]*radius[0]; 
radius[3] = radius[2]*radius[0]; 
#line 123
return abs(1f-rcp(dot(radius, K)+1f));
}
#line 129
void TiltShiftVS(
in  uint   vertexId  : SV_VertexID,
out float4 vertexPos : SV_Position,
out float2 texCoord  : TEXCOORD0,
out float2 viewCoord : TEXCOORD1)
{
#line 136
const float2 vertexPosList[3] =
{
float2(-1f, 1f), 
float2(-1f,-3f), 
float2( 3f, 1f)  
};
#line 144
viewCoord.x = (texCoord.x =   vertexPos.x = vertexPosList[vertexId].x)*(1920 * (1.0 / 1080));
viewCoord.y =  texCoord.y = -(vertexPos.y = vertexPosList[vertexId].y);
vertexPos.zw = float2(0f, 1f); 
texCoord = texCoord*0.5+0.5; 
}
#line 151
void TiltShiftPassHorizontalPS(
in  float4 pixCoord  : SV_Position,
in  float2 texCoord  : TEXCOORD0,
in  float2 viewCoord : TEXCOORD1,
out float3 color     : SV_Target)
{
#line 158
float blurRadius = getBlurRadius(viewCoord);
#line 160
uint blurPixelCount = uint(ceil(blurRadius*1080));
#line 162
if (blurPixelCount!=0u && any(K!=0f))
{
#line 165
blurPixelCount = min(
blurPixelCount+blurPixelCount%2u, 
128u-128u%2u 
);
#line 170
blurRadius *= 1080*(1.0 / 1920); 
float rcpWeightStep = rcp(blurPixelCount);
float rcpOffsetStep = rcp(blurPixelCount*2u-1u);
color = 0f; float cumulativeWeight = 0f; 
for (uint i=1u; i<blurPixelCount*2u; i+=2u)
{
#line 177
float weight = bellWeight(mad(i, rcpWeightStep, -1f));
#line 179
float offset = (i-1u)*rcpOffsetStep-0.5;
color += tex2Dlod(
BackBuffer,
float4(blurRadius*offset+texCoord.x, texCoord.y, 0f, 0f) 
).rgb*weight;
cumulativeWeight += weight;
}
#line 187
color /= cumulativeWeight;
}
#line 190
else color = tex2Dfetch(BackBuffer, uint2(pixCoord.xy)).rgb;
color = saturate(color); 
#line 194
color = to_display_gamma_hq(color);
#line 197
color = BlueNoise::dither(uint2(pixCoord.xy), color);
}
#line 201
void TiltShiftPassVerticalPS(
in  float4 pixCoord  : SV_Position,
in  float2 texCoord  : TEXCOORD0,
in  float2 viewCoord : TEXCOORD1,
out float3 color     : SV_Target)
{
#line 208
float blurRadius = getBlurRadius(viewCoord);
#line 210
uint blurPixelCount = uint(ceil(blurRadius*1080));
#line 212
if (blurPixelCount!=0u && any(K!=0f))
{
#line 215
blurPixelCount = min(
blurPixelCount+blurPixelCount%2u, 
128u-128u%2u 
);
float rcpWeightStep = rcp(blurPixelCount);
float rcpOffsetStep = rcp(blurPixelCount*2u-1u);
color = 0f; float cumulativeWeight = 0f; 
for (uint i=1u; i<blurPixelCount*2u; i+=2u)
{
#line 225
float weight = bellWeight(mad(i, rcpWeightStep, -1f));
#line 227
float offset = (i-1u)*rcpOffsetStep-0.5;
color += tex2Dlod(
BackBuffer,
float4(texCoord.x, blurRadius*offset+texCoord.y, 0f, 0f) 
).rgb*weight;
cumulativeWeight += weight;
}
#line 235
color /= cumulativeWeight;
}
#line 238
else color = tex2Dfetch(BackBuffer, uint2(pixCoord.xy)).rgb;
color = saturate(color); 
#line 242
if (VisibleLine)
{
const float2x2 rotationMtx = get2dRotationMatrix(BlurAngle);
#line 246
const float2 offsetDir = mul(
float2x2(-rotationMtx[0]*(1920 * (1.0 / 1080)), rotationMtx[1]), 
float2(0f, BlurOffset) 
);
#line 251
const float2x2 pixelRoationMtx = rotationMtx*1080*0.5; 
#line 254
viewCoord = mul(pixelRoationMtx, viewCoord+offsetDir);
#line 256
float lineHorizontal = saturate(
BlurLineWidth*0.5 
-abs(viewCoord.y)  
);
#line 262
float lineColor = abs(dot(LumaMtx, color)*2f-1f);
color = lerp(
color,
#line 266
to_linear_gamma_hq(lineColor),
#line 270
lineHorizontal
);
}
#line 275
color = to_display_gamma_hq(color);
#line 278
color = BlueNoise::dither(uint2(pixCoord.xy), color);
}
#line 283
technique TiltShift
<
ui_label = "Tilt Shift";
ui_tooltip =
"Tilt shift blur effect.\n"
"\n"
"	· dynamic per-pixel sampling.\n"
"	· minimal sample count.\n"
"\n"
"This effect © 2018-2023 Jakub Maksymilian Fober\n"
"Licensed under CC BY 3.0 (see source).";
>
{
pass GaussianBlurHorizontal
{
VertexShader = TiltShiftVS;
PixelShader  = TiltShiftPassHorizontalPS;
}
pass GaussianBlurVerticalWithLine
{
VertexShader = TiltShiftVS;
PixelShader  = TiltShiftPassVerticalPS;
}
}

