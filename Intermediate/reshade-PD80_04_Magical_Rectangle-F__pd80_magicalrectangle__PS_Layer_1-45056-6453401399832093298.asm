//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 pp;                         // Offset:    0 Size:     8 [unused]
//   bool hasdepth;                     // Offset:    8 Size:     4
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
// TEXCOORD                 2     zw        1     NONE   float     zw
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.zw
dcl_output o0.xyzw
dcl_temps 2
mad r0.xyzw, v1.zwzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
mad r0.xyzw, r0.xyzw, l(6.903278, 6.903278, 6.903278, 6.903278), l(1.000000, 1.000000, 1.000000, 1.000000)
mul r1.xy, r0.zwzz, l(50.000000, 50.000000, 0.000000, 0.000000)
mad r0.xy, -r0.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000), l(1.000000, 1.000000, 0.000000, 0.000000)
mul_sat r0.xy, r0.xyxx, l(100.000000, 100.000000, 0.000000, 0.000000)
mov_sat r1.xy, r1.xyxx
mad r0.zw, r1.xxxy, l(0.000000, 0.000000, -2.000000, -2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
mul r1.xy, r1.xyxx, r1.xyxx
mul r0.zw, r0.zzzw, r1.xxxy
mul r0.z, r0.w, r0.z
mad r1.xy, r0.xyxx, l(-2.000000, -2.000000, 0.000000, 0.000000), l(3.000000, 3.000000, 0.000000, 0.000000)
mul r0.xy, r0.xyxx, r0.xyxx
mul r0.xy, r0.xyxx, r1.xyxx
mul r0.x, r0.x, r0.z
mul r0.x, r0.y, r0.x
sample_l_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
add r0.y, r0.y, l(0.002000)
mul_sat r0.y, r0.y, l(249.999985)
mad r0.z, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.z
movc r0.y, cb0[0].z, r0.y, l(1.000000)
mad r0.z, -r0.x, r0.y, l(1.000000)
mul r0.x, r0.y, r0.x
max r0.y, r0.z, l(0.000000)
mul r0.z, r0.x, l(0.500000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
mad_sat r0.yzw, r1.xxyz, r0.yyyy, r0.zzzz
add r0.yzw, -r1.xxyz, r0.yyzw
mad o0.xyz, r0.xxxx, r0.yzwy, r1.xyzx
mov o0.w, r0.x
ret 
// Approximately 34 instruction slots used
