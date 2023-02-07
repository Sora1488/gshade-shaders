//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int Mode;                          // Offset:    0 Size:     4
//   int Formula;                       // Offset:    4 Size:     4
//   float Contrast;                    // Offset:    8 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
dp3 r1.x, l(0.212600, 0.715200, 0.072200, 0.000000), r0.xyzx
add r1.yzw, r0.xxyz, -r1.xxxx
mad r2.xyz, r1.yzwy, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
ieq r3.xyzw, cb0[0].xyyy, l(1, 1, 2, 3)
movc r2.xyz, r3.xxxx, r2.xyzx, r0.xyzx
movc r2.xyz, cb0[0].xxxx, r2.xyzx, r1.xxxx
mul r4.xyz, r2.xyzx, l(1.570796, 1.570796, 1.570796, 0.000000)
sincos r4.xyz, null, r4.xyzx
mul r4.xyz, r4.xyzx, r4.xyzx
movc r2.xyz, cb0[0].yyyy, r2.xyzx, r4.xyzx
add r4.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
add r5.xyz, |r4.xyzx|, l(0.500000, 0.500000, 0.500000, 0.000000)
div r4.xyz, r4.xyzx, r5.xyzx
add r4.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
movc r2.xyz, r3.yyyy, r4.xyzx, r2.xyzx
mul r4.xyz, r2.xyzx, r2.xyzx
mad r5.xyz, -r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(3.000000, 3.000000, 3.000000, 0.000000)
mul r4.xyz, r4.xyzx, r5.xyzx
movc r2.xyz, r3.zzzz, r4.xyzx, r2.xyzx
mul r4.xyz, r2.xyzx, l(8.656170, 8.656170, 8.656170, 0.000000)
exp r4.xyz, r4.xyzx
mad r5.xyz, r4.xyzx, l(1.052400, 1.052400, 1.052400, 0.000000), l(-1.052480, -1.052480, -1.052480, 0.000000)
add r4.xyz, r4.xyzx, l(20.085501, 20.085501, 20.085501, 0.000000)
div r4.xyz, r5.xyzx, r4.xyzx
movc r2.yzw, r3.wwww, r4.xxyz, r2.xxyz
add r3.yzw, -r2.yyzw, l(0.000000, 1.500000, 1.500000, 1.500000)
mad r3.yzw, r2.yyzw, r3.yyzw, l(0.000000, 0.500000, 0.500000, 0.500000)
mul r4.yzw, r2.yyzw, r3.yyzw
mul r4.x, cb0[0].z, l(2.000000)
mov r2.x, cb0[0].z
ieq r5.xyzw, cb0[0].yyyy, l(4, 5, 6, 7)
movc r2.xyzw, r5.xxxx, r4.xyzw, r2.xyzw
mul r3.yzw, r2.yyzw, r2.yyzw
mul r3.yzw, r2.yyzw, r3.yyzw
mad r4.xyz, r2.yzwy, l(6.000000, 6.000000, 6.000000, 0.000000), l(-15.000000, -15.000000, -15.000000, 0.000000)
mad r4.xyz, r2.yzwy, r4.xyzx, l(10.000000, 10.000000, 10.000000, 0.000000)
mul r3.yzw, r3.yyzw, r4.xxyz
movc r3.yzw, r5.yyyy, r3.yyzw, r2.yyzw
add r4.xyz, r3.yzwy, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r6.xyz, |r4.xyzx|, l(1.250000, 1.250000, 1.250000, 0.000000), l(0.375000, 0.375000, 0.375000, 0.000000)
div r4.xyz, r4.xyzx, r6.xyzx
add r4.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
movc r3.yzw, r5.zzzz, r4.xxyz, r3.yyzw
mad r4.xyz, r3.yzwy, l(1.600000, 1.600000, 1.600000, 0.000000), l(-7.200000, -7.200000, -7.200000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(10.800000, 10.800000, 10.800000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(-4.200000, -4.200000, -4.200000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(-3.600000, -3.600000, -3.600000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(2.700000, 2.700000, 2.700000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(-1.800000, -1.800000, -1.800000, 0.000000)
mad r4.xyz, r3.yzwy, r4.xyzx, l(2.700000, 2.700000, 2.700000, 0.000000)
mul r5.xyz, r3.yzwy, r3.yzwy
mul r4.xyz, r4.xyzx, r5.xyzx
movc r3.yzw, r5.wwww, r4.xxyz, r3.yyzw
mad r4.xyz, r3.yzwy, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
mul r5.xyz, r4.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
add r4.xyz, |r4.xyzx|, l(-2.000000, -2.000000, -2.000000, 0.000000)
mad r4.xyz, r5.xyzx, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
ieq r5.xyz, cb0[0].yyyy, l(8, 9, 10, 0)
movc r2.yzw, r5.xxxx, r4.xxyz, r3.yyzw
ge r3.yzw, l(0.000000, 0.500000, 0.500000, 0.500000), r2.yyzw
swapc r4.xyz, r6.xyz, r3.yzwy, l(0.500000,0.500000,0.500000,0), l(-0.500000,-0.500000,-0.500000,0)
and r3.yzw, r3.yyzw, l(0, 0x3f800000, 0x3f800000, 0x3f800000)
add r6.xyz, r2.yzwy, r6.xyzx
mad r6.xyz, -r6.xyzx, r6.xyzx, r6.xyzx
sqrt r6.xyz, r6.xyzx
add r3.yzw, r3.yyzw, -r6.xxyz
add r4.yzw, r4.xxyz, |r3.yyzw|
mul r4.x, cb0[0].z, l(0.500000)
movc r2.xyzw, r5.yyyy, r4.xyzw, r2.xyzw
mad r3.yzw, r2.yyzw, l(0.000000, -2.000000, -2.000000, -2.000000), l(0.000000, 4.000000, 4.000000, 4.000000)
mad r3.yzw, r3.yyzw, r2.yyzw, l(0.000000, -1.000000, -1.000000, -1.000000)
lt r4.xyz, r2.yzwy, l(0.500000, 0.500000, 0.500000, 0.000000)
or r4.x, r4.y, r4.x
or r4.x, r4.z, r4.x
mul r4.yzw, r2.yyzw, r2.yyzw
add r4.yzw, r4.yyzw, r4.yyzw
movc r3.yzw, r4.xxxx, r4.yyzw, r3.yyzw
movc r2.yzw, r5.zzzz, r3.yyzw, r2.yyzw
mad r3.yzw, r2.yyzw, l(0.000000, 2.000000, 2.000000, 2.000000), r1.xxxx
add r3.yzw, r3.yyzw, l(0.000000, -1.000000, -1.000000, -1.000000)
add r3.yzw, -r0.xxyz, r3.yyzw
mad r3.yzw, r2.xxxx, r3.yyzw, r0.xxyz
add r4.xyz, -r0.xyzx, r2.yzwy
add r2.yzw, -r1.xxxx, r2.yyzw
mad r2.yzw, r2.xxxx, r2.yyzw, r1.xxxx
mad r0.xyz, r2.xxxx, r4.xyzx, r0.xyzx
mov o0.w, r0.w
movc r0.xyz, r3.xxxx, r3.yzwy, r0.xyzx
add r1.xyz, r1.yzwy, r2.yzwy
movc o0.xyz, cb0[0].xxxx, r0.xyzx, r1.xyzx
ret 
// Approximately 92 instruction slots used
