#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\TFAA.fx"
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
#line 31 "C:\Program Files\GShade\gshade-shaders\Shaders\TFAA.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\TFAAUI.fxh"
#line 26
uniform float  UI_TEMPORAL_FILTER_STRENGTH <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0; ui_step = 0.01;
ui_label = "Temporal Filter Strength";
ui_category = "Temporal Filter";
ui_tooltip = "";
> = 0.5;
#line 34
uniform float  UI_CLAMP_STRENGTH <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0; ui_step = 0.1;
ui_label = "Clamping Strength";
ui_category = "Temporal Filter";
ui_tooltip = "";
> = 0.5;
#line 50
uniform float  UI_PRESHARP <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0; ui_step = 0.1;
ui_label = "Pre Filter Sharpening";
ui_category = "Sharpening";
ui_tooltip = "";
> = 0.5;
#line 66
uniform bool UI_USE_CUBIC_HISTORY <
ui_label = "Cubic History Sampling";
ui_category = "Sharpening";
ui_tooltip = "Default (ON) \nIf activated Bicubic Interpolation is used to resample Data from the past instead of basic Bilinear Interpolation. \nThis makes the image much sharper in motion";
> = true;
#line 73
uniform int UI_COLOR_FORMAT <
ui_type = "combo";
ui_items = "RGB\0YCgCo\0YCbCr\0";
ui_label = "Clamping Color Space ";
ui_category = "Clamping Method";
ui_tooltip = "Default (YCbCr) \nThis selects what color space is used to clamp data from past Frames. \nThe YCgCo and YCbCr color spaces, in contrast to RGB, dedicate one of their 3 channels to brightness, \nthis makes them much sharper on high Filter Strength settings\n ";
> = 2;
#line 81
uniform int UI_CLAMP_PATTERN <
ui_type = "combo";
ui_items = "Cross (4 Samples)\0Rounded Box (8 Samples)\0";
ui_label = "Clamp Pattern";
ui_category = "Clamping Method";
ui_tooltip = "Default (Rounded Box (8 Samples)) \nThis selects how many neighbouring pixels are sampled to calculate clamping and sharpening weights";
> = 1;
#line 89
uniform int UI_CLAMP_TYPE <
ui_type = "combo";
ui_items = "Min/Max Clamping\0Variance Clamping\0None (Debug)\0";
ui_label = "Camping Type";
ui_category = "Clamping Method";
ui_tooltip = "Default (Min/Max Clamping) \nThis selects what formula is used to clamp data from past frames into a reasonable range. \nOne is not better than the other and they don't have the same clamping strength by default.";
> = 0;
#line 32 "C:\Program Files\GShade\gshade-shaders\Shaders\TFAA.fx"
#line 34
uniform float frametime < source = "frametime"; >;
uniform int framecount < source = "framecount"; >;
#line 40
texture texInCur : COLOR;
texture texInCurBackup < pooled = true; > { Width = 1920; Height = 1080; Format = RGBA8; };
#line 43
texture texExpColor < pooled = true; > { Width = 1920; Height = 1080; Format = RGBA16F; };
texture texExpColorBackup { Width = 1920; Height = 1080; Format = RGBA16F; };
#line 46
texture texDepthBackup < pooled = true; > { Width = 1920; Height = 1080; Format = R16f; };
#line 49
sampler smpInCur { Texture = texInCur; AddressU = Clamp; AddressV = Clamp; MipFilter = Linear; MinFilter = Linear; MagFilter = Linear; };
sampler smpInCurBackup { Texture = texInCurBackup; AddressU = Clamp; AddressV = Clamp; MipFilter = Linear; MinFilter = Linear; MagFilter = Linear; };
#line 52
sampler smpExpColor { Texture = texExpColor; AddressU = Clamp; AddressV = Clamp; MipFilter = Linear; MinFilter = Linear; MagFilter = Linear; };
sampler smpExpColorBackup { Texture = texExpColorBackup; AddressU = Clamp; AddressV = Clamp; MipFilter = Linear; MinFilter = Linear; MagFilter = Linear; };
#line 55
sampler smpDepthBackup { Texture = texDepthBackup; AddressU = Clamp; AddressV = Clamp; MipFilter = Point; MinFilter = Point; MagFilter = Point; };
#line 59
texture texMotionVectors < pooled = false; > { Width = 1920; Height = 1080; Format = RG16F; };
sampler SamplerMotionVectors { Texture = texMotionVectors; AddressU = Clamp; AddressV = Clamp; MipFilter = Point; MinFilter = Point; MagFilter = Point; };
#line 63
float2 sampleMotion(float2 texcoord)
{
return tex2D(SamplerMotionVectors, texcoord).rg;
}
#line 72
float3 cvtRgb2YCgCo(float3 rgb)
{
float3 RGB2Y =  float3(0.25, 0.5, -0.25);
float3 RGB2Cg = float3(0.5,  0.0,  0.5);
float3 RGB2Co = float3(0.25,-0.5, -0.25);
return float3(dot(rgb, RGB2Y), dot(rgb, RGB2Cg), dot(rgb, RGB2Co));
}
#line 80
float3 cvtYCgCo2Rgb(float3 ycc)
{
float3 YCgCo2R = float3( 1.0, 1.0, 1.0);
float3 YCgCo2G = float3(1.0, 0.0, -1.0);
float3 YCgCo2B = float3(-1.0, 1.0, -1.0);
return float3(dot(ycc, YCgCo2R), dot(ycc, YCgCo2G), dot(ycc, YCgCo2B));
}
#line 90
float3 cvtRgb2YCbCr(float3 rgb)
{
float y = 0.299 * rgb.r + 0.587 * rgb.g + 0.114 * rgb.b;
float cb = (rgb.b - y) * 0.565;
float cr = (rgb.r - y) * 0.713;
#line 96
return float3(y, cb, cr);
}
#line 99
float3 cvtYCbCr2Rgb(float3 YCbCr)
{
return float3(
YCbCr.x + 1.403 * YCbCr.z,
YCbCr.x - 0.344 * YCbCr.y - 0.714 * YCbCr.z,
YCbCr.x + 1.770 * YCbCr.y
);
}
#line 109
float3 cvtRgb2whatever(float3 rgb)
{
switch(UI_COLOR_FORMAT)
{
case 1:
return cvtRgb2YCgCo(rgb);
case 2:
return cvtRgb2YCbCr(rgb);
default:
return rgb;
}
}
#line 122
float3 cvtWhatever2Rgb(float3 whatever)
{
switch(UI_COLOR_FORMAT)
{
case 1:
return cvtYCgCo2Rgb(whatever);
case 2:
return cvtYCbCr2Rgb(whatever);
default:
return whatever;
}
}
#line 136
float4 sampleBicubic(sampler2D source, float2 texcoord)
{
float2 texSize = tex2Dsize(source);
float2 samplePos = texcoord * texSize;
float2 texPos1 = floor(samplePos - 0.5f) + 0.5f;
float2 f = samplePos - texPos1;
#line 143
float2 w0 = f * (-0.5f + f * (1.0f - 0.5f * f));
float2 w1 = 1.0f + f * f * (-2.5f + 1.5f * f);
float2 w2 = f * (0.5f + f * (2.0f - 1.5f * f));
float2 w3 = f * f * (-0.5f + 0.5f * f);
#line 148
float2 w12 = w1 + w2;
float2 offset12 = w2 / (w1 + w2);
#line 151
float2 texPos0 = texPos1 - 1;
float2 texPos3 = texPos1 + 2;
float2 texPos12 = texPos1 + offset12;
#line 155
texPos0 /= texSize;
texPos3 /= texSize;
texPos12 /= texSize;
#line 159
float4 result = 0.0f;
result += tex2D(source, float2(texPos0.x, texPos0.y)) * w0.x * w0.y;
result += tex2D(source, float2(texPos12.x, texPos0.y)) * w12.x * w0.y;
result += tex2D(source, float2(texPos3.x, texPos0.y)) * w3.x * w0.y;
#line 164
result += tex2D(source, float2(texPos0.x, texPos12.y)) * w0.x * w12.y;
result += tex2D(source, float2(texPos12.x, texPos12.y)) * w12.x * w12.y;
result += tex2D(source, float2(texPos3.x, texPos12.y)) * w3.x * w12.y;
#line 168
result += tex2D(source, float2(texPos0.x, texPos3.y)) * w0.x * w3.y;
result += tex2D(source, float2(texPos12.x, texPos3.y)) * w12.x * w3.y;
result += tex2D(source, float2(texPos3.x, texPos3.y)) * w3.x * w3.y;
#line 172
return result;
}
#line 176
float4 sampleHistory(sampler2D historySampler, float2 texcoord)
{
#line 180
[branch]
#line 182
if (UI_USE_CUBIC_HISTORY)
return sampleBicubic(historySampler, texcoord);
else
return tex2Dlod(historySampler, float4(texcoord, 0.0, 0.0));
}
#line 191
float4 SaveCurPS(float4 position : SV_Position, float2 texcoord : TEXCOORD) : SV_Target0
{
#line 194
float depthOnly = ReShade::GetLinearizedDepth(texcoord);
return float4(tex2D(smpInCur, texcoord).rgb, depthOnly);
}
#line 199
float4 TaaPass(float4 position : SV_Position, float2 texcoord : TEXCOORD ) : SV_Target
{
#line 202
float4 sampleCur = tex2D(smpInCurBackup, texcoord);
float3 colorCur = sampleCur.rgb;
float depthCur = sampleCur.a;
#line 207
float2 sampleDist =  1.0 * ReShade::GetPixelSize(); 
#line 210
float4 cvtColorCur = float4(cvtRgb2whatever(colorCur), depthCur);
#line 213
float2 sampledMotion = float2(0, 0);
#line 216
float4 nCrossMin = cvtColorCur;
float4 nCrossMax = cvtColorCur;
float4 boxMin = 1.0;
float4 boxMax = 0.0;
float4 finalMin = 1.0;
float4 finalMax = 0.0;
#line 224
float4 summedRGB = sampleCur;
float4 mean = 0;
float varMin = 1.0;
float varMax = 0.0;
#line 230
static const float2 nOffsets[8] = { float2(0,1), float2(0,-1), float2(1,0), float2(-1,0),
float2(-1,-1), float2(1,-1), float2(1,1), float2(-1,1) };
#line 234
float4 neigborhood[8];
int closestDepthIndex = -1;
float closestDepth = 1.0;
#line 239
[unroll] for (int i = 0; i < 4; i++)
{
float4 nSample = tex2Dlod(smpInCurBackup, float4(texcoord + (nOffsets[i] * sampleDist), 0.0, 0.0));
neigborhood[i] = nSample;
summedRGB += nSample;
#line 246
if (nSample.a < closestDepth)
{
closestDepth = nSample.a;
closestDepthIndex = i;
}
#line 253
float4 cvt = float4(cvtRgb2whatever(nSample.rgb), nSample.a);
nCrossMin = min(cvt, nCrossMin);
nCrossMax = max(cvt, nCrossMax);
}
#line 260
[branch]
#line 262
if (UI_CLAMP_PATTERN != 0)
{
float4 nCornersMin = cvtColorCur;
float4 nCornersMax = cvtColorCur;
[unroll] for (int i = 4; i < 8; i++)
{
float4 nSample = tex2Dlod(smpInCurBackup, float4(texcoord + (nOffsets[i] * sampleDist), 0.0, 0.0));
neigborhood[i] = nSample;
summedRGB += nSample;
#line 273
if (nSample.a < closestDepth)
{
closestDepth = nSample.a;
closestDepthIndex = i;
}
#line 280
float4 cvt = float4(cvtRgb2whatever(nSample.rgb), nSample.a);
nCornersMin = min(cvt, nCornersMin);
nCornersMax = max(cvt, nCornersMax);
}
#line 286
boxMin = min(nCrossMin, nCornersMin);
boxMax = max(nCrossMax, nCornersMax);
#line 290
finalMin = (nCrossMin + boxMin) * 0.5;
finalMax = (nCrossMax + boxMax) * 0.5;
#line 293
mean = summedRGB / 9.0;
#line 295
}
#line 297
else
{
#line 300
finalMin = nCrossMin;
finalMax = nCrossMax;
mean = summedRGB / 5.0;
}
#line 306
if(closestDepthIndex != -1)
sampledMotion = sampleMotion(texcoord + (neigborhood[closestDepthIndex].rg * sampleDist));
#line 310
static const float fpsConst = (1000.0 / 48.0);
float fpsFix = frametime / fpsConst;
#line 314
float2 lastSamplePos = texcoord + sampledMotion;
float4 sampleLast = sampleHistory(smpExpColorBackup, lastSamplePos);
float3 colorLast = sampleLast.rgb;
float  depthLast = tex2D(smpDepthBackup, lastSamplePos).r;
#line 320
float sharpAmount = saturate((UI_PRESHARP + 0.1) * 5);
#line 323
float3 rgbMin = cvtWhatever2Rgb(nCrossMin.rgb);
float3 rgbMax = cvtWhatever2Rgb(nCrossMax.rgb);
#line 327
float3 crossWeight = -rcp(rsqrt(saturate(min(rgbMin, 2.0 - rgbMax) * rcp(rgbMax))) * (-3.0 * sharpAmount + 8.0));
#line 330
float3 rcpWeight = rcp(4.0 * crossWeight + 1.0);
#line 333
float3 crossSumm = ((neigborhood[0].rgb + neigborhood[1].rgb) + (neigborhood[2].rgb + neigborhood[3].rgb));
#line 336
float3 sharpened = lerp(colorCur, saturate((crossSumm * crossWeight + colorCur) * rcpWeight), sharpAmount);
#line 339
float previousClamping = sampleLast.a;
#line 342
float reduceBlendClamp = saturate(previousClamping * UI_CLAMP_STRENGTH * UI_TEMPORAL_FILTER_STRENGTH);
#line 345
float maxWeight = 0.5;
float weight = lerp(maxWeight, 0.01, sqrt(UI_TEMPORAL_FILTER_STRENGTH));
#line 349
weight = weight * fpsFix;
#line 352
weight = saturate(lerp(weight, maxWeight, reduceBlendClamp));
#line 355
float3 blendedColor = lerp(colorLast, sharpened, weight);
#line 359
[branch]
#line 361
if (UI_CLAMP_TYPE == 2)
return float4(blendedColor, 0);
#line 366
float3 clamped = 0;
switch (UI_CLAMP_TYPE)
{
#line 370
case 0:	
clamped = clamp(cvtRgb2whatever(blendedColor.rgb), finalMin.rgb, finalMax.rgb);
break;
case 1:	
float var = cvtColorCur.r - mean.r;
#line 377
[unroll]
#line 381
for (int i = 0; i < (UI_CLAMP_PATTERN == 0 ? 4 : 8); i++)
var += cvtRgb2whatever(neigborhood[i].rgb).r - mean.r;
float sd = sqrt(var);
varMin = mean.r - sd;
varMax = mean.r + sd;
clamped = clamp(cvtRgb2whatever(blendedColor.rgb), finalMin.rgb, finalMax.rgb);
break;
default:
clamped = blendedColor;
break;
}
#line 394
float3 rgb = cvtWhatever2Rgb(clamped);
#line 397
float clampDelta = length(clamped - colorLast);
#line 400
float smoothedDelta = (clampDelta + previousClamping) * 0.5;
#line 403
return float4(rgb, smoothedDelta);
}
#line 407
void SaveThisPS(float4 position : SV_Position, float2 texcoord : TEXCOORD, out float4 lastExpOut : SV_Target0, out float depthOnly : SV_Target1)
{
#line 410
lastExpOut = tex2D(smpExpColor, texcoord);
depthOnly = ReShade::GetLinearizedDepth(texcoord);
}
#line 414
float4 OutPS(float4 position : SV_Position, float2 texcoord : TEXCOORD ) : SV_Target
{
#line 417
return tex2D(smpExpColor, texcoord);
}
#line 421
technique TFAA < ui_tooltip = "This technique requires qUINT_MotionVectors to be enabled and placed before (above) it in the load order."; >
{
pass SaveLastColorPass
{
VertexShader = PostProcessVS;
PixelShader = SaveCurPS;
RenderTarget0 = texInCurBackup;
}
pass TaaPass
{
VertexShader = PostProcessVS;
PixelShader = TaaPass;
RenderTarget = texExpColor;
}
pass SaveThisPass
{
VertexShader = PostProcessVS;
PixelShader = SaveThisPS;
RenderTarget0 = texExpColorBackup;
RenderTarget1 = texDepthBackup;
}
pass OutPass
{
VertexShader = PostProcessVS;
PixelShader = OutPS;
}
}

