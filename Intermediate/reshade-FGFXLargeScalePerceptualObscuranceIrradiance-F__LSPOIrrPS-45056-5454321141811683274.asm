//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__VBlurTex                     texture  float4          2d            t14      1 
// __V__ShortBlurTex                 texture  float4          2d            t16      1 
// __V__BlurMaxHistoryTex            texture  float4          2d            t20      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t20
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t14.xyzw, s0
add r0.w, r1.y, r1.x
add r0.w, r1.z, r0.w
mul r0.w, r0.w, l(0.333333)
sample_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t20.xyzw, s0
ge r1.y, l(0.050000), r1.x
if_nz r1.y
  mul r1.y, r1.x, l(399.999969)
else 
  div r1.y, l(1.000000, 1.000000, 1.000000, 1.000000), r1.x
endif 
max r1.x, r1.y, l(1.000000)
min r1.x, r1.x, l(4.000000)
add r1.x, r1.x, l(-1.000000)
mad r1.x, r1.x, l(0.500000), l(1.000000)
mul r1.y, r0.w, r1.x
lt r2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
if_nz r2.x
  dp2 r1.z, r0.xxxx, r1.yyyy
else 
  add r1.w, -r0.x, l(1.000000)
  mad r2.x, -r0.w, r1.x, l(1.000000)
  dp2 r1.w, r1.wwww, r2.xxxx
  add r1.z, -r1.w, l(1.000000)
endif 
if_nz r2.y
  dp2 r1.w, r0.yyyy, r1.yyyy
else 
  add r2.x, -r0.y, l(1.000000)
  mad r2.y, -r0.w, r1.x, l(1.000000)
  dp2 r2.x, r2.xxxx, r2.yyyy
  add r1.w, -r2.x, l(1.000000)
endif 
if_nz r2.z
  dp2 r1.y, r0.zzzz, r1.yyyy
else 
  add r2.x, -r0.z, l(1.000000)
  mad r0.w, -r0.w, r1.x, l(1.000000)
  dp2 r0.w, r2.xxxx, r0.wwww
  add r1.y, -r0.w, l(1.000000)
endif 
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t16.xyzw, s0
add r0.w, r2.y, r2.x
add r0.w, r2.z, r0.w
mad r0.w, -r0.w, l(0.333333), l(0.500000)
mad r0.w, r0.w, l(0.750000), l(0.500000)
lt r1.x, r1.z, l(0.500000)
if_nz r1.x
  dp2 r2.x, r1.zzzz, r0.wwww
else 
  add r1.x, -r1.z, l(1.000000)
  add r1.z, -r0.w, l(1.000000)
  dp2 r1.x, r1.xxxx, r1.zzzz
  add r2.x, -r1.x, l(1.000000)
endif 
lt r1.x, r1.w, l(0.500000)
if_nz r1.x
  dp2 r2.y, r1.wwww, r0.wwww
else 
  add r1.x, -r1.w, l(1.000000)
  add r1.z, -r0.w, l(1.000000)
  dp2 r1.x, r1.xxxx, r1.zzzz
  add r2.y, -r1.x, l(1.000000)
endif 
lt r1.x, r1.y, l(0.500000)
if_nz r1.x
  dp2 r2.z, r1.yyyy, r0.wwww
else 
  add r1.x, -r1.y, l(1.000000)
  add r0.w, -r0.w, l(1.000000)
  dp2 r0.w, r1.xxxx, r0.wwww
  add r2.z, -r0.w, l(1.000000)
endif 
max r1.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r1.xyzx, l(0.900000, 0.900000, 0.900000, 0.000000), r0.xyzx
ret 
// Approximately 78 instruction slots used
