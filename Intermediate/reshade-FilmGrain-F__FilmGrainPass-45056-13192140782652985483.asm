//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Timer;                       // Offset:    0 Size:     4
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
dcl_temps 2
dp2 r0.x, v1.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r0.x, r1.x, r0.x
mul r0.y, cb0[0].x, l(0.002234)
mad r0.x, r0.x, l(43758.542969), r0.y
mad r0.y, r1.x, l(53758.546875), -r0.y
frc r0.xy, r0.xyxx
mul r0.y, r0.y, l(6.283185)
sincos null, r0.y, r0.y
lt r0.z, r0.x, l(0.000100)
movc r0.x, r0.z, l(0.000100), r0.x
log r0.z, r0.x
lt r0.x, r0.x, l(0.000100)
mul r0.z, r0.z, l(0.693147)
sqrt r0.z, -r0.z
movc r0.x, r0.x, l(3.141593), r0.z
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.z, r1.xyzx, l(-0.333333, -0.333333, -0.333333, 0.000000)
add r0.z, r0.z, l(1.000000)
mul r0.z, |r0.z|, |r0.z|
mul r0.w, r0.z, r0.z
mul r0.z, r0.w, r0.z
mul r0.z, r0.z, l(0.160000)
mul r0.x, r0.x, r0.z
mad r0.x, r0.x, r0.y, l(0.500000)
mad r0.x, r0.x, l(-0.600000), l(1.300000)
mul o0.xyz, r0.xxxx, r1.xyzx
ret 
// Approximately 27 instruction slots used
