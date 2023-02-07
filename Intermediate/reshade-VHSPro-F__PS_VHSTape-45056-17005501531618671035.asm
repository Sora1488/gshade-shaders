//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float screenLinesNum;              // Offset:    0 Size:     4 [unused]
//   bool VHS_Bleed;                    // Offset:    4 Size:     4 [unused]
//   int VHS_BleedMode;                 // Offset:    8 Size:     4 [unused]
//   float bleedAmount;                 // Offset:   12 Size:     4 [unused]
//   bool VHS_FishEye;                  // Offset:   16 Size:     4 [unused]
//   bool VHS_FishEye_Hyperspace;       // Offset:   20 Size:     4 [unused]
//   float fisheyeBend;                 // Offset:   24 Size:     4 [unused]
//   float cutoffX;                     // Offset:   28 Size:     4 [unused]
//   float cutoffY;                     // Offset:   32 Size:     4 [unused]
//   float cutoffFadeX;                 // Offset:   36 Size:     4 [unused]
//   float cutoffFadeY;                 // Offset:   40 Size:     4 [unused]
//   bool VHS_Vignette;                 // Offset:   44 Size:     4 [unused]
//   float vignetteAmount;              // Offset:   48 Size:     4 [unused]
//   float vignetteSpeed;               // Offset:   52 Size:     4 [unused]
//   float noiseLinesNum;               // Offset:   56 Size:     4 [unused]
//   float noiseQuantizeX;              // Offset:   60 Size:     4 [unused]
//   bool VHS_FilmGrain;                // Offset:   64 Size:     4
//   float filmGrainAmount;             // Offset:   68 Size:     4
//   bool VHS_YIQNoise;                 // Offset:   72 Size:     4 [unused]
//   int signalNoiseType;               // Offset:   76 Size:     4 [unused]
//   float signalNoiseAmount;           // Offset:   80 Size:     4 [unused]
//   float signalNoisePower;            // Offset:   84 Size:     4 [unused]
//   bool VHS_LineNoise;                // Offset:   88 Size:     4
//   float lineNoiseAmount;             // Offset:   92 Size:     4
//   float lineNoiseSpeed;              // Offset:   96 Size:     4
//   bool VHS_TapeNoise;                // Offset:  100 Size:     4
//   float tapeNoiseTH;                 // Offset:  104 Size:     4
//   float tapeNoiseAmount;             // Offset:  108 Size:     4 [unused]
//   float tapeNoiseSpeed;              // Offset:  112 Size:     4
//   bool VHS_ScanLines;                // Offset:  116 Size:     4 [unused]
//   float scanLineWidth;               // Offset:  120 Size:     4 [unused]
//   bool VHS_LinesFloat;               // Offset:  124 Size:     4 [unused]
//   float linesFloatSpeed;             // Offset:  128 Size:     4 [unused]
//   bool VHS_Stretch;                  // Offset:  132 Size:     4 [unused]
//   bool VHS_Jitter_H;                 // Offset:  136 Size:     4 [unused]
//   float jitterHAmount;               // Offset:  140 Size:     4 [unused]
//   bool VHS_Jitter_V;                 // Offset:  144 Size:     4 [unused]
//   float jitterVAmount;               // Offset:  148 Size:     4 [unused]
//   float jitterVSpeed;                // Offset:  152 Size:     4 [unused]
//   bool VHS_Twitch_H;                 // Offset:  156 Size:     4 [unused]
//   float twitchHFreq;                 // Offset:  160 Size:     4 [unused]
//   bool VHS_Twitch_V;                 // Offset:  164 Size:     4 [unused]
//   float twitchVFreq;                 // Offset:  168 Size:     4 [unused]
//   bool VHS_SignalTweak;              // Offset:  172 Size:     4 [unused]
//   float signalAdjustY;               // Offset:  176 Size:     4 [unused]
//   float signalAdjustI;               // Offset:  180 Size:     4 [unused]
//   float signalAdjustQ;               // Offset:  184 Size:     4 [unused]
//   float signalShiftY;                // Offset:  188 Size:     4 [unused]
//   float signalShiftI;                // Offset:  192 Size:     4 [unused]
//   float signalShiftQ;                // Offset:  196 Size:     4 [unused]
//   float gammaCorection;              // Offset:  200 Size:     4 [unused]
//   bool VHS_Feedback;                 // Offset:  204 Size:     4 [unused]
//   float feedbackAmount;              // Offset:  208 Size:     4 [unused]
//   float feedbackFade;                // Offset:  212 Size:     4 [unused]
//   float feedbackThresh;              // Offset:  216 Size:     4 [unused]
//   float3 feedbackColor;              // Offset:  224 Size:    12 [unused]
//   bool feedbackDebug;                // Offset:  236 Size:     4 [unused]
//   int VHS_Filter;                    // Offset:  240 Size:     4 [unused]
//   float Timer;                       // Offset:  244 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[16], immediateIndexed
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
mul r0.x, cb0[15].y, l(0.001000)
add r0.y, -v1.y, l(1.000000)
mad r1.xyz, v1.xyxx, l(1.000000, -1.000000, 1.000000, 0.000000), l(0.000000, 1.000000, 0.000000, 0.000000)
if_nz cb0[6].y
  mul r0.z, r0.x, cb0[7].x
  add r0.w, r0.z, r0.z
  mad r2.xyz, r0.yyyy, l(10.800000, 11.880000, 550.799988, 0.000000), r0.wwww
  round_ni r0.w, r2.x
  frc r3.xyz, r2.xyzx
  mul r4.xyz, r3.xyzx, r3.xyzx
  mad r3.xyz, -r3.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(3.000000, 3.000000, 3.000000, 0.000000)
  mul r3.xyz, r3.xyzx, r4.xyzx
  add r2.xw, r0.wwww, l(170.000000, 0.000000, 0.000000, 171.000000)
  sincos r2.xw, null, r2.xxxw
  mul r2.xw, r2.xxxw, l(43758.542969, 0.000000, 0.000000, 43758.542969)
  frc r2.xw, r2.xxxw
  add r0.w, -r2.x, r2.w
  mad r0.w, r3.x, r0.w, r2.x
  add r2.xyzw, r2.yyzz, l(1000.000000, 1000.000000, 421.000000, 421.000000)
  round_ni r2.xyzw, r2.xyzw
  add r2.xyzw, r2.xyzw, l(170.000000, 171.000000, 170.000000, 171.000000)
  sincos r2.xyzw, null, r2.xyzw
  mul r2.xyzw, r2.xyzw, l(43758.542969, 43758.542969, 43758.542969, 43758.542969)
  frc r2.xyzw, r2.xyzw
  add r2.yw, -r2.xxxz, r2.yyyw
  mad r2.xy, r3.yzyy, r2.ywyy, r2.xzxx
  mul r0.w, r0.w, r2.x
  mul r0.w, r2.y, r0.w
  mad r2.xyz, r0.zzzz, l(0.234000, 0.637000, 0.234000, 0.000000), r1.xyzx
  frc r2.xyz, r2.xyzx
  mul r2.xyz, r2.xyzx, l(443.897491, 397.297302, 491.187103, 0.000000)
  frc r2.xyz, r2.xyzx
  add r3.xyz, r2.yzxy, l(19.190001, 19.190001, 19.190001, 0.000000)
  dp3 r0.z, r2.xyzx, r3.xyzx
  add r2.xyz, r0.zzzz, r2.xyzx
  mul r0.z, r2.z, r2.x
  mul r0.z, r2.y, r0.z
  frc r0.z, r0.z
  mul r0.z, r0.z, r0.z
  mad r0.z, r0.z, r0.z, l(0.300000)
  mul r0.z, r0.z, r0.w
  lt r0.z, r0.z, cb0[6].z
  movc o0.x, r0.z, l(0), l(1.000000)
  mad r2.xyz, v1.xyxx, l(1.000000, -1.000000, 1.000000, 0.000000), l(0.010000, 1.020000, 0.010000, 0.000000)
  mul r2.xyz, r2.xyzx, l(443.897491, 397.297302, 491.187103, 0.000000)
  frc r2.xyz, r2.xyzx
  add r3.xyz, r2.yzxy, l(19.190001, 19.190001, 19.190001, 0.000000)
  dp3 r0.z, r2.xyzx, r3.xyzx
  add r2.xyz, r0.zzzz, r2.xyzx
  mul r0.z, r2.z, r2.x
  mul r0.z, r2.y, r0.z
  frc o0.w, r0.z
  mov o0.y, r0.w
else 
  mov o0.xyw, l(0,0,0,0)
endif 
if_nz cb0[5].z
  mul r2.x, r0.x, cb0[6].x
  mad r0.zw, v1.xxxy, l(0.000000, 0.000000, 1.000000, -1.000000), l(0.000000, 0.000000, 0.000000, 1.000000)
  mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 960.000000, 1080.000000), l(0.000000, 0.000000, 1.000000, 3.000000)
  sincos r3.x, r4.x, r2.x
  mul r2.y, r2.x, r4.x
  mul r2.zw, r2.xxxx, l(0.000000, 0.000000, 0.500000, 0.630000)
  mad r0.zw, r2.xxxy, l(0.000000, 0.000000, 8.000000, 16.000000), r0.zzzw
  dp2 r0.z, r0.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
  mul r0.w, r0.z, l(0.318471)
  frc r0.w, |r0.w|
  mul r0.w, r0.w, l(3.140000)
  lt r0.z, r0.z, l(0.000000)
  movc r0.z, r0.z, -r0.w, r0.w
  sincos r0.z, null, r0.z
  mul r0.z, r0.z, l(43758.542969)
  frc r0.z, r0.z
  mul r0.z, r0.z, r0.z
  mul r0.z, r0.z, l(20.000000)
  mad r0.y, r0.y, l(4320.000000), r2.z
  sincos r0.w, null, r2.w
  mad r0.w, r0.x, cb0[6].x, r0.w
  sincos r0.w, null, r0.w
  add r0.y, r0.w, r0.y
  div r0.w, r0.y, |r3.x|
  frc r0.w, |r0.w|
  mul r0.w, |r3.x|, r0.w
  lt r0.y, r0.y, l(0.000000)
  movc r0.y, r0.y, -r0.w, r0.w
  add r0.w, -r0.y, l(0.950000)
  div r0.y, l(1.000000, 1.000000, 1.000000, 1.000000), -r0.y
  mul_sat r0.y, r0.y, r0.w
  mad r0.w, r0.y, l(-2.000000), l(3.000000)
  mul r0.y, r0.y, r0.y
  mul r0.y, r0.y, r0.w
  mul r0.y, r0.y, r0.z
  mul r0.y, r0.y, cb0[5].w
else 
  mov r0.y, l(0)
endif 
mad r1.xyz, r1.xyzx, l(1920.000000, 1080.000000, 1920.000000, 0.000000), l(-960.000000, -540.000000, -960.000000, 0.000000)
frc r0.x, r0.x
mul r0.x, r0.x, l(0.070000)
mad r0.xzw, r1.xxyz, l(0.500000, 0.000000, 0.500000, 0.500000), r0.xxxx
mul r0.xzw, r0.xxzw, l(443.897491, 0.000000, 397.297302, 491.187103)
frc r0.xzw, r0.xxzw
add r1.xyz, r0.zwxz, l(19.190001, 19.190001, 19.190001, 0.000000)
dp3 r1.x, r0.xzwx, r1.xyzx
add r0.xzw, r0.xxzw, r1.xxxx
mul r0.x, r0.w, r0.x
mul r0.x, r0.z, r0.x
frc r0.x, r0.x
mul r0.z, r0.x, r0.x
mul r0.x, r0.z, r0.x
mad r0.x, r0.x, cb0[4].y, r0.y
movc o0.z, cb0[4].x, r0.x, r0.y
ret 
// Approximately 113 instruction slots used
