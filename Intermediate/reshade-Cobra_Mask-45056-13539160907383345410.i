#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Cobra_Mask.fx"
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
#line 22 "C:\Program Files\GShade\gshade-shaders\Shaders\Cobra_Mask.fx"
#line 24
namespace Cobra_Masking
{
#line 37
uniform int Buffer1 <
ui_type = "radio"; ui_label = " ";
>;
uniform bool InvertMask <
ui_tooltip = "Invert the mask.";
ui_category = "General Options\n";
> = false;
uniform bool ShowMask <
ui_tooltip = "Show the masked pixels.";
ui_category = "General Options\n";
> = false;
uniform int Buffer2 <
ui_type = "radio"; ui_label = " ";
>;
uniform bool FilterColor <
ui_tooltip = "Activates the color filter option.";
ui_category = "Color Masking\n";
> = false;
uniform bool ShowSelectedHue <
ui_tooltip = "Display the current selected hue range on the top of the image.";
ui_category = "Color Masking\n";
> = false;
uniform float Value <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.001;
ui_step = 0.001;
ui_tooltip = "The Value describes the brightness of the hue. 0 is black/no hue and 1 is maximum hue(e.g. pure red).";
ui_category = "Color Masking\n";
> = 1.0;
uniform float ValueRange <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.001;
ui_step = 0.001;
ui_tooltip = "The tolerance around the value.";
ui_category = "Color Masking\n";
> = 1.0;
uniform float ValueEdge <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The smoothness beyond the value range.";
ui_category = "Color Masking\n";
> = 0.0;
uniform float Hue <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The hue describes the color category. It can be red, green, blue or a mix of them.";
ui_category = "Color Masking\n";
> = 1.0;
uniform float HueRange <
ui_type = "slider";
ui_min = 0.000; ui_max = 0.500;
ui_step = 0.001;
ui_tooltip = "The tolerance around the hue.";
ui_category = "Color Masking\n";
> = 0.5;
uniform float Saturation <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The saturation determines the colorfulness. 0 is greyscale and 1 pure colors.";
ui_category = "Color Masking\n";
> = 1.0;
uniform float SaturationRange <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The tolerance around the saturation.";
ui_category = "Color Masking\n";
> = 1.0;
uniform int Buffer3 <
ui_type = "radio"; ui_label = " ";
>;
uniform bool FilterDepth <
ui_tooltip = "Activates the depth filter option.";
ui_category = "Depth Masking\n";
> = false;
uniform float FocusDepth <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "Manual focus depth of the point which has the focus. Range from 0.0, which means camera is the focus plane, till 1.0 which means the horizon is focus plane.";
ui_category = "Depth Masking\n";
> = 0.026;
uniform float FocusRangeDepth <
ui_type = "slider";
ui_min = 0.0; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The depth of the range around the manual focus depth which should be emphasized. Outside this range, de-emphasizing takes place";
ui_category = "Depth Masking\n";
> = 0.010;
uniform float FocusEdgeDepth <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_tooltip = "The depth of the edge of the focus range. Range from 0.00, which means no depth, so at the edge of the focus range, the effect kicks in at full force,\ntill 1.00, which means the effect is smoothly applied over the range focusRangeEdge-horizon.";
ui_step = 0.001;
> = 0.050;
uniform bool Spherical <
ui_tooltip = "Enables Emphasize in a sphere around the focus-point instead of a 2D plane";
ui_category = "Depth Masking\n";
> = false;
uniform int Sphere_FieldOfView <
ui_type = "slider";
ui_min = 1; ui_max = 180;
ui_tooltip = "Specifies the estimated Field of View you are currently playing with. Range from 1, which means 1 Degree, till 180 which means 180 Degree (half the scene).\nNormal games tend to use values between 60 and 90.";
ui_category = "Depth Masking\n";
> = 75;
uniform float Sphere_FocusHorizontal <
ui_type = "slider";
ui_min = 0; ui_max = 1;
ui_tooltip = "Specifies the location of the focuspoint on the horizontal axis. Range from 0, which means left screen border, till 1 which means right screen border.";
ui_category = "Depth Masking\n";
> = 0.5;
uniform float Sphere_FocusVertical <
ui_type = "slider";
ui_min = 0; ui_max = 1;
ui_tooltip = "Specifies the location of the focuspoint on the vertical axis. Range from 0, which means upper screen border, till 1 which means bottom screen border.";
ui_category = "Depth Masking\n";
> = 0.5;
uniform int Buffer4 <
ui_type = "radio"; ui_label = " ";
>;
#line 169
texture texMask {Width = 1920; Height = 1080; Format = RGBA16F; };
#line 171
sampler2D SamplerMask { Texture = texMask; };
#line 182
float3 mod(float3 x, float y)
{
return x - y * floor(x / y);
}
#line 188
float4 hsv2rgb(float4 c)
{
float3 rgb = clamp(abs(mod(float3(c.x * 6.0, c.x * 6.0 + 4.0, c.x * 6.0 + 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
rgb = rgb * rgb * (3.0 - 2.0 * rgb); 
return float4(c.z * lerp(float3(1.0, 1.0, 1.0), rgb, c.y), 1.0);
}
#line 196
float4 rgb2hsv(float4 c)
{
const float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));
float d = q.x - min(q.w, q.y);
const float e = 1.0e-10;
return float4(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x, 1.0);
}
#line 207
float4 showHue(float2 texcoord, float4 fragment)
{
float range = 0.145;
float depth = 0.06;
if (abs(texcoord.x - 0.5) < range && texcoord.y < depth)
{
float4 hsvval = float4(saturate(texcoord.x - 0.5 + range) / (2 * range), 1, 1, 1);
float4 rgbval = hsv2rgb(hsvval);
bool active = min(abs(hsvval.r - Hue), (1 - abs(hsvval.r - Hue))) < HueRange;
fragment = active ? rgbval : float4(0.5, 0.5, 0.5, 1);
}
return fragment;
}
#line 229
float inFocus(float4 rgbval, float scenedepth, float2 texcoord)
{
#line 232
float4 hsvval = rgb2hsv(rgbval);
float d1_f = abs(hsvval.b - Value) - ValueRange;
d1_f = 1 - smoothstep(0, ValueEdge, d1_f);
bool d2 = abs(hsvval.r - Hue) < (HueRange + pow(2.71828, -(hsvval.g * hsvval.g) / 0.005)) || (1 - abs(hsvval.r - Hue)) < (HueRange + pow(2.71828, -(hsvval.g * hsvval.g) / 0.01));
bool d3 = abs(hsvval.g - Saturation) <= SaturationRange;
float is_color_focus = max(d3 * d2 * d1_f, FilterColor == 0); 
#line 239
const float desaturateFullRange = FocusRangeDepth + FocusEdgeDepth;
texcoord.x = (texcoord.x - Sphere_FocusHorizontal) * ReShade::GetScreenSize().x;
texcoord.y = (texcoord.y - Sphere_FocusVertical) * ReShade::GetScreenSize().y;
const float degreePerPixel = Sphere_FieldOfView / ReShade::GetScreenSize().x;
const float fovDifference = sqrt((texcoord.x * texcoord.x) + (texcoord.y * texcoord.y)) * degreePerPixel;
float depthdiff = Spherical ? sqrt((scenedepth * scenedepth) + (FocusDepth * FocusDepth) - (2 * scenedepth * FocusDepth * cos(fovDifference * (2 * 3.1415927 / 360)))) : abs(scenedepth - FocusDepth);
float depthval = 1 - saturate((depthdiff > desaturateFullRange) ? 1.0 : smoothstep(FocusRangeDepth, desaturateFullRange, depthdiff));
depthval = max(depthval, FilterDepth == 0);
return is_color_focus * depthval;
}
#line 250
void mask_start(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
float4 color = tex2D(ReShade::BackBuffer, texcoord);
float scenedepth = ReShade::GetLinearizedDepth(texcoord);
float in_focus = inFocus(color, scenedepth, texcoord);
in_focus = (1 - InvertMask) * in_focus + InvertMask * (1 - in_focus);
fragment = float4(color.rgb, in_focus);
}
#line 259
void mask_end(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
fragment = tex2D(SamplerMask, texcoord);
fragment = ShowMask ? fragment.aaaa : fragment;
fragment = (!ShowMask) ? lerp(tex2D(ReShade::BackBuffer, texcoord), fragment, 1 - fragment.aaaa) : fragment;
fragment = (ShowSelectedHue * FilterColor * !ShowMask) ? showHue(texcoord, fragment) : fragment;
}
#line 275
technique Cobra_Masking_Start
< ui_tooltip = "This is the masking part of the shader. It has to be placed before Cobra_Masking_End. The masked area is copied and stored here, meaning all effects applied between Start and End only affect the unmasked area."; >
{
pass mask { VertexShader = PostProcessVS; PixelShader = mask_start; RenderTarget = texMask; }
}
#line 281
technique CobraFX_Masking_End < ui_tooltip = "The masked area is applied again onto the screen."; >
{
pass display { VertexShader = PostProcessVS; PixelShader = mask_end; }
}
}

