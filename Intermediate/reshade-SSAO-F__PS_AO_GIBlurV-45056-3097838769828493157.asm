//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__texOcclusion1                texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r1.xyzw, v1.xyxy, l(0.000000, 0.001000, 0.001000, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
add r1.xy, -r0.xxxx, r0.zyzz
mul r0.xy, r1.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
mov r0.z, l(0.000001)
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r0.w, r0.w
mul r0.xyz, r0.wwww, r0.xyzx
dp3 r0.x, r0.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
mul r0.x, r0.x, l(0.100000)
mov r1.z, l(0.000001)
mov r2.xyzw, l(0,0,0,0)
mov r0.yz, l(0,0,-11,0)
loop 
  ilt r0.w, l(11), r0.z
  breakc_nz r0.w
  itof r0.w, r0.z
  mad r3.xyzw, r0.wwww, l(0.000000, 0.000926, 0.000000, 0.000926), v1.xyxy
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.zwzz, t6.xyzw, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, r3.zwzz, t2.yzwx, s0, l(0.000000)
  mad r1.w, -r0.w, l(999.000000), l(1000.000000)
  div r0.w, r0.w, r1.w
  add r3.xyzw, r3.xyzw, l(0.000000, 0.001000, 0.001000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r1.w, r3.xyxx, t2.yzwx, s0, l(0.000000)
  mad r3.x, -r1.w, l(999.000000), l(1000.000000)
  div r1.w, r1.w, r3.x
  sample_l_indexable(texture2d)(float,float,float,float) r3.x, r3.zwzz, t2.xyzw, s0, l(0.000000)
  mad r3.y, -r3.x, l(999.000000), l(1000.000000)
  div r3.x, r3.x, r3.y
  add r5.y, -r0.w, r1.w
  add r5.x, -r0.w, r3.x
  mul r1.xy, r5.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
  dp3 r0.w, r1.xyzx, r1.xyzx
  rsq r0.w, r0.w
  mul r1.xyw, r0.wwww, r1.xyxz
  dp3 r0.w, r1.xywx, l(0.333000, 0.333000, 0.333000, 0.000000)
  imax r1.x, -r0.z, r0.z
  iadd r1.x, -r1.x, l(11)
  itof r1.x, r1.x
  mad r0.w, r0.w, l(0.100000), -r0.x
  mad r0.w, -|r0.w|, l(700.000000), l(1.000000)
  max r0.w, r0.w, l(0.000000)
  mul r1.y, r0.w, r1.x
  mad r2.xyzw, r4.xyzw, r1.yyyy, r2.xyzw
  mad r0.y, r1.x, r0.w, r0.y
  iadd r0.z, r0.z, l(1)
endloop 
add r0.x, r0.y, l(0.000100)
div o0.xyzw, r2.xyzw, r0.xxxx
ret 
// Approximately 58 instruction slots used
