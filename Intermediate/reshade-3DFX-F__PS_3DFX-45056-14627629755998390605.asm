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
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
mul r0.x, v1.y, l(540.000000)
frc r0.x, |r0.x|
add r0.x, r0.x, r0.x
lt r0.y, v1.y, l(0.000000)
movc r0.x, r0.y, -r0.x, r0.x
lt r0.x, r0.x, l(1.000000)
movc r0.x, r0.x, l(0), l(0.100000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0
mad r0.yzw, r1.xxyz, l(0.000000, 255.000000, 255.000000, 255.000000), l(0.000000, -1.000000, -0.500000, -1.000000)
mov o0.w, r1.w
mul r0.yzw, r0.yyzw, l(0.000000, 0.125490, 0.250980, 0.125490)
round_ni r0.yzw, r0.yyzw
mad o0.xyz, r0.yzwy, l(0.031250, 0.015625, 0.031250, 0.000000), r0.xxxx
ret 
// Approximately 14 instruction slots used
