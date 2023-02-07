#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Prism.fx"
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
#line 33 "C:\Program Files\GShade\gshade-shaders\Shaders\Prism.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ColorAndDither.fxh"
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
#line 34 "C:\Program Files\GShade\gshade-shaders\Shaders\Prism.fx"
#line 37
uniform float4 K <
ui_type = "drag";
ui_min = -0.1;
ui_max =  0.1;
ui_label = "Radial 'k' coefficients";
ui_tooltip = "Radial distortion coefficients k1, k2, k3, k4.";
ui_category = "Chromatic aberration";
> = float4(0.016, 0f, 0f, 0f);
#line 48
uniform uint ChromaticSamplesLimit <
ui_type = "slider";
ui_min = 6u; ui_max = 128u; ui_step = 2u;
ui_label = "Chromatic aberration samples limit";
ui_tooltip =
"Sample count is generated automatically per pixel, based on visible distortion amount.\n"
"This option limits maximum sample (steps) count allowed for color fringing.\n"
"Only even numbers are accepted, odd numbers will be clamped.";
ui_category = "Performance";
ui_category_closed = true;
> = 64u;
#line 65
float3 Spectrum(float hue)
{
float3 hueColor;
hue *= 4f; 
hueColor.rg = hue-float2(1f, 2f);
hueColor.rg = saturate(1.5-abs(hueColor.rg));
hueColor.r += saturate(hue-3.5);
hueColor.b = 1f-hueColor.r;
return hueColor;
}
#line 79
sampler BackBuffer
{
Texture = ReShade::BackBufferTex;
#line 83
SRGBTexture = true;
#line 86
AddressU = MIRROR;
AddressV = MIRROR;
};
#line 93
void ChromaticAberrationVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 viewCoord : TEXCOORD)
{
#line 96
const float2 vertexPos[3] =
{
float2(-1f, 1f), 
float2(-1f,-3f), 
float2( 3f, 1f)  
};
#line 103
viewCoord.x =  vertexPos[id].x;
viewCoord.y = -vertexPos[id].y;
#line 106
viewCoord *= normalize(float2(1920, 1080));
#line 108
position = float4(vertexPos[id], 0f, 1f);
}
#line 112
void ChromaticAberrationPS(float4 pixelPos : SV_Position, float2 viewCoord : TEXCOORD, out float3 color : SV_Target)
{
#line 115
float4 pow_radius;
pow_radius[0] = dot(viewCoord, viewCoord); 
pow_radius[1] = pow_radius[0]*pow_radius[0]; 
pow_radius[2] = pow_radius[1]*pow_radius[0]; 
pow_radius[3] = pow_radius[2]*pow_radius[0]; 
#line 121
float2 distortion = viewCoord*(rcp(1f+dot(K, pow_radius))-1f)/normalize(float2(1920, 1080))*0.5; 
#line 123
viewCoord = pixelPos.xy*float2((1.0 / 1920), (1.0 / 1080));
#line 125
uint evenSampleCount = min(ChromaticSamplesLimit-ChromaticSamplesLimit%2u, 128u); 
#line 127
uint totalPixelOffset = uint(ceil(length(distortion*float2(1920, 1080))));
#line 129
evenSampleCount = clamp(totalPixelOffset+totalPixelOffset%2u, 4u, evenSampleCount);
#line 132
color = 0f; 
for (uint i=0u; i<evenSampleCount; i++)
#line 137
color += tex2Dlod(
#line 139
BackBuffer, 
float4(
(i/float(evenSampleCount-1u)-0.5) 
*distortion 
+viewCoord, 
0f, 0f)
#line 148
).rgb
#line 150
*Spectrum(i/float(evenSampleCount)); 
#line 152
color *= 2f/evenSampleCount;
#line 154
color = to_display_gamma_hq(color);
#line 156
color = BlueNoise::dither(uint2(pixelPos.xy), color); 
}
#line 161
technique ChromaticAberration
<
ui_label = "Chromatic Aberration";
ui_tooltip =
"Chromatic aberration color split at the screen borders.\n"
"\n"
"	· Dynamic minimal sample count per pixel.\n"
"	· Accurate color split.\n"
"	· Driven by lens distortion Brown-Conrady division model.\n"
"\n"
"\n"
"This effect © 2018-2022 Jakub Maksymilian Fober\n"
"Licensed under CC BY-NC-ND 3.0 + additional permissions (see source).";
>
{
pass ChromaticColorSplit
{
VertexShader = ChromaticAberrationVS;
PixelShader  = ChromaticAberrationPS;
}
}

