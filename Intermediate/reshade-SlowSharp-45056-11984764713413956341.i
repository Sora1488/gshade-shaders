#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\SlowSharp.fx"
#line 13
texture TexColor : COLOR;
sampler sTexColor {Texture = TexColor; SRGBTexture = false;};
#line 16
texture2D Ssharp_Tex1 { Width = 1920; Height = 1080; Format = RGBA8; };
sampler sSsharp_Tex1 {Texture = Ssharp_Tex1; };
#line 19
texture2D Ssharp_Tex2 { Width = 1920; Height = 1080; Format = RGBA8; };
sampler sSsharp_Tex2 {Texture = Ssharp_Tex2; };
#line 26
uniform float threshold <
ui_type = "slider";
ui_label = "Edge Threshold";
ui_label = "Edge Avoidance Threshold";
> = 0.1;
#line 32
uniform float intensity <
ui_type = "slider";
ui_label = "Intensity";
> = 0.5;
#line 37
uniform int size <
ui_type = "slider";
ui_label = "Filter Width";
ui_tooltip = "Higher : Wider filter but slower";
ui_min = 1;
ui_max = 16;
> = 8;
#line 45
uniform float bias <
ui_type = "slider";
ui_tooltip = "Higher : Wider filter but slower";
ui_min = -0.5;
ui_max =  0.5;
> = -0.5;
#line 57
void VS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
texcoord.x = (id == 2) ? 2.0 : 0.0;
texcoord.y = (id == 1) ? 2.0 : 0.0;
position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}
#line 67
float3 H(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
float4 color = float4(tex2D(sTexColor, texcoord).rgb, 1);
#line 71
float4 s = 0;
s.a = 1;
float4 s1= 0;
float2 p = float2((1.0 / 1920), (1.0 / 1080));;
int width = size;
#line 77
[loop]
for (int i = -width; i <= width; i++)
{
s.rgb = tex2Dlod(sTexColor, float4(texcoord + float2(i*p.x, 0), 0.0, 0.0)).rgb;
float3 diff3 = abs(s.rgb - color.rgb);
float  diff  = dot(0.333, diff3);
if( diff < threshold + 0.0001){s1 += s;}
}
return s1.rgb/s1.a;
}
#line 88
float3 V(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
float4 color = float4(tex2D(sSsharp_Tex1, texcoord).rgb, 1);
#line 92
float4 s = 0;
s.a = 1;
float4 s1    = 0;
float2 p     = float2((1.0 / 1920), (1.0 / 1080));;
int    width = size;
#line 98
[loop]
for (int i = -width; i <= width; i++)
{
s.rgb = tex2Dlod(sSsharp_Tex1, float4(texcoord + float2(0, i*p.y), 0.0, 0.0)).rgb;
float3 diff3 = abs(s.rgb - color.rgb);
float  diff  = dot(0.333, diff3);
if( diff < threshold + 0.0001){s1 += s;}
}
return s1.rgb/s1.a;
#line 108
}
#line 110
float3 Sharp(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
float3 color = tex2D(sTexColor, texcoord).rgb;
float3 blur  = tex2D(    sSsharp_Tex2, texcoord).rgb;
float3 sharp = color + (color - blur);
#line 116
return lerp( color, sharp, intensity);
}
#line 123
technique SlowSharp
< ui_label = "Slow Sharp";
ui_tooltip = "Super Wide Sharpening with nearly no artifact"; >
{
pass Horizontal
{
VertexShader = VS;
PixelShader = H;
RenderTarget = Ssharp_Tex1;
}
pass Vertical
{
VertexShader = VS;
PixelShader = V;
RenderTarget = Ssharp_Tex2;
}
pass Sharpening
{
VertexShader = VS;
PixelShader = Sharp;
}
}

