//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __srgbV__ReShade__BackBufferTex    texture  float4          2d             t1      1 
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
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_input_ps linear v1.xy
dcl_output o0.x
dcl_temps 1
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t1.xyzw, s0
dp3 r0.x, r0.xyzx, l(0.212656, 0.715158, 0.072186, 0.000000)
max r0.x, r0.x, l(0.333000)
log o0.x, r0.x
ret 
// Approximately 5 instruction slots used