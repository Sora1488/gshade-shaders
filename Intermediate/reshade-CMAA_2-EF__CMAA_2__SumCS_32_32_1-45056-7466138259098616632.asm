//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__CMAA_2__ZShapes              texture  float4          2d             t0      1 
// V__CMAA_2__wSum                       UAV  float4          2d             u0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Input
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Output
cs_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_uav_typed_texture2d (float,float,float,float) u0
dcl_input vThreadGroupID.xy
dcl_input vThreadIDInGroup.xy
dcl_input vThreadID.xy
dcl_temps 2
dcl_tgsm_raw g0, 4
dcl_thread_group 32, 32, 1
ieq r0.xy, vThreadIDInGroup.xyxx, l(0, 0, 0, 0)
and r0.x, r0.y, r0.x
if_nz r0.x
  store_raw g0.x, l(0), l(0)
endif 
sync_g_t
imad r0.yz, vThreadID.xxyx, l(0, 2, 2, 0), l(0, 1, 1, 0)
utof r0.yz, r0.yyzy
mul r0.yz, r0.yyzy, l(0.000000, 0.000521, 0.000926, 0.000000)
gather4_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.yzyy, t0.xyzw, s0.w
lt r1.xyzw, l(0.015294, 0.015294, 0.015294, 0.015294), r1.xyzw
and r1.xyzw, r1.xyzw, l(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000)
dp4 r0.y, r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
ftou r0.y, r0.y
atomic_iadd g0, l(0), r0.y
sync_g_t
if_nz r0.x
  ld_raw r0.x, l(0), g0.xxxx
  ubfe r0.y, l(8), l(8), r0.x
  and r0.x, r0.x, l(255)
  utof r1.xyzw, r0.yxyy
  mul r0.xyzw, r1.xyzw, l(0.003922, 0.003922, 0.003922, 0.003922)
  store_uav_typed u0.xyzw, vThreadGroupID.xyyy, r0.xyzw
endif 
ret 
// Approximately 25 instruction slots used
