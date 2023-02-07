#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\SlitScan.fx"
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
#line 6 "C:\Program Files\GShade\gshade-shaders\Shaders\SlitScan.fx"
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
#line 7 "C:\Program Files\GShade\gshade-shaders\Shaders\SlitScan.fx"
#line 12
uniform float x_col <
ui_type = "slider";
ui_label = "Position";
ui_tooltip = "Determines which column on the screen to start scanning.";
ui_max = 1.0;
ui_min = 0.0;
> = 0.250;
#line 20
uniform float scan_speed <
ui_type = "slider";
ui_label="Scan Speed";
ui_tooltip=
"Adjusts the rate of the scan. Lower values mean a slower scan, which can get you better images at the cost of scan speed.";
ui_max = 3.0;
ui_min = 0.0;
> = 1.0;
#line 29
uniform float min_depth <
ui_type = "slider";
ui_label="Minimum Depth";
ui_tooltip="Unmasks anything before a set depth.";
ui_min=0.0;
ui_max=1.0;
> = 0;
#line 37
uniform int direction <
ui_type = "combo";
ui_label = "Scan Direction";
ui_items = "Left\0Right\0Up\0Down\0";
ui_tooltip = "Changes the direction of the scan to the direction specified.";
> = 0;
#line 44
uniform int animate <
ui_type = "combo";
ui_label = "Animate";
ui_items = "No\0Yes\0";
ui_tooltip = "Animates the scanned column, moving it from one end to the other.";
> = 0;
#line 51
uniform float frame_rate <
source = "framecount";
>;
#line 55
uniform float2 anim_rate <
source = "pingpong";
min = 0.0;
max = 1.0;
step = 0.001;
smoothing = 0.0;
>;
#line 79
uniform int
render_type < ui_category =
"Blending"; ui_category_closed =
false; ui_items = "Normal\0" "Darken\0" "  Multiply\0" "  Color Burn\0" "  Linear Burn\0" "Lighten\0" "  Screen\0" "  Color Dodge\0" "  Linear Dodge\0" "  Addition\0" "  Glow\0" "Overlay\0" "  Soft Light\0" "  Hard Light\0" "  Vivid Light\0" "  Linear Light\0" "  Pin Light\0" "  Hard Mix\0" "Difference\0" "  Exclusion\0" "Subtract\0" "  Divide\0" "  Divide (Alternative)\0" "  Divide (Photoshop)\0" "  Reflect\0" "  Grain Extract\0" "  Grain Merge\0" "Hue\0" "  Saturation\0" "  Color\0" "  Luminosity\0"; ui_label =
"Blending Mode"; ui_tooltip =
"Blends the effect with the previous layers."; ui_type = "combo"; ui_spacing =
0; > =
0
#line 71
;;
#line 73
uniform float blending_amount <
ui_type = "slider";
ui_label = "Opacity";
ui_category = "Blending";
ui_tooltip = "Adjusts the blending amount.";
ui_min = 0.0;
ui_max = 1.0;
> = 1.0;
#line 83
texture texColorBuffer: COLOR;
#line 85
texture ssTexture {
Height = 1080;
Width = 1920;
};
#line 90
sampler samplerColor {
Texture = texColorBuffer;
#line 93
Width = 1920;
Height = 1080;
Format = RGBA16;
#line 97
};
#line 99
sampler ssTarget {
Texture = ssTexture;
#line 102
AddressU = WRAP;
AddressV = WRAP;
AddressW = WRAP;
#line 106
Height = 1080;
Width = 1920;
Format = RGBA16;
};
#line 111
float get_pix_w() {
float output;
switch(direction) {
case 0:
case 1:
output = scan_speed * (1.0 / 1920);
break;
case 2:
case 3:
output = scan_speed * (1.0 / 1080);
break;
}
return output;
}
#line 127
void FullScreenVS(uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD0)
{
#line 130
if (id == 2)
texcoord.x = 2.0;
else
texcoord.x = 0.0;
#line 135
if (id == 1)
texcoord.y  = 2.0;
else
texcoord.y = 0.0;
#line 140
position = float4( texcoord * float2(2, -2) + float2(-1, 1), 0, 1);
};
#line 143
void SlitScan(float4 pos : SV_Position, float2 texcoord : TEXCOORD0, out float4 color : SV_TARGET)
{
float4 col_pixels;
float scan_col;
#line 148
if(animate) scan_col = anim_rate.x;
else scan_col = x_col;
#line 151
switch(direction) {
case 0:
case 1:
col_pixels =  tex2D(samplerColor, float2(scan_col, texcoord.y));
break;
case 2:
case 3:
col_pixels =  tex2D(samplerColor, float2(texcoord.x, scan_col));
break;
#line 161
}
float pix_w = get_pix_w();
float slice_to_fill;
switch(direction){
case 0:
case 2:
slice_to_fill = (frame_rate * pix_w) % 1;
break;
case 1:
case 3:
slice_to_fill = abs(1-((frame_rate * pix_w) % 1));
break;
}
#line 175
float4 cols = tex2Dfetch(ssTarget, texcoord);
float4 col_to_write = tex2Dfetch(ssTarget, texcoord);
switch(direction) {
case 0:
case 1:
if(texcoord.x >= slice_to_fill - pix_w && texcoord.x <= slice_to_fill + pix_w)
col_to_write.rgba = col_pixels.rgba;
else
discard;
break;
case 2:
case 3:
if(texcoord.y >= slice_to_fill - pix_w && texcoord.y <= slice_to_fill + pix_w)
col_to_write.rgba = col_pixels.rgba;
else
discard;
break;
}
#line 194
color = col_to_write;
};
#line 197
void SlitScanPost(float4 pos : SV_Position, float2 texcoord : TEXCOORD0, out float4 color : SV_TARGET)
{
const float depth = ReShade::GetLinearizedDepth(texcoord).r;
float2 uv = texcoord;
float4 screen = tex2D(samplerColor, texcoord);
float pix_w = get_pix_w();
float scan_col;
#line 205
if(animate) scan_col = anim_rate.x;
else scan_col = x_col;
#line 208
switch(direction) {
case 0:
uv.x +=  (frame_rate * pix_w) - scan_col % 1 ;
break;
case 1:
uv.x -= (frame_rate * pix_w) - (1 - scan_col) % 1 ;
break;
case 2:
uv.y +=  (frame_rate * pix_w) - scan_col % 1 ;
break;
case 3:
uv.y -=  (frame_rate * pix_w) - (1 - scan_col) % 1 ;
break;
}
#line 223
float4 scanned = tex2D(ssTarget, uv);
#line 226
float4 mask;
switch(direction) {
case 0:
mask = step(texcoord.x, scan_col);
break;
case 1:
mask = step(scan_col, texcoord.x);
break;
case 2:
mask = step(texcoord.y, scan_col);
break;
case 3:
mask = step(scan_col, texcoord.y);
break;
}
if(depth >= min_depth) {
color = lerp(
screen,
float4(ComHeaders::Blending::Blend(render_type, screen.rgb, scanned.rgb, blending_amount), 1.0),
mask);
#line 250
}
#line 252
else
color = screen;
#line 258
}
#line 262
technique SlitScan <
ui_label="Slit Scan";
ui_tooltip="Scans a column or row of pixels and creates a sliding image in the direction specified.\n When animated, gradually scans the entire image.";
> {
pass p0 {
#line 268
VertexShader = FullScreenVS;
PixelShader = SlitScan;
#line 271
RenderTarget = ssTexture;
}
#line 274
pass p1 {
#line 276
VertexShader = FullScreenVS;
PixelShader = SlitScanPost;
#line 279
}
}

