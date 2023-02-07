#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\BlueNoiseMotionBlur.fx"
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
#line 26 "C:\Program Files\GShade\gshade-shaders\Shaders\BlueNoiseMotionBlur.fx"
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
#line 27 "C:\Program Files\GShade\gshade-shaders\Shaders\BlueNoiseMotionBlur.fx"
#line 30
uniform uint framecount < source = "framecount"; >;
#line 35
texture InterlacedTargetBuffer
{
Width = 1920;
Height = 1080;
};
sampler InterlacedBufferSampler
{
Texture = InterlacedTargetBuffer;
MagFilter = POINT;
MinFilter = POINT;
MipFilter = POINT;
#line 47
SRGBTexture = true;
};
#line 53
float4 InterlacedVS(in uint id : SV_VertexID) : SV_Position
{
#line 56
const float2 vertexPos[3] = {
float2(-1f, 1f), 
float2(-1f,-3f), 
float2( 3f, 1f)  
};
return float4(vertexPos[id], 0f, 1f);
}
#line 65
void InterlacedTargetPass(float4 pixelPos : SV_Position, out float4 Target : SV_Target)
{
#line 68
uint2 pixelCoord = uint2(pixelPos.xy);
#line 70
Target.rgb = tex2Dfetch(ReShade::BackBuffer, pixelCoord).rgb;
#line 72
uint offset = uint(4f*tex2Dfetch(BlueNoise::BlueNoiseTexSmp, pixelCoord/64u%64u).r);
offset += framecount;
#line 75
Target.a = tex2Dfetch(BlueNoise::BlueNoiseTexSmp, pixelCoord%64u)[offset%4u];
}
#line 79
float4 InterlacedPS(float4 pixelPos : SV_Position) : SV_Target
{ return tex2Dfetch(InterlacedBufferSampler, uint2(pixelPos.xy)); }
#line 85
technique BlueNoiseMotion
<
ui_label = "Blue Noise Motion Blur";
ui_tooltip =
"It generates 'fake' motion blur, by blending previous frames.\n"
"The smoothness is achieved by incorporating blue noise as a blending pattern.\n"
"\n"
"To get higher quality results, the game should be running at higher FPS.\n"
"\n"
"This effect © 2022 Jakub Maksymilian Fober\n"
"Licensed under CC BY-NC-ND 3.0 + additional permissions (see source).";
>{
pass GatherFrames
{
VertexShader = InterlacedVS;
PixelShader = InterlacedTargetPass;
#line 102
RenderTarget = InterlacedTargetBuffer;
#line 104
ClearRenderTargets = false;
SRGBWriteEnable = true; 
#line 107
BlendEnable = true;
BlendOp = ADD; 
SrcBlend = SRCALPHA;
DestBlend = INVSRCALPHA;
}
pass DisplayEffect
{
VertexShader = InterlacedVS;
PixelShader = InterlacedPS;
}
}

