#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\GlobalAlpha.fx"
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
#line 33 "C:\Program Files\GShade\gshade-shaders\Shaders\GlobalAlpha.fx"
#line 34
uniform bool bIgnore <
ui_label = "Ignore Fully Transparent Pixels";
ui_tooltip = "If this setting is enabled, pixels with a alpha value of 0 will not be modified and remain fully transparent.";
ui_bind = "GLOBAL_ALPHA_IGNORE";
> = true;
#line 44
uniform float fOpacity <
ui_label = "Alpha";
ui_tooltip = "If this setting is above 0.0 (fully transparent), you will mainly be able to see its impact in screenshots.\n\nA value of 0.5 is 50\% transparent.";
ui_type = "slider";
> = 1.0;
#line 50
float4 GlobalAlphaPS(float4 pos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target
{
const float4 back = tex2D(ReShade::BackBuffer, texcoord);
#line 55
return float4(back.rgb, back.a <= 0.0 ? back.a : fOpacity);
#line 59
}
#line 61
technique GlobalAlpha
{
pass
{
VertexShader = PostProcessVS;
PixelShader = GlobalAlphaPS;
}
}

