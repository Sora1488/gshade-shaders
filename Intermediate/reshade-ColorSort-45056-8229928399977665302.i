#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\ColorSort.fx"
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
#line 35 "C:\Program Files\GShade\gshade-shaders\ComputeShaders\ColorSort.fx"
#line 37
namespace ColorSorter
{
#line 59
uniform int Buffer1 <
ui_type = "radio"; ui_label = " ";
>;
uniform uint RotationAngle <
ui_type = "slider";
ui_min = 0; ui_max = 360;
ui_step = 1;
ui_tooltip = "Rotation in Degrees.";
ui_category = "Sorting Options\n";
> = 0;
uniform float BrightnessThresholdStart <
ui_type = "slider";
ui_min = -0.050; ui_max = 1.050;
ui_step = 0.001;
ui_tooltip = "Pixels with brightness close to this parameter serve as starting threshold for the sorting algorithm and fragment the area. Set both to their max value to disable them.";
ui_category = "Sorting Options\n";
> = 1.050;
uniform float BrightnessThresholdEnd <
ui_type = "slider";
ui_min = -0.050; ui_max = 1.050;
ui_step = 0.001;
ui_tooltip = "Pixels with brightness close to this parameter serve as finishing threshold for the sorting algorithm and fragment the area. Set both to their max value to disable them.";
ui_category = "Sorting Options\n";
> = 1.050;
uniform float GradientStrength <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "Strength of the noise applied to the masked area. More noise results in more brightness variance. Only recommended in monotone environments. For color gradients on the sorted area, better apply other effects between Masking and Main effect order.";
ui_category = "Sorting Options\n";
> = 0.0;
uniform float MaskingNoise <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.001;
ui_step = 0.001;
ui_tooltip = "Strength of the noise applied to mask itself.";
ui_category = "Sorting Options\n";
> = 0.0;
uniform float NoiseSize <
ui_type = "slider";
ui_min = 0.001; ui_max = 1;
ui_step = 0.001;
ui_tooltip = "Size of the noise texture. A lower value means larger noise pixels.";
ui_category = "Sorting Options\n";
> = 1.0;
uniform bool ReverseSort <
ui_tooltip = "While active, it orders from dark to bright, top to bottom. Else it will sort from bright to dark.";
ui_category = "Sorting Options\n";
> = false;
uniform bool InvertMask <
ui_tooltip = "Invert the mask.";
ui_category = "Sorting Options\n";
> = false;
uniform bool ShowMask <
ui_tooltip = "Show the masked pixels.";
ui_category = "Sorting Options\n";
> = false;
uniform bool HotsamplingMode <
ui_tooltip = "The noise will be the same at all resolutions. Activate this, then adjust your options and it will stay the same at all resolutions. Turn this off when you do not intend to hotsample.";
ui_category = "Sorting Options\n";
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
ui_min = 0.000; ui_max = 1.000;
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
> = 1.001;
uniform float Hue <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The hue describes the color category. It can be red, green, blue or a mix of them.";
ui_category = "Color Masking\n";
> = 1.0;
uniform float HueRange <
ui_type = "slider";
ui_min = 0.000; ui_max = 0.501;
ui_step = 0.001;
ui_tooltip = "The tolerance around the hue.";
ui_category = "Color Masking\n";
> = 0.501;
uniform float Saturation <
ui_type = "slider";
ui_min = 0.000; ui_max = 1.000;
ui_step = 0.001;
ui_tooltip = "The saturation determins the colorfulness. 0 is greyscale and 1 pure colors.";
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
#line 226
texture texHalfRes { Width = 1920; Height = 640; Format = RGBA16F; };
texture texNoise < source = "colorsort_noise.png"; > { Width = 4096; Height = 1024; Format = R8; };
texture texMask {Width = 1920; Height = 640; Format = R16F; };
texture texBackground { Width = 1920; Height = 1080; Format = RGBA16F; };
texture texColorSort { Width = 1920; Height = 640; Format = RGBA16F; };
storage texColorSortStorage { Texture = texColorSort; };
#line 233
sampler2D SamplerHalfRes { Texture = texHalfRes; };
sampler2D SamplerNoise { Texture = texNoise; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };
sampler2D SamplerMask { Texture = texMask; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };
sampler2D SamplerBackground { Texture = texBackground; };
sampler2D SamplerColorSort { Texture = texColorSort; };
#line 246
float3 mod(float3 x, float y)
{
return x - y * floor(x / y);
}
float fmod(float x, float y)
{
return x - y * floor(x / y);
}
#line 256
float4 hsv2rgb(float4 c)
{
float3 rgb = clamp(abs(mod(float3(c.x * 6.0, c.x * 6.0 + 4.0, c.x * 6.0 + 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
rgb = rgb * rgb * (3.0 - 2.0 * rgb); 
return float4(c.z * lerp(float3(1.0, 1.0, 1.0), rgb, c.y), 1.0);
}
#line 264
float4 rgb2hsv(float4 c)
{
const float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));
#line 270
float d = q.x - min(q.w, q.y);
const float e = 1.0e-10;
return float4(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x, 1.0);
}
#line 276
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
#line 291
float2 rotate(float2 texcoord, uint angle, bool revert)
{
float2 rotated = texcoord;
#line 295
rotated = (angle == 90) ? float2(texcoord.y, texcoord.x) : rotated;
rotated = (angle == 180) ? float2(1 - texcoord.x, 1 - texcoord.y) : rotated;
rotated = (angle == 270) ? float2(1 - texcoord.y, 1 - texcoord.x) : rotated;
rotated = (angle == 360 || angle == 0) ? rotated : rotated;
#line 300
if (!(angle == 0 || angle == 90 || angle == 180 || angle == 270 || angle == 360))
{
#line 303
angle = fmod(angle + 180, 360); 
float phi = angle * 3.1415927 / 180;
#line 306
float2 p00 = float2(0, 0); 
float2 p01 = float2(0, 1); 
float2 p10 = float2(1, 0); 
float2 p11 = float2(1, 1); 
p00 = float2(cos(phi) * p00.x - sin(phi) * p00.y, sin(phi) * p00.x + cos(phi) * p00.y);
p01 = float2(cos(phi) * p01.x - sin(phi) * p01.y, sin(phi) * p01.x + cos(phi) * p01.y);
p10 = float2(cos(phi) * p10.x - sin(phi) * p10.y, sin(phi) * p10.x + cos(phi) * p10.y);
p11 = float2(cos(phi) * p11.x - sin(phi) * p11.y, sin(phi) * p11.x + cos(phi) * p11.y);
#line 315
uint l, r;
float lval, rval;
lval = p00.x;
rval = p00.y;
l = 0;
r = 0;
l = (p01.x < lval) ? 1 : l;
lval = (p01.x < lval) ? p01.x : lval;
r = (p01.x > rval) ? 1 : r;
rval = (p01.x > rval) ? p01.x : rval;
l = (p10.x < lval) ? 2 : l;
lval = (p10.x < lval) ? p10.x : lval;
r = (p10.x > rval) ? 2 : r;
rval = (p10.x > rval) ? p10.x : rval;
l = (p11.x < lval) ? 3 : l;
lval = (p11.x < lval) ? p11.x : lval;
r = (p11.x > rval) ? 3 : r;
rval = (p11.x > rval) ? p11.x : rval;
#line 334
float current_x = revert ? float2(cos(phi) * texcoord.x - sin(phi) * texcoord.y, sin(phi) * texcoord.x + cos(phi) * texcoord.y).x : lval + texcoord.x * (rval - lval); 
float current_x_rel = abs(lval - current_x) / abs(lval - rval);
float current_y = float2(cos(phi) * texcoord.x - sin(phi) * texcoord.y, sin(phi) * texcoord.x + cos(phi) * texcoord.y).y;
#line 339
float3 ylow = 1000;
float3 yhigh = -1000;
#line 342
float x_rel = abs(p00.x - current_x) / abs(p00.x - p01.x);
float y_abs = (1 - x_rel) * p00.y + x_rel * p01.y;
ylow = ((p00.x < current_x && current_x < p01.x) || (p00.x > current_x && current_x > p01.x)) ? float3(0, x_rel, y_abs) : ylow;
yhigh = ((p00.x < current_x && current_x < p01.x) || (p00.x > current_x && current_x > p01.x)) ? ylow : yhigh;
#line 347
x_rel = abs(p00.x - current_x) / abs(p00.x - p10.x);
y_abs = (1 - x_rel) * p00.y + x_rel * p10.y;
ylow = ((p00.x < current_x && current_x < p10.x) || (p00.x > current_x && current_x > p10.x)) && (y_abs < ylow.z) ? float3(x_rel, 0, y_abs) : ylow;
yhigh = ((p00.x < current_x && current_x < p10.x) || (p00.x > current_x && current_x > p10.x)) && (y_abs > yhigh.z) ? float3(x_rel, 0, y_abs) : yhigh;
#line 352
x_rel = abs(p01.x - current_x) / abs(p01.x - p11.x);
y_abs = (1 - x_rel) * p01.y + x_rel * p11.y;
ylow = ((p01.x < current_x && current_x < p11.x) || (p01.x > current_x && current_x > p11.x)) && (y_abs < ylow.z) ? float3(x_rel, 1, y_abs) : ylow;
yhigh = ((p01.x < current_x && current_x < p11.x) || (p01.x > current_x && current_x > p11.x)) && (y_abs > yhigh.z) ? float3(x_rel, 1, y_abs) : yhigh;
#line 357
x_rel = abs(p10.x - current_x) / abs(p10.x - p11.x);
y_abs = (1 - x_rel) * p10.y + x_rel * p11.y;
ylow = ((p10.x < current_x && current_x < p11.x) || (p10.x > current_x && current_x > p11.x)) && (y_abs < ylow.z) ? float3(1, x_rel, y_abs) : ylow;
yhigh = ((p10.x < current_x && current_x < p11.x) || (p10.x > current_x && current_x > p11.x)) && (y_abs > yhigh.z) ? float3(1, x_rel, y_abs) : yhigh;
#line 363
rotated = revert ? float2(current_x_rel, abs(yhigh.z - current_y) / abs(ylow.z - yhigh.z)) : (1 - texcoord.y) * yhigh.xy + texcoord.y * ylow.xy; 
}
return rotated;
}
#line 376
bool inFocus(float4 rgbval, float scenedepth, float2 texcoord)
{
#line 379
float4 hsvval = rgb2hsv(rgbval);
bool d1 = abs(hsvval.b - Value) < ValueRange;
bool d2 = abs(hsvval.r - Hue) < (HueRange + pow(2.71828, -(hsvval.g * hsvval.g) / 0.005)) || (1 - abs(hsvval.r - Hue)) < (HueRange + pow(2.71828, -(hsvval.g * hsvval.g) / 0.01));
bool d3 = abs(hsvval.g - Saturation) <= SaturationRange;
bool is_color_focus = (d3 && d2 && d1) || FilterColor == 0; 
#line 385
float depthdiff;
texcoord.x = (texcoord.x - Sphere_FocusHorizontal) * ReShade::GetScreenSize().x;
texcoord.y = (texcoord.y - Sphere_FocusVertical) * ReShade::GetScreenSize().y;
const float degreePerPixel = Sphere_FieldOfView / ReShade::GetScreenSize().x;
const float fovDifference = sqrt((texcoord.x * texcoord.x) + (texcoord.y * texcoord.y)) * degreePerPixel;
depthdiff = Spherical ? sqrt((scenedepth * scenedepth) + (FocusDepth * FocusDepth) - (2 * scenedepth * FocusDepth * cos(fovDifference * (2 * 3.1415927 / 360)))) : depthdiff = abs(scenedepth - FocusDepth);
#line 392
bool is_depth_focus = (depthdiff < FocusRangeDepth) || FilterDepth == 0;
bool in_focus = is_color_focus && is_depth_focus;
return (1 - InvertMask) * in_focus + InvertMask * (1 - in_focus);
}
#line 397
void mask_color(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float fragment : SV_Target)
{
#line 400
float4 color = tex2D(ReShade::BackBuffer, texcoord);
float scenedepth = ReShade::GetLinearizedDepth(texcoord);
float in_focus = inFocus(color, scenedepth, texcoord);
#line 404
uint hs_width = HotsamplingMode ? 2036 : 1920;
float2 t_noise = float2(texcoord.x, texcoord.y) * NoiseSize;
float angle = RotationAngle;
float phi = angle * 3.1415927 / 180;
t_noise = float2(cos(phi) * t_noise.x - sin(phi) * t_noise.y, sin(phi) * t_noise.x + cos(phi) * t_noise.y);
t_noise = float2(fmod(t_noise.x * hs_width, 4096) / (float) 4096, fmod(t_noise.y * 640, 1024) / (float)1024);
float noise_1 = tex2D(SamplerNoise, t_noise).r; 
#line 412
bool seperator_1 = abs((color.r + color.g + color.b) / 3 - BrightnessThresholdStart) < 0.04;
bool seperator_2 = abs((color.r + color.g + color.b) / 3 - BrightnessThresholdEnd) < 0.04;
#line 415
noise_1 = 0.5 * noise_1;
noise_1 = seperator_1 ? 0.8 : noise_1;
noise_1 = seperator_2 ? 0.7 : noise_1;
fragment = saturate(!in_focus + noise_1); 
}
void save_background(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
fragment = tex2D(ReShade::BackBuffer, texcoord);
}
#line 431
void grad_color(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
fragment = tex2D(ReShade::BackBuffer, texcoord);
#line 435
float2 t_noise = float2(frac(texcoord.x * 1920 / 4096), frac(texcoord.y * 640 / 1024));
float noise_1 = tex2D(SamplerNoise, t_noise).r;
noise_1 = (sin(4 * 3.1415927 * noise_1) + 4 * 3.1415927 * noise_1) / (4 * 3.1415927);
noise_1 = GradientStrength * (noise_1 - 0.5);
fragment = saturate(fragment + float4(noise_1, noise_1, noise_1, 0));
}
void pre_color(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
#line 444
float2 texcoord_new = rotate(texcoord, RotationAngle, false);
fragment = tex2D(ReShade::BackBuffer, texcoord_new);
float mask = tex2D(SamplerMask, texcoord_new).r;
fragment.a = mask;
}
#line 457
groupshared float4 colortable[2 * 640];
groupshared int evenblock[2 * ((uint)16)];
groupshared int oddblock[2 * ((uint)16)];
#line 462
bool min_color(float4 a, float4 b)
{
float val = b.a - a.a; 
val = (abs(val) < 0.1) ? ((a.r + a.g + a.b) - (b.r + b.g + b.b)) * (1 - ReverseSort - ReverseSort) : val;
return (val < 0) ? false : true; 
}
#line 470
void merge_sort(int low, int high, int em)
{
float4 temp[640 / ((uint)16)];
for (int i = 0; i < 640 / ((uint)16); i++)
{
temp[i] = colortable[low + i];
}
for (int m = em; m <= high - low; m = 2 * m)
{
for (int i = low; i < high; i += 2 * m)
{
int from = i;
int mid = i + m - 1;
int to = min(i + 2 * m - 1, high);
#line 485
int k = from, i_2 = from, j = mid + 1;
while (i_2 <= mid && j <= to)
{
if (min_color(colortable[i_2], colortable[j]))
{
temp[k++ - low] = colortable[i_2++];
}
else
{
temp[k++ - low] = colortable[j++];
}
}
while (i_2 < high && i_2 <= mid)
{
temp[k++ - low] = colortable[i_2++];
}
for (i_2 = from; i_2 <= to; i_2++)
{
colortable[i_2] = temp[i_2 - low];
}
}
}
}
#line 510
void sort_color(uint3 id : SV_DispatchThreadID, uint3 tid : SV_GroupThreadID)
{
int row = tid.y * 640 / ((uint)16);
int interval_start = row + tid.x * 640;
int interval_end = row - 1 + 640 / ((uint)16) + tid.x * 640;
uint i;
#line 517
for (i = row; i <= row - 1 + 640 / ((uint)16); i++)
{
colortable[i + tid.x * 640] = tex2Dfetch(SamplerHalfRes, int2(id.x, i));
}
if (tid.y == 0)
{
bool was_focus = false; 
bool is_focus = false;	
float noise = 0;
bool is_seperate = false;
bool was_seperate = false;
bool active_seperator = BrightnessThresholdStart < 1.02 || BrightnessThresholdEnd < 1.02;
bool seperate_area = !active_seperator;
int maskval = 0;
for (i = 0; i < 640; i++)
{
#line 535
is_focus = colortable[i + tid.x * 640].a < 0.9;  
#line 537
noise = colortable[i + tid.x * 640].a < 0.6 ? 2 * colortable[i + tid.x * 640].a : 0;
is_seperate = is_focus &&  MaskingNoise > noise;
seperate_area = active_seperator && is_focus && colortable[i + tid.x * 640].a > 0.75 ? true : seperate_area;
seperate_area = active_seperator && is_focus && colortable[i + tid.x * 640].a > 0.65 && is_focus && colortable[i + tid.x * 640].a < 0.75  ? false : seperate_area;
#line 542
if (!(is_focus && was_focus && seperate_area && !(is_seperate && !was_seperate)))
maskval++;
was_focus = is_focus;
was_seperate = is_seperate;
colortable[i + tid.x * 640].a = (float)maskval + 0.5 * is_focus; 
}
}
barrier();
#line 551
merge_sort(interval_start, interval_end, 1);
#line 553
float4 key[((uint)16)];
float4 key_sorted[((uint)16)];
float4 sorted_array[2 * 640 / ((uint)16)];
for (i = 1; i < ((uint)16); i = 2 * i) 
{
barrier();
uint groupsize = 2 * i;
#line 561
for (int j = 0; j < groupsize; j++) 
{
int curr = tid.y - (tid.y % groupsize) + j;
key[curr] = colortable[curr * 640 / ((uint)16) + tid.x * 640];
}
#line 567
int idy_sorted;
int even = tid.y - (tid.y % groupsize);
int k = even;
int mid = even + groupsize / 2.0 - 1;
int odd = mid + 1;
int to = even + groupsize - 1;
while (even <= mid && odd <= to)
{
if (min_color(key[even], key[odd]))
{
if (tid.y == even)
idy_sorted = k;
key_sorted[k++] = key[even++];
}
else
{
if (tid.y == odd)
idy_sorted = k;
key_sorted[k++] = key[odd++];
}
}
#line 589
while (even <= mid)
{
if (tid.y == even)
idy_sorted = k;
key_sorted[k++] = key[even++];
}
while (odd <= to)
{
if (tid.y == odd)
idy_sorted = k;
key_sorted[k++] = key[odd++];
}
#line 602
int diff_sorted = (idy_sorted % groupsize) - (tid.y % (groupsize / 2.0 ));
int pos1 = tid.y * 640 / ((uint)16);
bool is_even = (tid.y % groupsize) < groupsize / 2.0;
if (is_even)
{
evenblock[idy_sorted + tid.x * ((uint)16)] = pos1;
if (diff_sorted == 0)
{
oddblock[idy_sorted + tid.x * ((uint)16)] = (tid.y - (tid.y % groupsize) + groupsize / 2.0) * 640 / ((uint)16);
}
else
{
int odd_block_search_start = (tid.y - (tid.y % groupsize) + groupsize / 2.0 + diff_sorted - 1) * 640 / ((uint)16);
for (int i2 = 0; i2 < 640 / ((uint)16); i2++)
{ 
oddblock[idy_sorted + tid.x * ((uint)16)] = odd_block_search_start + i2;
if (min_color(key_sorted[idy_sorted], colortable[odd_block_search_start + i2 + tid.x * 640]))
{
break;
}
else
{
oddblock[idy_sorted + tid.x * ((uint)16)] = odd_block_search_start + i2 + 1;
}
}
}
}
else
{
oddblock[idy_sorted + tid.x * ((uint)16)] = pos1;
if (diff_sorted == 0)
{
evenblock[idy_sorted + tid.x * ((uint)16)] = (tid.y - (tid.y % groupsize)) * 640 / ((uint)16);
}
else
{
int even_block_search_start = (tid.y - (tid.y % groupsize) + diff_sorted - 1) * 640 / ((uint)16);
for (int i2 = 0; i2 < 640 / ((uint)16); i2++)
{
evenblock[idy_sorted + tid.x * ((uint)16)] = even_block_search_start + i2;
if (min_color(key_sorted[idy_sorted], colortable[even_block_search_start + i2 + tid.x * 640]))
{
break;
}
else
{
evenblock[idy_sorted + tid.x * ((uint)16)] = even_block_search_start + i2 + 1;
}
}
}
}
#line 654
barrier();
int even_start, even_end, odd_start, odd_end;
even_start = evenblock[tid.y + tid.x * ((uint)16)];
odd_start = oddblock[tid.y + tid.x * ((uint)16)];
if ((tid.y + 1) % groupsize == 0)
{
even_end = (tid.y - (tid.y % groupsize) + groupsize / 2.0 ) * 640 / ((uint)16);
odd_end = (tid.y - (tid.y % groupsize) + groupsize) * 640 / ((uint)16);
}
else
{
even_end = evenblock[tid.y + 1 + tid.x * ((uint)16)];
odd_end = oddblock[tid.y + 1 + tid.x * ((uint)16)];
}
#line 669
int even_counter = even_start;
int odd_counter = odd_start;
int cc = 0;
while (even_counter < even_end && odd_counter < odd_end)
{
if (min_color(colortable[even_counter + tid.x * 640], colortable[odd_counter + tid.x * 640]))
{
sorted_array[cc++] = colortable[even_counter++ + tid.x * 640];
}
else
{
sorted_array[cc++] = colortable[odd_counter++ + tid.x * 640];
}
}
while (even_counter < even_end)
{
sorted_array[cc++] = colortable[even_counter++ + tid.x * 640];
}
while (odd_counter < odd_end)
{
sorted_array[cc++] = colortable[odd_counter++ + tid.x * 640];
}
#line 692
barrier();
int sorted_array_size = cc;
int global_position = odd_start + even_start - (tid.y - (tid.y % groupsize) + groupsize / 2.0 ) * 640 / ((uint)16);
for (int w = 0; w < cc; w++)
{
colortable[global_position + w + tid.x * 640] = sorted_array[w];
}
}
barrier();
for (i = 0; i < 640 / ((uint)16); i++)
{
colortable[row + i + tid.x * 640].a = colortable[row + i + tid.x * 640].a % 1;
tex2Dstore(texColorSortStorage, float2(id.x, row + i), float4(colortable[row + i + tid.x * 640]));
}
}
#line 709
void downsample_color(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
float2 texcoord_new = rotate(texcoord, RotationAngle, true);
fragment = tex2D(SamplerBackground, texcoord);
float fragment_depth = ReShade::GetLinearizedDepth(texcoord);
fragment = inFocus(fragment, fragment_depth, texcoord) ? tex2D(SamplerColorSort, texcoord_new) : fragment;
fragment = (ShowSelectedHue * FilterColor) ? showHue(texcoord, fragment) : fragment;
fragment = ShowMask ? tex2D(SamplerMask, texcoord).rrrr : fragment;
}
#line 726
technique ColorSort_Masking < ui_tooltip = "This is the masking part of the shader. It has to be placed before ColorSort_Main. All effects between Masking and Main (e.g. Monochrome) will only apply to the sorted area."; >
{
pass maskColor { VertexShader = PostProcessVS; PixelShader = mask_color; RenderTarget = texMask; }
pass saveBackground { VertexShader = PostProcessVS; PixelShader = save_background; RenderTarget = texBackground; }
pass gradColor { VertexShader = PostProcessVS; PixelShader = grad_color; }
}
#line 733
technique ColorSort_Main < ui_tooltip = "This is a compute shader, which sorts colors from brightest to darkest. You can filter the selection by depth and color."; >
{
pass preColor { VertexShader = PostProcessVS; PixelShader = pre_color; RenderTarget = texHalfRes; }
pass sortColor { ComputeShader = sort_color< 2, ((uint)16) >; DispatchSizeX = 1920 / 2; DispatchSizeY = 1; }
pass downsampleColor { VertexShader = PostProcessVS; PixelShader = downsample_color; }
}
} 

