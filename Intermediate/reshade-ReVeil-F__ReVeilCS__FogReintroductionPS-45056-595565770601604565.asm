//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReVeilCS__BackBuffer         texture  float4          2d             t8      1 
// __V__ReVeilCS__Airlight           texture  float4          2d            t14      1 
// __V__ReVeilCS__OriginalImage      texture  float4          2d            t16      1 
// __V__ReVeilCS__Transmission       texture  float4          2d            t18      1 
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
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t18
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t18.xyzw, s0
max r0.x, r0.x, l(0.050000)
eq r0.y, r0.x, l(1.000000)
if_nz r0.y
  discard_nz l(-1)
  mov o0.xyzw, l(0,0,0,0)
else 
  sample_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t14.yxzw, s0
  sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t8.xyzw, s0
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t16.xyzw, s0
  dp3 r0.z, r2.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
  add r0.z, -r0.y, r0.z
  div r0.z, r0.z, r0.x
  dp3 r0.w, r1.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
  add r0.w, -r0.y, r0.w
  div r0.w, r0.w, r0.x
  add r0.zw, r0.yyyy, r0.zzzw
  add r0.w, -r0.z, r0.w
  mad r0.z, r0.x, r0.w, r0.z
  add r0.z, -r0.y, r0.z
  mad r0.x, r0.z, r0.x, r0.y
  mul r0.yz, r1.yyyy, l(0.000000, 0.331264, 0.418688, 0.000000)
  mad r0.y, r1.x, l(-0.168736), -r0.y
  mad r0.y, r1.z, l(0.500000), r0.y
  mad r0.z, r1.x, l(0.500000), -r0.z
  mad r0.z, -r1.z, l(0.081312), r0.z
  mad o0.x, r0.z, l(1.402000), r0.x
  mad r0.w, -r0.y, l(0.344136), r0.x
  mad o0.y, -r0.z, l(0.714136), r0.w
  mad o0.z, r0.y, l(1.772000), r0.x
  mov o0.w, l(1.000000)
endif 
ret 
// Approximately 33 instruction slots used