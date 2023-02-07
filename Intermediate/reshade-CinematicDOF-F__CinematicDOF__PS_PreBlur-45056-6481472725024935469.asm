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
// TEXCOORD                 1     z         1     NONE   float       
// TEXCOORD                 2      w        1     NONE   float       
// TEXCOORD                 3   x           2     NONE   float       
// TEXCOORD                 4    y          2     NONE   float       
// TEXCOORD                 5     z         2     NONE   float       
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
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0, l(0.000000)
log r0.xyz, |r0.xyzx|
mov o0.w, r0.w
mul r0.xyz, r0.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
exp r0.xyz, r0.xyzx
mad r1.xyz, -r0.xyzx, l(0.900000, 0.900000, 0.900000, 0.000000), l(1.001000, 1.001000, 1.001000, 0.000000)
max r1.xyz, r1.xyzx, l(0.001000, 0.001000, 0.001000, 0.000000)
div o0.xyz, r0.xyzx, r1.xyzx
ret 
// Approximately 9 instruction slots used
