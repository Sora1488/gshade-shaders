#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\CAS.fx"
#line 56
uniform float Contrast <
ui_type = "slider";
ui_label = "Contrast Adaptation";
ui_tooltip = "Adjusts the range the shader adapts to high contrast (0 is not all the way off).  Higher values = more high contrast sharpening.";
ui_min = 0.0; ui_max = 1.0;
> = 0.0;
#line 63
uniform float Sharpening <
ui_type = "slider";
ui_label = "Sharpening intensity";
ui_tooltip = "Adjusts sharpening intensity by averaging the original pixels to the sharpened result.  1.0 is the unmodified default.";
ui_min = 0.0; ui_max = 1.0;
> = 1.0;
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
#line 71 "C:\Program Files\GShade\gshade-shaders\Shaders\CAS.fx"
#line 73
texture TexCASColor : COLOR;
sampler sTexCASColor {Texture = TexCASColor; SRGBTexture = true;};
#line 76
float3 CASPass(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
#line 84
const float3 b = tex2D(sTexCASColor, texcoord, int2(0, -1)).rgb;
const float3 d = tex2D(sTexCASColor, texcoord, int2(-1, 0)).rgb;
#line 89
const float4 red_efhi = tex2DgatherR(sTexCASColor, texcoord + 0.5 * float2((1.0 / 1920), (1.0 / 1080)));
const float4 green_efhi = tex2DgatherG(sTexCASColor, texcoord + 0.5 * float2((1.0 / 1920), (1.0 / 1080)));
const float4 blue_efhi = tex2DgatherB(sTexCASColor, texcoord + 0.5 * float2((1.0 / 1920), (1.0 / 1080)));
#line 93
const float3 e = float3( red_efhi.w, green_efhi.w, blue_efhi.w);
const float3 f = float3( red_efhi.z, green_efhi.z, blue_efhi.z);
const float3 h = float3( red_efhi.x, green_efhi.x, blue_efhi.x);
const float3 i = float3( red_efhi.y, green_efhi.y, blue_efhi.y);
#line 108
const float3 g = tex2D(sTexCASColor, texcoord, int2(-1, 1)).rgb;
const float3 a = tex2D(sTexCASColor, texcoord, int2(-1, -1)).rgb;
const float3 c = tex2D(sTexCASColor, texcoord, int2(1, -1)).rgb;
#line 118
float3 mnRGB = min(min(min(d, e), min(f, b)), h);
mnRGB += min(mnRGB, min(min(a, c), min(g, i)));
#line 121
float3 mxRGB = max(max(max(d, e), max(f, b)), h);
mxRGB += max(mxRGB, max(max(a, c), max(g, i)));
#line 126
const float3 wRGB = -rcp(rsqrt(saturate(min(mnRGB, 2.0 - mxRGB) * rcp(mxRGB))) * (-3.0 * Contrast + 8.0));
#line 131
return lerp(e, saturate((((b + d) + (f + h)) * wRGB + e) * rcp(4.0 * wRGB + 1.0)), Sharpening);
}
#line 134
technique ContrastAdaptiveSharpen
<
ui_label = "AMD FidelityFX Contrast Adaptive Sharpening";
ui_tooltip =
"CAS is a low overhead adaptive sharpening algorithm that AMD includes with their drivers.\n"
"This port to Reshade works with all cards from all vendors,\n"
"but cannot do the optional scaling that CAS is normally also capable of when activated in the AMD drivers.\n"
"\n"
"The algorithm adjusts the amount of sharpening per pixel to target an even level of sharpness across the image.\n"
"Areas of the input image that are already sharp are sharpened less, while areas that lack detail are sharpened more.\n"
"This allows for higher overall natural visual sharpness with fewer artifacts.";
>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = CASPass;
SRGBWriteEnable = true;
}
}

