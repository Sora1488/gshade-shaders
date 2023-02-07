#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\LumaLines.fx"
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
#line 2 "C:\Program Files\GShade\gshade-shaders\Shaders\LumaLines.fx"
#line 3
uniform int lineDensity <
ui_type = "slider";
ui_min = 1; ui_max = 100;
ui_tooltip = "if you put this at 0 your game crashes";
> = 10;
#line 9
uniform float blackThreshold <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
> = 0.1;
#line 14
uniform float whiteThreshold <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.0;
> = 0.9;
#line 19
uniform bool blend <
> = false;
#line 22
float3 lumaLines(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR
{
int OneBitLuma, OneBitLumaShift, lines;
float luma = dot(tex2D(ReShade::BackBuffer, texcoord).rgb, 1.0 / 3.0);
#line 27
for(float i = 1.0 / lineDensity; i <= 1.0 - (1.0 / lineDensity); i += (1.0 / lineDensity))
{
OneBitLuma = ceil(1.0 - step(luma, i));
#line 31
OneBitLumaShift = ceil(1.0 - step(dot(tex2Dlod(ReShade::BackBuffer, float4(texcoord.x + (1.0 / 1920), texcoord.y, 0.0, 0.0)).rgb, 1.0 / 3.0), i));
lines += OneBitLumaShift - OneBitLuma;
#line 34
OneBitLumaShift = ceil(1.0 - step(dot(tex2Dlod(ReShade::BackBuffer, float4(texcoord.x - (1.0 / 1920), texcoord.y, 0.0, 0.0)).rgb, 1.0 / 3.0), i));
lines += OneBitLumaShift - OneBitLuma;
#line 37
OneBitLumaShift = ceil(1.0 - step(dot(tex2Dlod(ReShade::BackBuffer, float4(texcoord.x, texcoord.y + (1.0 / 1080), 0.0, 0.0)).rgb, 1.0 / 3.0), i));
lines += OneBitLumaShift - OneBitLuma;
#line 40
OneBitLumaShift = ceil(1.0 - step(dot(tex2Dlod(ReShade::BackBuffer, float4(texcoord.x, texcoord.y - (1.0 / 1080), 0.0, 0.0)).rgb, 1.0 / 3.0), i));
lines += OneBitLumaShift - OneBitLuma;
}
#line 44
lines = max(lines, ceil(step(luma, blackThreshold)));
lines = min(lines, ceil(step(luma, whiteThreshold)));
#line 47
if(blend)
{
return (1.0 - lines) * tex2D(ReShade::BackBuffer, texcoord).rgb;
}
else
{
return 1.0 - lines;
}
}
#line 57
technique LumaLines
{
pass pass0
{
VertexShader = PostProcessVS;
PixelShader = lumaLines;
}
}

