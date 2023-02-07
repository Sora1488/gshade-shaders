#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Droste.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Reshade.fxh"
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
#line 17 "C:\Program Files\GShade\gshade-shaders\Shaders\Droste.fx"
#line 19
namespace Droste
{
#line 33
uniform int Buffer1 <
ui_type = "radio"; ui_label = " ";
>;
uniform int EffectType <
ui_type = "radio";
ui_items = "Hyperdroste\0Droste\0";
ui_label = "Effect Type";
ui_category = "General Options\n";
> = 0;
uniform bool Spiral <
ui_tooltip = "Warp space into a spiral.";
ui_category = "General Options\n";
> = true;
uniform float InnerRing <
ui_type = "slider";
ui_min = 0.00; ui_max = 1;
ui_step = 0.01;
ui_tooltip = "The inner ring defines the texture border towards the center of the screen.";
ui_category = "General Options\n";
> = 0.3;
uniform float OuterRing <
ui_type = "slider";
ui_min = 0.0; ui_max = 1;
ui_step = 0.01;
ui_tooltip = "The outer ring defines the texture border towards the edge of the screen.";
ui_category = "General Options\n";
> = 1.0;
uniform float Zoom <
ui_type = "slider";
ui_min = 0.0; ui_max = 9.9;
ui_step = 0.01;
ui_tooltip = "Zoom in the output.";
ui_category = "General Options\n";
> = 1.0;
uniform float Frequency <
ui_type = "slider";
ui_min = 0.1; ui_max = 10;
ui_step = 0.01;
ui_tooltip = "Defines the frequency of the intervals.";
ui_category = "General Options\n";
> = 1.0;
uniform float X_Offset <
ui_type = "slider";
ui_min = -0.5; ui_max = 0.5;
ui_step = 0.01;
ui_tooltip = "Change the X position of the center. Keep it to 0 to get the best results. ";
ui_category = "General Options\n";
> = 0.0;
uniform float Y_Offset <
ui_type = "slider";
ui_min = -0.5; ui_max = 0.5;
ui_step = 0.01;
ui_tooltip = "Change the Y position of the center. Keep it to 0 to get the best results.";
ui_category = "General Options\n";
> = 0.0;
uniform int Buffer4 <
ui_type = "radio"; ui_label = " ";
>;
#line 101
float mod(float x, float y)
{
return x - y * floor(x / y);
}
#line 106
float atan2_approx(float y, float x)
{
return acos(x * rsqrt(y * y + x * x)) * (y < 0 ? -1 : 1);
}
#line 119
void droste(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
#line 122
float ar = float(1920) / 1080;
ar = EffectType == 0 ? ar : 1;
float new_x = (texcoord.x - 0.5 + X_Offset) * (EffectType == 0 ? ar : 1);
float new_y = (texcoord.y - 0.5 + Y_Offset);
#line 128
float val = atan2_approx(new_x, new_y) + 3.1415927;
val /= 2 * 3.1415927;
val = Spiral ? val : 0;
#line 133
float hyperdroste = val + log(sqrt(new_x * new_x + new_y * new_y) * (10 - Zoom)) * Frequency;
float droste = val + log(max(abs(new_x), abs(new_y)) * (10 - Zoom)) * Frequency;
val = EffectType == 0 ? hyperdroste : droste;
val = (exp(mod(val, 1)) - 1) / (2.71828183 - 1);
#line 139
const float y_top = 0.5;
const float y_bottom = -0.5;
const float x_right = 0.5;
const float x_left = -0.5;
#line 144
float nny = (new_y < 0) ? y_bottom / new_y : y_top / new_y;
float nnx = (new_x < 0) ? x_left * ar / new_x : x_right * ar / new_x; 
float nnc = min(nnx, nny);
float normalized_x = new_x * nnc + X_Offset * ar;
float normalized_y = new_y * nnc + Y_Offset;
float d_normal_2 = sqrt((normalized_x - X_Offset * ar) * (normalized_x - X_Offset * ar) + (normalized_y - Y_Offset) * (normalized_y - Y_Offset)); 
#line 152
float d_left = x_left + X_Offset;
float d_right = x_right + X_Offset;
float d_top = y_top + Y_Offset;
float d_bottom = y_bottom + Y_Offset;
float d_x = (new_x < 0) ? d_left * ar / new_x : d_right * ar / new_x;
float d_y = (new_y < 0) ? d_bottom / new_y : d_top / new_y;
#line 159
float xclose = d_x * new_x;
float yclose = d_y * new_y;
float ri = (abs(new_x * xclose) + abs(new_y * yclose)) / (abs(new_x) + abs(new_y)) / 0.5;
#line 164
nnc = min(d_x, d_y);
float nx_2 = new_x * nnc;
float ny_2 = new_y * nnc;
float aar = saturate(ri - 0.4) + 0.15; 
float r = aar;						   
float arr = (1 - r) * ar + r;
float d_final = sqrt(new_x * new_x + new_y * new_y) / pow(pow(max(abs(new_x) / arr * 2, 0.0), 2.0 / r) + pow(abs(new_y) * 2, 2.0 / r), r / 2.0);
#line 172
float buffer_len = d_normal_2;
#line 174
float scale_normal = d_final / buffer_len;
normalized_x = EffectType == 0 ? (normalized_x - X_Offset * ar) * scale_normal / ar + X_Offset : normalized_x; 
normalized_y = EffectType == 0 ? (normalized_y - Y_Offset) * scale_normal + Y_Offset : normalized_y;
#line 178
float real_scale = (1 - val) * InnerRing + val * OuterRing;
float adjusted_x = EffectType == 0 ? normalized_x * real_scale + 0.5 - X_Offset : normalized_x * real_scale + 0.5 - X_Offset;
float adjusted_y = normalized_y * real_scale + 0.5 - Y_Offset;
fragment = tex2D(ReShade::BackBuffer, float2(adjusted_x, adjusted_y));
}
#line 192
technique Droste < ui_tooltip = "Warp space inside a spiral."; >
{
pass spiral_step { VertexShader = PostProcessVS; PixelShader = droste; }
}
}

