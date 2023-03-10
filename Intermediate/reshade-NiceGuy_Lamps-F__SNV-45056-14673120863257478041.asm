//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__NormTex1                     texture  float4          2d            t10      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t10.xyzw, s0, l(0.000000)
add r1.x, -r0.w, l(1.000000)
add_sat r1.x, r1.x, r1.x
mul r1.x, r1.x, l(0.500000)
max r1.x, r1.x, l(0.000100)
rcp r1.x, r1.x
mov r2.x, l(0)
mov r1.yzw, l(0,0,0,0)
mov r2.zw, l(0,0,0,-3)
loop 
  ilt r3.x, l(3), r2.w
  breakc_nz r3.x
  itof r3.x, r2.w
  mul r2.y, r3.x, l(0.002315)
  add r3.xy, r2.xyxx, v1.xyxx
  sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t10.xyzw, s0
  add r4.xyzw, -r0.xyzw, r3.xyzw
  dp4 r2.y, l(0.333000, 0.333000, 0.333000, 500.000000), |r4.xyzw|
  dp2 r2.y, r2.yyyy, r1.xxxx
  min r2.y, r2.y, l(1.000000)
  add r2.y, -r2.y, l(1.000000)
  mad r1.yzw, r3.xxyz, r2.yyyy, r1.yyzw
  add r2.z, r2.y, r2.z
  iadd r2.w, r2.w, l(1)
endloop 
div r0.xyz, r1.yzwy, r2.zzzz
mul r1.xyz, r0.zzzz, l(0.000000, 0.000000, 4.000000, 0.000000)
div r1.xyz, r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000)
mad o0.xyz, -r0.xyzx, l(-1.000000, -1.000000, 1.000000, 0.000000), r1.xyzx
mov o0.w, l(0.972222)
ret 
// Approximately 31 instruction slots used
