#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\MagicBorder.fx"
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
#line 35 "C:\Program Files\GShade\gshade-shaders\Shaders\MagicBorder.fx"
#line 36
namespace MagicBorder
{
#line 40
uniform float LeftTopCornerDepth <
ui_label = "Depth of window left top corner";
ui_type = "slider";
ui_min = 0.00; ui_max = 300.00;
ui_step = 0.01;
ui_tooltip = "The depth the left top corner of the window is placed in the scene.\n0.0 is at the camera, 1000.0 is at the horizon";
> = 1.0;
#line 48
uniform float RightTopCornerDepth <
ui_label = "Depth of window right top corner";
ui_type = "slider";
ui_min = 0.00; ui_max = 300.00;
ui_step = 0.01;
ui_tooltip = "The depth the right top corner of the window is placed in the scene.\n0.0 is at the camera, 1000.0 is at the horizon";
> = 1.0;
#line 56
uniform float RightBottomCornerDepth <
ui_label = "Depth of window right bottom corner";
ui_type = "slider";
ui_min = 0.00; ui_max = 300.00;
ui_step = 0.01;
ui_tooltip = "The depth the right bottom corner of the window is placed in the scene.\n0.0 is at the camera, 1000.0 is at the horizon";
> = 1.0;
#line 64
uniform float LeftBottomCornerDepth <
ui_label = "Depth of window left bottom corner";
ui_type = "slider";
ui_min = 0.00; ui_max = 300.00;
ui_step = 0.01;
ui_tooltip = "The depth the left bottom corner of the window is placed in the scene.\n0.0 is at the camera, 1000.0 is at the horizon";
> = 1.0;
#line 72
uniform bool ShowDepths <
ui_label = "Show corner depths";
ui_tooltip = "If enabled it will show the depths of each corner. White is far away, black is close to the camera.";
> = false;
#line 77
uniform float2 PictureFrameLeftTop <
ui_label = "Picture frame left top coord";
ui_type = "drag";
ui_tooltip = "The left top coordinate of the picture frame";
> = float2(0.1, 0.1);
#line 83
uniform float2 PictureFrameRightTop <
ui_label = "Picture frame right top coord";
ui_type = "drag";
ui_tooltip = "The right top coordinate of the picture frame";
> = float2(0.9, 0.1);
#line 89
uniform float2 PictureFrameRightBottom <
ui_label = "Picture frame right bottom coord";
ui_type = "drag";
ui_tooltip = "The right bottom coordinate of the picture frame";
> = float2(0.9, 0.9);
#line 95
uniform float2 PictureFrameLeftBottom <
ui_label = "Picture frame left bottom coord";
ui_type = "drag";
ui_tooltip = "The left bottom coordinate of the picture frame";
> = float2(0.1, 0.9);
#line 101
uniform float4 BorderColor <
ui_label = "Border color";
ui_type= "color";
ui_tooltip = "The color of the border. Use the alpha value for blending. ";
> = float4(1.0, 1.0, 1.0, 1.0);
#line 107
uniform float4 PictureFrameColor <
ui_label = "Picture frame color";
ui_type= "color";
ui_tooltip = "The color of the area within the border. Use the alpha value for blending. ";
> = float4(0.7, 0.7, 0.7, 1.0);
#line 114
struct VSBORDERINFO
{
float4 vpos : SV_Position;
float2 Texcoord : TEXCOORD0;
float2 LeftTop : TEXCOORD1;
float2 RightTop : TEXCOORD2;
float2 RightBottom : TEXCOORD3;
float2 LeftBottom : TEXCOORD4;
};
#line 125
float CalculateDepthOfFrameAtCoord(VSBORDERINFO info)
{
#line 128
const float2 coord = info.Texcoord;
#line 131
float distanceToCorner = 1-distance(float2(0, 0), coord);
float2 average = float2((LeftTopCornerDepth/1000.0) * distanceToCorner, distanceToCorner);
#line 134
distanceToCorner = 1-distance(float2(1, 0), coord);
average.x += ((RightTopCornerDepth/1000.0) * distanceToCorner);
average.y += distanceToCorner;
#line 138
distanceToCorner = 1-distance(float2(1, 1), coord);
average.x += ((RightBottomCornerDepth/1000.0) * distanceToCorner);
average.y += distanceToCorner;
#line 142
distanceToCorner = 1-distance(float2(0, 1), coord);
average.x += ((LeftBottomCornerDepth/1000.0) * distanceToCorner);
average.y += distanceToCorner;
#line 146
return saturate(average.x/average.y);
}
#line 154
bool IsCoordInPictureArea(VSBORDERINFO info)
{
bool isInPictureArea = false;
#line 158
float2 vertices[4];
vertices[0] = info.LeftTop;
vertices[1] = info.RightTop;
vertices[2] = info.RightBottom;
vertices[3] = info.LeftBottom;
#line 166
int next = 0;
for (int current=0; current<4; current++)
{
#line 170
next = current+1;
if (next == 4) next = 0;
#line 174
float2 vc = vertices[current];    
float2 vn = vertices[next];       
#line 178
if (((vc.y >= info.Texcoord.y && vn.y < info.Texcoord.y) || (vc.y < info.Texcoord.y && vn.y >= info.Texcoord.y)) &&
(info.Texcoord.x < (vn.x-vc.x)*(info.Texcoord.y-vc.y) / (vn.y-vc.y)+vc.x))
{
isInPictureArea = !isInPictureArea;
}
}
#line 185
return isInPictureArea;
}
#line 195
VSBORDERINFO VS_CalculateBorderInfo(in uint id : SV_VertexID)
{
VSBORDERINFO borderInfo;
#line 199
borderInfo.Texcoord.x = (id == 2) ? 2.0 : 0.0;
borderInfo.Texcoord.y = (id == 1) ? 2.0 : 0.0;
borderInfo.vpos = float4(borderInfo.Texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
#line 203
borderInfo.LeftTop = PictureFrameLeftTop;
borderInfo.RightTop = PictureFrameRightTop;
borderInfo.LeftBottom = PictureFrameLeftBottom;
borderInfo.RightBottom = PictureFrameRightBottom;
return borderInfo;
}
#line 216
void PS_DrawBorder(VSBORDERINFO borderInfo, out float4 fragment : SV_Target0)
{
const float4 originalFragment = tex2D(ReShade::BackBuffer, borderInfo.Texcoord);
const float depthFragment = ReShade::GetLinearizedDepth(borderInfo.Texcoord);
#line 222
const bool isInPictureArea = IsCoordInPictureArea(borderInfo);
float depthOfFrameAtCoord = CalculateDepthOfFrameAtCoord(borderInfo);
fragment = isInPictureArea ? PictureFrameColor : BorderColor;
fragment = depthFragment > depthOfFrameAtCoord ? lerp(originalFragment, fragment, fragment.a) : originalFragment;
fragment = ShowDepths ? float4(depthOfFrameAtCoord, depthOfFrameAtCoord, depthOfFrameAtCoord, 1.0) : fragment;
}
#line 235
technique MagicBorder
< ui_tooltip = "Magic Border "
"v1.0.1"
"\n===========================================\n\n"
"Magic Border is an easy way to create a border in a shot and have part of your\n"
"shot in front of the border, like it jumps out of the frame.\n\n"
"Magic Border was written by Frans 'Otis_Inf' Bouma and is part of OtisFX\n"
"https://fransbouma.com | https://github.com/FransBouma/OtisFX"; >
{
pass DrawBorder { VertexShader = VS_CalculateBorderInfo; PixelShader = PS_DrawBorder;}
}
}

