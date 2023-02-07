#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\PatternShading.fx"
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
#line 2 "C:\Program Files\GShade\gshade-shaders\Shaders\PatternShading.fx"
#line 3
uniform float threshold <
ui_type = "slider";
ui_label = "Brightness";
ui_min = 0.0; ui_max = 1.0;
> = 0.1;
#line 9
uniform int steps <
ui_label = "Amount of Shades";
ui_type  = "combo";
ui_items = " 2\0 3\0 4\0 5\0";
> = 3;
#line 15
uniform bool test <
> = false;
#line 18
float3 patternShading(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR
{
int pattern, pattern1, pattern2, pattern3;
float luma = dot(tex2D(ReShade::BackBuffer, texcoord).rgb, 1.0 / 3.0);
#line 23
if(test)
{
luma = lerp(0.0, 1.0, texcoord.x);
}
#line 28
if(pos.x % 2 <= 1 && pos.y % 2 <= 1)
{
pattern = 0;
}
else
{
pattern = 1;
}
#line 37
if((pos.x + 1) % 2 <= 1 && (pos.y - 1) % 2 <= 1)
{
pattern1 = 1;
}
else
{
pattern1 = 0;
}
#line 46
if(pos.x % 2 <= 1 && (pos.y - 1) % 2 <= 1)
{
pattern2 = 1;
}
else
{
pattern2 = 0;
}
#line 55
if(pos.x % 2 <= 1 && pos.y % 2 <= 1 || (pos.x + 1) % 2 <= 1 && (pos.y + 1) % 2 <= 1)
{
pattern3 = 0;
}
else
{
pattern3 = 1;
}
#line 64
if(steps == 0)
{
pattern = ceil(1.0 - step(luma, threshold));
}
else if(steps == 1)
{
if(luma <= threshold)
{
pattern = 0;
}
else if(luma <= threshold * 2)
{
pattern = pattern3;
}
else if(luma > threshold * 2)
{
pattern = 1;
}
}
else if(steps == 2)
{
if(luma <= threshold)
{
pattern = 0;
}
else if(luma <= threshold * 2)
{
pattern = pattern1;
}
else if(luma > threshold * 3)
{
pattern = 1;
}
}
else
{
if(luma <= threshold)
{
pattern = 0;
}
else if(luma <= threshold * 2)
{
pattern = pattern2;
}
else if(luma <= threshold * 3)
{
pattern = pattern3;
}
else if(luma > threshold * 4)
{
pattern = 1;
}
}
#line 118
return pattern;
}
#line 121
technique PatternShading
{
pass pass0
{
VertexShader = PostProcessVS;
PixelShader = patternShading;
}
}

