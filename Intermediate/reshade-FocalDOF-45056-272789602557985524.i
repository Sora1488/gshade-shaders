#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\FocalDOF.fx"
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
#line 4 "C:\Program Files\GShade\gshade-shaders\Shaders\FocalDOF.fx"
#line 17
uniform float DofScale
<
ui_type = "slider";
ui_label = "Scale";
ui_tooltip =
"If this is empty, nag @luluco250 in the ReShade Discord channel.\n"
"\nDefault: 3.0";
ui_category = "Appearance";
ui_min = 1.0;
ui_max = 10.0;
ui_step = 0.001;
> = 3.0;
#line 30
uniform float FocusTime
<
ui_type = "slider";
ui_label = "Time";
ui_tooltip =
"If this is empty, nag @luluco250 in the ReShade Discord channel.\n"
"\nDefault: 350.0";
ui_category = "Focus";
ui_min = 0.0;
ui_max = 2000.0;
ui_step = 10.0;
> = 350.0;
#line 43
uniform float2 FocusPoint
<
ui_type = "slider";
ui_label = "Point";
ui_tooltip =
"If this is empty, nag @luluco250 in the ReShade Discord channel.\n"
"\nDefault: 0.5 0.5";
ui_category = "Focus";
ui_min = 0.0;
ui_max = 1.0;
ui_step = 0.001;
> = float2(0.5, 0.5);
#line 56
uniform float FrameTime <source = "frametime";>;
#line 74
texture FocalDOF_Focus { Format = R32F; };
sampler Focus { Texture = FocalDOF_Focus; };
#line 77
texture FocalDOF_LastFocus { Format = R32F; };
sampler LastFocus { Texture = FocalDOF_LastFocus; };
#line 84
void GetFocusVS(
uint id : SV_VERTEXID,
out float4 p : SV_POSITION,
out float2 uv : TEXCOORD0,
out float focus : TEXCOORD1)
{
PostProcessVS(id, p, uv);
#line 95
focus = 0.0;
#line 97
}
#line 99
void ReadFocusVS(
uint id : SV_VERTEXID,
out float4 p : SV_POSITION,
out float2 uv : TEXCOORD0,
out float focus : TEXCOORD1)
{
PostProcessVS(id, p, uv);
#line 110
focus = 0.0;
#line 112
}
#line 114
float4 GetFocusPS(
float4 p : SV_POSITION,
float2 uv : TEXCOORD0,
float focus : TEXCOORD1) : SV_TARGET
{
#line 120
return saturate(lerp(tex2Dfetch(LastFocus, float2(0, 0), 0).x, ReShade::GetLinearizedDepth(FocusPoint), FrameTime / FocusTime));
#line 124
}
#line 126
float4 SaveFocusPS(
float4 p : SV_POSITION,
float2 uv : TEXCOORD0,
float focus : TEXCOORD1) : SV_TARGET
{
#line 132
return tex2Dfetch(Focus, float2(0, 0), 0).x;
#line 136
}
#line 138
float4 MainPS(
float4 p : SV_POSITION,
float2 uv : TEXCOORD0,
float focus : TEXCOORD1) : SV_TARGET
{
#line 146
static const float2 offsets[] =
{
float2(0.0, 1.0),
float2(0.75, 0.75),
float2(1.0, 0.0),
float2(0.75, -0.75),
float2(0.0, -1.0),
float2(-0.75, -0.75),
float2(-1.0, 0.0),
float2(-0.75, 0.75)
};
#line 158
float4 color = exp( tex2D(ReShade::BackBuffer, uv + ReShade::GetPixelSize() * 0.0 * (abs(ReShade::GetLinearizedDepth(uv) - focus) * DofScale)));
#line 160
[unroll]
for (int i = 0; i < 8; ++i)
color += exp( tex2D(ReShade::BackBuffer, uv + ReShade::GetPixelSize() * offsets[i] * (abs(ReShade::GetLinearizedDepth(uv) - focus) * DofScale)));
color /= 9;
#line 167
return log(color);
}
#line 174
technique FocalDOF
{
pass GetFocus
{
VertexShader = GetFocusVS;
PixelShader = GetFocusPS;
RenderTarget = FocalDOF_Focus;
}
pass SaveFocus
{
VertexShader = ReadFocusVS;
PixelShader = SaveFocusPS;
RenderTarget = FocalDOF_LastFocus;
}
pass Main
{
VertexShader = ReadFocusVS;
PixelShader = MainPS;
#line 196
}
}

