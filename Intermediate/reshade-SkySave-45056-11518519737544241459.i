#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\SkySave.fx"
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
#line 29 "C:\Program Files\GShade\gshade-shaders\Shaders\SkySave.fx"
#line 30
texture SkySave_Tex { Width = 1920; Height = 1080; Format = RGBA16f; };
sampler SkySave_Sampler { Texture = SkySave_Tex; };
#line 33
uniform float fSkySaveDepth <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_label = "Depth";
> = 0.999;
#line 40
void PS_SkySave(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target)
{
if (ReShade::GetLinearizedDepth(texcoord) > fSkySaveDepth)
{
color = tex2D(ReShade::BackBuffer, texcoord);
}
else
{
color = float4(0.0, 0.0, 0.0, 2.0);
}
}
#line 52
void PS_SkyRestore(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 color : SV_Target)
{
const float4 keep = tex2D(SkySave_Sampler, texcoord);
#line 56
if (keep.a != 2.0)
{
color = keep;
}
else
{
color = tex2D(ReShade::BackBuffer, texcoord);
}
}
#line 66
technique SkySave <
ui_tooltip = "Place this at the point in your load order where you want to save the sky for later restoration with SkyRestore.\n"
"To use this Technique, you must also enable \"SkyRestore\".\n";
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = PS_SkySave;
RenderTarget = SkySave_Tex;
}
}
#line 79
technique SkyRestore <
ui_tooltip = "Place this at the point in your load order where you want to restore the sky previously saved by SkySave.\n"
"To use this Technique, you must also enable \"SkySave\".\n";
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = PS_SkyRestore;
}
}

