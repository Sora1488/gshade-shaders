//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__tMagicBloom_Small            texture  float4          2d            t20      1 
// __V__tMagicBloom_LastAdapt        texture  float4          2d            t24      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float       
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t20
dcl_resource_texture2d (float,float,float,float) t24
dcl_output o0.x
dcl_temps 1
sample_l_indexable(texture2d)(float,float,float,float) r0.x, l(0.500000, 0.500000, 0.000000, 0.000000), t20.xyzw, s0, l(-1076677888.000000)
mov_sat r0.x, r0.x
sample_indexable(texture2d)(float,float,float,float) r0.y, l(0.000000, 0.000000, 0.000000, 0.000000), t24.yxzw, s1
add r0.x, -r0.y, r0.x
mad o0.x, r0.x, l(0.100000), r0.y
ret 
// Approximately 6 instruction slots used
