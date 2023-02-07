//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool enable_test;                  // Offset:    0 Size:     4 [unused]
//   int grainMotion;                   // Offset:    4 Size:     4
//   float grainAdjust;                 // Offset:    8 Size:     4
//   int grainSize;                     // Offset:   12 Size:     4
//   int grainOrigColor;                // Offset:   16 Size:     4 [unused]
//   bool use_negnoise;                 // Offset:   20 Size:     4 [unused]
//   float grainColor;                  // Offset:   24 Size:     4
//   float grainAmount;                 // Offset:   28 Size:     4 [unused]
//   float grainIntensity;              // Offset:   32 Size:     4
//   float grainDensity;                // Offset:   36 Size:     4
//   float grainIntHigh;                // Offset:   40 Size:     4 [unused]
//   float grainIntLow;                 // Offset:   44 Size:     4 [unused]
//   bool enable_depth;                 // Offset:   48 Size:     4 [unused]
//   bool display_depth;                // Offset:   52 Size:     4 [unused]
//   float depthStart;                  // Offset:   56 Size:     4 [unused]
//   float depthEnd;                    // Offset:   60 Size:     4 [unused]
//   float depthCurve;                  // Offset:   64 Size:     4 [unused]
//   float Timer;                       // Offset:   68 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__pd80_filmgrain__texPerm      texture  float4          2d             t4      1 
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
dcl_constantbuffer CB0[5], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 9
mul r0.xy, v1.xyxx, l(1920.000000, 1080.000000, 0.000000, 0.000000)
round_ni r0.zw, r0.xxxy
frc r0.xy, r0.xyxx
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 0.003906, 0.003906), l(0.000000, 0.000000, 0.001953, 0.001953)
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 256.000000, 256.000000), l(0.000000, 0.000000, -0.001953, -0.001953)
itof r1.x, cb0[0].w
div r0.zw, r0.zzzw, r1.xxxx
round_ne r0.zw, r0.zzzw
mul r0.zw, r1.xxxx, r0.zzzw
mad r1.xy, r0.zwzz, l(0.003906, 0.003906, 0.000000, 0.000000), l(0.003906, 0.003906, 0.000000, 0.000000)
dp2 r1.x, r1.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r1.x, null, r1.x
mul r1.y, cb0[4].y, l(1000.000000)
ge r1.y, r1.y, -r1.y
movc r1.yz, r1.yyyy, l(0,1000.000000,0.001000,0), l(0,-1000.000000,-0.001000,0)
mul r1.z, r1.z, cb0[4].y
frc r1.z, r1.z
mad r1.y, r1.y, r1.z, l(43758.542969)
movc r1.y, cb0[0].y, r1.y, l(43759.542969)
mul r1.x, r1.y, r1.x
mul r1.x, r1.x, cb0[0].z
mul r1.x, r1.x, l(1.364700)
frc r1.x, r1.x
mad r2.z, r1.x, l(2.000000), l(-1.000000)
mov r2.yw, l(0,0.009766,0,0.009766)
sample_indexable(texture2d)(float,float,float,float) r1.zw, r2.zwzz, t4.zwxy, s0
mad r1.zw, r1.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
add r2.zw, r0.xxxy, l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r3.y, r1.zwzz, r2.zwzz
mul r1.zw, r0.zzzw, l(0.000000, 0.000000, 0.003906, 0.003906)
mad r4.xyzw, r0.zwzw, l(0.003906, 0.003906, 0.003906, 0.003906), l(0.000000, 0.003906, 0.003906, 0.000000)
dp2 r0.z, r1.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r0.z, null, r0.z
mul r0.z, r1.y, r0.z
mul r0.z, r0.z, cb0[0].z
frc r0.z, r0.z
mad r5.x, r0.z, l(2.000000), l(-1.000000)
mov r5.yw, l(0,0.009766,0,0.009766)
sample_indexable(texture2d)(float,float,float,float) r1.zw, r5.xyxx, t4.zwxy, s0
mad r1.zw, r1.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r5.x, r1.zwzz, r0.xyxx
dp2 r0.w, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
dp2 r1.z, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r1.z, null, r1.z
mul r1.z, r1.y, r1.z
mul r1.z, r1.z, cb0[0].z
mul r1.z, r1.z, l(1.215400)
frc r1.z, r1.z
sincos r0.w, null, r0.w
mul r0.w, r1.y, r0.w
mul r0.w, r0.w, cb0[0].z
mul r0.w, r0.w, l(1.345300)
frc r0.w, r0.w
mad r2.x, r0.w, l(2.000000), l(-1.000000)
sample_indexable(texture2d)(float,float,float,float) r1.yw, r2.xyxx, t4.zxwy, s0
mad r1.yw, r1.yyyw, l(0.000000, 4.000000, 0.000000, 4.000000), l(0.000000, -1.000000, 0.000000, -1.000000)
add r4.xyzw, r0.xyxy, l(-0.000000, -1.000000, -1.000000, -0.000000)
dp2 r3.x, r1.ywyy, r4.zwzz
mad r5.z, r1.z, l(2.000000), l(-1.000000)
sample_indexable(texture2d)(float,float,float,float) r1.yw, r5.zwzz, t4.zxwy, s0
mad r1.yw, r1.yyyw, l(0.000000, 4.000000, 0.000000, 4.000000), l(0.000000, -1.000000, 0.000000, -1.000000)
dp2 r5.y, r1.ywyy, r4.xyxx
add r1.yw, r3.xxxy, -r5.xxxy
mul r2.xy, r0.xyxx, r0.xyxx
mul r2.xy, r0.xyxx, r2.xyxx
mad r3.xy, r0.xyxx, l(6.000000, 6.000000, 0.000000, 0.000000), l(-15.000000, -15.000000, 0.000000, 0.000000)
mad r3.xy, r0.xyxx, r3.xyxx, l(10.000000, 10.000000, 0.000000, 0.000000)
mul r2.xy, r2.xyxx, r3.xyxx
mad r1.yw, r2.xxxx, r1.yyyw, r5.xxxy
add r1.w, -r1.y, r1.w
mad r3.y, r2.y, r1.w, r1.y
mad r5.x, r0.z, l(2.000000), l(-1.000000)
mad r6.x, r0.z, l(2.000000), l(-1.000000)
mov r5.yw, l(0,0.013672,0,0.013672)
sample_indexable(texture2d)(float,float,float,float) r1.yw, r5.xyxx, t4.zxwy, s0
mad r1.yw, r1.yyyw, l(0.000000, 4.000000, 0.000000, 4.000000), l(0.000000, -1.000000, 0.000000, -1.000000)
dp2 r5.x, r1.ywyy, r0.xyxx
mad r7.z, r1.x, l(2.000000), l(-1.000000)
mad r8.z, r1.x, l(2.000000), l(-1.000000)
mov r7.yw, l(0,0.013672,0,0.013672)
sample_indexable(texture2d)(float,float,float,float) r1.xy, r7.zwzz, t4.xyzw, s0
mad r1.xy, r1.xyxx, l(4.000000, 4.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
dp2 r1.y, r1.xyxx, r2.zwzz
mad r7.x, r0.w, l(2.000000), l(-1.000000)
mad r8.x, r0.w, l(2.000000), l(-1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r7.xyxx, t4.zwxy, s0
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r1.x, r0.zwzz, r4.zwzz
mad r5.z, r1.z, l(2.000000), l(-1.000000)
mad r6.z, r1.z, l(2.000000), l(-1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r5.zwzz, t4.zwxy, s0
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r5.y, r0.zwzz, r4.xyxx
add r0.zw, r1.xxxy, -r5.xxxy
mad r0.zw, r2.xxxx, r0.zzzw, r5.xxxy
add r0.w, -r0.z, r0.w
mad r3.z, r2.y, r0.w, r0.z
mov r8.yw, l(0,0.005859,0,0.005859)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r8.zwzz, t4.zwxy, s0
sample_indexable(texture2d)(float,float,float,float) r1.xy, r8.xyxx, t4.xyzw, s0
mad r1.xy, r1.xyxx, l(4.000000, 4.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
dp2 r1.x, r1.xyxx, r4.zwzz
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r1.y, r0.zwzz, r2.zwzz
mov r6.yw, l(0,0.005859,0,0.005859)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r6.xyxx, t4.zwxy, s0
sample_indexable(texture2d)(float,float,float,float) r1.zw, r6.zwzz, t4.zwxy, s0
mad r1.zw, r1.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r4.y, r1.zwzz, r4.xyxx
mad r0.zw, r0.zzzw, l(0.000000, 0.000000, 4.000000, 4.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
dp2 r4.x, r0.zwzz, r0.xyxx
add r0.xy, r1.xyxx, -r4.xyxx
mad r0.xy, r2.xxxx, r0.xyxx, r4.xyxx
add r0.y, -r0.x, r0.y
mad r3.x, r2.y, r0.y, r0.x
mul r0.x, r3.x, cb0[2].x
mad r0.yzw, r3.xxyz, cb0[2].xxxx, -r0.xxxx
mad r0.xyz, cb0[1].zzzz, r0.yzwy, r0.xxxx
lt r1.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r0.xyzx
lt r2.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r0.xyz, |r0.xyzx|
iadd r1.xyz, -r1.xyzx, r2.xyzx
itof r1.xyz, r1.xyzx
add r0.w, -cb0[2].y, l(11.000000)
max r0.w, r0.w, l(0.100000)
mul r0.xyz, r0.xyzx, r0.wwww
exp r0.xyz, r0.xyzx
mad r0.xyz, r0.xyzx, r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul_sat o0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
mov o0.w, l(1.000000)
ret 
// Approximately 131 instruction slots used
