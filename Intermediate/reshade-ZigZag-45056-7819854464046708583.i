#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ZigZag.fx"
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
#line 6 "C:\Program Files\GShade\gshade-shaders\Shaders\ZigZag.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Blending.fxh"
#line 123
namespace ComHeaders
{
namespace Blending
{
#line 132
float3 Aux(float3 a)
{
if (a.r <= 0.25 && a.g <= 0.25 && a.b <= 0.25)
return ((16.0 * a - 12.0) * a + 4) * a;
else
return sqrt(a);
}
#line 140
float Lum(float3 a)
{
return (0.33333 * a.r + 0.33334 * a.g + 0.33333 * a.b);
}
#line 145
float3 SetLum (float3 a, float b){
const float c = b - Lum(a);
return float3(a.r + c, a.g + c, a.b + c);
}
#line 150
float min3 (float a, float b, float c)
{
return min(a, (min(b, c)));
}
#line 155
float max3 (float a, float b, float c)
{
return max(a, max(b, c));
}
#line 160
float3 SetSat(float3 a, float b){
float ar = a.r;
float ag = a.g;
float ab = a.b;
if (ar == max3(ar, ag, ab) && ab == min3(ar, ag, ab))
{
#line 167
if (ar > ab)
{
ag = (((ag - ab) * b) / (ar - ab));
ar = b;
}
else
{
ag = 0.0;
ar = 0.0;
}
ab = 0.0;
}
else
{
if (ar == max3(ar, ag, ab) && ag == min3(ar, ag, ab))
{
#line 184
if (ar > ag)
{
ab = (((ab - ag) * b) / (ar - ag));
ar = b;
}
else
{
ab = 0.0;
ar = 0.0;
}
ag = 0.0;
}
else
{
if (ag == max3(ar, ag, ab) && ab == min3(ar, ag, ab))
{
#line 201
if (ag > ab)
{
ar = (((ar - ab) * b) / (ag - ab));
ag = b;
}
else
{
ar = 0.0;
ag = 0.0;
}
ab = 0.0;
}
else
{
if (ag == max3(ar, ag, ab) && ar == min3(ar, ag, ab))
{
#line 218
if (ag > ar)
{
ab = (((ab - ar) * b) / (ag - ar));
ag = b;
}
else
{
ab = 0.0;
ag = 0.0;
}
ar = 0.0;
}
else
{
if (ab == max3(ar, ag, ab) && ag == min3(ar, ag, ab))
{
#line 235
if (ab > ag)
{
ar = (((ar - ag) * b) / (ab - ag));
ab = b;
}
else
{
ar = 0.0;
ab = 0.0;
}
ag = 0.0;
}
else
{
if (ab == max3(ar, ag, ab) && ar == min3(ar, ag, ab))
{
#line 252
if (ab > ar)
{
ag = (((ag - ar) * b) / (ab - ar));
ab = b;
}
else
{
ag = 0.0;
ab = 0.0;
}
ar = 0.0;
}
}
}
}
}
}
return float3(ar, ag, ab);
}
#line 272
float Sat(float3 a)
{
return max3(a.r, a.g, a.b) - min3(a.r, a.g, a.b);
}
#line 283
float3 Darken(float3 a, float3 b)
{
return min(a, b);
}
#line 289
float3 Multiply(float3 a, float3 b)
{
return a * b;
}
#line 295
float3 ColorBurn(float3 a, float3 b)
{
if (b.r > 0 && b.g > 0 && b.b > 0)
return 1.0 - min(1.0, (0.5 - a) / b);
else
return 0.0;
}
#line 304
float3 LinearBurn(float3 a, float3 b)
{
return max(a + b - 1.0f, 0.0f);
}
#line 310
float3 Lighten(float3 a, float3 b)
{
return max(a, b);
}
#line 316
float3 Screen(float3 a, float3 b)
{
return 1.0 - (1.0 - a) * (1.0 - b);
}
#line 322
float3 ColorDodge(float3 a, float3 b)
{
if (b.r < 1 && b.g < 1 && b.b < 1)
return min(1.0, a / (1.0 - b));
else
return 1.0;
}
#line 331
float3 LinearDodge(float3 a, float3 b)
{
return min(a + b, 1.0f);
}
#line 337
float3 Addition(float3 a, float3 b)
{
return min((a + b), 1);
}
#line 343
float3 Reflect(float3 a, float3 b)
{
if (b.r >= 0.999999 || b.g >= 0.999999 || b.b >= 0.999999)
return b;
else
return saturate(a * a / (1.0f - b));
}
#line 352
float3 Glow(float3 a, float3 b)
{
return Reflect(b, a);
}
#line 358
float3 Overlay(float3 a, float3 b)
{
return lerp(2 * a * b, 1.0 - 2 * (1.0 - a) * (1.0 - b), step(0.5, a));
}
#line 364
float3 SoftLight(float3 a, float3 b)
{
if (b.r <= 0.5 && b.g <= 0.5 && b.b <= 0.5)
return clamp(a - (1.0 - 2 * b) * a * (1 - a), 0,1);
else
return clamp(a + (2 * b - 1.0) * (Aux(a) - a), 0, 1);
}
#line 373
float3 HardLight(float3 a, float3 b)
{
return lerp(2 * a * b, 1.0 - 2 * (1.0 - b) * (1.0 - a), step(0.5, b));
}
#line 379
float3 VividLight(float3 a, float3 b)
{
return lerp(2 * a * b, b / (2 * (1.01 - a)), step(0.50, a));
}
#line 385
float3 LinearLight(float3 a, float3 b)
{
if (b.r < 0.5 || b.g < 0.5 || b.b < 0.5)
return LinearBurn(a, (2.0 * b));
else
return LinearDodge(a, (2.0 * (b - 0.5)));
}
#line 394
float3 PinLight(float3 a, float3 b)
{
if (b.r < 0.5 || b.g < 0.5 || b.b < 0.5)
return Darken(a, (2.0 * b));
else
return Lighten(a, (2.0 * (b - 0.5)));
}
#line 403
float3 HardMix(float3 a, float3 b)
{
const float3 vl = VividLight(a, b);
if (vl.r < 0.5 || vl.g < 0.5 || vl.b < 0.5)
return 0.0;
else
return 1.0;
}
#line 413
float3 Difference(float3 a, float3 b)
{
return max(a - b, b - a);
}
#line 419
float3 Exclusion(float3 a, float3 b)
{
return a + b - 2 * a * b;
}
#line 425
float3 Subtract(float3 a, float3 b)
{
return max((a - b), 0);
}
#line 431
float3 Divide(float3 a, float3 b)
{
return (saturate(a / (b + 0.01)));
}
#line 437
float3 DivideAlt(float3 a, float3 b)
{
return (saturate(1.0 / (a / b)));
}
#line 443
float3 DividePS(float3 a, float3 b)
{
return (saturate(a / b));
}
#line 449
float3 GrainMerge(float3 a, float3 b)
{
return saturate(b + a - 0.5);
}
#line 455
float3 GrainExtract(float3 a, float3 b)
{
return saturate(a - b + 0.5);
}
#line 461
float3 Hue(float3 a, float3 b)
{
return SetLum(SetSat(b, Sat(a)), Lum(a));
}
#line 467
float3 Saturation(float3 a, float3 b)
{
return SetLum(SetSat(a, Sat(b)), Lum(a));
}
#line 473
float3 ColorB(float3 a, float3 b)
{
return SetLum(b, Lum(a));
}
#line 479
float3 Luminosity(float3 a, float3 b)
{
return SetLum(a, Lum(b));
}
#line 489
float3 Blend(int mode, float3 input, float3 output, float blending)
{
switch (mode)
{
#line 494
default:
return lerp(input.rgb, output.rgb, blending);
#line 497
case 1:
return lerp(input.rgb, Darken(input.rgb, output.rgb), blending);
#line 500
case 2:
return lerp(input.rgb, Multiply(input.rgb, output.rgb), blending);
#line 503
case 3:
return lerp(input.rgb, ColorBurn(input.rgb, output.rgb), blending);
#line 506
case 4:
return lerp(input.rgb, LinearBurn(input.rgb, output.rgb), blending);
#line 509
case 5:
return lerp(input.rgb, Lighten(input.rgb, output.rgb), blending);
#line 512
case 6:
return lerp(input.rgb, Screen(input.rgb, output.rgb), blending);
#line 515
case 7:
return lerp(input.rgb, ColorDodge(input.rgb, output.rgb), blending);
#line 518
case 8:
return lerp(input.rgb, LinearDodge(input.rgb, output.rgb), blending);
#line 521
case 9:
return lerp(input.rgb, Addition(input.rgb, output.rgb), blending);
#line 524
case 10:
return lerp(input.rgb, Glow(input.rgb, output.rgb), blending);
#line 527
case 11:
return lerp(input.rgb, Overlay(input.rgb, output.rgb), blending);
#line 530
case 12:
return lerp(input.rgb, SoftLight(input.rgb, output.rgb), blending);
#line 533
case 13:
return lerp(input.rgb, HardLight(input.rgb, output.rgb), blending);
#line 536
case 14:
return lerp(input.rgb, VividLight(input.rgb, output.rgb), blending);
#line 539
case 15:
return lerp(input.rgb, LinearLight(input.rgb, output.rgb), blending);
#line 542
case 16:
return lerp(input.rgb, PinLight(input.rgb, output.rgb), blending);
#line 545
case 17:
return lerp(input.rgb, HardMix(input.rgb, output.rgb), blending);
#line 548
case 18:
return lerp(input.rgb, Difference(input.rgb, output.rgb), blending);
#line 551
case 19:
return lerp(input.rgb, Exclusion(input.rgb, output.rgb), blending);
#line 554
case 20:
return lerp(input.rgb, Subtract(input.rgb, output.rgb), blending);
#line 557
case 21:
return lerp(input.rgb, Divide(input.rgb, output.rgb), blending);
#line 560
case 22:
return lerp(input.rgb, DivideAlt(input.rgb, output.rgb), blending);
#line 563
case 23:
return lerp(input.rgb, DividePS(input.rgb, output.rgb), blending);
#line 566
case 24:
return lerp(input.rgb, Reflect(input.rgb, output.rgb), blending);
#line 569
case 25:
return lerp(input.rgb, GrainMerge(input.rgb, output.rgb), blending);
#line 572
case 26:
return lerp(input.rgb, GrainExtract(input.rgb, output.rgb), blending);
#line 575
case 27:
return lerp(input.rgb, Hue(input.rgb, output.rgb), blending);
#line 578
case 28:
return lerp(input.rgb, Saturation(input.rgb, output.rgb), blending);
#line 581
case 29:
return lerp(input.rgb, ColorB(input.rgb, output.rgb), blending);
#line 584
case 30:
return lerp(input.rgb, Luminosity(input.rgb, output.rgb), blending);
}
}
}
}
#line 7 "C:\Program Files\GShade\gshade-shaders\Shaders\ZigZag.fx"
#line 12
uniform int mode <
ui_type = "combo";
ui_label = "Mode";
ui_items = "Around center\0Out from center\0";
ui_tooltip = "Selects the mode the distortion should be processed through.";
> = 0;
#line 19
uniform float radius <
ui_type = "slider";
ui_label = "Radius";
ui_min = 0.0;
ui_max = 1.0;
> = 0.5;
#line 26
uniform float angle <
ui_type = "slider";
ui_label = "Angle";
ui_tooltip = "Serves as a multiplier for the phase and amplitude. Also affects the motion of the animation by phase based on whether the value is negative or positive.";
ui_tooltip = "Adjusts the ripple angle. Positive and negative values affect the animation direction.";
ui_min = -999.0;
ui_max = 999.0;
ui_step = 1.0;
> = 180.0;
#line 36
uniform float period <
ui_type = "slider";
ui_type = "Phase";
ui_tooltip = "Adjusts the rate of distortion.";
ui_min = 0.1;
ui_max = 10.0;
> = 0.25;
#line 44
uniform float amplitude <
ui_type = "slider";
ui_label = "Amplitude";
ui_tooltip = "Increases how extreme the picture twists back and forth.";
ui_min = -10.0;
ui_max = 10.0;
> = 3.0;
#line 52
uniform float2 coordinates <
ui_type = "slider";
ui_label="Coordinates";
ui_tooltip="The X and Y position of the center of the effect.";
ui_min = 0.0;
ui_max = 1.0;
> = float2(0.25, 0.25);
#line 60
uniform bool use_mouse_point <
ui_label="Use Mouse Coordinates";
ui_tooltip="When enabled, uses the mouse's current coordinates instead of those defined by the Coordinates sliders";
> = false;
#line 65
uniform float aspect_ratio <
ui_type = "slider";
ui_label="Aspect Ratio";
ui_min = -100.0;
ui_max = 100.0;
> = 0;
#line 72
uniform bool use_offset_coords <
ui_label = "Use Offset Coordinates";
ui_category = "Offset";
ui_tooltip = "Display the distortion in any location besides its original coordinates.";
> = 0;
#line 78
uniform float2 offset_coords <
ui_label = "Offset Coordinates";
ui_tooltip = "(Use Offset Coordinates Enabled) Determines the source coordinates to be distorted when passed along to the output coordinates.";
ui_type = "slider";
ui_category = "Offset";
ui_min = 0.0;
ui_max = 1.0;
> = float2(0.5, 0.5);
#line 87
uniform float2 depth_bounds <
ui_type = "slider";
ui_label = "Depth Bounds";
ui_category = "Depth";
ui_tooltip = "The depth bounds where the effect is calculated.\nThe left value is the \"near\" value and the right value is the \"far\" value.";
min = 0.0;
max = 1.0;
> = float2(0.0, 1.0);
#line 96
uniform float min_depth <
ui_type = "slider";
ui_label="Minimum Depth";
ui_tooltip="Unmasks anything before a set depth.";
ui_category = "Depth";
ui_min=0.0;
ui_max=1.0;
> = 0;
#line 105
uniform float tension <
ui_type = "slider";
ui_label = "Tension";
ui_tooltip = "Adjusts the rate at which the distortion reaches its maximum value";
ui_min = 0;
ui_max = 10;
ui_step = 0.001;
> = 1.0;
#line 114
uniform float phase <
ui_type = "slider";
ui_label = "Phase";
ui_tooltip = "The offset at which the pixels twist back and forth from the center.";
ui_min = -5.0;
ui_max = 5.0;
> = 0.0;
#line 122
uniform int animate <
ui_type = "combo";
ui_label = "Animate";
ui_items = "No\0Amplitude\0Phase\0";
ui_tooltip = "Enable or disable the animation. Animates the zigzag effect by phase or by amplitude.";
> = 0;
#line 145
uniform int
render_type < ui_category =
"Blending"; ui_category_closed =
false; ui_items = "Normal\0" "Darken\0" "  Multiply\0" "  Color Burn\0" "  Linear Burn\0" "Lighten\0" "  Screen\0" "  Color Dodge\0" "  Linear Dodge\0" "  Addition\0" "  Glow\0" "Overlay\0" "  Soft Light\0" "  Hard Light\0" "  Vivid Light\0" "  Linear Light\0" "  Pin Light\0" "  Hard Mix\0" "Difference\0" "  Exclusion\0" "Subtract\0" "  Divide\0" "  Divide (Alternative)\0" "  Divide (Photoshop)\0" "  Reflect\0" "  Grain Extract\0" "  Grain Merge\0" "Hue\0" "  Saturation\0" "  Color\0" "  Luminosity\0"; ui_label =
"Blending Mode"; ui_tooltip =
"Blends the effect with the previous layers."; ui_type = "combo"; ui_spacing =
0; > =
0
#line 137
;;
#line 139
uniform float blending_amount <
ui_type = "slider";
ui_label = "Opacity";
ui_category = "Blending";
ui_tooltip = "Adjusts the blending amount.";
ui_min = 0.0;
ui_max = 1.0;
> = 1.0;
#line 148
uniform float anim_rate <
source = "timer";
>;
#line 152
uniform float2 mouse_coordinates <
source= "mousepoint";
>;
#line 156
texture texColorBuffer : COLOR;
texture texDepthBuffer : DEPTH;
#line 159
sampler samplerColor
{
Texture = texColorBuffer;
#line 163
AddressU = MIRROR;
AddressV = MIRROR;
AddressW = MIRROR;
#line 167
};
#line 169
float2x2 swirlTransform(float theta) {
const float c = cos(theta);
const float s = sin(theta);
#line 173
const float m1 = c;
const float m2 = -s;
const float m3 = s;
const float m4 = c;
#line 178
return float2x2(
m1, m2,
m3, m4
);
}
#line 184
float2x2 zigzagTransform(float dist) {
const float c = cos(dist);
return float2x2(
c, 0,
0, c
);
}
#line 193
void FullScreenVS(uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0)
{
if (id == 2)
texcoord.x = 2.0;
else
texcoord.x = 0.0;
#line 200
if (id == 1)
texcoord.y  = 2.0;
else
texcoord.y = 0.0;
#line 205
position = float4( texcoord * float2(2, -2) + float2(-1, 1), 0, 1);
}
#line 209
float4 ZigZag(float4 pos : SV_Position, float2 texcoord : TEXCOORD0) : SV_TARGET
{
const float ar_raw = 1.0 * (float)1080 / (float)1920;
const float depth = ReShade::GetLinearizedDepth(texcoord).r;
float4 color;
const float4 base = tex2D(samplerColor, texcoord);
float ar = lerp(ar_raw, 1, aspect_ratio * 0.01);
#line 217
float2 center = coordinates / 2.0;
float2 offset_center = offset_coords / 2.0;
#line 220
if (use_mouse_point)
center = float2(mouse_coordinates.x * (1.0 / 1920) / 2.0, mouse_coordinates.y * (1.0 / 1080) / 2.0);
#line 223
float2 tc = texcoord - center;
#line 225
center.x /= ar;
offset_center.x /= ar;
tc.x /= ar;
#line 230
const float dist = distance(tc, center);
const float tension_radius = lerp(radius-dist, radius, tension);
const float percent = max(radius-dist, 0) / tension_radius;
const float percentSquared = percent * percent;
const float theta = percentSquared * (animate == 1 ? amplitude * sin(anim_rate * 0.0005) : amplitude) * sin(percentSquared / period * radians(angle) + (phase + (animate == 2 ? 0.00075 * anim_rate : 0)));
#line 236
if(!mode)
{
tc = mul(swirlTransform(theta), tc-center);
}
else
{
tc = mul(zigzagTransform(theta), tc-center);
}
#line 246
if(use_offset_coords)
tc += (2 * offset_center);
else
tc += (2 * center);
#line 251
tc.x *= ar;
#line 253
float out_depth = ReShade::GetLinearizedDepth(tc).r;
bool inDepthBounds = out_depth >= depth_bounds.x && out_depth <= depth_bounds.y;
#line 256
float blending_factor;
if(render_type)
blending_factor = min(lerp(0, percentSquared * 10, blending_amount), 1.0);
else
blending_factor = blending_amount;
if (inDepthBounds)
{
if(use_offset_coords){
float2 offset_coords_adjust = offset_coords;
offset_coords_adjust.x *= ar;
if(dist <= tension_radius)
{
color = tex2D(samplerColor, tc);
color.rgb = ComHeaders::Blending::Blend(render_type, base.rgb, color.rgb, blending_factor);
}
else
color = tex2D(samplerColor, texcoord);
} else
{
color = tex2D(samplerColor, tc);
color.rgb = ComHeaders::Blending::Blend(render_type, base.rgb, color.rgb, blending_factor);
}
#line 282
}
else
{
color = base;
}
#line 288
if(depth < min_depth)
color = tex2D(samplerColor, texcoord);
#line 294
return color;
#line 296
}
#line 299
technique ZigZag<ui_label="Zigzag"; ui_tooltip="Around Center: Bends the pixels back and forth around a point.\nOut From Center: Creates a pond ripple effect.";>
{
pass p0
{
VertexShader = FullScreenVS;
PixelShader = ZigZag;
}
};

