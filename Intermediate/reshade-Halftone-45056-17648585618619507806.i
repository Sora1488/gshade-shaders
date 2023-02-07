#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\Halftone.fx"
#line 11
texture BackBuffer:COLOR;
#line 14
sampler sBackBuffer{Texture = BackBuffer;};
#line 16
uniform float Strength<
ui_type = "slider";
ui_label = "Strength";
ui_tooltip = "Changes how much of the color is from the dots vs. the original image.";
ui_min = 0; ui_max = 1;
ui_step = 0.001;
> = 1;
#line 24
uniform float KStrength<
ui_type = "slider";
ui_label = "K-Strength";
ui_tooltip = "Changes how much K is used to subtract from the color dots";
ui_min = 0; ui_max = 1;
ui_step = 0.001;
> = 0.5;
#line 32
uniform float3 PaperColor<
ui_type = "color";
ui_label = "Paper Color";
ui_min = 0; ui_max = 1;
> = 1;
#line 38
uniform float Angle<
ui_type = "slider";
ui_label = "Angle";
ui_tooltip = "Changles the angle that the dots are laid out in, helps with aliasing patterns.";
ui_min = 0; ui_max = 1;
ui_step = 0.001;
> = 0.33;
#line 46
uniform float Scale<
ui_type = "slider";
ui_label = "Scale";
ui_tooltip = "Changes the size of the dots in the halftone pattern.";
ui_min = 1; ui_max = 9;
ui_step = 1;
> = 3;
#line 54
uniform bool SuperSample = true;
#line 59
void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
texcoord.x = (id == 2) ? 2.0 : 0.0;
texcoord.y = (id == 1) ? 2.0 : 0.0;
position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}
#line 66
float2x2 rotationMatrix(float angle)
{
float2 trig;
sincos(angle, trig.x, trig.y);
#line 71
return float2x2(float2(trig.x, -trig.y), float2(trig.y, trig.x));
}
#line 74
float2 scaledTexcoord(float2 texcoord, float angle, float scale)
{
float2x2 rot = rotationMatrix(angle);
#line 79
float2 scaledTexcoord = mul((texcoord) * float2(float(1920) / float(1080), 1), rot);
scaledTexcoord = (round(scaledTexcoord / scale)) * scale;
scaledTexcoord = mul(scaledTexcoord, transpose(rot)) / float2(float(1920) / float(1080), 1);
#line 83
return scaledTexcoord;
}
#line 86
float4 sRGBToCMYK(float3 sRGB)
{
float4 cmyk;
cmyk.xyz = saturate(PaperColor - sRGB);
cmyk.w = (min(min(cmyk.x, cmyk.y), cmyk.z)) * KStrength;
cmyk.xyz = (PaperColor - sRGB - cmyk.w) / (1 - cmyk.w);
return saturate(cmyk);
}
#line 95
float coveragePercent(float2 dotCenter, float2 pixelCenter, float tonalValue, float scale)
{
#line 98
float radius = (scale * tonalValue * 0.5) / 0.7;
#line 100
float2 fromCenter = (pixelCenter - dotCenter) * float2(float(1920) / float(1080), 1);
#line 102
float dist = length(fromCenter);
#line 104
float wd = fwidth(dist) * sqrt(0.5);
#line 106
return smoothstep(radius+wd, radius-wd, dist);
}
#line 109
float4 CMYKSample(const float2 texcoord, const float scale)
{
float4 output;
#line 113
float2 coord;
float4 value;
#line 116
output = 0;
float2 rotatedCoord = mul(texcoord * float2(float(1920) / float(1080), 1), rotationMatrix(3.14159265/4)) / float2(float(1920) / float(1080), 1);
coord = scaledTexcoord(texcoord.xy, 0 + Angle, scale);
value = sRGBToCMYK(tex2D(sBackBuffer, coord).rgb);
output.z = coveragePercent(coord, texcoord, value.z, scale);
#line 122
coord = scaledTexcoord(texcoord.xy, 3.14159265/12 + Angle, scale);
value = sRGBToCMYK(tex2D(sBackBuffer, coord).rgb);
output.x = coveragePercent(coord, texcoord, value.x, scale);
#line 126
coord = scaledTexcoord(texcoord.xy, 3.14159265/4 + Angle, scale);
value = sRGBToCMYK(tex2D(sBackBuffer, coord).rgb);
output.w = coveragePercent(coord, texcoord, value.w, scale);
#line 130
coord = scaledTexcoord(texcoord.xy, (5*3.14159265)/12 + Angle, scale);
value = sRGBToCMYK(tex2D(sBackBuffer, coord).rgb);
output.y = coveragePercent(coord, texcoord, value.y, scale);
#line 134
return output;
}
#line 137
void OutputPS(float4 vpos : SV_POSITION, float2 texcoord : TEXCOORD, out float4 output : SV_TARGET0)
{
float scale = (1 / (1080 / Scale));
#line 141
output = 0;
#line 143
float4 values[4];
float2 coords[4];
#line 147
for(int i = 0; i < 4; i++)
{
values[i] = sqrt(values[i]);
}
if(SuperSample)
{
#line 154
[unroll]
for(int i = 1; i <= 2; i++)
{
[unroll]
for(int j = 1; j <= 2; j++)
{
float2 offset = (float2(i, j) / 3.0) - 0.5;
offset *= float2((1.0 / 1920), (1.0 / 1080));
output += CMYKSample(texcoord + offset, scale);
}
}
output /= 4;
}
else
{
#line 170
output += CMYKSample(texcoord, scale);
}
#line 173
float4 value = sRGBToCMYK(tex2D(sBackBuffer, texcoord).rgb);
#line 175
output.xyz = (output.w > 0.99) ? 0 : output.xyz;
output = lerp(value, output, Strength);
#line 178
output.rgb = ((1 - output.xyz) * (1 - output.w));
output.rgb = (output.rgb - (1 - PaperColor));
output.a = 1;
#line 182
}
#line 184
technique Halftone <ui_tooltip = "This shader emulates the CMYK halftoning commonly found in offset printing, \n"
"to give the image a printer-like effect.\n\n"
"Part of Insane Shaders\n"
"By: Lord Of Lunacy";>
{
pass
{
VertexShader = PostProcessVS;
PixelShader = OutputPS;
}
}

