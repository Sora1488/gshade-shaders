#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\SimpleGrain.fx"
#line 15
uniform float Intensity <
ui_type = "slider";
ui_label = "Noise intensity";
ui_min = 0.0; ui_max = 1.0; ui_step = 0.002;
> = 0.4;
#line 21
uniform int Framerate <
ui_type = "slider";
ui_label = "Noise framerate";
ui_tooltip = "Zero will match in-game framerate";
ui_step = 1;
ui_min = 0; ui_max = 120;
> = 12;
#line 29
uniform int Coefficient <
ui_type = "radio";
ui_tooltip = "For digital video signal (HDMI, DVI, Display Port) use BT.709,\n"
"for analog (like VGA, S-Video) use BT.601";
ui_label = "YUV coefficients";
ui_items = "BT.709 (digital signal)\0BT.601 (analog signal))\0";
> = 0;
#line 42
uniform float Timer < source = "timer"; >;
uniform int FrameCount < source = "framecount"; >;
#line 46
static const float3 Luma709 = float3(0.2126, 0.7152, 0.0722);
#line 48
static const float3 Luma601 = float3(0.299, 0.587, 0.114);
#line 51
float Overlay(float LayerA, float LayerB)
{
float MinA = min(LayerA, 0.5);
float MinB = min(LayerB, 0.5);
float MaxA = max(LayerA, 0.5);
float MaxB = max(LayerB, 0.5);
return 2 * (MinA * MinB + MaxA + MaxB - MaxA * MaxB) - 1.5;
}
#line 61
float SimpleNoise(float p)
{ return frac(sin(dot(p, float2(12.9898, 78.233))) * 43758.5453); }
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
#line 65 "C:\Program Files\GShade\gshade-shaders\Shaders\SimpleGrain.fx"
#line 67
void SimpleGrainPS(float4 vois : SV_Position, float2 TexCoord : TEXCOORD, out float3 Image : SV_Target)
{
#line 70
float3 LumaCoefficient = bool(Coefficient) ? Luma601 : Luma709;
#line 73
Image = tex2D(ReShade::BackBuffer, TexCoord).rgb;
#line 75
const float GoldenAB = sqrt(5.0) * 0.5 + 0.5;
float Mask = pow(abs(1.0 - dot(Image.rgb, LumaCoefficient)), GoldenAB);
#line 78
float Seed = Framerate == 0 ? FrameCount : floor(Timer * 0.001 * Framerate);
#line 81
Seed %= 10000;
#line 83
const float GoldenABh = sqrt(5.0) * 0.25 + 0.25;
float Noise = saturate(SimpleNoise(Seed * TexCoord.x * TexCoord.y) * GoldenABh);
Noise = lerp(0.5, Noise, Intensity * 0.1 * Mask);
#line 87
Image.rgb = float3(
Overlay(Image.r, Noise),
Overlay(Image.g, Noise),
Overlay(Image.b, Noise)
);
}
#line 99
technique SimpleGrain < ui_label = "Simple Grain"; >
{
pass
{
VertexShader = PostProcessVS;
PixelShader = SimpleGrainPS;
}
}

