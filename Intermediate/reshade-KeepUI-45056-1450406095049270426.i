#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\KeepUI.fx"
#line 47
uniform bool bKeepUIOcclude <
ui_category = "Options";
ui_label = "Occlusion Assistance";
ui_tooltip = "Set to 1 if you notice odd graphical issues with Bloom or similar shaders. May cause problems with SSDO when enabled.";
ui_bind = "KeepUIOccludeAssist";
> = 0;
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
#line 93 "C:\Program Files\GShade\gshade-shaders\Shaders\KeepUI.fx"
#line 94
texture KeepUI_Tex { Width = 1920; Height = 1080; };
sampler KeepUI_Sampler { Texture = KeepUI_Tex; };
#line 97
void PS_KeepUI(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target)
{
color = tex2D(ReShade::BackBuffer, texcoord);
#line 103
}
#line 114
void PS_RestoreUI(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target)
{
#line 145
color = tex2D(ReShade::BackBuffer, texcoord);
const float4 keep = tex2D(KeepUI_Sampler, texcoord);
#line 148
color.rgb   = lerp(color.rgb, keep.rgb, keep.a).rgb;
#line 150
}
#line 152
technique FFKeepUI <
ui_tooltip = "Place this at the top of your Technique list to save the UI into a texture for restoration with FFRestoreUI.\n"
"To use this Technique, you must also enable \"FFRestoreUI\".\n";
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = PS_KeepUI;
RenderTarget = KeepUI_Tex;
}
#line 170
}
#line 172
technique FFRestoreUI <
ui_tooltip = "Place this at the bottom of your Technique list to restore the UI texture saved by FFKeepUI.\n"
"To use this Technique, you must also enable \"FFKeepUI\".\n";
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = PS_RestoreUI;
}
}

