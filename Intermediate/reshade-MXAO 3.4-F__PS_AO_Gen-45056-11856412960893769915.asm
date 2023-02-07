//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texDistance                  texture  float4          2d             t6      1 
// __V__texSurfaceNormal             texture  float4          2d             t8      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t8.xyzw, s0
mad r1.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.w, v1.xyxx, t6.yzwx, s0, l(0.000000)
mad r2.xy, v1.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
mov r2.z, l(1.000000)
mul r2.w, r1.w, l(0.001000)
mul r3.xyz, r1.xyzx, r2.wwww
mad r2.xyz, r2.xyzx, r1.wwww, r3.xyzx
mul r1.w, r2.z, l(24.000000)
div r1.w, l(1.250000), r1.w
mul r2.w, r1.w, l(3200.000000)
mul r3.x, r0.w, l(6.283185)
sincos r3.x, r4.x, r3.x
mov r4.y, r3.x
mul r3.xy, r1.wwww, r4.xyxx
mov r4.z, l(1.000000)
mov r3.zw, r3.xxxy
mov r1.w, l(0)
mov r4.w, l(0)
loop 
  itof r5.x, r4.w
  ge r5.y, r5.x, l(24.000000)
  breakc_nz r5.y
  dp2 r6.x, r3.zwzz, l(0.575000, -0.818150, 0.000000, 0.000000)
  dp2 r6.y, r3.zwzz, l(0.818150, 0.575000, 0.000000, 0.000000)
  mul r5.yz, r6.xxyx, l(0.000000, 1.000000, 1.777778, 0.000000)
  add r5.w, r0.w, r5.x
  mad r5.yz, r5.yyzy, r5.wwww, v1.xxyx
  mul r5.x, r2.w, r5.x
  log r5.x, r5.x
  mad_sat r5.x, r5.x, l(0.200000), l(-0.600000)
  mul r5.x, r5.x, l(5.000000)
  mad r4.xy, r5.yzyy, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
  round_z r5.x, r5.x
  sample_l_indexable(texture2d)(float,float,float,float) r5.x, r5.yzyy, t6.xyzw, s0, r5.x
  mad r5.xyz, r4.xyzx, r5.xxxx, -r2.xyzx
  dp3 r4.x, r5.xyzx, r5.xyzx
  rsq r4.x, r4.x
  dp3 r4.y, r5.xyzx, r1.xyzx
  div r5.x, l(-0.160000), r4.x
  add r5.x, r5.x, l(1.000000)
  max r5.x, r5.x, l(0.000000)
  mad_sat r4.x, r4.y, r4.x, l(-0.200000)
  mad r1.w, r5.x, r4.x, r1.w
  iadd r4.w, r4.w, l(1)
  mov r3.zw, r6.xxxy
endloop 
mul_sat r0.w, r1.w, l(0.082351)
sqrt o0.w, r0.w
mov o0.xyz, r0.xyzx
ret 
// Approximately 51 instruction slots used