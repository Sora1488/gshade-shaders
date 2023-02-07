#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\PerfectPerspective.fx"
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
#line 70 "C:\Program Files\GShade\gshade-shaders\Shaders\PerfectPerspective.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ColorAndDither.fxh"
#line 53
static const float3x3 YCbCrMtx =
float3x3(
float3(0.299, 1f-0.299-0.114, 0.114), 
float3(-0.5*0.299/(1f-0.114), -0.5*(1f-0.299-0.114)/(1f-0.114), 0.5), 
float3(0.5, -0.5*(1f-0.299-0.114)/(1f-0.299), -0.5*0.114/(1f-0.299))  
);
#line 60
static const float3 LumaMtx = float3(0.299, 1f-0.299-0.114, 0.114); 
#line 62
static const float3x2 ChromaMtx =
float3x2(
float3(-0.5*0.299/(1f-0.114), -0.5*(1f-0.299-0.114)/(1f-0.114), 0.5), 
float3(0.5, -0.5*(1f-0.299-0.114)/(1f-0.299), -0.5*0.114/(1f-0.299))  
);
#line 68
static const float3x3 RgbMtx =
float3x3(
float3(1f, 0f, 2f-2f*0.299), 
float3(1f, -0.114/(1f-0.299-0.114)*(2f-2f*0.114), -0.299/(1f-0.299-0.114)*(2f-2f*0.299)), 
float3(1f, 2f-2f*0.114, 0f) 
);
#line 82
float  to_display_gamma(float  g) { return pow(abs(g), rcp(2.2)); }
float2 to_display_gamma(float2 g) { return pow(abs(g), rcp(2.2)); }
float3 to_display_gamma(float3 g) { return pow(abs(g), rcp(2.2)); }
float4 to_display_gamma(float4 g) { return pow(abs(g), rcp(2.2)); }
#line 87
float  to_linear_gamma(float  g) { return pow(abs(g), 2.2); }
float2 to_linear_gamma(float2 g) { return pow(abs(g), 2.2); }
float3 to_linear_gamma(float3 g) { return pow(abs(g), 2.2); }
float4 to_linear_gamma(float4 g) { return pow(abs(g), 2.2); }
#line 97
float  to_display_gamma_hq(float  g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float2 to_display_gamma_hq(float2 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float3 to_display_gamma_hq(float3 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
float4 to_display_gamma_hq(float4 g) { return ((g)<=0.0031308? (g)*12.92 : pow(abs(g), rcp(2.4))*1.055-0.055); }
#line 102
float  to_linear_gamma_hq(float  g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float2 to_linear_gamma_hq(float2 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float3 to_linear_gamma_hq(float3 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
float4 to_linear_gamma_hq(float4 g) { return ((g)<=0.04049936? (g)/12.92 : pow((abs(g)+0.055)/1.055, 2.4)); }
#line 108
namespace BlueNoise
{
#line 113
texture BlueNoiseTex
<
source = "fubax_bluenoise.png";
pooled = true;
>{
Width = 64u;
Height = 64u;
Format = RGBA8;
};
#line 123
sampler BlueNoiseTexSmp
{
Texture = BlueNoiseTex;
#line 127
AddressU = REPEAT;
AddressV = REPEAT;
};
#line 137
float dither(int2 pixelPos, float gradient)
{
#line 140
gradient *= 255;
#line 142
float noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u).r;
#line 144
gradient = frac(gradient) >= noise? ceil(gradient) : floor(gradient);
#line 146
return gradient/255;
}
float3 dither(int2 pixelPos, float3 color)
{
#line 151
color *= 255;
#line 153
float3 noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u).rgb;
#line 155
float3 slope = frac(color);
#line 157
[unroll]
for (uint i=0u; i<3u; i++)
color[i] = slope[i] >= noise[i]? ceil(color[i]) : floor(color[i]);
#line 161
return color/255;
}
float4 dither(int2 pixelPos, float4 color)
{
#line 166
color *= 255;
#line 168
float4 noise = tex2Dfetch(BlueNoiseTexSmp, pixelPos%64u);
#line 170
float4 slope = frac(color);
#line 172
[unroll]
for (uint i=0u; i<4u; i++)
color[i] = slope[i] >= noise[i]? ceil(color[i]) : floor(color[i]);
#line 176
return color/255;
}
}
#line 71 "C:\Program Files\GShade\gshade-shaders\Shaders\PerfectPerspective.fx"
#line 76
uniform uint FovAngle <
ui_type = "slider";
ui_category = "Game";
ui_text = "(Match game settings)";
ui_label = "Field of view (FOV)";
ui_tooltip = "This should match your in-game FOV value.";
#line 85
ui_max = 170u;
> = 90u;
#line 88
uniform uint FovType <
ui_type = "combo";
ui_category = "Game";
ui_label = "Field of view type";
ui_tooltip =
"This should match game-specific FOV type.\n"
"\n"
"Adjust so that round objects are still round when at the corner, and not oblong.\n"
"Tilt head to see better.\n"
"\n"
"Tip:\n"
"	If image bulges in movement, change it to 'diagonal'.\n"
"	When proportions are distorted at the periphery, choose 'vertical' or '4:3'.\n"
"	For ultra-wide display you may want '16:9' instead.\n"
"\n"
"	This method only works with k = 0.5 and s = 1.0.";
ui_items =
"horizontal\0"
"diagonal\0"
"vertical\0"
"horizontal 4:3\0"
"horizontal 16:9\0";
> = 0u;
#line 114
uniform float K <
ui_type = "slider";
ui_category = "Distortion";
#line 120
ui_label = "Projection type 'k'";
#line 122
ui_tooltip =
"Projection coefficient 'k', represents\n"
"various azimuthal projections types:\n"
"\n"
"Perception     Value  Projection\n"
"\n"
"straight path   1     Rectilinear\n"
"shape           0.5   Stereographic\n"
"distance        0     Equidistant\n"
"depth          -0.5   Equisolid\n"
"illumination   -1     Orthographic\n"
"\n"
"\n"
"[Ctrl+click] to type value.";
ui_min = -1f; ui_max = 1f; ui_step = 0.05;
> = 0.5;
#line 161
uniform float S <
ui_type = "slider";
ui_category = "Distortion";
ui_label = "Anamorphic squeeze 's'";
ui_tooltip =
"Anamorphic squeeze factor 's', affects\n"
"vertical axis:\n"
"\n"
"1      spherical lens\n"
"1.25   Ultra Panavision 70\n"
"1.33   16x9 TV\n"
"1.5    Technirama\n"
"1.6    digital anamorphic\n"
"1.8    4x3 full-frame\n"
"2      golden-standard";
ui_min = 1f; ui_max = 4f; ui_step = 0.05;
> = 1f;
#line 180
uniform bool UseVignette <
ui_type = "input";
ui_category = "Distortion";
ui_label = "Apply vignetting";
ui_tooltip = "Apply lens-correct natural vignetting effect.";
> = true;
#line 189
uniform float CroppingFactor <
ui_type = "slider";
ui_category = "Border";
ui_category_closed = true;
ui_label = "Cropping";
ui_tooltip =
"Adjusts image scale and cropped area size:\n"
"\n"
"Value Cropping\n"
"\n"
"  0   circular\n"
#line 204
"  1   cropped-circle\n"
"  2   full-frame";
ui_min = 0f; ui_max = 2f;
#line 208
> = 1f;
#line 210
uniform bool MirrorBorder <
ui_type = "input";
ui_category = "Border";
ui_label = "Mirror on border";
ui_tooltip = "Choose mirrored or original image on the border.";
> = true;
#line 217
uniform bool BorderVignette <
ui_type = "input";
ui_category = "Border";
ui_label = "Vignette on border";
ui_tooltip = "Apply vignetting effect to border.";
> = false;
#line 224
uniform float4 BorderColor <
ui_type = "color";
ui_category = "Border";
ui_label = "Border color";
ui_tooltip = "Use alpha to change border transparency.";
> = float4(0.027, 0.027, 0.027, 0.96);
#line 231
uniform float BorderCorner <
ui_type = "slider";
ui_category = "Border";
ui_label = "Corner radius";
ui_tooltip = "Value of 0 gives sharp corners.";
ui_min = 0f; ui_max = 1f;
> = 0.062;
#line 239
uniform uint BorderGContinuity <
ui_type = "slider";
ui_category = "Border";
ui_label = "Corner roundness";
ui_tooltip =
"G-surfacing continuity level for the corners:\n"
"\n"
"G0   sharp\n"
"G1   circular\n"
"G2   smooth\n"
"G3   very smooth";
ui_min = 1u; ui_max = 3u;
> = 3u;
#line 255
uniform bool DebugModePreview <
ui_type = "input";
ui_label = "Display debug mode";
ui_tooltip =
"Display calibration grid for lens-matching or\n"
"pixel scale-map for resolution matching.";
ui_category = "Debugging mode";
ui_category_closed = true;
> = false;
#line 265
uniform uint DebugMode <
ui_type = "combo";
ui_items =
"calibration grid\0"
"pixel scale-map\0";
ui_label = "Select debug mode";
ui_tooltip =
"Calibration grid:\n"
"\n"
"	Display distorted grid on-top of undistorted image.\n"
"	This can be used in conjunction with Image.fx\n"
"	to display real-world camera lens image and\n"
"	match its distortion profile.\n"
"\n"
"Pixel scale-map:\n"
"\n"
"	Display resolution-scale color map.\n"
"	Can indicate if super-resolution is required:\n"
"\n"
"	Color   Definition\n"
"\n"
"	red     under-sampling\n"
"	green   oversampling\n"
"	blue    1:1";
ui_category = "Debugging mode";
> = 0u;
#line 292
uniform float DimDebugBackground <
ui_type = "slider";
ui_min = 0.25; ui_max = 1f; ui_step = 0.1;
ui_label = "Dim background";
ui_tooltip = "Adjust background visibility.";
ui_category = "Debugging mode";
> = 1f;
#line 302
uniform uint GridLook <
ui_type = "combo";
ui_items =
"yellow grid\0"
"black grid\0"
"white grid\0"
"red-green grid\0";
ui_label = "Grid look";
ui_tooltip = "Select look of the grid.";
ui_text =
"Use calibration grid in conjunction with Image.fx, to match\n"
"lens distortion with a real-world camera profile.";
ui_category = "Debugging calibration grid";
ui_category_closed = true;
> = 0u;
#line 318
uniform uint GridSize <
ui_type = "slider";
ui_min = 1u; ui_max = 32u;
ui_label = "Grid size";
ui_tooltip = "Adjust calibration grid size.";
ui_category = "Debugging calibration grid";
> = 16u;
#line 326
uniform uint GridWidth <
ui_type = "slider";
ui_min = 2u; ui_max = 16u;
ui_label = "Grid bar width";
ui_tooltip = "Adjust calibration grid bar width in pixels.";
ui_category = "Debugging calibration grid";
> = 2u;
#line 334
uniform float GridTilt <
ui_type = "slider";
ui_min = -1f; ui_max = 1f; ui_step = 0.01;
ui_label = "Tilt grid";
ui_tooltip = "Adjust calibration grid tilt in degrees.";
ui_category = "Debugging calibration grid";
> = 0f;
#line 344
uniform uint ResScaleScreen <
ui_type = "input";
ui_label = "Screen (native) resolution";
ui_tooltip = "Set it to default screen resolution.";
ui_text = "Use pixel scale-map to get optimal resolution for super-sampling.";
ui_category = "Debugging pixel scale-map";
ui_category_closed = true;
> = 1920u;
#line 353
uniform uint ResScaleVirtual <
ui_type = "drag";
ui_step = 0.2;
ui_min = 16u; ui_max = 16384u;
ui_label = "Virtual resolution";
ui_tooltip =
"Simulates application running beyond native\n"
"screen resolution (using VSR or DSR).";
ui_category = "Debugging pixel scale-map";
> = 1920u;
#line 367
sampler BackBuffer
{
Texture = ReShade::BackBufferTex;
#line 371
SRGBTexture = true;
#line 374
AddressU = MIRROR;
AddressV = MIRROR;
};
#line 386
float s_curve(float gradient)
{
float top = max(gradient, 0.5);
float bottom = min(gradient, 0.5);
return 2f*((bottom*bottom+top)-(top*top-top))-1.5;
}
#line 398
float glength(uint G, float2 pos)
{
#line 401
if (G==0u) return max(abs(pos.x), abs(pos.y)); 
#line 403
pos = pow(abs(pos), ++G); 
return pow(pos.x+pos.y, rcp(G)); 
}
#line 410
float aastep(float grad)
{
#line 413
float2 Del = float2(ddx(grad), ddy(grad));
#line 415
return saturate(mad(rsqrt(dot(Del, Del)), grad, 0.5)); 
}
#line 422
float get_radius(float theta, float rcp_f, float k) 
{
if      (k>0f)   return tan(k*theta)/(rcp_f*k); 
else if (k<0f)   return sin(k*theta)/(rcp_f*k); 
else  return       theta / rcp_f;     
}
float get_rcp_focal(float halfOmega, float radiusAtOmega, float k) 
{ return get_radius(halfOmega, radiusAtOmega, k); }
float get_theta(float radius, float rcp_f, float k) 
{
if      (k>0f)   return atan(k*radius*rcp_f)/k; 
else if (k<0f)   return asin(k*radius*rcp_f)/k; 
else  return        radius*rcp_f;    
}
float get_vignette(float theta, float k) 
{
#line 439
float spherical_vignette = cos(max(abs(k), 0.5)*theta); 
#line 441
return pow(abs(spherical_vignette), mad(k, 0.5, 1.5));
}
float2 get_phi_weights(float2 texCoord)
{
texCoord *= texCoord; 
return texCoord/(texCoord.x+texCoord.y); 
}
#line 452
float GetBorderMask(float2 borderCoord)
{
#line 455
borderCoord = abs(borderCoord);
if (BorderGContinuity!=0u && BorderCorner!=0f) 
{
#line 459
if ((1920 * (1.0 / 1080))>1f) 
borderCoord.x = mad(borderCoord.x, (1920 * (1.0 / 1080)), 1f-(1920 * (1.0 / 1080)));
else if ((1920 * (1.0 / 1080))<1f) 
borderCoord.y = mad(borderCoord.y, (1080*(1.0 / 1920)), 1f-(1080*(1.0 / 1920)));
#line 464
borderCoord = max(borderCoord+(BorderCorner-1f), 0f)/BorderCorner;
#line 467
return aastep(glength(BorderGContinuity, borderCoord)-1f); 
}
else 
return aastep(glength(0u, borderCoord)-1f);
}
#line 474
float3 GridModeViewPass(
uint2  pixelCoord,
float2 texCoord,
float3 display)
{
#line 483
display = tex2Dfetch(BackBuffer, pixelCoord).rgb;
#line 487
texCoord = (texCoord*2f-1f)*normalize(float2(1920, 1080));
#line 489
if (GridTilt!=0f) 
{
#line 492
float tiltRad = radians(GridTilt);
#line 494
float tiltSin = sin(tiltRad);
float tiltCos = cos(tiltRad);
#line 497
texCoord = mul(
#line 499
float2x2(
tiltCos, tiltSin,
-tiltSin, tiltCos
),
texCoord 
);
}
#line 508
float2 delX = float2(ddx(texCoord.x), ddy(texCoord.x));
float2 delY = float2(ddx(texCoord.y), ddy(texCoord.y));
#line 511
texCoord = frac(texCoord*GridSize)-0.5;
#line 515
texCoord *= float2(
rsqrt(dot(delX, delX)),
rsqrt(dot(delY, delY))
)/GridSize; 
#line 520
texCoord = saturate(GridWidth*0.5-abs(texCoord)); 
#line 523
display = lerp(
#line 525
to_linear_gamma_hq(16f/255f), 
#line 529
display, 
DimDebugBackground 
);
#line 533
switch (GridLook)
{
#line 536
case 1:  display *= (1f-texCoord.x)*(1f-texCoord.y); break;
#line 538
case 2:  display  = 1f-(1f-texCoord.x)*(1f-texCoord.y)*(1f-display); break;
#line 540
case 3:
{
display = lerp(display, float3(1f, 0f, 0f), texCoord.y);
display = lerp(display, float3(0f, 1f, 0f), texCoord.x);
} break;
#line 546
default: display  = lerp(float3(1f, 1f, 0f), display, (1f-texCoord.x)*(1f-texCoord.y)); break;
}
#line 549
return display; 
}
#line 553
float3 SamplingScaleModeViewPass(
float2 texCoord,
float3 display)
{
#line 558
const float3   underSample = float3(235f, 16f, 16f)/255f; 
const float3   superSample = float3(16f, 235f, 16f)/255f; 
const float3 neutralSample = float3(16f, 16f, 235f)/255f; 
#line 563
texCoord *= float2(1920, 1080)*ResScaleVirtual/float(ResScaleScreen);
texCoord = float2(
length(float2(ddx(texCoord.x), ddy(texCoord.x))),
length(float2(ddx(texCoord.y), ddy(texCoord.y)))
);
#line 569
float pixelScale = texCoord.x*texCoord.y;
#line 571
float3 pixelScaleMap = lerp(
lerp(
underSample,
neutralSample,
s_curve(saturate(pixelScale*2f-1f)) 
),
superSample,
s_curve(saturate(pixelScale*2f-2f)) 
);
#line 583
display = to_display_gamma_hq(display);
#line 586
display.x = lerp(
16f/255f, 
235f/255f, 
dot(LumaMtx, display)
);
#line 592
display = lerp(
16f/255f, 
display, 
DimDebugBackground 
);
#line 598
display = lerp(
#line 600
to_linear_gamma_hq(display.x), 
#line 604
pixelScaleMap, 
sqrt(1.25)-0.5 
);
return display;
}
#line 611
float3 PerfectPerspectivePS(
float4 pixelPos : SV_Position,
float2 texCoord : TEXCOORD0) : SV_Target
{
#line 619
if (FovAngle==0u || (K==1f && !UseVignette))
#line 621
if (DebugModePreview)
{
float3 display; switch (DebugMode) 
{
#line 626
default: display = GridModeViewPass(uint2(pixelPos.xy), texCoord, display); break;
#line 631
case 1u: display = SamplingScaleModeViewPass(texCoord, tex2Dfetch(BackBuffer, uint2(pixelPos.xy)).rgb); break;
#line 633
}
#line 635
display = to_display_gamma_hq(display); 
#line 637
return BlueNoise::dither(uint2(pixelPos.xy), display); 
}
else 
return tex2D(ReShade::BackBuffer, texCoord).rgb;
#line 649
const float2 viewProportions = normalize(float2(1920, 1080));
#line 651
const float halfOmega = radians(FovAngle*0.5);
#line 654
texCoord = texCoord*2f-1f;
#line 656
texCoord *= viewProportions;
#line 659
static float radiusAtOmega; switch (FovType)
{
default: radiusAtOmega = viewProportions.x; break; 
case 1u: radiusAtOmega = 1f; break; 
case 2u: radiusAtOmega = viewProportions.y; break; 
case 3u: radiusAtOmega = viewProportions.y*4f/3f; break; 
case 4u: radiusAtOmega = viewProportions.y*16f/9f; break; 
}
#line 669
const float rcp_focal = get_rcp_focal(halfOmega, radiusAtOmega, K);
#line 674
float radius = S==1f ?
dot(texCoord, texCoord) : 
(texCoord.y*texCoord.y)/S+(texCoord.x*texCoord.x); 
float rcp_radius = rsqrt(radius); radius = sqrt(radius);
#line 679
{
#line 681
const float croppingHorizontal = get_radius(
atan(tan(halfOmega)/radiusAtOmega*viewProportions.x),
rcp_focal, K)/viewProportions.x;
#line 697
const float croppingVertical = get_radius(
atan(tan(halfOmega)/radiusAtOmega*viewProportions.y*rsqrt(S)),
rcp_focal, K)/viewProportions.y*sqrt(S);
#line 701
const float anamorphicDiagonal = length(float2(
viewProportions.x,
viewProportions.y*rsqrt(S)
));
const float croppingDigonal = get_radius(
atan(tan(halfOmega)/radiusAtOmega*anamorphicDiagonal),
rcp_focal, K)/anamorphicDiagonal;
#line 710
const float croppingScalar = CroppingFactor<1f ?
lerp(
max(croppingHorizontal, croppingVertical), 
min(croppingHorizontal, croppingVertical), 
max(CroppingFactor, 0f) 
) :
lerp(
min(croppingHorizontal, croppingVertical), 
croppingDigonal, 
min(CroppingFactor-1f, 1f) 
);
#line 723
radius *= croppingScalar;
}
#line 741
float theta = get_theta(radius, rcp_focal, K);
float vignette = UseVignette? get_vignette(theta, K) : 1f;
#line 744
if (UseVignette && S!=1f)
{
#line 747
float3 incident = float3(
(sin(theta)*rcp_radius)*texCoord,
cos(theta)
);
vignette /= dot(incident, incident); 
}
#line 759
texCoord *= tan(theta)*rcp_radius;
#line 763
const float2 toUvCoord = radiusAtOmega/(tan(halfOmega)*viewProportions);
texCoord *= toUvCoord;
#line 767
float borderMask = GetBorderMask(texCoord);
#line 770
texCoord = texCoord*0.5+0.5;
#line 780
float3 display = K!=1f ?
#line 782
tex2D(BackBuffer, texCoord).rgb : 
tex2Dfetch(BackBuffer, uint2(pixelPos.xy)).rgb; 
#line 789
if (DebugModePreview) switch (DebugMode) 
{
#line 792
default: display = GridModeViewPass(uint2(pixelPos.xy), texCoord, display); break;
#line 794
case 1u: display = SamplingScaleModeViewPass(texCoord, display); break;
}
#line 800
if (K!=1f && CroppingFactor!=2f) 
#line 802
{
#line 804
float3 border = lerp(
#line 809
MirrorBorder? display : tex2Dfetch(BackBuffer, uint2(pixelPos.xy)).rgb,
#line 812
to_linear_gamma_hq(BorderColor.rgb), 
to_linear_gamma_hq(BorderColor.a)    
#line 818
);
#line 821
display = BorderVignette?
vignette*lerp(display, border, borderMask) : 
lerp(vignette*display, border, borderMask);  
}
else 
display *= vignette;
#line 830
display = to_display_gamma_hq(display);
#line 833
return BlueNoise::dither(uint2(pixelPos.xy), display);
}
#line 838
technique PerfectPerspective
<
ui_label = "Perfect Perspective";
ui_tooltip =
"Adjust perspective for distortion-free picture:\n"
"\n"
"	· Fish-eye\n"
"	· Panini\n"
#line 849
"	· Anamorphic\n"
#line 851
"	· Vignetting (natural)\n"
"\n"
"Instruction:\n"
"\n"
"	1# select proper FOV angle and type. If FOV type is unknown,\n"
"	   find a round object within the game and look at it upfront,\n"
"	   then rotate the camera so that the object is in the corner.\n"
#line 861
"	   Set 'k' to 0.5, change squeeze factor to 1x and adjust FOV type such that\n"
#line 863
"	   the object does not have an egg shape, but a perfect round shape.\n"
"\n"
"	2# adjust perspective type according to game-play style.\n"
#line 869
"	   If you look mostly at the horizon, anamorphic squeeze can be increased.\n"
#line 871
"	   For curved-display correction, set it to higher value.\n"
"\n"
"	3# adjust visible borders. You can change the zoom factor,\n"
"	   such that no borders are visible, or that no image area is lost.\n"
"\n"
"	4# additionally for sharp image, use sharpening FX or run game at a\n"
"	   Super-Resolution. Debug options can help you find the proper value.\n"
"\n"
"The algorithm is part of a scientific article:\n"
"	arXiv:2003.10558 [cs.GR] (2020)\n"
"	arXiv:2010.04077 [cs.GR] (2020)\n"
#line 885
"\n"
"This effect © 2018-2023 Jakub Maksymilian Fober\n"
"Licensed under CC BY-NC-ND 3.0 +\n"
"for additional permissions see the source.";
>
{
pass PerspectiveDistortion
{
VertexShader = PostProcessVS;
PixelShader = PerfectPerspectivePS;
}
}

