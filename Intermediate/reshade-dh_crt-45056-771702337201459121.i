#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\dh_crt.fx"
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
#line 2 "C:\Program Files\GShade\gshade-shaders\Shaders\dh_crt.fx"
#line 5
namespace DH_CRT {
#line 8
uniform float iPixelHeight <
ui_category = "Effect";
ui_label = "Pixel height";
ui_type = "slider";
ui_min = 1;
ui_max = 16;
ui_step = 1;
> = 2;
#line 17
uniform int iScanlineHeight <
ui_category = "Effect";
ui_label = "Scanline height";
ui_type = "slider";
ui_min = 0;
ui_max = 16;
ui_step = 1;
> = 1;
#line 26
uniform float fScanlineOpacity <
ui_category = "Effect";
ui_label = "Scanline opacity";
ui_type = "slider";
ui_min = 0;
ui_max = 1;
ui_step = 0.1;
> = 0.5;
#line 35
uniform bool bScanlineGrad <
ui_category = "Effect";
ui_label = "Scanline grad";
> = true;
#line 40
uniform float fScanlineBloom <
ui_category = "Effect";
ui_label = "Scanline bloom";
ui_type = "slider";
ui_min = 0;
ui_max = 1;
ui_step = 0.1;
> = 0.1;
#line 49
uniform float fScanlineBloomThreshold <
ui_category = "Effect";
ui_label = "Scanline bloom threshold";
ui_type = "slider";
ui_min = 0;
ui_max = 1;
ui_step = 0.1;
> = 0.5;
#line 58
uniform float fBrightnessBoost <
ui_category = "Effect";
ui_label = "Brightness boost";
ui_type = "slider";
ui_min = 0;
ui_max = 1;
ui_step = 0.1;
> = 0.1;
#line 71
int2 screenSize() { return int2(1920,1080); }
#line 73
int getScanlineNumber(float2 coords) {
int yPx = coords.y*1080;
int yCellPx = yPx%iPixelHeight;
#line 77
if(yCellPx>iScanlineHeight) {
return -1;
} else {
return yCellPx;
}
}
#line 84
float isScanline(float2 coords) {
int yPx = coords.y*1080;
int yCellPx = yPx%iPixelHeight;
if(yCellPx>=iScanlineHeight) {
return 0;
} else if(!bScanlineGrad) {
return 1;
} else {
return 1-float(yCellPx)/iScanlineHeight;
}
}
#line 99
void PS_result(in float4 position : SV_Position, in float2 coords : TEXCOORD, out float4 outPixel : SV_Target)
{
float4 color = tex2D(ReShade::BackBuffer,coords);
#line 103
float scanlineNumber = getScanlineNumber(coords);
if(scanlineNumber>0) {
#line 106
if(bScanlineGrad) {
color.rgb *= 1-fScanlineOpacity*scanlineNumber/iScanlineHeight;
} else {
color.rgb *= 1-fScanlineOpacity;
}
#line 112
if(fScanlineBloom>0) {
float previousLine = coords.y-ReShade::GetPixelSize().y*scanlineNumber;
float nextLine = coords.y+ReShade::GetPixelSize().y*(iScanlineHeight-scanlineNumber);
float minX = saturate(coords.x - ReShade::GetPixelSize().x);
float maxX = saturate(coords.x + ReShade::GetPixelSize().x);
#line 118
float w;
float sumW = 0;
float3 sumColor;
if(previousLine>=0) {
float2 currentCoords = float2(0,previousLine);
for(currentCoords.x = minX;currentCoords.x<=maxX;currentCoords.x+=ReShade::GetPixelSize().x) {
float3 c = tex2Dlod(ReShade::BackBuffer,float4(currentCoords,0,0)).rgb;
w = 1-float(scanlineNumber)/iScanlineHeight;
w *= pow(max(c.x,max(c.y,c.z)),2);
sumColor += c*w;
sumW += w;
}
}
if(nextLine<=1) {
float2 currentCoords = float2(0,nextLine);
for(currentCoords.x = minX;currentCoords.x<=maxX;currentCoords.x+=ReShade::GetPixelSize().x) {
float3 c = tex2Dlod(ReShade::BackBuffer,float4(currentCoords,0,0)).rgb;
w = 1-float(iScanlineHeight-scanlineNumber)/iScanlineHeight;
w *= pow(max(c.x,max(c.y,c.z)),2);
sumColor += c*w;
sumW += w;
}
}
color.rgb += fScanlineBloom*sumColor/sumW;
#line 144
}
#line 146
} else {
if(fBrightnessBoost>0) {
color.rgb *= 1+fBrightnessBoost;
}
}
outPixel = saturate(color);
}
#line 157
technique DH_CRT <
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = PS_result;
}
}
#line 167
}

