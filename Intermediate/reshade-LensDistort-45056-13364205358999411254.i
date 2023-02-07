#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\LensDistort.fx"
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
#line 54 "C:\Program Files\GShade\gshade-shaders\Shaders\LensDistort.fx"
#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\ColorAndDither.fxh"
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
#line 55 "C:\Program Files\GShade\gshade-shaders\Shaders\LensDistort.fx"
#line 58
uniform bool ShowGrid <
ui_type = "input";
ui_label = "Display calibration grid";
ui_tooltip =
"This can be used in conjunction with Image.fx\n"
"to display real-world camera lens image and\n"
"match its distortion profile.";
> = false;
#line 70
uniform float4 K <
ui_type = "drag";
ui_min = -0.2;
ui_max =  0.2;
ui_label = "Radial distortion";
ui_tooltip = "Radial distortion coefficients K1, K2, K3, K4.";
ui_category = "Geometrical lens distortions";
> = 0f;
#line 79
uniform float S <
ui_type = "slider";
ui_min = 1f;
ui_max = 2f;
ui_step = 0.05;
ui_label = "Anamorphic";
ui_tooltip =
"Anamorphic squeeze factor S,\n"
"affects vertical axis:\n"
"\n"
"1      spherical lens\n"
"1.25   Ultra Panavision 70\n"
"1.33   16x9 TV\n"
"1.5    Technirama\n"
"1.6    digital anamorphic\n"
"1.8    4x3 full-frame\n"
"2      golden-standard";
ui_category = "Geometrical lens distortions";
> = 1f;
#line 124
uniform bool UseVignette <
ui_type = "drag";
ui_label = "Brightness aberration";
ui_tooltip = "Automatically change image brightness based on projection area.";
ui_category = "Color aberrations";
> = true;
#line 131
uniform float T <
ui_type = "drag";
ui_min = -0.2;
ui_max =  0.2;
ui_label = "Chromatic radius";
ui_tooltip = "Color separation amount using T.";
ui_category = "Color aberrations";
> = -0.2;
#line 142
uniform float2 P <
ui_type = "drag";
ui_min = -0.1;
ui_max =  0.1;
ui_label = "Decentering";
ui_tooltip = "Correct image sensor alignment to the optical axis, using P1, P2.";
ui_category = "Elements misalignment";
> = 0f;
#line 151
uniform float2 Q <
ui_type = "drag";
ui_min = -0.05;
ui_max =  0.05;
ui_label = "Thin prism";
ui_tooltip = "Correct optical elements offset from the optical axis, using Q1, Q2.";
ui_category = "Elements misalignment";
> = 0f;
#line 160
uniform float2 C <
ui_type = "drag";
ui_min = -0.05;
ui_max =  0.05;
ui_label = "Center";
ui_tooltip = "Offset lens optical center, to correct image cropping, using C1, C2.";
ui_category = "Elements misalignment";
> = 0f;
#line 172
uniform float4 Kp <
ui_type = "drag";
ui_min = -0.2;
ui_max = 0f;
ui_label = "Radial parallax";
ui_tooltip =
"Parallax aberration radial coefficients K1, K2, K3, K4.\n"
"Requires depth-buffer access.";
ui_category = "Parallax aberration";
> = 0f;
#line 186
uniform bool MirrorBorder <
ui_type = "input";
ui_label = "Mirror on border";
ui_tooltip = "Choose between mirrored image or original background on the border.";
ui_category = "Border";
ui_category_closed = true;
> = true;
#line 194
uniform bool BorderVignette <
ui_type = "input";
ui_label = "Brightness aberration on border";
ui_tooltip = "Apply brightness aberration effect to the border.";
ui_category = "Border";
> = true;
#line 201
uniform float4 BorderColor <
ui_type = "color";
ui_label = "Border color";
ui_tooltip = "Use alpha to change border transparency.";
ui_category = "Border";
> = float4(0.027, 0.027, 0.027, 0.96);
#line 208
uniform float BorderCorner <
ui_type = "slider";
ui_min = 0f; ui_max = 1f;
ui_label = "Corner radius";
ui_tooltip = "Value of 0.0 gives sharp corners.";
ui_category = "Border";
> = 0.062;
#line 216
uniform uint BorderGContinuity <
ui_type = "slider";
ui_min = 1u; ui_max = 3u;
ui_label = "Corner roundness";
ui_tooltip =
"G-surfacing continuity level for the corners:\n"
"\n"
"G0   sharp\n"
"G1   circular\n"
"G2   smooth\n"
"G3   very smooth";
ui_category = "Border";
> = 3u;
#line 232
uniform float DimGridBackground <
ui_type = "slider";
ui_min = 0.25; ui_max = 1f; ui_step = 0.1;
ui_label = "Dim background";
ui_tooltip = "Adjust background visibility.";
ui_category = "Grid";
ui_category_closed = true;
ui_text =
"Use this in conjunction with Image.fx, to match\n"
"lens distortion with a real-world camera profile.";
> = 1f;
#line 244
uniform uint GridLook <
ui_type = "combo";
ui_items =
"yellow grid\0"
"black grid\0"
"white grid\0"
"red-green grid\0";
ui_label = "Grid look";
ui_tooltip = "Select look of the grid.";
ui_category = "Grid";
> = 0u;
#line 256
uniform uint GridSize <
ui_type = "slider";
ui_min = 1u; ui_max = 32u;
ui_label = "Grid size";
ui_tooltip = "Adjust calibration grid size.";
ui_category = "Grid";
> = 16u;
#line 264
uniform uint GridWidth <
ui_type = "slider";
ui_min = 2u; ui_max = 16u;
ui_label = "Grid bar width";
ui_tooltip = "Adjust calibration grid bar width in pixels.";
ui_category = "Grid";
> = 2u;
#line 272
uniform float GridTilt <
ui_type = "slider";
ui_min = -1f; ui_max = 1f; ui_step = 0.01;
ui_label = "Tilt grid";
ui_tooltip = "Adjust calibration grid tilt in degrees.";
ui_category = "Grid";
> = 0f;
#line 283
uniform uint ChromaticSamplesLimit <
ui_type = "slider";
ui_min = 6u; ui_max = 64u; ui_step = 2u;
ui_label = "Chromatic aberration samples limit";
ui_tooltip =
"Sample count is generated automatically per pixel, based on visible amount.\n"
"This option limits maximum sample (steps) count allowed for color fringing.\n"
"Only even numbers are accepted, odd numbers will be clamped.";
ui_category = "Performance";
> = 32u;
#line 295
uniform uint ParallaxSamples <
ui_type = "slider";
ui_min = 2u; ui_max = 64u;
ui_label = "Parallax aberration samples";
ui_tooltip =
"Amount of samples (steps) for parallax aberration mapping.";
ui_category = "Performance";
> = 32u;
#line 308
sampler BackBuffer
{
Texture = ReShade::BackBufferTex;
#line 312
SRGBTexture = true;
#line 315
AddressU = MIRROR;
AddressV = MIRROR;
};
#line 330
float glength(uint G, float2 pos)
{
#line 333
if (G==0u) return max(abs(pos.x), abs(pos.y)); 
#line 335
pos = pow(abs(pos), ++G); 
return pow(pos.x+pos.y, rcp(G)); 
}
#line 342
float aastep(float grad)
{
#line 345
float2 Del = float2(ddx(grad), ddy(grad));
#line 347
return saturate(rsqrt(dot(Del, Del))*grad+0.5); 
}
#line 353
float3 Spectrum(float hue)
{
float3 hueColor;
hue *= 4f; 
hueColor.rg = hue-float2(1f, 2f);
hueColor.rg = saturate(1.5-abs(hueColor.rg));
hueColor.r += saturate(hue-3.5);
hueColor.b = 1f-hueColor.r;
return hueColor;
}
#line 365
float GetBorderMask(float2 borderCoord)
{
#line 368
borderCoord = abs(borderCoord);
if (BorderGContinuity!=0u && BorderCorner!=0f) 
{
#line 372
if ((1920 * (1.0 / 1080))>1f) 
borderCoord.x = borderCoord.x*(1920 * (1.0 / 1080))+(1f-(1920 * (1.0 / 1080)));
else if ((1920 * (1.0 / 1080))<1f) 
borderCoord.y = borderCoord.y*(1080*(1.0 / 1920))+(1f-(1080*(1.0 / 1920)));
#line 377
borderCoord = max(borderCoord+(BorderCorner-1f), 0f)/BorderCorner;
#line 380
return aastep(glength(BorderGContinuity, borderCoord)-1f); 
}
else 
return aastep(glength(0u, borderCoord)-1f);
}
#line 389
void LensDistortVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 viewCoord : TEXCOORD)
{
#line 392
const float2 vertexPos[3] =
{
float2(-1f, 1f), 
float2(-1f,-3f), 
float2( 3f, 1f)  
};
#line 399
viewCoord.x =  vertexPos[id].x;
viewCoord.y = -vertexPos[id].y;
#line 402
viewCoord *= normalize(float2(1920, 1080));
#line 404
position = float4(vertexPos[id], 0f, 1f);
}
#line 409
void ParallaxPS(float4 pixelPos : SV_Position, float2 viewCoord : TEXCOORD, out float3 color : SV_Target)
{
if (all(Kp==0f)) 
{
color = tex2Dfetch(ReShade::BackBuffer, uint2(pixelPos.xy)).rgb;
return;
}
#line 418
const float2 aspectScalar = 0.5/normalize(float2(1920, 1080));
#line 420
float2 texCoord = viewCoord*aspectScalar+0.5;
#line 423
float4 R;
R[0] = dot(viewCoord, viewCoord); 
R[1] = R[0]*R[0]; 
R[2] = R[1]*R[0]; 
R[3] = R[2]*R[0]; 
#line 429
float2 centerCoord = texCoord-0.5;
centerCoord *= rcp(1f+dot(Kp, R))-1f;
#line 433
uint maxStepAmount = clamp(ParallaxSamples, 2u, 255u);
#line 435
float offset; 
float stepSize = rcp(maxStepAmount-1u);
for (int counter = maxStepAmount-1u; counter >= 0; counter--)
{
offset = counter*stepSize;
float reverseDepth = 1f-ReShade::GetLinearizedDepth(texCoord-centerCoord*offset);
if (offset <= reverseDepth)
{
float prevOffset = (counter+3u)*stepSize;
float prevDifference = prevOffset-1f+ReShade::GetLinearizedDepth(texCoord-centerCoord*prevOffset);
#line 446
offset = lerp(prevOffset, offset, prevDifference/(prevDifference+reverseDepth-offset));
break;
}
}
#line 451
texCoord -= centerCoord*offset;
#line 453
color = tex2D(BackBuffer, texCoord).rgb;
#line 455
color = to_display_gamma_hq(color); 
#line 457
color = BlueNoise::dither(uint2(pixelPos.xy), color); 
}
#line 462
void LensDistortPS(float4 pixelPos : SV_Position, float2 viewCoord : TEXCOORD, out float3 color : SV_Target)
{
#line 466
if (!ShowGrid && all(K==0f) && all(P==0f) && all(Q==0f))
#line 470
{
color = tex2Dfetch(ReShade::BackBuffer, uint2(pixelPos.xy)).rgb;
return;
}
#line 476
const float2 aspectScalar = 0.5/normalize(float2(1920, 1080));
#line 479
bool isDistorted = any(K!=0f) || any(P!=0f) || any(Q!=0f);
#line 483
if (isDistorted) 
{
viewCoord -= C; 
#line 488
float2 anamViewCoord = viewCoord; anamViewCoord.y /= S;
#line 490
float4 anamorphR;
anamorphR[0] = dot(anamViewCoord, anamViewCoord); 
anamorphR[1] = anamorphR[0]*anamorphR[0]; 
anamorphR[2] = anamorphR[1]*anamorphR[0]; 
anamorphR[3] = anamorphR[2]*anamorphR[0]; 
float R2 = dot(viewCoord, viewCoord); 
#line 497
viewCoord *=
rcp(1f+dot(K, anamorphR)) 
+ dot(viewCoord, P); 
#line 501
viewCoord +=
R2*Q 
+ C;     
#line 523
}
#line 526
float2 texCoord = viewCoord*aspectScalar+0.5;
#line 528
if (isDistorted && T!=0f && !ShowGrid) 
{
#line 531
float2 orygTexCoord = (pixelPos.xy+0.5)*float2((1.0 / 1920), (1.0 / 1080));
#line 533
float2 distortion = texCoord-orygTexCoord;
#line 535
uint evenSampleCount = min(ChromaticSamplesLimit-ChromaticSamplesLimit%2u, 64u); 
#line 537
uint totalPixelOffset = uint(ceil(length(T*(distortion*float2(1920, 1080)))));
#line 539
evenSampleCount = clamp(totalPixelOffset+totalPixelOffset%2u, 4u, evenSampleCount);
#line 542
color = 0f; 
for (uint i=0u; i<evenSampleCount; i++)
#line 554
color += tex2Dlod(
BackBuffer, 
float4(
(T*(i/float(evenSampleCount-1u)-0.5)+1f) 
*distortion 
+orygTexCoord, 
0f, 0f)
).rgb
#line 563
*Spectrum(i/float(evenSampleCount)); 
#line 565
color *= 2f/evenSampleCount;
}
else if (ShowGrid) 
{
#line 573
color = tex2Dfetch(BackBuffer, uint2(pixelPos.xy)).rgb;
#line 577
{
#line 579
float tiltRad = radians(GridTilt);
#line 581
float tiltSin = sin(tiltRad);
float tiltCos = cos(tiltRad);
#line 584
viewCoord = mul(
#line 586
float2x2(
tiltCos, tiltSin,
-tiltSin, tiltCos
),
viewCoord
);
}
#line 595
float2 delX = float2(ddx(viewCoord.x), ddy(viewCoord.x));
float2 delY = float2(ddx(viewCoord.y), ddy(viewCoord.y));
#line 598
viewCoord = frac(viewCoord*GridSize)-0.5;
#line 602
viewCoord *= float2(
rsqrt(dot(delX, delX)),
rsqrt(dot(delY, delY))
)/GridSize; 
#line 607
viewCoord = GridWidth*0.5-abs(viewCoord);
viewCoord = saturate(viewCoord); 
#line 611
color = lerp(
#line 613
to_linear_gamma_hq(16f/255f),
#line 617
color,
DimGridBackground
);
switch (GridLook)
{
default:
#line 624
color = lerp(float3(1f, 1f, 0f), color, (1f-viewCoord.x)*(1f-viewCoord.y));
break;
case 1:
#line 628
color *= (1f-viewCoord.x)*(1f-viewCoord.y);
break;
case 2:
#line 632
color = 1f-(1f-viewCoord.x)*(1f-viewCoord.y)*(1f-color);
break;
case 3:
#line 636
color = lerp(color, float3(1f, 0f, 0f), viewCoord.y);
color = lerp(color, float3(0f, 1f, 0f), viewCoord.x);
break;
}
}
else 
#line 645
color = tex2D(BackBuffer, texCoord).rgb;
#line 649
if (!ShowGrid) 
{
#line 652
texCoord *= float2(1920, 1080);
float vignetteMask = UseVignette? ddx(texCoord.x)*ddy(texCoord.y) : 1f;
#line 656
viewCoord *= aspectScalar*2f;
#line 658
float3 border = lerp(
#line 663
MirrorBorder? color : tex2Dfetch(BackBuffer, uint2(pixelPos.xy)).rgb,
#line 666
to_linear_gamma_hq(BorderColor.rgb), 
to_linear_gamma_hq(BorderColor.a)    
#line 672
);
#line 675
color = BorderVignette?
vignetteMask*lerp(color, border, GetBorderMask(viewCoord)): 
lerp(vignetteMask*color, border, GetBorderMask(viewCoord)); 
color = saturate(color);
}
#line 682
color = to_display_gamma_hq(color); 
#line 684
color = BlueNoise::dither(uint2(pixelPos.xy), color); 
}
#line 689
technique LensDistort
<
ui_label = "Lens distortion";
ui_tooltip =
"Apply camera lens distortion to the image.\n"
"\n"
"	· Brown-Conrady lens division model\n"
#line 697
"	· Anamorphic distortion\n"
#line 702
"	· Parallax aberration\n"
#line 704
"	· Chromatic aberration\n"
"	· Lens vignetting\n"
"\n"
"The algorithm is part of a scientific article:\n"
"	arXiv:2010.04077 [cs.GR] (2020)\n"
"	arXiv:2102.12682 [cs.GR] (2021)\n"
"\n"
"This effect © 2022 Jakub Maksymilian Fober\n"
"Licensed under CC BY-NC-ND 3.0 + additional permissions (see source).";
>
{
#line 716
pass Parallax
{
VertexShader = LensDistortVS;
PixelShader = ParallaxPS;
}
#line 722
pass Distort
{
VertexShader = LensDistortVS;
PixelShader = LensDistortPS;
}
}

