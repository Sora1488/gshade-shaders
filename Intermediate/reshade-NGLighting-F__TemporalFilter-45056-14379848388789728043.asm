//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__TexColor                     texture  float4          2d             t4      1 
// __V__texMotionVectors             texture  float4          2d             t8      1 
// __V__SSSR_ReflectionTex           texture  float4          2d            t10      1 
// __V__SSSR_POGColTex               texture  float4          2d            t14      1 
// __V__SSSR_FilterTex1              texture  float4          2d            t18      1 
// __V__SSSR_FilterTex3              texture  float4          2d            t22      1 
// __V__SSSR_PNormalTex              texture  float4          2d            t24      1 
// __V__SSSR_NormTex                 texture  float4          2d            t26      1 
// __V__SSSR_HLTex1                  texture  float4          2d            t36      1 
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
// SV_TARGET                1   x           1   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t18
dcl_resource_texture2d (float,float,float,float) t22
dcl_resource_texture2d (float,float,float,float) t24
dcl_resource_texture2d (float,float,float,float) t26
dcl_resource_texture2d (float,float,float,float) t36
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.x
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xy, v1.xyxx, t8.xyzw, s1
add r0.zw, r0.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r1.x, r0.zwzz, t36.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r1.y, v1.xyxx, t2.yxzw, s0, l(0.000000)
mad r1.z, -r1.y, l(999.000000), l(1000.000000)
div r1.y, r1.y, r1.z
lt r1.z, l(0.990000), r1.y
if_nz r1.z
  mov r1.z, l(0)
else 
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t26.xyzw, s0
  sample_indexable(texture2d)(float,float,float,float) r1.w, r0.zwzz, t24.xyzw, s0
  sample_indexable(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t4.xyzw, s0
  dp3 r2.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
  mul r3.w, r3.y, l(0.331000)
  mad r3.w, r3.x, l(-0.169000), -r3.w
  mad r3.w, r3.z, l(0.500000), r3.w
  mul r3.y, r3.y, l(0.419000)
  mad r3.x, r3.x, l(0.500000), -r3.y
  mad r3.x, -r3.z, l(0.081000), r3.x
  add r3.x, r3.x, r3.w
  add r2.w, r2.w, r3.x
  sample_indexable(texture2d)(float,float,float,float) r3.x, r0.zwzz, t14.xyzw, s0
  add r2.w, r2.w, l(1.003922)
  add r1.w, -r1.w, r1.y
  mad r3.yz, v1.xxyx, l(0.000000, 2.000000, 2.000000, 0.000000), l(0.000000, -1.000000, -1.000000, 0.000000)
  mul r4.z, r1.y, l(1000.000000)
  mul r3.yz, r3.yyzy, r4.zzzz
  mul r4.xy, r3.yzyy, l(0.872665, 0.872665, 0.000000, 0.000000)
  dp3 r1.y, r4.xyzx, r4.xyzx
  rsq r1.y, r1.y
  mul r3.yzw, r1.yyyy, r4.xxyz
  dp3 r1.y, r2.xyzx, r3.yzwy
  add r2.x, -r3.x, r2.w
  mul r2.x, |r2.x|, l(0.040000)
  mad r1.y, |r1.w|, r1.y, r2.x
  ge r1.z, l(0.004000), r1.y
endif 
max r1.y, r0.w, r0.z
min r1.w, r0.w, r0.z
lt r1.y, l(1.000000), r1.y
lt r1.w, r1.w, l(0.000000)
or r1.y, r1.w, r1.y
movc r1.y, r1.y, l(0), l(1.000000)
and r1.z, r1.z, l(0x3f800000)
min r1.y, r1.z, r1.y
ne r1.y, l(0.000000, 0.000000, 0.000000, 0.000000), r1.y
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t10.xyzw, s0
max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r0.zwzz, t18.xyzw, s0
and r1.y, r1.y, l(0x3f800000)
mul r1.x, r1.y, r1.x
min r1.x, r1.x, l(64.000000)
sample_indexable(texture2d)(float,float,float,float) r1.yzw, r0.zwzz, t22.wxyz, s0
add r0.z, r1.z, r1.y
add r0.z, r1.w, r0.z
add r0.w, r3.y, r3.x
add r0.w, r3.z, r0.w
mul r0.xyw, r0.xyxw, l(80.000000, 80.000000, 0.000000, 0.333333)
mad r0.z, r0.z, l(0.333333), -r0.w
min r0.z, |r0.z|, l(1.000000)
dp2 r0.x, r0.xyxx, r0.xyxx
sqrt r0.x, r0.x
add r0.xz, -r0.xxzx, l(1.000000, 0.000000, 1.000000, 0.000000)
max r0.x, r0.x, l(0.000000)
add r0.y, -r0.z, l(1.000000)
mad r0.x, r0.x, r0.y, r0.z
mad r0.x, r1.x, r0.x, l(1.000000)
div r0.y, l(1.000000, 1.000000, 1.000000, 1.000000), r0.x
add r1.xyzw, r2.xyzw, -r3.xyzw
mad r1.xyzw, r0.yyyy, r1.xyzw, r3.xyzw
max o0.xyzw, r1.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
mov o1.x, r0.x
ret 
// Approximately 74 instruction slots used