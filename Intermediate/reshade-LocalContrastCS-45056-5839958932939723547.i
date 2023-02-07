#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\LocalContrastCS.fx"
#line 40
namespace Spatial_IIR_Clarity
{
texture BackBuffer:COLOR;
texture Luma <Pooled = true;>{Width = 1920; Height = 1080; Format = R8;};
texture Blur0 <Pooled = true;>{Width = 1920 * 2; Height = 1080; Format = R8;};
#line 46
sampler sBackBuffer{Texture = BackBuffer;};
sampler sLuma {Texture = Luma;};
sampler sBlur0{Texture = Blur0;};
#line 51
storage wLuma{Texture = Luma;};
storage wBlur0{Texture = Blur0;};
#line 54
uniform float Strength<
ui_type = "slider";
ui_label = "Strength";
ui_min = 0; ui_max = 1;
ui_step = 0.001;
> = 1;
#line 63
uniform float WeightExponent<
ui_type = "slider";
ui_label = "Detail Sharpness";
ui_tooltip = "Use this slider to determine how large of a region the shader considers to be local;\n"
"a larger number will correspond to a smaller region, and will result in sharper looking\n"
"details.";
ui_min = 5; ui_max = 12;
> = 5;
#line 73
static const float a = 0.0039215686;
static const float b = 0.0274509804;
static const float c = 0.0823529412;
#line 77
float GainCoefficient(float x, float a, float b, float c, float k)
{
float gain = (x < a) ? 0 :
(x < b) ? cos((3.1415962 * rcp(b - a) * x + 3.1415962 - (3.1415962 * a) * rcp(b - a))) :
(x < c) ? cos((3.1415962 * rcp(c - b) * x - (3.1415962 * b) * rcp(c-b))) : 0;
return gain * (k/2) + (k/2);
}
#line 86
void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
texcoord.x = (id == 2) ? 2.0 : 0.0;
texcoord.y = (id == 1) ? 2.0 : 0.0;
position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}
#line 93
void LumaPS(float4 vpos : SV_POSITION, float2 texcoord : TEXCOORD, out float luma : SV_Target0)
{
luma = dot(tex2D(sBackBuffer, texcoord).rgb, float3(0.299, 0.587, 0.114));
}
#line 98
void CombinePS(float4 vpos : SV_POSITION, float2 texcoord : TEXCOORD, out float output : SV_Target0)
{
texcoord.x /= 2;
output = (tex2D(sBlur0, texcoord).x + tex2D(sBlur0, float2(texcoord.x + 0.5, texcoord.y)).x) * 0.5;
}
#line 104
void HorizontalFilterCS0(uint3 id : SV_DispatchThreadID)
{
if(id.x < (uint2((uint(((1920) + (128) - 1) / (128)) * 2), uint(((1080) + (64) - 1) / (64))).x / 2))
{
float2 coord = float2(id.x * 128, id.y) + 0.5;
float curr;
float prev;
float weight;
prev = tex2Dfetch(sLuma, float2(coord.x - 128, coord.y)).x;
#line 114
for(int i = -128 + 1; i < 128; i++)
{
curr = tex2Dfetch(sLuma, float2(coord.x + i, coord.y)).x;
weight = 1 - abs(curr - prev);
weight = pow(abs(weight), WeightExponent);
prev = lerp(curr, prev, weight);
if(i >= 0  && (coord.x + i) < 1920)
{
tex2Dstore(wBlur0, int2(coord.x + i, coord.y), prev.xxxx);
}
}
}
else
{
float2 coord = float2((id.x - (uint2((uint(((1920) + (128) - 1) / (128)) * 2), uint(((1080) + (64) - 1) / (64))).x / 2)) * 128 + 128, id.y) + 0.5;
float curr;
float prev;
float weight;
prev = tex2Dfetch(sLuma, float2(coord.x + 128, coord.y)).x;
#line 134
for(int i = 128 - 1; i > -128; i--)
{
curr = tex2Dfetch(sLuma, float2(coord.x + i, coord.y)).x;
weight = 1 - abs(curr - prev);
weight = pow(abs(weight), WeightExponent);
prev = lerp(curr, prev, weight);
if(i <= 0)
{
tex2Dstore(wBlur0, int2(1920 + coord.x + i, coord.y), prev.xxxx);
}
}
}
}
#line 148
void VerticalFilterCS0(uint3 id : SV_DispatchThreadID, uint3 tid : SV_GroupThreadID)
{
if(id.y < uint2(uint(((1920) + (64) - 1) / (64)), (uint(((1080) + (128) - 1) / (128)) * 2)).y / 2)
{
float2 coord = float2(id.x, id.y * 128) + 0.5;
float curr;
float prev;
float weight;
prev = tex2Dfetch(sLuma, float2(coord.x, coord.y - 128)).x;
#line 158
for(int i = -128 + 1; i < 128; i++)
{
curr = tex2Dfetch(sLuma, float2(coord.x, coord.y + i)).x;
weight = 1 - abs(curr - prev);
weight = pow(abs(weight), WeightExponent);
prev = lerp(curr, prev, weight);
if(i >= 0 && (coord.x) < 1920)
{
tex2Dstore(wBlur0, int2(coord.x, coord.y + i), prev.xxxx);
}
}
}
else
{
float2 coord = float2(id.x, (id.y - (uint2(uint(((1920) + (64) - 1) / (64)), (uint(((1080) + (128) - 1) / (128)) * 2)).y / 2)) * 128 + 128) + 0.5;
float curr;
float prev;
float weight;
prev = tex2Dfetch(sLuma, float2(coord.x, coord.y + 128)).x;
#line 178
for(int i = 128 - 1; i > -128; i--)
{
curr = tex2Dfetch(sLuma, float2(coord.x, coord.y + i)).x;
weight = 1 - abs(curr - prev);
weight = pow(abs(weight), WeightExponent);
prev = lerp(curr, prev, weight);
if(i <= 0)
{
tex2Dstore(wBlur0, int2(1920 + coord.x, coord.y + i), prev.xxxx);
}
}
}
}
#line 192
void OutputPS(float4 vpos : SV_POSITION, float2 texcoord : TEXCOORD, out float4 output : SV_TARGET0)
{
float3 color = tex2D(sBackBuffer, texcoord).rgb;
texcoord.x /= 2;
float blur = (tex2D(sBlur0, texcoord).x + tex2D(sBlur0, float2(texcoord.x + 0.5, texcoord.y)).x) * 0.5;;
#line 199
float y = dot(color, float3(0.299, 0.587, 0.114));
y += (y - blur) * GainCoefficient(abs(y-blur), a, b, c, Strength);
float cb = dot(color, float3(-0.168736, -0.331264, 0.5));
float cr = dot(color, float3(0.5, -0.418688, -0.081312));
#line 205
output.r = dot(float2(y, cr), float2(1, 1.402));
output.g = dot(float3(y, cb, cr), float3(1, -0.344135, -0.714136));
output.b = dot(float2(y, cb), float2(1, 1.772));
output.a = 1;
}
#line 211
technique LocalContrastCS <ui_tooltip = "A local contrast shader based on an adaptive infinite impulse response filter,\n"
"that adjusts the contrast of the image based on the amount of sorrounding contrast.\n\n"
"Part of Insane Shaders\n"
"By: Lord of Lunacy";>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = LumaPS;
RenderTarget0 = Luma;
}
#line 223
pass
{
ComputeShader = HorizontalFilterCS0<uint2(1, 64).x, uint2(1, 64).y>;
DispatchSizeX = uint2((uint(((1920) + (128) - 1) / (128)) * 2), uint(((1080) + (64) - 1) / (64))).x;
DispatchSizeY = uint2((uint(((1920) + (128) - 1) / (128)) * 2), uint(((1080) + (64) - 1) / (64))).y;
}
#line 230
pass
{
VertexShader = PostProcessVS;
PixelShader = CombinePS;
RenderTarget0 = Luma;
}
#line 237
pass
{
ComputeShader = VerticalFilterCS0<uint2(64, 1).x, uint2(64, 1).y>;
DispatchSizeX = uint2(uint(((1920) + (64) - 1) / (64)), (uint(((1080) + (128) - 1) / (128)) * 2)).x;
DispatchSizeY = uint2(uint(((1920) + (64) - 1) / (64)), (uint(((1080) + (128) - 1) / (128)) * 2)).y;
}
#line 245
pass
{
VertexShader = PostProcessVS;
PixelShader = OutputPS;
}
}
}

