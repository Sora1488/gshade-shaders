//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 MouseCoords;                // Offset:    0 Size:     8
//   float Timer;                       // Offset:    8 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texHDR2                      texture  float4          2d             t2      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t4      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.wxyz, s0
mad r0.y, r0.x, l(2.000000), l(-1.000000)
lt r0.z, r0.x, l(0.500000)
mul r0.yw, |r0.yyyy|, l(0.000000, 26.500002, 0.000000, 0.082596)
movc r0.y, r0.z, r0.w, r0.y
mul r0.zw, r0.yyyy, l(0.000000, 0.000000, -0.000182, 0.000107)
exp r1.xyzw, r0.zzww
mad r0.z, -r0.y, l(0.000130), l(1.000000)
mov r0.w, l(0)
mov r2.xyzw, l(0,0,0,-2)
loop 
  itof r3.x, r2.w
  ge r3.y, r3.x, l(2.000000)
  breakc_nz r3.y
  mul r3.y, r0.y, r3.x
  mad r3.yz, r3.yyyy, l(0.000000, 0.000040, 0.000171, 0.000000), v1.xxyx
  mad r3.yz, r3.yyzy, l(0.000000, 2.000000, 2.000000, 0.000000), l(0.000000, -1.000000, -1.000000, 0.000000)
  mul r4.xyzw, r1.xyzw, r3.yzyz
  mad r4.xyzw, r4.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), l(0.500000, 0.500000, 0.500000, 0.500000)
  sample_l_indexable(texture2d)(float,float,float,float) r5.x, r4.xyxx, t2.xyzw, s0, l(0.000000)
  mad r3.yz, r3.yyzy, l(0.000000, 0.500000, 0.500000, 0.000000), l(0.000000, 0.500000, 0.500000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r5.y, r3.yzyy, t2.xyzw, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r5.z, r4.zwzz, t2.xyzw, s0, l(0.000000)
  mul r3.yzw, r0.zzzz, r5.xxyz
  dp3 r4.x, r3.yzwy, l(0.333000, 0.333000, 0.333000, 0.000000)
  dp3 r4.y, r3.yzwy, r3.yzwy
  sqrt r4.y, r4.y
  add r4.x, r4.y, r4.x
  add r4.x, r4.x, l(0.100000)
  mul r4.x, |r4.x|, |r4.x|
  mul r4.x, r4.x, r4.x
  mad r3.x, r4.x, r4.x, |r3.x|
  mad r2.xyz, r3.yzwy, r3.xxxx, r2.xyzx
  add r0.w, r0.w, r3.x
  iadd r2.w, r2.w, l(1)
endloop 
div r0.yzw, r2.xxyz, r0.wwww
sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t6.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div_sat r1.x, r1.x, r1.y
mul r1.yz, cb0[0].xxyx, l(0.000000, 0.000521, 0.000926, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.yzyy, t6.yxzw, s0, l(0.000000)
mad r1.z, -r1.y, l(999.000000), l(1000.000000)
div r1.y, r1.y, r1.z
mov r1.zw, l(0,0,0,5)
loop 
  ige r2.x, l(0), r1.w
  breakc_nz r2.x
  add r1.z, r1.y, r1.z
  iadd r1.w, r1.w, l(-1)
endloop 
mul_sat r1.y, r1.z, l(0.200000)
mad r1.z, r1.y, l(-2.000000), l(3.000000)
mul r1.y, r1.y, r1.y
mul r1.y, r1.y, r1.z
mad r1.z, r1.x, l(-2.000000), l(3.000000)
mul r1.x, r1.x, r1.x
mul r1.w, r1.x, r1.z
lt r1.w, r1.w, r1.y
mad r1.x, r1.z, r1.x, -r1.y
div r1.z, r1.x, r1.y
mul r1.y, r1.y, l(3.228072)
div_sat r1.x, r1.x, r1.y
movc r1.x, r1.w, r1.z, r1.x
mad_sat r1.x, r1.x, l(0.500000), l(0.500000)
mad r1.y, r1.x, l(2.000000), l(-1.000000)
lt r1.x, r1.x, l(0.500000)
mul r1.yz, |r1.yyyy|, l(0.000000, 26.500002, 0.082596, 0.000000)
movc r1.x, r1.x, r1.z, r1.y
sample_indexable(texture2d)(float,float,float,float) r1.yzw, v1.xyxx, t4.wxyz, s0
add r1.x, r1.x, l(-0.200000)
mul_sat r1.x, r1.x, l(0.555556)
mad r2.x, r1.x, l(-2.000000), l(3.000000)
mul r1.x, r1.x, r1.x
mul r1.x, r1.x, r2.x
add r0.yzw, r0.yyzw, -r1.yyzw
mad o0.xyz, r1.xxxx, r0.yzwy, r1.yzwy
mov o0.w, r0.x
ret 
// Approximately 79 instruction slots used