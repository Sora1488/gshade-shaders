#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\LightPersistance.fx"
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
#line 2 "C:\Program Files\GShade\gshade-shaders\Shaders\LightPersistance.fx"
#line 3
uniform float persistance <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
ui_label = "Persistance";
> = 0.1;
#line 9
texture LPt { Width = 1920; Height = 1080; Format = RGBA16F; };
sampler LPs { Texture = LPt; };
#line 12
float3 lightPersistance(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR
{
return max(tex2D(LPs, texcoord).rgb, tex2D(ReShade::BackBuffer, texcoord).rgb);
}
#line 17
float3 previousFrame(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR
{
if(persistance == 0.0)
{
return tex2D(ReShade::BackBuffer, texcoord).rgb;
}
else
{
return (tex2D(ReShade::BackBuffer, texcoord).rgb / (1 + persistance)) - 0.002;
}
}
#line 29
technique LightPersistance
{
pass pass0
{
VertexShader = PostProcessVS;
PixelShader = lightPersistance;
}
#line 37
pass pass1
{
VertexShader = PostProcessVS;
PixelShader = previousFrame;
RenderTarget = LPt;
}
}

