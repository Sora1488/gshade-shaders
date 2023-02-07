#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting-Shader.fxh"
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
#line 57 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting-Shader.fxh"
#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLightingUI.fxh"
#line 279
uniform int Hints<
ui_text = "This shader is in -ALPHA PHASE-, expect major changes.\n\n"
"Set UI_DIFFICULTY to 1 if you want access to more settings.\n"
"Advanced categories are unnecessary options that\n"
"can break the look of the shader if modified improperly.\n\n"
"Use with ReShade_MotionVectors at Quarter Resolution.\n"
"Using higher resolutions for the motion vector only makes it WORSE "
"when the game is using temporal filters (TAA,DLSS2,FSR2,TAAU,TSR,etc.)";
ui_category = "Hints - Please Read!";
ui_label = " ";
ui_type = "radio";
>;
#line 293
uniform int GI <
ui_type = "combo";
ui_label = "Mode";
ui_items = "Reflection\0GI\0";
> = 1;
#line 300
uniform int UI_QUALITY_PRESET <
ui_type = "combo";
ui_label = "Quality Preset";
ui_items = "Low (16)\0Medium (64)\0High (160)\0Very High (320)\0Extreme (500)\0";
> = 1;
#line 306
uniform float BUMP <
ui_label = "Bump mapping";
ui_type = "slider";
ui_category = "Ray Tracing";
ui_tooltip = "Adds tiny details to the lighting.";
ui_min = 0.0;
ui_max = 1;
> = 0.5;
#line 315
uniform float roughness <
ui_label = "Roughness";
ui_type = "slider";
ui_category = "Ray Tracing";
ui_tooltip = "Blurriness of the reflections.";
ui_min = 0.0;
ui_max = 0.999;
> = 0.4;
#line 324
uniform float EXP <
ui_label = "Reflection rim fade";
ui_type = "slider";
ui_category = "Blending Options";
ui_min = 1;
ui_max = 10;
> = 4;
#line 332
uniform float AO_Intensity <
ui_label = "AO Power";
ui_type = "slider";
ui_category = "Blending Options";
ui_tooltip = "Ambient Occlusion falloff curve";
> = 0.67;
#line 339
uniform float depthfade <
ui_label = "Depth Fade";
ui_type = "slider";
ui_category = "Blending Options";
ui_tooltip = "Higher values decrease the intesity on distant objects.\n"
"Reduces blending issues with in-game fogs.";
ui_min = 0;
ui_max = 1;
> = 0.8;
#line 349
uniform bool LinearConvert <
ui_type = "radio";
ui_label = "sRGB to Linear";
ui_category = "Color Management";
ui_tooltip = "Disable if the game is HDR";
ui_category_closed = true;
> = 1;
#line 357
uniform float2 SatExp <
ui_type = "slider";
ui_label = "Saturation || Exposure";
ui_category = "Color Management";
ui_tooltip = "Left slider is Saturation. Right one is Exposure.";
ui_category_closed = true;
ui_min = 0;
ui_max = 4;
> = float2(1,1);
#line 367
uniform uint debug <
ui_type = "combo";
ui_items = "None\0Lighting\0Depth\0Normal\0Accumulation\0Roughness Map\0";
ui_category = "Extra";
ui_category_closed = true;
ui_min = 0;
ui_max = 4;
> = 0;
#line 376
uniform int Credits<
ui_text = "Thanks Lord of Lunacy, Leftfarian, and other devs for helping me. <3\n"
"Thanks Alea and MassiHancer for testing.<3\n\n"
#line 380
"Credits:\n"
"Thanks Crosire for ReShade.\n"
"https://reshade.me/\n\n"
#line 384
"Thanks Jakob for DRME.\n"
"https://github.com/JakobPCoder/ReshadeMotionEstimation\n\n"
#line 387
"I learnt as lot from qUINT_SSR. Thanks Pascal Gilcher.\n"
"https://github.com/martymcmodding/qUINT\n\n"
#line 390
"Also a lot from DH_RTGI. Thanks Demien Hambert.\n"
"https://github.com/AlucardDH/dh-reshade-shaders\n\n"
#line 393
"Thanks Nvidia for <<Ray Tracing Gems II>> for ReBlur\n"
"https://link.springer.com/chapter/10.1007%2F978-1-4842-7185-8_49\n\n"
#line 396
"Thanks Radegast for Unity Sponza Test Scene.\n"
"https://mega.nz/#!qVwGhYwT!rEwOWergoVOCAoCP3jbKKiuWlRLuHo9bf1mInc9dDGE\n\n"
#line 399
"Thanks Timothy Lottes and AMD for the Tonemapper and the Inverse Tonemapper.\n"
"https://gpuopen.com/learn/optimized-reversible-tonemapper-for-resolve/\n\n"
#line 402
"Thanks Eric Reinhard for the Luminance Tonemapper and  the Inverse.\n"
"https://www.cs.utah.edu/docs/techreports/2002/pdf/UUCS-02-001.pdf\n\n"
#line 405
"Thanks sujay for the noise function. Ported from ShaderToy.\n"
"https://www.shadertoy.com/view/lldBRn";
#line 408
ui_category = "Credits";
ui_category_closed = true;
ui_label = " ";
ui_type = "radio";
>;
#line 414
uniform int Preprocessordefinitionstooltip<
ui_text = "RESOLUTION_SCALE_ : Lower values are much faster but may be a bit blurrier.\n\n"
#line 417
"SMOOTH_NORMALS : 0 is disabed, 1 is low quality and fast, 2 is high quality and a bit slow, 3 is Photography mode is really slow.\n\n"
#line 419
"UI_DIFFICULTY : 0 is EZ, 1 is for ReShade shamans.";
#line 422
ui_category = "Preprocessor definitions tooltip";
ui_category_closed = true;
ui_label = " ";
ui_type = "radio";
>;
#line 58 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting-Shader.fxh"
#line 59
uniform float Timer < source = "timer"; >;
uniform float Frame < source = "framecount"; >;
#line 62
static const float2 pix = float2((1.0 / 1920), (1.0 / 1080));
#line 69
static const float PI2div360 = 3.1415927/180;
#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting-Configs.fxh"
#line 75 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting-Shader.fxh"
#line 79
texture TexColor : COLOR;
sampler sTexColor {Texture = TexColor; SRGBTexture = false;};
#line 82
texture TexDepth : DEPTH;
sampler sTexDepth {Texture = TexDepth;};
#line 85
texture texMotionVectors { Width = 1920; Height = 1080; Format = RG16F; };
sampler SamplerMotionVectors { Texture = texMotionVectors; AddressU = Clamp; AddressV = Clamp; MipFilter = Point; MinFilter = Point; MagFilter = Point; };
#line 88
texture SSSR_ReflectionTex  { Width = 1920*0.67; Height = 1080*0.67; Format = RGBA16f; };
sampler sSSSR_ReflectionTex { Texture = SSSR_ReflectionTex; };
#line 91
texture SSSR_HitDistTex { Width = 1920*0.67; Height = 1080*0.67; Format = R16f; MipLevels = 7; };
sampler sSSSR_HitDistTex { Texture = SSSR_HitDistTex; };
#line 94
texture SSSR_POGColTex  { Width = 1920; Height = 1080; Format = R16f; };
sampler sSSSR_POGColTex { Texture = SSSR_POGColTex; };
#line 97
texture SSSR_FilterTex0  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_FilterTex0 { Texture = SSSR_FilterTex0; };
#line 100
texture SSSR_FilterTex1  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_FilterTex1 { Texture = SSSR_FilterTex1; };
#line 103
texture SSSR_FilterTex2  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_FilterTex2 { Texture = SSSR_FilterTex2; };
#line 106
texture SSSR_FilterTex3  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_FilterTex3 { Texture = SSSR_FilterTex3; };
#line 109
texture SSSR_PNormalTex  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_PNormalTex { Texture = SSSR_PNormalTex; };
#line 112
texture SSSR_NormTex  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_NormTex { Texture = SSSR_NormTex; };
#line 116
texture SSSR_NormTex1  { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler sSSSR_NormTex1 { Texture = SSSR_NormTex1; };
#line 122
texture SSSR_LowResDepthTex  { Width = 1920*0.67*0.5; Height = 1080*0.67*0.5; Format = R16f; };
sampler sSSSR_LowResDepthTex { Texture = SSSR_LowResDepthTex; };
#line 125
texture SSSR_LowResNormTex  { Width = 1920*0.67*0.5; Height = 1080*0.67*0.5; Format = RGBA16f; };
sampler sSSSR_LowResNormTex { Texture = SSSR_LowResNormTex; };
#line 129
texture SSSR_HLTex0 { Width = 1920; Height = 1080; Format = R16f; };
sampler sSSSR_HLTex0 { Texture = SSSR_HLTex0; };
#line 132
texture SSSR_HLTex1 { Width = 1920; Height = 1080; Format = R16f; };
sampler sSSSR_HLTex1 { Texture = SSSR_HLTex1; };
#line 135
texture SSSR_RoughTex { Width = 1920; Height = 1080; Format = R8; };
sampler sSSSR_RoughTex { Texture = SSSR_RoughTex; };
#line 167
float3 toYCC(float3 rgb)
{
float Y  =  .299 * rgb.x + .587 * rgb.y + .114 * rgb.z; 
float Cb = -.169 * rgb.x - .331 * rgb.y + .500 * rgb.z; 
float Cr =  .500 * rgb.x - .419 * rgb.y - .081 * rgb.z; 
return float3(Y,Cb + 128./255.,Cr + 128./255.);
}
#line 175
float3 toRGB(float3 ycc)
{
float3 c = ycc - float3(0., 128./255., 128./255.);
#line 179
float R = c.x + 1.400 * c.z;
float G = c.x - 0.343 * c.y - 0.711 * c.z;
float B = c.x + 1.765 * c.y;
return float3(R,G,B);
}
#line 185
float GetSpecularDominantFactor(float NoV, float roughness)
{
float a = 0.298475 * log(39.4115 - 39.0029 * roughness);
float f = pow(saturate(1.0 - NoV), 10.8649)*(1.0 - a) + a;
#line 190
return saturate(f);
}
#line 193
float GetHLDivion(in float HL){return HL*4;}
#line 195
float2 GetPixelSize()
{
float2 DepthSize = tex2Dsize(sTexDepth) / float2(1920, 1080);
float2 ColorSize = rcp(0.67);
#line 200
float2 MinResRcp = max(ColorSize, DepthSize);
#line 202
return MinResRcp;
}
#line 205
float2 GetPixelSizeWithMip(in float mip)
{
float2 DepthSize = tex2Dsize(sTexDepth) / float2(1920, 1080);
#line 209
float2 ColorSize = rcp(0.67);
ColorSize /= exp2(mip);
#line 212
float2 MinResRcp = max(ColorSize, DepthSize);
#line 214
return MinResRcp;
}
#line 217
float2 sampleMotion(float2 texcoord)
{
return tex2D(SamplerMotionVectors, texcoord).rg;
}
#line 222
float checker(float4 vpos)
{
if(Frame%2)vpos.y++;
return (vpos.y+vpos.x%2)%2;
}
#line 228
float checker(float2 uv)
{
uv *= float2(1920, 1080);
return checker(uv.xyxy);
}
#line 234
float WN(float2 co)
{
return frac(sin(dot(co.xy ,float2(1.0,73))) * 437580.5453);
}
#line 239
float3 WN3dts(float2 co, float HL)
{
co += (Frame%HL)/120.3476687;
#line 243
return float3( WN(co), WN(co+0.6432168421), WN(co+0.19216811));
}
#line 246
float IGN(float2 n)
{
float f = 0.06711056 * n.x + 0.00583715 * n.y;
return frac(52.9829189 * frac(f));
}
#line 252
float3 IGN3dts(float2 texcoord, float HL)
{
float3 OutColor;
float2 seed = texcoord*float2(1920, 1080)+(Frame%HL)*5.588238;
OutColor.r = IGN(seed);
OutColor.g = IGN(seed + 91.534651 + 189.6854);
OutColor.b = IGN(seed + 167.28222 + 281.9874);
return OutColor;
}
#line 262
texture SSSR_BlueNoise <source="BlueNoise-64frames128x128.png";> { Width = 1024; Height = 1024; Format = RGBA8;};
sampler sSSSR_BlueNoise { Texture = SSSR_BlueNoise; AddressU = REPEAT; AddressV = REPEAT; MipFilter = Point; MinFilter = Point; MagFilter = Point; };
#line 265
float3 BN3dts(float2 texcoord, float HL)
{
texcoord *= float2(1920, 1080); 
#line 269
texcoord = texcoord%128; 
#line 271
float frame = Frame%HL; 
int2 F;
F.x = frame%8; 
F.y = floor(frame/8)%8; 
F *= 128; 
texcoord += F;
#line 278
texcoord /= 1024; 
float3 Tex = tex2D(sSSSR_BlueNoise, texcoord).rgb;
return Tex;
}
#line 283
float3 UVtoPos(float2 texcoord)
{
float3 scrncoord = float3(texcoord.xy*2-1, ReShade::GetLinearizedDepth(texcoord) * 1000.0);
scrncoord.xy *= scrncoord.z;
scrncoord.x *= 1920/1080;
scrncoord.xy *= 50*PI2div360;
#line 291
return scrncoord.xyz;
}
#line 294
float3 UVtoPos(float2 texcoord, float depth)
{
float3 scrncoord = float3(texcoord.xy*2-1, depth * 1000.0);
scrncoord.xy *= scrncoord.z;
scrncoord.x *= 1920/1080;
scrncoord *= 50*PI2div360;
#line 302
return scrncoord.xyz;
}
#line 305
float2 PostoUV(float3 position)
{
float2 scrnpos = position.xy;
scrnpos /= 50*PI2div360;
scrnpos.x /= 1920/1080;
scrnpos /= position.z;
#line 312
return scrnpos/2 + 0.5;
}
#line 315
float3 Normal(float2 texcoord)
{
float2 p = pix;
float3 u,d,l,r,u2,d2,l2,r2;
#line 320
u = UVtoPos( texcoord + float2( 0, p.y));
d = UVtoPos( texcoord - float2( 0, p.y));
l = UVtoPos( texcoord + float2( p.x, 0));
r = UVtoPos( texcoord - float2( p.x, 0));
#line 325
p *= 2;
#line 327
u2 = UVtoPos( texcoord + float2( 0, p.y));
d2 = UVtoPos( texcoord - float2( 0, p.y));
l2 = UVtoPos( texcoord + float2( p.x, 0));
r2 = UVtoPos( texcoord - float2( p.x, 0));
#line 332
u2 = u + (u - u2);
d2 = d + (d - d2);
l2 = l + (l - l2);
r2 = r + (r - r2);
#line 337
float3 c = UVtoPos( texcoord);
#line 339
float3 v = u-c; float3 h = r-c;
#line 341
if( abs(d2.z-c.z) < abs(u2.z-c.z) ) v = c-d;
if( abs(l2.z-c.z) < abs(r2.z-c.z) ) h = c-l;
#line 344
return normalize(cross( v, h));
}
#line 347
float lum(in float3 color)
{
return (color.r+color.g+color.b)/3;
}
#line 352
float3 ClampLuma(float3 color, float luma)
{
float L = lum(color);
color /= L;
color *= L > luma ? luma : L;
return color;
}
#line 360
float3 GetRoughTex(float2 texcoord, float4 normal)
{
float2 p = pix;
#line 364
if(!GI)
{
#line 367
const float Threshold = 0.00003;
float facing = dot(normal.rgb, normalize(UVtoPos(texcoord, normal.a)));
facing *= facing;
#line 371
float roughfac; float2 fromrough, torough;
roughfac = (1 - roughness);
fromrough.x = lerp(0, 0.1, saturate(roughness*10));
fromrough.y = 0.8;
torough = float2(0, pow(max(roughness, 0.0), roughfac));
#line 377
float3 center = toYCC(tex2D(sTexColor, texcoord).rgb);
float depth = ReShade::GetLinearizedDepth(texcoord);
#line 380
float Roughness = 0.0;
#line 382
float2 offsets[4] = {float2(p.x,0), float2(-p.x,0),float2( 0,-p.y),float2(0,p.y)};
[unroll]for(int x; x < 4; x++)
{
float2 SampleCoord = texcoord + offsets[x];
float  SampleDepth = ReShade::GetLinearizedDepth(SampleCoord);
if(abs(SampleDepth - depth)*facing < Threshold)
{
float3 SampleColor = toYCC(tex2Dlod( sTexColor, float4(SampleCoord, 0.0, 0.0)).rgb);
SampleColor = min(abs(center.g - SampleColor.g), 0.25);
Roughness += SampleColor.r;
}
}
#line 395
Roughness = pow( max(Roughness, 0.0), roughfac*0.66);
Roughness = clamp(Roughness, fromrough.x, fromrough.y);
Roughness = (Roughness - fromrough.x) / ( 1 - fromrough.x );
Roughness = Roughness / fromrough.y;
Roughness = clamp(Roughness, torough.x, torough.y);
#line 401
return saturate(Roughness);
}
return 0.0;
}
#line 407
float3 Bump(float2 texcoord, float height)
{
float2 p = pix;
#line 411
float3 s[3];
s[0] = tex2D(sTexColor, texcoord + float2(p.x, 0)).rgb;
s[1] = tex2D(sTexColor, texcoord + float2(0, p.y)).rgb;
s[2] = tex2D(sTexColor, texcoord).rgb;
float LC = rcp(lum(s[0]+s[1]+s[2])) * height;
s[0] *= LC; s[1] *= LC; s[2] *= LC;
float d[3];
d[0] = ReShade::GetLinearizedDepth(texcoord + float2(p.x, 0));
d[1] = ReShade::GetLinearizedDepth(texcoord + float2(0, p.y));
d[2] = ReShade::GetLinearizedDepth(texcoord);
#line 425
float3 XB = s[2]-s[0];
float3 YB = s[2]-s[1];
#line 428
float3 bump = float3(lum(XB)*saturate(1-abs(d[0] - d[2])*1000), lum(YB)*saturate(1-abs(d[1] - d[2])*1000), 1);
bump = normalize(bump);
return bump;
}
#line 433
float3 blend_normals(float3 n1, float3 n2)
{
n1 += float3( 0, 0, 1);
n2 *= float3(-1, -1, 1);
return n1*dot(n1, n2)/n1.z - n2;
}
#line 440
static const float LinearGamma = 0.454545;
static const float sRGBGamma = 2.2;
#line 443
float3 InvTonemapper(float3 color)
{
if(LinearConvert)color = pow(max(color, 0.0), LinearGamma);
#line 447
float3 L;
if(1)L = max(max(color.r, color.g), color.b); 
else L = color; 
#line 451
color = color / ((1.0 + max(1-1,0.00001)) - L);
return color;
}
#line 455
float3 Tonemapper(float3 color)
{
float3 L;
if(1)L = max(max(color.r, color.g), color.b); 
else L = color; 
#line 461
color = color / ((1.0 + max(1-1,0.00001)) + L);
#line 463
if(LinearConvert)color = pow(color, sRGBGamma);
#line 465
return (color);
}
#line 468
float3 FixWhitePoint()
{
return rcp(Tonemapper(InvTonemapper(float3(1,1,1))));
}
#line 473
float InvTonemapper(float color)
{
return color / (1.001 - color);
}
#line 478
bool IsSaturated(float2 coord)
{
float2 a = float2(max(coord.r, coord.g), min(coord.r, coord.g));
return coord.r > 1 || coord.g < 0;
}
#line 484
bool IsSaturatedStrict(float2 coord)
{
float2 a = float2(max(coord.r, coord.g), min(coord.r, coord.g));
return coord.r >= 1 || coord.g <= 0;
}
#line 493
float4 tex2Dcatrom(in sampler tex, in float2 uv, in float2 texsize)
{
float4 result = 0.0f;
#line 497
if(false){
float2 samplePos = uv; samplePos *= texsize;
float2 texPos1 = floor(samplePos - 0.5f) + 0.5f;
#line 501
float2 f = samplePos - texPos1;
#line 503
float2 w0 = f * (-0.5f + f * (1.0f - 0.5f * f));
float2 w1 = 1.0f + f * f * (-2.5f + 1.5f * f);
float2 w2 = f * (0.5f + f * (2.0f - 1.5f * f));
float2 w3 = f * f * (-0.5f + 0.5f * f);
#line 508
float2 w12 = w1 + w2;
float2 offset12 = w2 / (w1 + w2);
#line 511
float2 texPos0 = texPos1 - 1;
float2 texPos3 = texPos1 + 2;
float2 texPos12 = texPos1 + offset12;
#line 515
texPos0 /= texsize;
texPos3 /= texsize;
texPos12 /= texsize;
#line 519
result += tex2D(tex, float2(texPos0.x, texPos0.y)) * w0.x * w0.y;
result += tex2D(tex, float2(texPos12.x, texPos0.y)) * w12.x * w0.y;
result += tex2D(tex, float2(texPos3.x, texPos0.y)) * w3.x * w0.y;
result += tex2D(tex, float2(texPos0.x, texPos12.y)) * w0.x * w12.y;
result += tex2D(tex, float2(texPos12.x, texPos12.y)) * w12.x * w12.y;
result += tex2D(tex, float2(texPos3.x, texPos12.y)) * w3.x * w12.y;
result += tex2D(tex, float2(texPos0.x, texPos3.y)) * w0.x * w3.y;
result += tex2D(tex, float2(texPos12.x, texPos3.y)) * w12.x * w3.y;
result += tex2D(tex, float2(texPos3.x, texPos3.y)) * w3.x * w3.y;
} 
else{
result = tex2D(tex, uv);
} 
return max(0, result);
}
#line 535
float GetRoughness(float2 texcoord)
{ return GI?1:tex2Dlod(sSSSR_RoughTex, float4(texcoord,0,0)).x;}
#line 542
void GBuffer1
(
float4 vpos : SV_Position,
float2 texcoord : TexCoord,
out float4 normal : SV_Target0,
out float roughness : SV_Target1) 
{
normal.rgb = Normal(texcoord.xy);
normal.a   = ReShade::GetLinearizedDepth(texcoord.xy);
#line 554
roughness = GetRoughTex(texcoord, normal).r;
}
#line 557
float4 SNH(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
float4 color = tex2D(sSSSR_NormTex, texcoord);
float4 s, s1; float sc;
#line 562
float2 p = pix; p*=5.5;
#line 564
float T = 2.5 * saturate(2*(1-color.a));
T = rcp(max(T, 0.0001));
#line 567
for (int i = -1; i <= 1; i++)
{
s = tex2D(sSSSR_NormTex, float2(texcoord + float2(i*p.x, 0)));
float diff = dot(0.333, abs(s.rgb - color.rgb)) + abs(s.a - color.a)*1000.0*1*2.5;
diff = 1-saturate(diff*T);
s1 += s*diff;
sc += diff;
}
#line 576
return s1.rgba/sc;
}
#line 580
float4 SNV(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
float4 color = tex2Dlod(sSSSR_NormTex1, float4(texcoord, 0, 0));
float4 s, s1; float sc;
#line 585
float2 p = pix; p*=5.5;
float T = 2.5 * saturate(2*(1-color.a)); T = rcp(max(T, 0.0001));
for (int i = -1; i <= 1; i++)
{
s = tex2D(sSSSR_NormTex1, float2(texcoord + float2(0, i*p.y)));
float diff = dot(0.333, abs(s.rgb - color.rgb)) + abs(s.a - color.a)*1000.0*1*2.5;
diff = 1-saturate(diff*T*2);
s1 += s*diff;
sc += diff;
}
#line 596
s1.rgba = s1.rgba/sc;
s1.rgb = blend_normals( Bump(texcoord, BUMP), s1.rgb);
return float4(s1.rgb, ReShade::GetLinearizedDepth(texcoord));
}
#line 602
void CopyGBufferLowRes(float4 vpos : SV_Position, float2 texcoord : TexCoord, out float4 Normal : SV_Target0, out float Depth : SV_Target1)
{
Normal = tex2D(sSSSR_NormTex, texcoord);
Depth = Normal.a*1000.0;
}
#line 609
void DoRayMarch(float3 noise, float3 position, float3 raydir, out float3 Reflection, out float HitDistance, out float a)
{
float3 raypos; float2 UVraypos; float Check, steplength; bool hit; uint i;
float bias = -position.z * rcp(1000.0);
#line 614
steplength = (1 + noise.x * 1) * position.z * 0.01;
#line 616
raypos = position + raydir * steplength;
float raydepth = -5;
#line 623
const int RaySteps[5] = {17, 65, 161, 321, 501};
const float RayIncPreset[5] = {2, 1.14, 1.045, 1.02, 1.012};
float RayInc = RayIncPreset[UI_QUALITY_PRESET];
[loop]for(i = 0; i < RaySteps[UI_QUALITY_PRESET]; i++)
#line 628
{
UVraypos = PostoUV(raypos);
#line 631
Check = tex2Dlod(sSSSR_LowResDepthTex, float4(UVraypos.xy, 0, 0)).r - raypos.z; 
#line 636
if(Check < bias && Check > raydepth * max(steplength, 1))
{
a= 1;
break;
}
else if(0&&Check < bias)break;
#line 643
raypos += raydir * steplength;
steplength *= RayInc;
}
#line 647
if(IsSaturatedStrict(UVraypos.xy)) Reflection = 0;
else Reflection = tex2D(sTexColor, UVraypos.xy).rgb*a;
HitDistance = a ? distance(raypos, position) : 1000.0;
}
#line 652
void RayMarch(float4 vpos : SV_Position, float2 texcoord : TexCoord, out float4 FinalColor : SV_Target0, out float HitDistance : SV_Target1)
{
float4 Geometry = tex2D(sSSSR_NormTex, texcoord);
#line 656
if(Geometry.w>0.99)
{
HitDistance = 0;
FinalColor.rgba = float4(0,0,0,GI?1:0);
}
else
{
float Roughness = GetRoughness(texcoord);
float HL = max(1, tex2D(sSSSR_HLTex0, texcoord).r);
#line 666
float3 BlueNoise  = BN3dts(texcoord, GI?64:max(1,HL));
float3 IGNoise    = IGN3dts(texcoord, max(64,1)); 
float3 WhiteNoise = WN3dts(texcoord, HL);
#line 670
float3 noise = (HL <= 0) ? IGNoise :
(HL > 64) ? WhiteNoise :
BlueNoise;
#line 674
float3 position = UVtoPos (texcoord);
float3 normal   = Geometry.xyz;
float3 eyedir   = normalize(position);
#line 678
float3 raydirG   = reflect(eyedir, normal);
float3 raydirR   = normalize(noise*2-1);
if(dot(raydirR, Normal(texcoord))>0) raydirR *= -1;
#line 682
float raybias    = dot(raydirG, raydirR);
#line 684
float3 raydir;
float4 reflection;
float a;
if(!GI)raydir = lerp(raydirG, raydirR, pow(max(1-(0.5*cos(raybias*3.1415927)+0.5), 0.0), rsqrt(InvTonemapper((GI)?1:Roughness))));
else raydir = raydirR;
#line 690
DoRayMarch(IGNoise, position, raydir, reflection.rgb, HitDistance, a);
#line 692
FinalColor.rgb = max(ClampLuma(InvTonemapper(reflection.rgb), 100),0);
#line 694
float FadeFac = 1-pow(Geometry.w, InvTonemapper(depthfade));
if(!GI)FinalColor.a = a*FadeFac;
else
{
float AORadius = rcp(max(1, max(0.25, 1)));
FinalColor.a = saturate((HitDistance)*20*AORadius/1000.0);
FinalColor.rgb *= a;
#line 702
FinalColor.rgb *= FadeFac;
FinalColor.a    = lerp(1, FinalColor.a, FadeFac);
}
}
}
#line 708
float2 GetMotionVectorsDeflickered(float2 texcoord)
{
float2 p = pix;
float2 MV = 0;
if(0.96<1)
{
MV = sampleMotion(texcoord);
if(abs(MV.x) < p.x && abs(MV.y) < p.y) MV = 0;
}
return sampleMotion(texcoord);
#line 719
}
#line 721
void TemporalFilter(float4 vpos : SV_Position, float2 texcoord : TexCoord, out float4 FinalColor : SV_Target0, out float HistoryLength : SV_Target1)
{
float2 MotionVectors = sampleMotion(texcoord);
float2 PastUV = texcoord + MotionVectors;
HistoryLength = tex2D(sSSSR_HLTex1, PastUV).r;
float depth = ReShade::GetLinearizedDepth(texcoord);
bool mask;
if(depth>0.99){mask=0;}else{
float4 past_normal; float3 normal, ogcolor; float2 outbound; float past_ogcolor, past_depth;
#line 731
normal = tex2D(sSSSR_NormTex, texcoord).rgb;
past_normal = tex2D(sSSSR_PNormalTex, PastUV);
past_depth = past_normal.w;
#line 735
ogcolor = toYCC(tex2D(sTexColor, texcoord).rgb);
past_ogcolor = tex2D(sSSSR_POGColTex, PastUV).r;
#line 738
ogcolor.r += ogcolor.g + ogcolor.b;
#line 740
mask = abs(depth - past_depth) * dot(normal, normalize(UVtoPos(texcoord)))
+ abs(ogcolor.r - past_ogcolor)*saturate(1-0.96)
<= 0.004;
}
#line 745
float4 Current, History; float3 Xvirtual, eyedir; float past_depth;
#line 747
float Roughness = GI?1:GetRoughness(texcoord);
#line 749
float2 outbound = PastUV;
outbound = float2(max(outbound.r, outbound.g), min(outbound.r, outbound.g));
outbound.rg = (outbound.r > 1 || outbound.g < 0);
#line 753
mask = min(1-outbound.r, mask);
#line 755
Current = tex2Dcatrom(sSSSR_ReflectionTex, texcoord, float2(1920, 1080)*0.67).rgba;
History = tex2D(sSSSR_FilterTex1, PastUV);
#line 758
HistoryLength.r *= mask; 
HistoryLength.r = min(HistoryLength.r, 64); 
#line 762
HistoryLength.r *= lerp(
1-saturate(
abs((GI?1:1.5)*
lum(tex2D(sSSSR_FilterTex3, PastUV).rgb) -
lum(History.rgb)
)
),
1,
saturate(1 - length(MotionVectors * 160 / 2))
);
#line 774
if(!GI)HistoryLength.r = HistoryLength.r
* max(saturate(1 - length(MotionVectors) 
* (1 - sqrt(Roughness))                  
* 160), 					  
0.05);						
#line 780
HistoryLength.r++;
FinalColor = lerp(History, Current, 1 / HistoryLength.r);
FinalColor = max(1e-6, FinalColor);
}
#line 785
float GetHitDistanceAdaptation(float2 texcoord, float Roughness)
{
float HD = tex2Dlod(sSSSR_HitDistTex, float4(texcoord, 0, 3)).r;
HD = lerp(saturate(4 * HD * rcp(1000.0)), 1, Roughness);
return HD;
}
#line 792
void GetNormalAndDepthFromGeometry(in float2 texcoord, out float3 Normal, out float Depth)
{
float4 Geometry = tex2Dlod(sSSSR_NormTex, float4(texcoord,0,0));
Normal = Geometry.rgb;
Depth = Geometry.a;
}
#line 799
float GetSpecularSpatialDenoiserRadius(float2 texcoord)
{
float Roughness = GetRoughness(texcoord);
float HitDistance = GetHitDistanceAdaptation(texcoord, Roughness);
float radius = saturate(Roughness * 4) * HitDistance;
#line 805
return (max(0.000025, saturate((radius))));
}
#line 809
float4 AdaptiveBox(in int size, in sampler Tex, in float2 texcoord, in float checkertex, in float HL)
{
float2 p = pix;
float SpecRadius = 1;
if(!GI)SpecRadius = GetSpecularSpatialDenoiserRadius(texcoord);
p*=SpecRadius;
float3 normal; float depth;
GetNormalAndDepthFromGeometry(texcoord, normal, depth);
#line 819
float facing = dot(normal, normalize(UVtoPos(texcoord, depth)));
facing *= facing;
#line 822
const float STMulList[3] = {20, 10, 5};
float ST = lerp(0.003 * STMulList[size], 0.003, sqrt(saturate(HL/16)));
float STNormal = 1 - saturate(ST * 100);
float STDepth = ST/2.5;
#line 827
const float SizeList[3] = {2,4,8};
const float SizeListSmall[3] = {0,1,2};
#line 830
p *= round(lerp(SizeList[size], SizeListSmall[size], min(HL/64, 1)));
#line 832
p += checkertex * p; 
float2 pr = p * 0.70710678; 
#line 835
float2 offset[8];
offset = {
float2(-pr.x,-pr.y),float2(0, p.y),float2( pr.x,-pr.y),
float2(-p.x,     0),			   float2( p.x,     0),
float2(-pr.x, pr.y),float2(0,-p.y),float2( pr.x, pr.y)};
#line 841
float4 color = tex2Dlod(Tex, float4(texcoord, 0, 0));
float4 sColor = color;
int samples = 1;
float3 snormal; float sdepth; bool determinator;
#line 846
[loop]for(int i = 0; i <= 7; i++)
{
offset[i] += texcoord;
#line 850
GetNormalAndDepthFromGeometry(offset[i], snormal, sdepth);
#line 852
determinator =
(dot(snormal, normal)) > STNormal
&& abs(sdepth - depth) * facing < STDepth;
#line 856
sColor += tex2Dlod(Tex, float4(offset[i],0,0))*determinator;
samples +=determinator;
}
sColor /= samples;
return sColor;
}
#line 863
void SpatialFilter0( in float4 vpos : SV_Position, in float2 texcoord : TexCoord, out float4 FinalColor : SV_Target0)
{
float HLOut = tex2D(sSSSR_HLTex0, texcoord).r;
float HL = GetHLDivion(HLOut);
#line 868
float checkertex = checker(vpos);
float4 color = AdaptiveBox(0, sSSSR_FilterTex0, texcoord, checkertex, HL);
color.a = lerp(color.a, tex2D(sSSSR_FilterTex0, texcoord).a, 1);
FinalColor = max(color, 1e-6);
}
#line 874
void SpatialFilter1( in float4 vpos : SV_Position, in float2 texcoord : TexCoord, out float4 FinalColor : SV_Target0)
{
float HLOut = tex2D(sSSSR_HLTex0, texcoord).r;
float HL = GetHLDivion(HLOut);
#line 879
float checkertex = checker(vpos);
float4 color = AdaptiveBox(1, sSSSR_FilterTex1, texcoord, checkertex, HL);
color.a = lerp(color.a, tex2D(sSSSR_FilterTex1, texcoord).a, 1);
FinalColor = max(color, 1e-6);
}
#line 885
void SpatialFilter2(
in  float4 vpos       : SV_Position,
in  float2 texcoord   : TexCoord,
out float4 FinalColor : SV_Target0,
out float4 Geometry   : SV_Target1,
out float3 Ogcol      : SV_Target2,
out float  HLOut      : SV_Target3,
out float4 TSHistory  : SV_Target4)
{
HLOut = tex2D(sSSSR_HLTex0, texcoord).r;
float HL = GetHLDivion(HLOut);
#line 897
float checkertex = checker(vpos);
float4 color = AdaptiveBox(2, sSSSR_FilterTex0, texcoord, checkertex, HL);
color.a = lerp(color.a, tex2D(sSSSR_FilterTex0, texcoord).a, saturate((HLOut-8)/64));
FinalColor = max(color, 1e-6);
#line 902
Geometry   = tex2D(sSSSR_NormTex, texcoord);
TSHistory  = tex2D(sSSSR_FilterTex3, texcoord).rgba;
float3 OGC = toYCC(tex2D(sTexColor, texcoord).rgb);
Ogcol      = OGC.x+OGC.y+OGC.z;
}
#line 908
void TemporalStabilizer(float4 vpos : SV_Position, float2 texcoord : TexCoord, out float4 FinalColor : SV_Target0)
{
float HL = tex2D(sSSSR_HLTex0, texcoord).r;
float2 p = pix;
#line 913
float Roughness = tex2D(sSSSR_RoughTex, texcoord).x;
float2 MotionVectors = GetMotionVectorsDeflickered(texcoord);
#line 916
float4 current = tex2D(sSSSR_FilterTex1, texcoord);
float4 history = tex2Dcatrom(sSSSR_FilterTex2, texcoord +  MotionVectors, float2(1920, 1080));
#line 919
history.rgb = toYCC(history.rgb);
float4 CurrToYCC = float4(toYCC(current.rgb), current.a);
#line 922
float4 SharpenMin = 1000000, SharpenMax = 0;
float4 SharpenMean = current;
#line 926
float4 Max = CurrToYCC, Min = CurrToYCC;
#line 928
float4 PreSqr = CurrToYCC * CurrToYCC, PostSqr = CurrToYCC;
#line 930
float4 SCurrent; int x, y;
float2 pr = p * 0.707;
float2 offsets[8] =
{
float2(p.x,  0), float2(-p.x,   0), float2(  0,-p.y), float2(   0,p.y),
float2(pr.x,pr.y), float2(-pr.x,-pr.y), float2(pr.x,-pr.y), float2(-pr.x,pr.y)
};
#line 938
[unroll]for(int x = 0; x < 8; x++)
{
SCurrent = tex2D(sSSSR_FilterTex1, texcoord + offsets[x]);
#line 942
SharpenMin = min(SCurrent, SharpenMin);
SharpenMax = max(SCurrent, SharpenMax);
SharpenMean += SCurrent;
#line 946
SCurrent.rgb = toYCC(SCurrent.rgb);
#line 948
Max = max(SCurrent, Max);
Min = min(SCurrent, Min);
#line 951
PreSqr += SCurrent * SCurrent;
PostSqr += SCurrent;
}
#line 956
float4 chistory = lerp(history, clamp(history, Min, Max), 1);
#line 961
PostSqr /= 8+1; PreSqr /= 8+1;
PostSqr *= PostSqr;
float4 Var = sqrt(abs(PostSqr - PreSqr));
Var = pow(Var, 0.7);
Var.xyz *= CurrToYCC.x;
#line 967
chistory = lerp(chistory, clamp(chistory, CurrToYCC - Var, CurrToYCC + Var), 0.15);
#line 970
float4 diff = saturate((abs(chistory - history)));
diff.r = diff.g + diff.b;
#line 973
chistory.rgb = toRGB(chistory.rgb);
#line 975
float2 outbound = texcoord + MotionVectors;
outbound = float2(max(outbound.r, outbound.g), min(outbound.r, outbound.g));
outbound.rg = (outbound.r > 1 || outbound.g < 0);
#line 979
float4 LerpFac = 0.99                        
*(1 - outbound.r)                   
#line 982
*max(0.5, saturate(1 - diff.rrra*10))                  
*max(0.7, 1 - 5 * length(MotionVectors))  
;
LerpFac = saturate(LerpFac);
#line 987
FinalColor = lerp(current, chistory, LerpFac);
#line 989
if(false||(0.67<1&&!0))
{
SharpenMean /= 8+1;
#line 993
float4 weight = 1-saturate(Var * 2 - 1);
FinalColor = FinalColor + (FinalColor - SharpenMean) * weight * 1;
}
FinalColor = clamp(FinalColor, max(0.00000001, SharpenMin), SharpenMax);
}
#line 999
float3 RITM(in float3 color){return color/max(1 - color, 0.001);}
float3 RTM(in float3 color){return color / (1 + color);}
#line 1002
void Output(float4 vpos : SV_Position, float2 texcoord : TexCoord, out float3 FinalColor : SV_Target0)
{
FinalColor = 0;
float2 p = pix;
float3 Background = tex2D(sTexColor, texcoord).rgb;
float  Depth      = ReShade::GetLinearizedDepth(texcoord);
float  Roughness  = tex2D(sSSSR_RoughTex, texcoord).x;
float HL = tex2D(sSSSR_HLTex0, texcoord).r;
#line 1012
if(debug==1)Background = 0.5;
#line 1015
if(debug == 0 || debug == 1)
{
if(GI)
{
float4 GI = tex2D(sSSSR_FilterTex3, texcoord).rgba;
#line 1021
GI.rgb = Tonemapper(GI.rgb);
GI.rgb = RITM(GI.rgb);
#line 1024
float3 HDR_Background = RITM(Background);
#line 1027
float2 AO;
#line 1029
float Div = max(1, max(0.25, 1));
AO.g = saturate(GI.a * Div / 0.25);
AO.r = saturate(GI.a * Div / 1);
AO   = saturate(pow(max(AO, 0.0), AO_Intensity));
#line 1035
GI.rgb *= SatExp.g;
GI.rgb = lerp(lum(GI.rgb), GI.rgb, SatExp.r);
#line 1039
float3 Img_AO = HDR_Background * AO.r;
float3  GI_AO = GI.rgb * AO.g;
#line 1042
float3 Img_GI = Img_AO + GI_AO * Background;
Img_GI = RTM(Img_GI);
#line 1045
FinalColor = Img_GI;
}
else
{
float4 Reflection = tex2D(sSSSR_FilterTex3, texcoord);
Reflection.rgb = Tonemapper(Reflection.rgb);
Reflection.rgb = RITM(Reflection.rgb);
#line 1054
float3 Normal  = tex2D(sSSSR_NormTex, texcoord).rgb;
float3 Eyedir  = normalize(UVtoPos(texcoord));
float  Coeff   = pow(abs(1 - dot(Normal, Eyedir)), lerp(EXP, 0, Roughness));
float  Fresnel = lerp(0.05, 1, Coeff)*Reflection.a;
#line 1060
Reflection.rgb *= SatExp.g;
Reflection.rgb  = lerp(lum(Reflection.rgb), Reflection.rgb, SatExp.r);
#line 1064
float3 Img_Reflection = lerp(RITM(Background), Reflection.rgb, Fresnel);
Img_Reflection = RTM(Img_Reflection);
#line 1067
FinalColor = Img_Reflection;
}
#line 1070
FinalColor *= FixWhitePoint();
}
#line 1074
else if(debug == 2) FinalColor = sqrt(Depth);
else if(debug == 3) FinalColor = tex2D(sSSSR_NormTex, texcoord).rgb * 0.5 + 0.5;
else if(debug == 4) FinalColor = tex2D(sSSSR_HLTex1, texcoord).r/64;
else if(debug == 5) FinalColor = Roughness;
#line 1080
if(Depth <= 0.0001) FinalColor = Background;
#line 1082
}
#line 12 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\NGLighting.fx"
#line 14
technique NGLighting<
ui_label = "NiceGuy Lighting (GI/Reflection)";
ui_tooltip = "            NiceGuy Lighting 0.9.2 beta            \n"
"                  ||By Ehsan2077||                 \n"
"|Optional: Use with qUINT_MotionVectors above this technique in the load order at quarter detail.|\n"
"|And    don't   forget    to   read   the   hints.|";
>
{
pass
{
VertexShader  = PostProcessVS;
PixelShader   = GBuffer1;
RenderTarget0 = SSSR_NormTex;
RenderTarget1 = SSSR_RoughTex;
}
#line 30
pass SmoothNormalHpass
{
VertexShader = PostProcessVS;
PixelShader = SNH;
RenderTarget = SSSR_NormTex1;
}
pass SmoothNormalVpass
{
VertexShader = PostProcessVS;
PixelShader = SNV;
RenderTarget = SSSR_NormTex;
}
#line 44
pass LowResGBuffer
{
VertexShader = PostProcessVS;
PixelShader = CopyGBufferLowRes;
RenderTarget0 = SSSR_LowResNormTex;
RenderTarget1 = SSSR_LowResDepthTex;
}
#line 52
pass
{
VertexShader  = PostProcessVS;
PixelShader   = RayMarch;
RenderTarget0 = SSSR_ReflectionTex;
}
#line 88
pass
{
VertexShader  = PostProcessVS;
PixelShader   = TemporalFilter;
RenderTarget0 = SSSR_FilterTex0;
RenderTarget1 = SSSR_HLTex0;
}
pass
{
VertexShader  = PostProcessVS;
PixelShader   = SpatialFilter0;
RenderTarget0 = SSSR_FilterTex1;
}
pass
{
VertexShader  = PostProcessVS;
PixelShader   = SpatialFilter1;
RenderTarget0 = SSSR_FilterTex0;
}
pass
{
VertexShader  = PostProcessVS;
PixelShader   = SpatialFilter2;
RenderTarget0 = SSSR_FilterTex1;
RenderTarget1 = SSSR_PNormalTex;
RenderTarget2 = SSSR_POGColTex;
RenderTarget3 = SSSR_HLTex1;
RenderTarget4 = SSSR_FilterTex2;
}
#line 118
pass
{
VertexShader  = PostProcessVS;
PixelShader   = TemporalStabilizer;
RenderTarget0 = SSSR_FilterTex3;
}
pass
{
VertexShader  = PostProcessVS;
PixelShader   = Output;
}
}

