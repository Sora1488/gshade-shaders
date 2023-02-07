#line 1 "unknown"

#line 1 "C:\Program Files\GShade\gshade-shaders\Shaders\RealLongExposure.fx"
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
#line 19 "C:\Program Files\GShade\gshade-shaders\Shaders\RealLongExposure.fx"
uniform float timer < source = "timer"; > ;
#line 22
namespace RealisticLongExposure
{
#line 28
uniform float RealExposureDuration <
ui_label = "Exposure Duration";
ui_type = "slider";
ui_min = 0.1; ui_max = 120.0;
ui_step = 0.1;
ui_tooltip = "Exposure duration in seconds.";
> = 1.0;
#line 36
uniform bool StartExposure <
ui_label = "Start Exposure";
ui_tooltip = "Click to start the exposure process. It will run for the given amount of seconds and then freeze. Tip: Bind this to a hotkey to use it conveniently.";
> = false;
#line 41
uniform bool ShowGreenOnFinish <
ui_label = "Show Green Dot On Finish";
ui_tooltip = "Display a green dot at the top to signalize the exposure has finished and entered preview mode.";
> = false;
#line 46
uniform float ISO <
ui_label = "ISO";
ui_type = "slider";
ui_min = 100.0; ui_max = 1600.0;
ui_step = 1;
ui_tooltip = "Sensitivity to light. 100 is normalized to the game. 1600 is 16 times the sensitivity.";
> = 100.0;
#line 54
uniform float Gamma <
ui_type = "slider";
ui_min = 0.4; ui_max = 4.4;
ui_step = 0.01;
ui_tooltip = "The gamma correction value. The default value is 1.";
> = 1.0;
#line 61
uniform uint Delay <
ui_type = "slider";
ui_min = 0; ui_max = 100;
ui_step = 1;
ui_tooltip = "The delay before exposure starts in milliseconds.";
> = 1;
#line 75
texture texExposureReal{ 		Width = 1920; Height = 1080; Format = RGBA32F; };
texture texExposureRealCopy{ 	Width = 1920; Height = 1080; Format = RGBA32F; };
texture texTimer{ 		Width = 2; Height = 1; Format = R32F; };
texture texTimerCopy{ 	Width = 2; Height = 1; Format = R32F; };
#line 80
sampler2D samplerExposure{ 		Texture = texExposureReal; };
sampler2D samplerExposureCopy{ 	Texture = texExposureRealCopy; };
sampler2D samplerTimer{ 		Texture = texTimer; };
sampler2D samplerTimerCopy{ 	Texture = texTimerCopy; };
#line 92
float encodeTimer(float value)
{
return value / 8388608.0;
}
#line 97
float decodeTimer(float value)
{
return value * 8388608.0;
}
#line 103
float4 show_green(float2 texcoord, float4 fragment)
{
const float2 c = float2(0.5, 0.06);
const float range = 0.02;
if (sqrt((c.x - texcoord.x) * (c.x - texcoord.x) + (c.y - texcoord.y) * (c.y - texcoord.y)) < range)
{
fragment = float4(0.5, 1, 0.5, 1);
}
return fragment;
}
#line 121
float4 getExposure(float4 rgbval)
{
float enc = ISO / 100;
rgbval.rgb = enc * pow(abs(rgbval.rgb), Gamma) / 14400;
return rgbval;
}
#line 128
void long_exposure(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
float start_time = decodeTimer(tex2D(samplerTimer, float2(0.25, 0.5)).r);
float framecounter = decodeTimer(tex2D(samplerTimer, float2(0.75, 0.5)).r);
float4 rgbval = tex2D(ReShade::BackBuffer, texcoord);
fragment = tex2D(samplerExposureCopy, texcoord);
rgbval = getExposure(rgbval);
#line 139
if (StartExposure && abs(timer - start_time) > Delay)
{
if (abs(timer - start_time) < 1000 * RealExposureDuration)
{
fragment.rgb += rgbval.rgb;
}
}
else
{
fragment = float4(0, 0, 0, 1);
}
}
#line 152
void copy_exposure(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
fragment = tex2D(samplerExposure, texcoord);
}
#line 158
void update_timer(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float fragment : SV_Target)
{
#line 163
float start_time = decodeTimer(tex2D(samplerTimerCopy, float2(0.25, 0.5)).r);
float framecounter = decodeTimer(tex2D(samplerTimerCopy, float2(0.75, 0.5)).r);
float new_value;
if (texcoord.x < 0.5)
{
if (StartExposure)
new_value = start_time;
else
new_value = timer;
}
else
{
if (abs(timer - start_time) < 1000 * RealExposureDuration)
{
new_value = (StartExposure && abs(timer - start_time) > Delay) ? framecounter + 1 : 0;
}
else if (StartExposure)
{
new_value = framecounter;
}
}
fragment = encodeTimer(new_value);
}
#line 187
void copy_timer(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float fragment : SV_Target)
{
fragment = tex2D(samplerTimer, texcoord).r;
}
#line 193
void downsample_exposure(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target)
{
float4 exposure_rgb = tex2D(samplerExposure, texcoord);
float4 game_rgb = tex2D(ReShade::BackBuffer, texcoord);
float start_time = decodeTimer(tex2D(samplerTimer, float2(0.25, 0.5)).r);
float framecounter = decodeTimer(tex2D(samplerTimer, float2(0.75, 0.5)).r);
float4 result = float4(0, 0, 0, 1);
if (StartExposure && framecounter)
{
result.rgb = exposure_rgb.rgb * (14400 / framecounter);
result.rgb = pow(abs(result.rgb), 1 / Gamma);
}
else
{
result = game_rgb;
}
fragment = ((int)ShowGreenOnFinish * (int)StartExposure * (int)(timer - start_time > 1000 * RealExposureDuration)) ? show_green(texcoord, result) : result;
}
#line 219
technique RealLongExposure
{
pass longExposure { VertexShader = PostProcessVS; PixelShader = long_exposure; RenderTarget = texExposureReal; }
pass copyExposure { VertexShader = PostProcessVS; PixelShader = copy_exposure; RenderTarget = texExposureRealCopy; }
pass updateTimer { VertexShader = PostProcessVS; PixelShader = update_timer; RenderTarget = texTimer; }
pass copyTimer { VertexShader = PostProcessVS; PixelShader = copy_timer; RenderTarget = texTimerCopy; }
pass downsampleExposure { VertexShader = PostProcessVS; PixelShader = downsample_exposure; }
}
}

