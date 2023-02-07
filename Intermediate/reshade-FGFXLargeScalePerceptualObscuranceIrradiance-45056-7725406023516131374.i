#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\FGFXLargeScalePerceptualObscuranceIrradiance.fx"
#line 86
uniform int ___ABOUT <
ui_type = "radio";
ui_label = " ";
ui_category = "About";
ui_category_closed = true;
ui_text =
"-=[ FGFX::LSPOIrr - Large Scale Perceptual Obscurance and Irradiance ]=-\n"
"\n"
#line 95
"The Large Scale Perceptual Obscurance and Irradiance is a post-processing "
"effect that attempts to inject obscurance and irradiance in the scene at a "
"large scale (low frequency).\n"
"\n"
#line 100
"Due to the fact that the effect operates on the low frequencies of the "
"input image, the effect often plays just on a perceptual level rather "
"than being an actual physically correct rendition of scene obscurrance and "
"irradiance.\n"
"\n"
#line 106
"* How does it work? *\n"
"\n"
#line 109
"The concept sitting at the core of the effect is really simple and relies "
"on some assumptions that more than often are correct. If we take an "
"arbitrary image, blur it with a large gaussian and then overlay (as in "
"standard overlay blending operation) the blurred image onto the original "
"image, we get the illusion that some statistically-correct occlusion and "
"irradiance shows up in the image.\n"
"\n"
#line 117
"* Why does it work? *\n"
"\n"
#line 120
"The effect relies on the statistical fact that if there's a part in the "
"input image that is predominantly dark, chances are that the entire part "
"contains objects that obscure each other, reducing the amount of light "
"radiated in that particular area.\n"
"\n"
#line 126
"Admittedly, the opposite is also true: If a part of the input image is "
"predominantly bright, chances are that the objects in that part of the "
"image have an increased amount of light inter-radiation, as a result of "
"objects in that part of the image bouncing light to each other.\n"
"\n"
#line 132
"* What about performance? *\n"
"\n"
#line 135
"The implementation uses the Fast Cascaded Separable Blur technique, "
"which is blazing-fast. The entire effect executes in less than 0.35 ms "
"on a machine with a i7-8700K running at 4.2Ghz CPU and a GTX 1080Ti "
"running at 2000Mhz GPU in 2560x1440 resolution.\n"
"\n"
#line 141
"And if you think you don't need the auto-gain feature (by disabling it "
"in preprocessor definitions), you can cut 0.05 ms and get the total "
"execution time down to 0.3 ms.\n"
"\n"
#line 146
"* Where is this effect best placed? *\n"
"\n"
#line 149
"Since the effect addresses the lighting in the scene, it's best put "
"after any Global Illumination technique like Ambient Occlusion, "
"Obscurance, RTGI and before tone-mapping, film grain, color grading "
"of any sort, bloom, CA or any lens & sensor effects.\n";
>;
#line 161
uniform bool LSPOIrrEffectEnabled <
ui_category = "Effect Settings";
ui_label = "Effect Enabled";
ui_tooltip = "Enables / disables the effect entirely.";
> = true;
#line 167
uniform float LSPOIrrEffectIntensity <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Effect Settings";
ui_label = "Effect Intensity";
ui_tooltip = "Adjusts the overall intensity of the effect.";
> = 0.9;
#line 176
uniform float LSPOIrrOcclusionIntensity <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Effect Settings";
ui_label = "Occlusion Intensity";
ui_tooltip = "Adjusts the occlusion intensity of the effect.";
> = 1.0;
#line 185
uniform float LSPOIrrIrradianceIntensity <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Effect Settings";
ui_label = "Irradiance Intensity";
ui_tooltip = "Adjusts the irradiance intensity of the effect.";
> = 1.0;
#line 207
uniform float LSPOIrrEffectRadius <
ui_type = "slider";
ui_min = 0.25;
ui_max = 1.00;
ui_category = "Effect Settings";
ui_label = "Effect Radius";
ui_tooltip = "Adjusts the radius of the effect.";
> = 0.65;
#line 216
uniform float LSPOIrrEffectSaturation <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Effect Settings";
ui_label = "Effect Saturation";
ui_tooltip =
"Adjusts the saturation of the resulting occlusion and irradiance.\n"
"\n"
"Notice this is NOT the final output saturation, but the saturation applied to occlusion and irradiance prior to blending over the color buffer.\n"
"For the final output saturation see 'Saturation' in the 'Toning Settings' category.";
> = 0.0;
#line 229
uniform float LSPOIrrOcclusionIrradianceRecovery <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Effect Settings";
ui_label = "Occlusion-Irradiance Recovery";
ui_tooltip =
"Adjusts the recovery applied to occlusion and radiance.\n"
"\n"
"Set it to 0 for a dramatic effect overall, set to 1 for maximum recovery of dark and bright areas.";
> = 0.75;
#line 249
uniform float LSPOIrrAutoGain <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Toning Settings";
ui_label = "Auto-Gain";
ui_tooltip = "Adjusts the influence of auto-gain.";
> = 0.5;
#line 260
uniform float LSPOIrrGamma <
ui_type = "slider";
ui_min = 0.10;
ui_max = 4.00;
ui_category = "Toning Settings";
ui_label = "Gamma";
ui_tooltip = "Adjusts the gamma of the final result.";
> = 1.0;
#line 269
uniform float LSPOIrrGain <
ui_type = "slider";
ui_min = 0.0;
ui_max = 4.0;
ui_category = "Toning Settings";
ui_label = "Gain";
ui_tooltip = "Adjusts the gain of the final result.";
> = 1.0;
#line 278
uniform float LSPOIrrContrast <
ui_type = "slider";
ui_min = 0.0;
ui_max = 1.0;
ui_category = "Toning Settings";
ui_label = "Contrast";
ui_tooltip = "Adjusts the contrast of the final result.";
> = 1.0;
#line 287
uniform float LSPOIrrSaturation <
ui_type = "slider";
ui_min = 0.0;
ui_max = 2.0;
ui_category = "Toning Settings";
ui_label = "Saturation";
ui_tooltip = "Adjusts the saturation of the final result.";
> = 1.0;
#line 300
uniform int LSPOIrrDebugType <
ui_type = "combo";
ui_category = "Debug";
#line 304
ui_items =
"None\0"
"No Intensity\0"
"No Toning\0"
"Raw Blur\0"
"Saturated Blur\0"
#line 312
"Gained Blur\0"
#line 315
"Scaled Blur\0"
"Occlusion - Irradiance Map\0"
#line 319
"Blur Max Samples Positions\0"
"Blur Max\0"
"Blur Gain\0"
#line 324
"Recovery Blur\0"
"Scaled Recovery Blur\0"
"Recovery Occlusion - Irradiance Map\0";
#line 328
ui_label = "Debug Type";
ui_tooltip = "Different debug outputs";
> = 0;
#line 384
uniform int ___LSPOIRR_AUTO_GAIN_ENABLED_DESC <
ui_type = "radio";
ui_label = " ";
ui_category = "Preprocessor definitions descriptions";
ui_category_closed = true;
ui_text =
"LSPOIRR_AUTO_GAIN_ENABLED"
":\n- Enables / disables the auto-gain feature. "
"Disable for a slight performance boost if auto-gain is not needed.\n"
"- 0 means disabled, 1 means enabled, default is 1.\n";
>;
#line 396
uniform int ___LSPOIRR_AUTO_GAIN_SPEED_DESC <
ui_type = "radio";
ui_label = " ";
ui_category = "Preprocessor definitions descriptions";
ui_category_closed = true;
ui_text =
"LSPOIRR_AUTO_GAIN_SPEED"
":\n- Defines how fast the auto-gain adapts to the scenery. "
"Disable for a slight performance boost if auto-gain is not needed.\n"
"- Must be greater than 0, less than 0.25, default is 0.04.\n";
>;
#line 408
uniform int ___LSPOIRR_BLUR_MAX_RECIPROCAL_THRESHOLD_DESC <
ui_type = "radio";
ui_label = " ";
ui_category = "Preprocessor definitions descriptions";
ui_category_closed = true;
ui_text =
"LSPOIRR_BLUR_MAX_RECIPROCAL_THRESHOLD"
":\n- Defines the breaking point between the two piecewise functions that make up the compute blur gain function.\n"
"- Must be greater than 0, less than 0.5, default is 0.05.\n";
>;
#line 419
uniform int ___LSPOIRR_CASCADE_3_ON_DESC <
ui_type = "radio";
ui_label = " ";
ui_category = "Preprocessor definitions descriptions";
ui_category_closed = true;
ui_text =
"LSPOIRR_CASCADE_3_ON"
":\n- Enables / disables cascade 3 in the Fast Cascaded Separable Blur implementation in order to achieve a much wider blur radius. "
"Only required for resolutions bigger than 4K.\n"
"- 0 means disabled, 1 means enabled, default is 0.\n";
>;
#line 431
uniform int ___LSPOIRR_SRGB_DESC <
ui_type = "radio";
ui_label = " ";
ui_category = "Preprocessor definitions descriptions";
ui_category_closed = true;
ui_text =
"LSPOIRR_SRGB"
":\n- Enables / disables working in sRGB color space. "
"Blending the effect in sRGB yields slightly different results and it should be toggled as needed by the specific game you're running.\n"
"- However, beware that when enabled, in most cases the final output is lightly darker in the shadows areas than when disabled.\n"
"- 0 means disabled, 1 means enabled, default is 0.\n";
>;
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
#line 447 "C:\Program Files\GShade\gshade-shaders\Shaders\FGFXLargeScalePerceptualObscuranceIrradiance.fx"
#line 456
uniform float FrameTime <source = "frametime";>;
#line 462
sampler2D ReShadeBackBufferSRGBSampler {
Texture = ReShade::BackBufferTex;
#line 467
};
#line 473
texture HalfBlurTex {
Width = 1920 >> 1;
Height = 1080 >> 1;
Format = RGBA16F;
};
#line 479
sampler HalfBlurSampler {
Texture = HalfBlurTex;
};
#line 483
texture QuadBlurTex {
Width = 1920 >> 2;
Height = 1080 >> 2;
Format = RGBA16F;
};
#line 489
sampler QuadBlurSampler {
Texture = QuadBlurTex;
};
#line 493
texture OctoBlurTex {
Width = 1920 >> 3;
Height = 1080 >> 3;
Format = RGBA16F;
};
#line 499
sampler OctoBlurSampler {
Texture = OctoBlurTex;
};
#line 503
texture HexaBlurTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = RGBA16F;
};
#line 509
sampler HexaBlurSampler {
Texture = HexaBlurTex;
};
#line 517
texture HBlurTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = RGBA16F;
};
#line 523
sampler HBlurSampler {
Texture = HBlurTex;
};
#line 527
texture VBlurTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = RGBA16F;
};
#line 533
sampler VBlurSampler {
Texture = VBlurTex;
};
#line 537
texture ShortBlurTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = RGBA16F;
};
#line 543
sampler ShortBlurSampler {
Texture = ShortBlurTex;
};
#line 553
texture BlurMaxTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = R16F;
};
#line 559
sampler BlurMaxSampler {
Texture = BlurMaxTex;
};
#line 563
texture BlurMaxHistoryTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = R16F;
};
#line 569
sampler BlurMaxHistorySampler {
Texture = BlurMaxHistoryTex;
};
#line 573
texture BlurMaxHistoryTempTex {
Width = 1920 >> (4);
Height = 1080 >> (4);
Format = R16F;
};
#line 579
sampler BlurMaxHistoryTempSampler {
Texture = BlurMaxHistoryTempTex;
};
#line 614
static const float  ___BUFFER_ASPECT_RATIO___            = 1920 / 1080;
static const int    ___MAX_BLUR_NUM_TOTAL_SAMPLES___     = (7) * (7);
static const float  ___MAX_BLUR_NUM_TOTAL_SAMPLES_RCP___ = 1.0 / ___MAX_BLUR_NUM_TOTAL_SAMPLES___;
static const int    ___BUFFER_SIZE_DIVIDER___            = 1 << (4);
static const float  ___ONE_THIRD___                      = 1.0 / 3.0;
#line 649
static const float  ___STEP_MULTIPLIER___                                        = 1.5;
static const float  ___BUFFER_SIZE_DIVIDER_COMPENSATION_OFFSET___                = ___BUFFER_SIZE_DIVIDER___ * ___STEP_MULTIPLIER___;
static const float2 ___SCALED_BUFFER_SIZE_DIVIDER_DIVIDER_COMPENSATION_OFFSET___ = ___BUFFER_SIZE_DIVIDER_COMPENSATION_OFFSET___ * float2((1.0 / 1920), (1.0 / 1080));
#line 661
float3 CopyBBPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 663
return tex2D(ReShadeBackBufferSRGBSampler, texcoord.xy).rgb;
}
#line 666
float3 CopyHalfPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 668
return tex2D(HalfBlurSampler, texcoord.xy).rgb;
}
#line 671
float3 CopyQuadPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 673
return tex2D(QuadBlurSampler, texcoord.xy).rgb;
}
#line 676
float3 CopyOctoPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 678
return tex2D(OctoBlurSampler, texcoord.xy).rgb;
}
#line 681
float3 CopyHexaPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 683
return tex2D(HexaBlurSampler, texcoord.xy).rgb;
}
#line 759
float3 HBlur(in float2 texcoord : TEXCOORD, float blurSampleOffset, sampler srcSampler) {
float offset = ___SCALED_BUFFER_SIZE_DIVIDER_DIVIDER_COMPENSATION_OFFSET___.x * blurSampleOffset * LSPOIrrEffectRadius;
#line 762
float3 color = tex2D(srcSampler, texcoord).rgb; 
color += tex2D(srcSampler, float2(texcoord.x - offset, texcoord.y)).rgb; 
color += tex2D(srcSampler, float2(texcoord.x + offset, texcoord.y)).rgb; 
color *= ___ONE_THIRD___;
#line 767
return color;
}
#line 770
float3 VBlur(in float2 texcoord : TEXCOORD, float blurSampleOffset, sampler srcSampler) {
float offset = ___SCALED_BUFFER_SIZE_DIVIDER_DIVIDER_COMPENSATION_OFFSET___.y * blurSampleOffset * LSPOIrrEffectRadius;
#line 773
float3 color = tex2D(srcSampler, texcoord).rgb; 
color += tex2D(srcSampler, float2(texcoord.x, texcoord.y - offset)).rgb; 
color += tex2D(srcSampler, float2(texcoord.x, texcoord.y + offset)).rgb; 
color *= ___ONE_THIRD___;
#line 778
return color;
}
#line 785
float3 HBlurC0BBPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 787
return HBlur(texcoord, ( 1.0), ReShadeBackBufferSRGBSampler);
}
#line 790
float3 HBlurC0PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 792
return HBlur(texcoord, ( 1.0), VBlurSampler);
}
#line 795
float3 VBlurC0PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 797
return VBlur(texcoord, ( 1.0), HBlurSampler);
}
#line 804
float3 HBlurC1PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 806
return HBlur(texcoord, ( 3.0), VBlurSampler);
}
#line 809
float3 VBlurC1PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 811
return VBlur(texcoord, ( 3.0), HBlurSampler);
}
#line 818
float3 HBlurC2PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 820
return HBlur(texcoord, ( 9.0), VBlurSampler);
}
#line 823
float3 VBlurC2PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 825
return VBlur(texcoord, ( 9.0), HBlurSampler);
}
#line 832
float3 HBlurC3PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 834
return HBlur(texcoord, ( 27.0), VBlurSampler);
}
#line 837
float3 VBlurC3PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 839
return VBlur(texcoord, ( 27.0), HBlurSampler);
}
#line 846
float3 HBlurC4PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 848
return HBlur(texcoord, ( 81.0), VBlurSampler);
}
#line 851
float3 VBlurC4PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 853
return VBlur(texcoord, ( 81.0), HBlurSampler);
}
#line 860
float3 HBlurC5PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 862
return HBlur(texcoord, (243.0), VBlurSampler);
}
#line 865
float3 VBlurC5PS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
#line 867
return VBlur(texcoord, (243.0), HBlurSampler);
}
#line 874
float3 CopyVBlurPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD): COLOR {
return tex2D(VBlurSampler, texcoord.xy).rgb;
}
#line 884
float3 Hash31(in float p) {
float3 p3 = frac(p * float3(0.1031, 0.1030, 0.0973));
p3 += dot(p3, p3.yzx + 33.33);
return frac((p3.xxy + p3.yzz) * p3.zyx);
}
#line 890
float3 Hash32(in float2 p) {
float3 p3 = frac(float3(p.xyx) * float3(0.1031, 0.1030, 0.0973));
p3 += dot(p3, p3.yxz + 33.33);
return frac((p3.xxy + p3.yzz) * p3.zyx);
}
#line 896
float3 Hash33(in float3 p3) {
p3 = frac(p3 * float3(0.1031, 0.1030, 0.0973));
p3 += dot(p3, p3.yxz + 33.33);
return frac((p3.xxy + p3.yxx) * p3.zyx);
}
#line 902
float3 Hash32UV(in float2 uv, in float step) {
return Hash33(float3(uv * 14353.45646, (FrameTime % 100.0) * step));
}
#line 966
float OverlayBlend(in float a, in float b) {
[branch]
if (a < 0.5) {
return a * b * 2.0;
} else {
return 1.0 - (1.0 - a) * (1.0 - b) * 2.0;
}
}
#line 975
float3 OverlayBlend(in float3 a, in float3 b) {
return float3(
OverlayBlend(a.r, b.r),
OverlayBlend(a.g, b.g),
OverlayBlend(a.b, b.b)
);
}
#line 983
float ScaleOcclusionAndIrradiance(in float occlusionIrradianceOverlay, in float occlusionIntensity, in float irradianceIntensity) {
#line 985
return 0.5 + (occlusionIrradianceOverlay - 0.5) * (occlusionIrradianceOverlay < 0.5 ? occlusionIntensity : irradianceIntensity);
}
#line 988
float3 ScaleOcclusionAndIrradiance(in float3 occlusionIrradianceOverlay, in float occlusionIntensity, in float irradianceIntensity) {
return float3(
ScaleOcclusionAndIrradiance(occlusionIrradianceOverlay.r, occlusionIntensity, irradianceIntensity),
ScaleOcclusionAndIrradiance(occlusionIrradianceOverlay.g, occlusionIntensity, irradianceIntensity),
ScaleOcclusionAndIrradiance(occlusionIrradianceOverlay.b, occlusionIntensity, irradianceIntensity)
);
}
#line 1044
float ComputeBlurMaxChannel(in float2 texcoord) {
#line 1052
float maxChannel = 0;
float2 uv = float2((0.35), (0.35));
#line 1055
[unroll]
for (int i = 0; i < (7); i++) {
uv.x = (0.35);
#line 1059
[unroll]
for (int j = 0; j < (7); j++) {
maxChannel = max(maxChannel, (max(((tex2D(VBlurSampler, uv).rgb).r), max(((tex2D(VBlurSampler, uv).rgb).g), ((tex2D(VBlurSampler, uv).rgb).b)))));
uv.x += (0.05);
}
#line 1065
uv.y += (0.05);
}
#line 1072
maxChannel *= (1.5); 
#line 1074
return maxChannel;
}
#line 1077
float3 DrawBlurMaxSamplesPositions(in float2 texcoord) {
float3 color = 0;
float2 uv = float2((0.35), (0.35));
#line 1081
[unroll]
for (int i = 0; i < (7); i++) {
uv.x = (0.35);
#line 1085
[unroll]
for (int j = 0; j < (7); j++) {
float xDist = uv.x - texcoord.x;
xDist *= ReShade::GetAspectRatio();
float yDist = uv.y - texcoord.y;
float dist = xDist * xDist + yDist * yDist;
dist = sqrt(dist);
#line 1093
dist = 1.0 - dist;
dist = saturate(dist);
dist = pow(dist, 100.0);
#line 1097
dist = dist > 0.5 ? 0.5 : 0;
color += float3(dist, 0, 0);
uv.x += (0.05);
}
#line 1102
uv.y += (0.05);
}
#line 1105
return color;
}
#line 1108
float ComputeBlurGain(in float blurMax, in float reciptocalThreshold) {
[branch]
if (blurMax <= reciptocalThreshold) {
return blurMax / (reciptocalThreshold * reciptocalThreshold);
} else {
return 1.0 / blurMax;
}
}
#line 1117
float ComputeBlurMaxPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR {
return ComputeBlurMaxChannel(texcoord);
}
#line 1125
float3 LSPOIrrPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR {
#line 1127
float2 screenUV = texcoord.xy;
float3 color = tex2D(ReShadeBackBufferSRGBSampler, screenUV).rgb;
#line 1131
[branch]
if (!LSPOIrrEffectEnabled) {
return color;
}
#line 1137
float3 finalColor = color;
#line 1140
float3 overlayColor = tex2D(VBlurSampler, screenUV).rgb;
#line 1143
[branch]
if (LSPOIrrDebugType == (0x03)) {
return overlayColor;
}
#line 1149
overlayColor = (lerp((((overlayColor).r) + ((overlayColor).g) + ((overlayColor).b)) * ___ONE_THIRD___, (overlayColor), (LSPOIrrEffectSaturation)));
#line 1152
[branch]
if (LSPOIrrDebugType == (0x04)) {
return overlayColor;
}
#line 1158
[branch]
if (LSPOIrrDebugType == (0x07)) {
return lerp(color, 1.0 - step(overlayColor, 0.5), 0.65);
}
#line 1166
[branch]
if (LSPOIrrDebugType == (0x08)) {
float3 samplesPositionColor = DrawBlurMaxSamplesPositions(screenUV);
return samplesPositionColor.r < 0.01 ? color : samplesPositionColor;
}
#line 1173
float blurMax = tex2D(BlurMaxHistorySampler, screenUV).r;
#line 1176
[branch]
if (LSPOIrrDebugType == (0x09)) {
return float3(blurMax, blurMax, blurMax);
}
#line 1181
float blurGain = ComputeBlurGain(blurMax, 0.05);
#line 1184
blurGain = clamp(blurGain, 1.0, 4.0); 
#line 1187
[branch]
if (LSPOIrrDebugType == (0x0A)) {
return float3(blurGain, blurGain, blurGain);
}
#line 1193
blurGain = lerp(1.0, blurGain, LSPOIrrAutoGain);
#line 1196
overlayColor *= blurGain;
#line 1199
[branch]
if (LSPOIrrDebugType == (0x05)) {
return overlayColor;
}
#line 1207
overlayColor = ScaleOcclusionAndIrradiance(overlayColor, LSPOIrrOcclusionIntensity, LSPOIrrIrradianceIntensity);
#line 1210
[branch]
if (LSPOIrrDebugType == (0x06)) {
return overlayColor;
}
#line 1219
finalColor = OverlayBlend(finalColor, overlayColor);
#line 1223
float3 recoveryOverlayColor = tex2D(ShortBlurSampler, screenUV).rgb;
recoveryOverlayColor = (lerp((((recoveryOverlayColor).r) + ((recoveryOverlayColor).g) + ((recoveryOverlayColor).b)) * ___ONE_THIRD___, (recoveryOverlayColor), (0.0)));
recoveryOverlayColor = 1.0 - recoveryOverlayColor;
#line 1228
[branch]
if (LSPOIrrDebugType == (0x0B)) {
return recoveryOverlayColor;
}
#line 1234
[branch]
if (LSPOIrrDebugType == (0x0D)) {
return lerp(color, 1.0 - step(recoveryOverlayColor, 0.5), 0.65);
}
#line 1239
recoveryOverlayColor = (recoveryOverlayColor - 0.5) * LSPOIrrOcclusionIrradianceRecovery + 0.5;
#line 1242
recoveryOverlayColor = ScaleOcclusionAndIrradiance(recoveryOverlayColor, LSPOIrrIrradianceIntensity, LSPOIrrOcclusionIntensity);
#line 1245
[branch]
if (LSPOIrrDebugType == (0x0C)) {
return recoveryOverlayColor;
}
#line 1251
finalColor = OverlayBlend(finalColor, recoveryOverlayColor);
#line 1254
[branch]
if (LSPOIrrDebugType == (0x02)) {
return finalColor;
}
#line 1260
finalColor = pow(max(0.0, finalColor), LSPOIrrGamma);
#line 1263
finalColor *= LSPOIrrGain;
#line 1266
finalColor = (finalColor - 0.5) * LSPOIrrContrast + 0.5;
#line 1269
finalColor = (lerp((((finalColor).r) + ((finalColor).g) + ((finalColor).b)) * ___ONE_THIRD___, (finalColor), (LSPOIrrSaturation)));
#line 1272
float3 originalFinalColor = finalColor;
#line 1275
[branch]
if (LSPOIrrDebugType == (0x01)) {
return finalColor;
}
#line 1281
finalColor = lerp(color, finalColor, LSPOIrrEffectIntensity);
#line 1283
return finalColor;
}
#line 1290
float BlendBlurMaxIntoHistoryPS(in float4 pos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR {
float blurMax = tex2D(BlurMaxSampler, texcoord).r;
float blurMaxHistory = tex2D(BlurMaxHistorySampler, texcoord).r;
#line 1295
blurMaxHistory = lerp(blurMaxHistory, blurMax, 0.04);
#line 1297
return blurMaxHistory;
}
#line 1300
float CopyBlurMaxHistoryTempPS(in float4 vpos : SV_Position, in float2 texcoord : TEXCOORD) : COLOR {
return tex2D(BlurMaxHistoryTempSampler, texcoord).r;
}
#line 1308
technique FGFXLSPOIrr <
ui_label = "FGFX::LSPOIrr";
ui_tooltip =
"+------------------------------------------------------------------------+\n"
"|-=[ FGFX::LSPOIrr - Large Scale Perceptual Obscurance and Irradiance ]=-|\n"
"+------------------------------------------------------------------------+\n"
"\n"
#line 1316
"The Large Scale Perceptual Obscurance and Irradiance is a post-processing\n"
"effect that attempts to inject obscurance and irradiance in the scene at a\n"
"large scale (low frequency).\n"
"\n"
#line 1321
"The Large Scale Perceptual Obscurance and Irradiance is written by\n"
"Alex Tuduran.\n";
> {
#line 1329
pass CopyBB {
VertexShader = PostProcessVS;
PixelShader  = CopyBBPS;
RenderTarget = HalfBlurTex;
}
#line 1335
pass CopyHalf {
VertexShader = PostProcessVS;
PixelShader  = CopyHalfPS;
RenderTarget = QuadBlurTex;
}
#line 1341
pass CopyQuad {
VertexShader = PostProcessVS;
PixelShader  = CopyQuadPS;
RenderTarget = OctoBlurTex;
}
#line 1347
pass CopyOcto {
VertexShader = PostProcessVS;
PixelShader  = CopyOctoPS;
RenderTarget = HexaBlurTex;
}
#line 1357
pass CopyHexa {
VertexShader = PostProcessVS;
PixelShader  = CopyHexaPS;
RenderTarget = VBlurTex;
}
#line 1366
pass HBlurC0R {
VertexShader = PostProcessVS;
PixelShader  = HBlurC0PS;
RenderTarget = HBlurTex;
}
#line 1372
pass VBlurC0R {
VertexShader = PostProcessVS;
PixelShader  = VBlurC0PS;
RenderTarget = VBlurTex;
}
#line 1382
pass HBlurC0S {
VertexShader = PostProcessVS;
PixelShader  = HBlurC0PS;
RenderTarget = HBlurTex;
}
#line 1388
pass VBlurC0S {
VertexShader = PostProcessVS;
PixelShader  = VBlurC0PS;
RenderTarget = VBlurTex;
}
#line 1398
pass HBlurC0SS {
VertexShader = PostProcessVS;
PixelShader  = HBlurC0PS;
RenderTarget = HBlurTex;
}
#line 1404
pass VBlurC0SS {
VertexShader = PostProcessVS;
PixelShader  = VBlurC0PS;
RenderTarget = VBlurTex;
}
#line 1414
pass HBlurC1R {
VertexShader = PostProcessVS;
PixelShader  = HBlurC1PS;
RenderTarget = HBlurTex;
}
#line 1420
pass VBlurC1R {
VertexShader = PostProcessVS;
PixelShader  = VBlurC1PS;
RenderTarget = VBlurTex;
}
#line 1440
pass HBlurC2R {
VertexShader = PostProcessVS;
PixelShader  = HBlurC2PS;
RenderTarget = HBlurTex;
}
#line 1446
pass VBlurC2R {
VertexShader = PostProcessVS;
PixelShader  = VBlurC2PS;
RenderTarget = VBlurTex;
}
#line 1456
pass ShortBlur {
VertexShader = PostProcessVS;
PixelShader  = CopyVBlurPS;
RenderTarget = ShortBlurTex;
}
#line 1466
pass HBlurC2S {
VertexShader = PostProcessVS;
PixelShader  = HBlurC2PS;
RenderTarget = HBlurTex;
}
#line 1472
pass VBlurC2S {
VertexShader = PostProcessVS;
PixelShader  = VBlurC2PS;
RenderTarget = VBlurTex;
}
#line 1498
pass HBlurC0US {
VertexShader = PostProcessVS;
PixelShader  = HBlurC0PS;
RenderTarget = HBlurTex;
}
#line 1504
pass VBlurC0US {
VertexShader = PostProcessVS;
PixelShader  = VBlurC0PS;
RenderTarget = VBlurTex;
}
#line 1516
pass PassComputeBlurMax {
VertexShader = PostProcessVS;
PixelShader  = ComputeBlurMaxPS;
RenderTarget = BlurMaxTex;
}
#line 1522
pass PassBlendBlurMaxIntoHistoryTemp {
VertexShader = PostProcessVS;
PixelShader  = BlendBlurMaxIntoHistoryPS;
RenderTarget = BlurMaxHistoryTempTex;
}
#line 1528
pass CopyBlurMaxHistoryTemp {
VertexShader = PostProcessVS;
PixelShader = CopyBlurMaxHistoryTempPS;
RenderTarget = BlurMaxHistoryTex;
}
#line 1538
pass PassLSPOIrr {
VertexShader = PostProcessVS;
PixelShader  = LSPOIrrPS;
#line 1544
}
#line 1548
} 

