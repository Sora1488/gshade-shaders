//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int iUIBackground;                 // Offset:    0 Size:     4
//   float3 fUIColorBackground;         // Offset:    4 Size:    12
//   float3 fUIColorLines;              // Offset:   16 Size:    12
//   float fUIStrength;                 // Offset:   28 Size:     4
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
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r1.xyzw, v1.xyxy, l(0.000000, -0.000926, 0.000000, 0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r2.x, r0.y, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r2.y, r0.y, r0.z
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r2.z, r0.y, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r2.w, r0.y, r0.z
add r1.xyzw, v1.xyxy, l(0.000521, -0.000926, -0.000521, 0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r3.x, r0.y, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r3.y, r0.y, r0.z
add r1.xyzw, v1.xyxy, l(0.000521, 0.000926, -0.000521, -0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r3.z, r0.y, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r3.w, r0.y, r0.z
min r0.y, r2.w, r2.z
min r0.y, r0.y, r2.y
min r0.y, r0.y, r2.x
min r0.z, r3.w, r3.z
min r0.z, r0.z, r3.y
min r0.z, r0.z, r3.x
max r0.w, r2.w, r2.z
max r0.w, r0.w, r2.y
max r0.w, r0.w, r2.x
max r1.x, r3.w, r3.z
max r1.x, r1.x, r3.y
max r1.x, r1.x, r3.x
max r0.w, r0.w, r1.x
min r0.y, r0.z, r0.y
add r0.y, -r0.y, r0.w
add r0.y, r0.y, l(0.000010)
div r0.x, r0.x, r0.y
div r1.xyzw, r2.xyzw, r0.yyyy
div r2.xyzw, r3.xyzw, r0.yyyy
add r1.xyzw, -r0.xxxx, r1.xyzw
add r0.xyzw, -r0.xxxx, r2.xyzw
add r1.xy, -|r1.ywyy|, |r1.xzxx|
max r1.x, |r1.y|, |r1.x|
add r0.xy, -|r0.ywyy|, |r0.xzxx|
max r0.x, |r0.y|, |r0.x|
max r0.x, r0.x, r1.x
if_z cb0[0].x
  sample_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t0.wxyz, s0
  mul r1.x, r0.x, cb0[1].w
  add r1.yzw, -r0.yyzw, cb0[1].xxyz
  mad o0.xyz, r1.xxxx, r1.yzwy, r0.yzwy
  ret 
else 
  mul r0.x, r0.x, cb0[1].w
  add r0.yzw, -cb0[0].yyzw, cb0[1].xxyz
  mad o0.xyz, r0.xxxx, r0.yzwy, cb0[0].yzwy
  ret 
endif 
ret 
// Approximately 70 instruction slots used
