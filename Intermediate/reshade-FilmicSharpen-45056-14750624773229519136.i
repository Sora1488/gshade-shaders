#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\FilmicSharpen.fx"
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
#line 30 "C:\Program Files\GShade\gshade-shaders\Shaders\FilmicSharpen.fx"
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
#line 31 "C:\Program Files\GShade\gshade-shaders\Shaders\FilmicSharpen.fx"
#line 34
uniform uint Strength <
ui_type = "slider";
ui_label = "Strength";
ui_min = 1u; ui_max = 64u;
> = 32u;
#line 40
uniform float Offset <
ui_type = "slider";
ui_label = "Radius";
ui_tooltip = "High-pass cross offset in pixels";
ui_min = 0.05; ui_max = 0.25; ui_step = 0.01;
> = 0.1;
#line 47
uniform bool UseMask <
ui_type = "input";
ui_label = "Sharpen only center";
ui_tooltip = "Sharpen only in center of the image";
> = false;
#line 53
uniform float Clamp <
ui_type = "slider";
ui_label = "Clamping highlights";
ui_min = 0.5; ui_max = 1.0; ui_step = 0.1;
ui_category = "Additional settings";
ui_category_closed = true;
> = 0.6;
#line 61
uniform bool Preview <
ui_type = "input";
ui_label = "Preview sharpen layer";
ui_tooltip = "Preview sharpen layer and mask for adjustment.\n"
"If you don't see red strokes,\n"
"try changing Preprocessor Definitions in the Settings tab.";
ui_category = "Debug View";
ui_category_closed = true;
> = false;
#line 74
float Overlay(float LayerA, float LayerB)
{
float MinA = min(LayerA, 0.5);
float MinB = min(LayerB, 0.5);
float MaxA = max(LayerA, 0.5);
float MaxB = max(LayerB, 0.5);
return 2f*((MinA*MinB+MaxA)+(MaxB-MaxA*MaxB))-1.5;
}
#line 86
void FilmicSharpenPS(float4 pixelPos : SV_Position, float2 UvCoord : TEXCOORD, out float3 color : SV_Target)
{
#line 89
color = tex2D(ReShade::BackBuffer, UvCoord).rgb;
#line 92
float Mask;
if (UseMask)
{
#line 96
float2 viewCoord = UvCoord*2f-1f;
#line 98
viewCoord.y *= 1080*(1.0 / 1920);
#line 100
Mask = Strength-min(dot(viewCoord, viewCoord), 1f)*Strength;
}
else Mask = Strength;
#line 105
float2 Pixel = float2((1.0 / 1920), (1.0 / 1080))*Offset;
#line 108
float2 NorSouWesEst[4] = {
float2(UvCoord.x, UvCoord.y+Pixel.y),
float2(UvCoord.x, UvCoord.y-Pixel.y),
float2(UvCoord.x+Pixel.x, UvCoord.y),
float2(UvCoord.x-Pixel.x, UvCoord.y)
};
#line 116
float HighPass = 0f;
[unroll]
for(uint i=0u; i<4u; i++)
HighPass += dot(LumaMtx, tex2D(ReShade::BackBuffer, NorSouWesEst[i]).rgb);
#line 121
HighPass = 0.5-0.5*(HighPass*0.25-dot(LumaMtx, color));
#line 124
HighPass = lerp(0.5, HighPass, Mask);
#line 127
HighPass = Clamp!=1f? clamp(HighPass, 1f-Clamp, Clamp) : HighPass;
#line 130
if (Preview) color = HighPass;
else
{
[unroll]
for(uint i=0u; i<3u; i++)
#line 136
color[i] = Overlay(color[i], HighPass);
}
#line 140
color = BlueNoise::dither(uint2(pixelPos.xy), color);
}
#line 145
technique FilmicSharpen < ui_label = "Filmic Sharpen"; >
{
pass
{
VertexShader = PostProcessVS;
PixelShader = FilmicSharpenPS;
}
}

