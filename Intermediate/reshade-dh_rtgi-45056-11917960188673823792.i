#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\dh_rtgi.fx"
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
#line 2 "C:\Program Files\GShade\gshade-shaders\Shaders\dh_rtgi.fx"
#line 37
namespace DHRTGI {
#line 39
texture blueNoiseTex < source ="dh_rt_noise.png" ; > { Width = 512; Height = 512; MipLevels = 1; Format = RGBA8; };
sampler blueNoiseSampler { Texture = blueNoiseTex;  AddressU = REPEAT;  AddressV = REPEAT;  AddressW = REPEAT;};
#line 42
texture normalTex { Width = 1920; Height = 1080; Format = RGBA8; };
sampler normalSampler { Texture = normalTex;};
#line 45
texture previousDepthTex { Width = 1920; Height = 1080; Format = RGBA8; };
sampler previousDepthSampler { Texture = previousDepthTex; };
#line 48
texture lightPassTex { Width = 1920*0.5; Height = 1080*0.5; Format = RGBA8; MipLevels = 4; };
sampler lightPassSampler { Texture = lightPassTex; MinLOD = 0.0f; MaxLOD = 3.0f;};
#line 51
texture lightPassHitTex { Width = 1920*0.5; Height = 1080*0.5; Format = RGBA8; };
sampler lightPassHitSampler { Texture = lightPassHitTex; };
#line 54
texture lightPassAOTex { Width = 1920*0.5; Height = 1080*0.5; Format = RGBA8; MipLevels = 4; };
sampler lightPassAOSampler { Texture = lightPassAOTex; MinLOD = 0.0f; MaxLOD = 3.0f;};
#line 57
texture smoothPassTex { Width = 1920*0.5; Height = 1080*0.5; Format = RGBA8; MipLevels = 4; };
sampler smoothPassSampler { Texture = smoothPassTex; MinLOD = 0.0f; MaxLOD = 3.0f;};
#line 60
texture smoothAOPassTex { Width = 1920*0.5; Height = 1080*0.5; Format = RGBA8; MipLevels = 4; };
sampler smoothAOPassSampler { Texture = smoothAOPassTex; MinLOD = 0.0f; MaxLOD = 3.0f; };
#line 63
texture smoothPass2Tex { Width = 1920; Height = 1080; Format = RGBA8; MipLevels = 4; };
sampler smoothPass2Sampler { Texture = smoothPass2Tex; MinLOD = 0.0f; MaxLOD = 3.0f; };
#line 66
texture smoothAOPass2Tex { Width = 1920; Height = 1080; Format = RGBA8; MipLevels = 4; };
sampler smoothAOPass2Sampler { Texture = smoothAOPass2Tex; MinLOD = 0.0f; MaxLOD = 3.0f; };
#line 69
texture smoothPass3Tex { Width = 1920; Height = 1080; Format = RGBA8; MipLevels = 4; };
sampler smoothPass3Sampler { Texture = smoothPass3Tex; MinLOD = 0.0f; MaxLOD = 3.0f; };
#line 72
texture smoothAOPass3Tex { Width = 1920; Height = 1080; Format = RGBA8; };
sampler smoothAOPass3Sampler { Texture = smoothAOPass3Tex; MinLOD = 0.0f; MaxLOD = 3.0f; };
#line 75
texture resultTex { Width = 1920; Height = 1080; Format = RGBA8; };
sampler resultSampler { Texture = resultTex; };
#line 78
uniform float frametime < source = "frametime"; >;
uniform int framecount < source = "framecount"; >;
uniform int random < source = "random"; min = 0; max = 512; >;
#line 82
uniform bool bDebug <
ui_category = "Setting";
ui_label = "Display light only";
> = false;
#line 87
uniform float fPeviousDepth <
ui_type = "slider";
ui_category = "Setting";
ui_label = "PreviousDepthRecall";
ui_min = 0.0; ui_max = 0.1;
ui_step = 0.001;
> = 0.01;
#line 95
uniform bool bBrightnessOpacity <
ui_category = "Setting";
ui_label = "Brightness Opacity";
> = true;
#line 100
uniform float fDepthMultiplier <
ui_type = "slider";
ui_category = "Setting";
ui_label = "Depth multiplier";
ui_min = 0.1; ui_max = 10;
ui_step = 0.1;
> = 1.0;
#line 108
uniform bool bFrameAccuAuto <
ui_category = "Setting";
ui_label = "Temporal accumulation Auto";
> = true;
#line 113
uniform int iFrameAccu <
ui_type = "slider";
ui_category = "Setting";
ui_label = "Temporal accumulation";
ui_min = 1; ui_max = 16;
ui_step = 1;
> = 2;
#line 121
uniform float fSkyDepth <
ui_type = "slider";
ui_category = "Setting";
ui_label = "Sky Depth ";
ui_min = 0.0; ui_max = 1.0;
ui_step = 0.01;
> = 0.99;
#line 129
uniform float fWeaponDepth <
ui_type = "slider";
ui_category = "Setting";
ui_label = "Weapon Depth ";
ui_min = 0.0; ui_max = 1.0;
ui_step = 0.001;
> = 0.001;
#line 139
uniform int iRayPreciseHit <
ui_type = "slider";
ui_category = "Ray tracing";
ui_label = "Precise hit passes";
ui_min = 0; ui_max = 8;
ui_step = 1;
> = 8;
#line 147
uniform int iRayPreciseHitSteps <
ui_type = "slider";
ui_category = "Ray tracing";
ui_label = "Precise hit steps";
ui_min = 2; ui_max = 8;
ui_step = 1;
> = 4;
#line 156
uniform float fRayStepPrecision <
ui_type = "slider";
ui_category = "Ray tracing";
ui_label = "Step Precision";
ui_min = 1.0; ui_max = 10000;
ui_step = 0.1;
> = 2000;
#line 164
uniform float fRayStepMultiply <
ui_type = "slider";
ui_category = "Ray tracing";
ui_label = "Step multiply";
ui_min = 0.01; ui_max = 4.0;
ui_step = 0.01;
> = 1.0;
#line 172
uniform float fRayHitDepthThreshold <
ui_type = "slider";
ui_category = "Ray tracing";
ui_label = "Ray Hit Depth Threshold";
ui_min = 0.001; ui_max = 1;
ui_step = 0.001;
> = 0.500;
#line 182
uniform float fRayBounce <
ui_type = "slider";
ui_category = "COLOR";
ui_label = "Bounce strength";
ui_min = 0; ui_max = 1.0;
ui_step = 0.01;
> = 0.25;
#line 190
uniform float fFadePower <
ui_type = "slider";
ui_category = "COLOR";
ui_label = "Distance Fading";
ui_min = 0.1; ui_max = 10;
ui_step = 0.01;
> = 2.5;
#line 198
uniform float fSaturateColor <
ui_type = "slider";
ui_category = "COLOR";
ui_label = "Saturate";
ui_min = 0.0; ui_max = 1.0;
ui_step = 0.01;
> = 0.10;
#line 206
uniform float fSaturateColorPower <
ui_type = "slider";
ui_category = "COLOR";
ui_label = "Saturate";
ui_min = 1.0; ui_max = 10.0;
ui_step = 0.01;
> = 2.50;
#line 215
uniform float fAOMultiplier <
ui_type = "slider";
ui_category = "AO";
ui_label = "Multiplier";
ui_min = 0.0; ui_max = 5;
ui_step = 0.01;
> = 1;
#line 223
uniform int iAODistance <
ui_type = "slider";
ui_category = "AO";
ui_label = "Distance";
ui_min = 0; ui_max = 16;
ui_step = 1;
> = 6;
#line 234
uniform bool bNormalWeight <
ui_category = "Smoothing";
ui_label = "Normal weight";
> = true;
#line 239
uniform int iSmoothRadius <
ui_type = "slider";
ui_category = "Smoothing";
ui_label = "Radius";
ui_min = 0; ui_max = 8;
ui_step = 1;
> = 1;
#line 247
uniform int iSmoothLod <
ui_type = "slider";
ui_category = "Smoothing";
ui_label = "Lod";
ui_min = 0; ui_max = 3;
ui_step = 1;
> = 1;
#line 255
uniform float fSmoothPass <
ui_type = "slider";
ui_category = "Smoothing";
ui_label = "Pass";
ui_min = 1.0; ui_max = 4.0;
ui_step = 0.1;
> = 2.0;
#line 263
uniform float fSmoothDepthThreshold <
ui_type = "slider";
ui_category = "Smoothing";
ui_label = "Depth Threshold";
ui_min = 0.01; ui_max = 0.2;
ui_step = 0.01;
> = 0.10;
#line 271
uniform float fSmoothNormalThreshold <
ui_type = "slider";
ui_category = "Smoothing";
ui_label = "Normal Threshold";
ui_min = 0; ui_max = 2;
ui_step = 0.01;
> = 1.50;
#line 281
uniform float fSourceColor <
ui_type = "slider";
ui_category = "Merging";
ui_label = "Source color";
ui_min = 0.1; ui_max = 2;
ui_step = 0.01;
> = 0.90;
#line 289
uniform float fSourceDesat <
ui_type = "slider";
ui_category = "Merging";
ui_label = "Source desat";
ui_min = 0.0; ui_max = 1;
ui_step = 0.01;
> = 0.15;
#line 297
uniform float fLightMult <
ui_type = "slider";
ui_category = "Merging";
ui_label = "Light multiplier";
ui_min = 0.1; ui_max = 10;
ui_step = 0.01;
> = 1.0;
#line 305
uniform float fLightOffset <
ui_type = "slider";
ui_category = "Merging";
ui_label = "Light offset";
ui_min = 0.0; ui_max = 1.0;
ui_step = 0.01;
> = 0.0;
#line 313
uniform float fMaxLight <
ui_type = "slider";
ui_category = "Merging";
ui_label = "MAx light";
ui_min = 0.0; ui_max = 1.0;
ui_step = 0.1;
> = 1.0;
#line 321
uniform float fLightNormalize <
ui_type = "slider";
ui_category = "Merging";
ui_label = "Light normalize";
ui_min = 0.1; ui_max = 4;
ui_step = 0.01;
> = 0.1;
#line 332
float RGBCVtoHUE(in float3 RGB, in float C, in float V) {
float3 Delta = (V - RGB) / C;
Delta.rgb -= Delta.brg;
Delta.rgb += float3(2,4,6);
Delta.brg = step(V, RGB) * Delta.brg;
float H;
H = max(Delta.r, max(Delta.g, Delta.b));
return frac(H / 6);
}
#line 342
float3 RGBtoHSL(in float3 RGB) {
float3 HSL = 0;
float U, V;
U = -min(RGB.r, min(RGB.g, RGB.b));
V = max(RGB.r, max(RGB.g, RGB.b));
HSL.z = ((V - U) * 0.5);
float C = V + U;
if (C != 0)
{
HSL.x = RGBCVtoHUE(RGB, C, V);
HSL.y = C / (1 - abs(2 * HSL.z - 1));
}
return HSL;
}
#line 357
float3 HUEtoRGB(in float H)
{
float R = abs(H * 6 - 3) - 1;
float G = 2 - abs(H * 6 - 2);
float B = 2 - abs(H * 6 - 4);
return saturate(float3(R,G,B));
}
#line 365
float3 HSLtoRGB(in float3 HSL)
{
float3 RGB = HUEtoRGB(HSL.x);
float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
return (RGB - 0.5) * C + HSL.z;
}
#line 372
float getBrightness(float3 color) {
return max(max(color.r,color.g),color.b);
}
#line 376
float getFrameAccu() {
if(bFrameAccuAuto) {
return max(1,round(10.0/frametime));
} else {
return iFrameAccu;
}
}
#line 387
float2 InputPixelSize() {
float2 result = 1.0;
return result/float2(1920,1080);
}
#line 392
float2 RenderPixelSize() {
float2 result = 1.0;
return result/float2(1920*0.5,1080*0.5);
}
#line 397
bool inScreen(float2 coords) {
return coords.x>=0 && coords.x<=1
&& coords.y>=0 && coords.y<=1;
}
#line 402
bool inScreen(float3 coords) {
return coords.x>=0 && coords.x<=1
&& coords.y>=0 && coords.y<=1
&& coords.z>=0 && coords.z<=1;
}
#line 408
float3 getWorldPosition(float2 coords) {
float depth = ReShade::GetLinearizedDepth(coords);
float3 result = float3((coords-0.5)*depth,depth);
result *= int3(1920,1080,1920*1000.0*fDepthMultiplier/1024);
return result;
}
#line 415
float3 getScreenPosition(float3 wp) {
float3 result = wp/int3(1920,1080,1920*1000.0*fDepthMultiplier/1024);
result.xy /= result.z;
return float3(result.xy+0.5,result.z);
}
#line 421
float3 getNormalJitter(float2 coords) {
#line 423
int2 offset = int2((framecount*random*1.41421356237),(framecount*random*3.14159265359))%(float)512;
float3 jitter = normalize(tex2D(blueNoiseSampler,(offset+coords*int2(1920,1080))%((float)512)/((float)512)).rgb-0.5);
return normalize(jitter);
#line 427
}
#line 429
float3 getColorBounce(float2 coords) {
float3 result = tex2Dlod(ReShade::BackBuffer,float4(coords.xy,0,0)).rgb;
if(fRayBounce>0) {
#line 433
result = saturate(result+tex2Dlod(resultSampler,float4(coords.xy,0,0)).rgb*fRayBounce);
}
return result;
}
#line 438
void PS_NormalPass(float4 vpos : SV_Position, float2 coords : TexCoord, out float4 outNormal : SV_Target0) {
#line 440
float3 offset = float3(ReShade::GetPixelSize(), 0.0);
#line 442
float3 posCenter = getWorldPosition(coords);
float3 posNorth  = getWorldPosition(coords - offset.zy);
float3 posEast   = getWorldPosition(coords + offset.xz);
float3 normal = normalize(cross(posCenter - posNorth, posCenter - posEast));
#line 447
float4 r = float4(normal/2.0+0.5,1.0);
outNormal = r;
#line 450
}
#line 452
float3 getRayColor(float2 coords) {
float3 color = getColorBounce(coords);
#line 455
if(fSaturateColor>0) {
float3 hsl = RGBtoHSL(color);
if(hsl.y>0.1 && hsl.z>0.1) {
float maxChannel = getBrightness(color.rgb);
if(maxChannel>0) {
float3 saturatedColor = pow(max(color.rgb/maxChannel, 0.0),fSaturateColorPower);
color.rgb = fSaturateColor*saturatedColor+(1.0-fSaturateColor)*color.rgb;
}
}
}
return color;
}
#line 468
float4 trace(float3 refWp,float3 lightVector,float startDepth) {
#line 470
float stepRatio = 1.0+fRayStepMultiply/10.0;
#line 472
float stepLength = 1.0/fRayStepPrecision;
float3 incrementVector = lightVector*stepLength;
float traceDistance = 0;
float3 currentWp = refWp;
#line 477
float rayHitIncrement = fRayHitDepthThreshold/50.0;
float rayHitDepthThreshold = rayHitIncrement;
#line 480
bool crossed = false;
float deltaZ = 0;
float deltaZbefore = 0;
float3 lastCross;
#line 485
bool outSource = false;
bool firstStep = true;
#line 488
bool startWeapon = startDepth<fWeaponDepth;
float weaponLimit = fWeaponDepth*int3(1920,1080,1920*1000.0*fDepthMultiplier/1024).z;
#line 492
do {
currentWp += incrementVector;
traceDistance += stepLength;
#line 496
float3 screenCoords = getScreenPosition(currentWp);
#line 498
bool outScreen = !inScreen(screenCoords) && (!startWeapon || currentWp.z<weaponLimit);
#line 500
float3 screenWp = getWorldPosition(screenCoords.xy);
#line 502
deltaZ = screenWp.z-currentWp.z;
#line 506
if(firstStep && deltaZ<=0) {
#line 509
float3 n = (tex2Dlod(normalSampler,float4(getScreenPosition(refWp).xy,0,0)).xyz-0.5)*2;
incrementVector = reflect(incrementVector,n);
#line 512
currentWp = refWp+incrementVector;
#line 515
firstStep = false;
} else if(outSource) {
if(!outScreen && sign(deltaZ)!=sign(deltaZbefore)) {
#line 519
float preciseRatio = 1.0/iRayPreciseHitSteps;
float3 preciseIncrementVector = incrementVector;
float preciseLength = stepLength;
for(int precisePass=0;precisePass<iRayPreciseHit;precisePass++) {
preciseIncrementVector *= preciseRatio;
preciseLength *= preciseRatio;
#line 526
int preciseStep=0;
bool recrossed=false;
while(!recrossed && preciseStep<iRayPreciseHitSteps-1) {
currentWp -= preciseIncrementVector;
traceDistance -= preciseLength;
deltaZ = screenWp.z-currentWp.z;
recrossed = sign(deltaZ)==sign(deltaZbefore);
preciseStep++;
}
if(recrossed) {
currentWp += preciseIncrementVector;
traceDistance += preciseLength;
deltaZ = screenWp.z-currentWp.z;
}
}
#line 542
lastCross = currentWp;
crossed = true;
#line 546
}
if(abs(deltaZ)<=rayHitDepthThreshold || outScreen) {
#line 549
return float4(crossed ? lastCross : currentWp,1.0);
}
} else {
if(outScreen) {
currentWp -= incrementVector;
#line 558
return float4(currentWp,0.0);
}
outSource = abs(deltaZ)>rayHitDepthThreshold;
}
#line 563
firstStep = false;
#line 565
deltaZbefore = deltaZ;
#line 567
stepLength *= stepRatio;
if(rayHitDepthThreshold<fRayHitDepthThreshold) rayHitDepthThreshold +=rayHitIncrement;
incrementVector *= stepRatio;
#line 571
} while(traceDistance<1920);
#line 573
return 0.0;
#line 575
}
#line 577
void PS_LightPass(float4 vpos : SV_Position, float2 coords : TexCoord, out float4 outColor : SV_Target0, out float4 outHit : SV_Target1, out float4 outDistance : SV_Target2) {
#line 580
outColor = 0.0;
outHit = 0.0;
outDistance = 0.0;
#line 584
float depth = ReShade::GetLinearizedDepth(coords);
if(depth>fSkyDepth) {
return;
}
#line 589
float3 targetWp = getWorldPosition(coords);
float3 targetNormal = getNormalJitter(coords);
#line 593
float3 lightVector = reflect(targetWp,targetNormal);
#line 595
float opacity = 1.0/getFrameAccu();
#line 599
float4 hitPosition = trace(targetWp,lightVector,depth);
#line 602
float3 screenCoords = getScreenPosition(hitPosition.xyz);
float3 color = getRayColor(screenCoords.xy);
if(hitPosition.a==0) {
#line 606
outColor = float4(color,opacity);
outHit = float4(screenCoords,1);
#line 609
} else {
float b = getBrightness(color);
#line 612
float d = abs(distance(hitPosition.xyz,targetWp));
#line 614
float distance = 1.0+0.02*d;
float distanceRatio = 0.1+1.0/pow(distance,0.05*fFadePower);
#line 617
float previousDepth = tex2D(previousDepthSampler,coords).r;
if(abs(previousDepth-depth)>fPeviousDepth) {
opacity *= 5.0;
}
if(bBrightnessOpacity) {
opacity *= b;
#line 624
}
#line 627
outColor = float4(hitPosition.a*distanceRatio*color,opacity);
outHit = float4(screenCoords,1);
outDistance = depth<fWeaponDepth ? float4(1,0,0,1) : float4(d>iAODistance ? 1 : b+(d/iAODistance),0,0,opacity);
}
}
#line 633
void PS_SmoothPass(float4 vpos : SV_Position, float2 coords : TexCoord, out float4 outColor : SV_Target0, out float4 outAO : SV_Target1) {
#line 636
outColor = 0.0;
outAO = 0.0;
#line 639
float refDepth = ReShade::GetLinearizedDepth(coords);
if(refDepth>fSkyDepth) return;
#line 642
if(iSmoothRadius==0) {
outColor = tex2Dlod(lightPassSampler,float4(coords.xy,0,iSmoothLod));
float ao = tex2Dlod(lightPassAOSampler,float4(coords.xy,0,0)).r;
outAO = float4(ao,ao,ao,1);
return;
}
#line 649
int2 coordsInt = coords*int2(1920*0.5,1080*0.5);
#line 651
float3 refNormal = (tex2Dlod(normalSampler,float4(coords.xy,0,0)).xyz-0.5)*2;
#line 653
float3 result = 0;
float weightSum = 0;
#line 656
int foundSamples = 0;
#line 658
float AO = 0.0;
int AOSamples = 0;
#line 661
float2 pixelSize = RenderPixelSize();
#line 663
float2 minCoords = saturate(coords-iSmoothRadius*pixelSize);
float2 maxCoords = saturate(coords+iSmoothRadius*pixelSize);
float2 currentCoords = minCoords;
#line 668
for(currentCoords.x=minCoords.x;currentCoords.x<=maxCoords.x;currentCoords.x+=pixelSize.x) {
#line 670
for(currentCoords.y=minCoords.y;currentCoords.y<=maxCoords.y;currentCoords.y+=pixelSize.y) {
int2 currentCoordsInt = currentCoords*int2(1920*0.5,1080*0.5);
#line 674
float depth = ReShade::GetLinearizedDepth(currentCoords);
if(depth>fSkyDepth) continue;
#line 677
if(abs(depth-refDepth)<=fSmoothDepthThreshold) {
#line 679
float3 normal = (tex2Dlod(normalSampler,float4(currentCoords.xy,0,0)).xyz-0.5)*2;
if(!any(max(abs(normal-refNormal)-fSmoothNormalThreshold,0))) {
#line 682
float dist = distance(coordsInt,currentCoordsInt);
if(dist<=iSmoothRadius) {
float4 aoColor = tex2Dfetch(lightPassAOSampler,currentCoordsInt);
AO += pow(max(aoColor.r, 0.0),fAOMultiplier);
AOSamples += 1;
}
#line 692
float3 color = tex2Dfetch(lightPassSampler,currentCoordsInt).rgb;
#line 694
float weight = 1.0;
if(bNormalWeight) {
weight *= abs(dot(normal,refNormal));
}
#line 700
result += color*weight;
weightSum += weight;
foundSamples++;
#line 704
} 
} 
} 
} 
#line 709
float3 resultAO = AO/AOSamples;
outAO = float4(resultAO,1);
#line 713
if(foundSamples<1) {
#line 715
outColor = float4(tex2Dlod(lightPassSampler,float4(coords.xy,0,iSmoothLod)).rgb,1);
outAO = 1.0;
return;
}
#line 722
result /= weightSum;
outColor = float4(result,1.0);
}
#line 727
void PS_SmoothPassNoScale(int passNumber,sampler colorSampler,sampler aoSampler, float2 coords : TexCoord, out float4 outColor : SV_Target0, out float4 outAO : SV_Target1) {
#line 730
outColor = 0.0;
outAO = 0.0;
#line 733
float refDepth = ReShade::GetLinearizedDepth(coords);
float3 refNormal = (tex2Dlod(normalSampler,float4(coords.xy,0,0)).xyz-0.5)*2;
if(refDepth>fSkyDepth) {
outColor = float4(0,0,0,1);
outAO = tex2Dlod(aoSampler,float4(coords.xy,0,iSmoothLod));
return;
}
#line 741
if(iSmoothRadius==0) {
outColor = tex2Dlod(lightPassSampler,float4(coords.xy,0,iSmoothLod));
float ao = tex2Dlod(lightPassAOSampler,float4(coords.xy,0,iSmoothLod)).r;
outAO = float4(ao,ao,ao,1);
return;
}
#line 748
float4 result = 0;
float weightSum = 0;
#line 751
int2 offset = 0;
float radius = iSmoothRadius*passNumber;
#line 754
float maxRadius2 = 1+radius*radius;
#line 756
int maxSamples = 0;
int foundSamples = 0;
int whiteSamples = 0;
int missSamples = 0;
#line 761
float AO = 0.0;
int AOSamples = 0;
#line 764
for(offset.x=-radius;offset.x<=radius;offset.x+=passNumber) {
for(offset.y=-radius;offset.y<=radius;offset.y+=passNumber) {
float2 currentCoords = coords+offset*RenderPixelSize();
#line 768
int2 currentCoordsInt = currentCoords*int2(1920*0.5,1080*0.5);
#line 771
if(inScreen(currentCoords)) {
float depth = ReShade::GetLinearizedDepth(currentCoords);
if(depth>fSkyDepth) continue;
if(abs(depth-refDepth)<=fSmoothDepthThreshold) {
float3 normal = (tex2Dlod(normalSampler,float4(currentCoords.xy,0,0)).xyz-0.5)*2;
if(!any(max(abs(normal-refNormal)-fSmoothNormalThreshold,0))) {
maxSamples++;
#line 779
float dOff = dot(offset,offset);
if(dOff<=maxRadius2) {
float4 aoColor = tex2Dlod(aoSampler,float4(currentCoords.xy,0,iSmoothLod));
AO += aoColor.r;
AOSamples += 1;
}
#line 786
float4 color = tex2Dlod(colorSampler,float4(currentCoords.xy,0,iSmoothLod));
#line 788
float weight=1;
if(bNormalWeight) {
weight *= abs(dot(normal,refNormal));
}
#line 794
result += color*weight;
weightSum += weight;
foundSamples++;
#line 798
} 
} 
} 
} 
} 
#line 804
float3 resultAO = AO/AOSamples;
outAO = float4(resultAO,1);
#line 807
if(foundSamples<=1) {
#line 809
outColor = float4(tex2Dlod(colorSampler,float4(coords.xy,0,iSmoothLod)).rgb,1);
outAO = tex2Dlod(aoSampler,float4(coords.xy,0,iSmoothLod));
#line 812
return;
}
#line 815
if(weightSum>0) {
result.rgb = saturate(result.rgb/weightSum);
}
#line 819
result.a = 1.0/getFrameAccu();
outColor = result;
}
#line 823
void PS_SmoothPass2(float4 vpos : SV_Position, float2 coords : TexCoord, out float4 outColor : SV_Target0, out float4 outAO : SV_Target1) {
PS_SmoothPassNoScale(fSmoothPass,smoothPassSampler,smoothAOPassSampler,coords,outColor,outAO);
}
#line 827
void PS_SmoothPass3(float4 vpos : SV_Position, float2 coords : TexCoord, out float4 outColor : SV_Target0, out float4 outAO : SV_Target1) {
PS_SmoothPassNoScale(fSmoothPass*2,smoothPass2Sampler,smoothAOPass2Sampler,coords,outColor,outAO);
}
#line 831
float3 max3(float3 a,float3 b) {
return float3(max(a.x,b.x),max(a.y,b.y),max(a.z,b.z));
}
#line 835
float3 min3(float3 a,float3 b) {
return float3(min(a.x,b.x),min(a.y,b.y),min(a.z,b.z));
}
#line 839
float3 minSum3(float3 a,float b) {
float s = a.x+a.y+a.z;
return s>0 && s>b ? b*a/s : a;
}
#line 844
void PS_UpdateResult(in float4 position : SV_Position, in float2 coords : TEXCOORD, out float4 outPixel : SV_Target,out float4 outDepth : SV_Target1)
{
#line 848
outDepth = 0.0;
#line 850
float3 color = tex2Dlod(ReShade::BackBuffer,float4(coords.xy,0,0)).rgb;
float depth = ReShade::GetLinearizedDepth(coords);
if(depth>fSkyDepth) {
outPixel = float4(color,1.0);
return;
}
#line 857
float3 colorHsl = RGBtoHSL(color);
float3 light = tex2Dlod(smoothPass3Sampler,float4(coords.xy,0,0)).rgb;
float3 lightHsl = RGBtoHSL(light);
#line 861
float b = getBrightness(color);
float lb = getBrightness(light);
#line 864
float ao = max(tex2Dlod(smoothAOPass3Sampler,float4(coords.xy,0,0)).r,b);
#line 872
float3 colorDesatHsl = colorHsl;
colorDesatHsl.y *= fSourceDesat;
if(colorDesatHsl.z>0) {
colorDesatHsl.z = pow(colorDesatHsl.z+fLightOffset,0.5);
}
colorDesatHsl = saturate(colorDesatHsl);
float3 colorDesat = HSLtoRGB(colorDesatHsl);
float3 lightApply = light*colorDesat;
#line 881
float3 colorHueShift = colorHsl;
colorHueShift.x = lightHsl.x;
colorHueShift.y = lightHsl.y;
colorHueShift.z = pow(colorHueShift.z+0.1,0.5)*abs(sin(lightHsl.z*3.14159265359));
lightApply = HSLtoRGB(colorHueShift);
#line 887
float colorRatio = fSourceColor;
float lightRatio = fLightMult*(1.0-b)+lightHsl.y+lightHsl.z;
#line 898
float mLight = min(b*2+0.1,fMaxLight);
float3 result = (1.0-b)*2*(colorHueShift.y)*lightApply+(1.0-colorHueShift.y)*color;
result = (color*colorRatio+minSum3(fLightMult*light,mLight)*result*lightRatio)/(0.9+fLightNormalize);
result *= ao;
#line 905
outPixel = float4(saturate(result),1.0);
#line 908
outDepth = float4(ReShade::GetLinearizedDepth(coords),0,0,1);
}
#line 911
void PS_DisplayResult(in float4 position : SV_Position, in float2 coords : TEXCOORD, out float4 outPixel : SV_Target)
{
float4 color = tex2Dlod(resultSampler,float4(coords.xy,0,0));
if(bDebug) {
float b = getBrightness(color.rgb);
float ao = max(tex2Dlod(smoothAOPass3Sampler,float4(coords.xy,0,0)).r,b);
color = ao * tex2Dlod(smoothPass3Sampler,float4(coords.xy,0,0));
color.a = 1;
}
outPixel = color;
}
#line 924
technique DH_RTGI {
pass {
VertexShader = PostProcessVS;
PixelShader = PS_NormalPass;
RenderTarget = normalTex;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_LightPass;
RenderTarget = lightPassTex;
RenderTarget1 = lightPassHitTex;
RenderTarget2 = lightPassAOTex;
#line 937
ClearRenderTargets = false;
#line 939
BlendEnable = true;
BlendOp = ADD;
#line 947
SrcBlend = SRCALPHA;
SrcBlendAlpha = ONE;
DestBlend = INVSRCALPHA;
DestBlendAlpha = ONE;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_SmoothPass;
RenderTarget = smoothPassTex;
RenderTarget1 = smoothAOPassTex;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_SmoothPass2;
RenderTarget = smoothPass2Tex;
RenderTarget1 = smoothAOPass2Tex;
#line 964
ClearRenderTargets = false;
#line 966
BlendEnable = true;
BlendOp = ADD;
#line 974
SrcBlend = SRCALPHA;
SrcBlendAlpha = ONE;
DestBlend = INVSRCALPHA;
DestBlendAlpha = ONE;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_SmoothPass3;
RenderTarget = smoothPass3Tex;
RenderTarget1 = smoothAOPass3Tex;
#line 985
ClearRenderTargets = false;
#line 987
BlendEnable = true;
BlendOp = ADD;
#line 995
SrcBlend = SRCALPHA;
SrcBlendAlpha = ONE;
DestBlend = INVSRCALPHA;
DestBlendAlpha = ONE;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_UpdateResult;
RenderTarget = resultTex;
RenderTarget1 = previousDepthTex;
#line 1006
ClearRenderTargets = false;
}
pass {
VertexShader = PostProcessVS;
PixelShader = PS_DisplayResult;
}
}
#line 1015
}

