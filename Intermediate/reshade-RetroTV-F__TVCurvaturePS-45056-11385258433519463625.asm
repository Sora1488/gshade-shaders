//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__target1                      texture  float4          2d             t2      1 
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
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 1
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
add r0.xy, r0.xyxx, r0.xyxx
mul r0.zw, r0.yyyx, r0.yyyx
mul r0.xy, r0.xyxx, r0.zwzz
mad r0.xy, r0.xyxx, l(0.050000, 0.050000, 0.000000, 0.000000), v1.xyxx
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, r0.xyxx, t2.xyzw, s0
ret 
// Approximately 7 instruction slots used