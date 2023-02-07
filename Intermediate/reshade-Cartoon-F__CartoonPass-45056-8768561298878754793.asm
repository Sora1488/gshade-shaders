//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Power;                       // Offset:    0 Size:     4
//   float EdgeSlope;                   // Offset:    4 Size:     4
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
add r0.xyzw, v1.xyxy, l(0.000521, 0.000926, -0.000521, -0.000926)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.zwzz, t0.xyzw, s0
dp3 r0.w, l(0.212600, 0.715200, 0.072200, 0.000000), r1.xyzx
dp4 r0.x, l(0.212600, 0.715200, 0.072200, -1.000000), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000521, -0.000926, -0.000521, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t0.xyzw, s0
dp3 r1.w, l(0.212600, 0.715200, 0.072200, 0.000000), r2.xyzx
dp4 r0.y, l(0.212600, 0.715200, 0.072200, -1.000000), r1.xyzw
dp2 r0.x, r0.xyxx, r0.xyxx
log r0.x, r0.x
mul r0.x, r0.x, cb0[0].y
exp r0.x, r0.x
sample_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t0.wxyz, s0
mad_sat o0.xyz, r0.xxxx, -cb0[0].xxxx, r0.yzwy
ret 
// Approximately 17 instruction slots used
