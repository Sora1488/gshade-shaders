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
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__texGravityMain               texture  float4          2d            t12      1 
// __V__texGravityDepth              texture  float4          2d            t14      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t12
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
sample_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t14.yxzw, s1
lt r0.x, r0.y, r0.x
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t12.xyzw, s1
ne r0.y, l(0.000000, 0.000000, 0.000000, 0.000000), r1.w
and r0.x, r0.x, r0.y
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t0.xyzw, s0
movc o0.xyzw, r0.xxxx, r1.xyzw, r2.xyzw
ret 
// Approximately 11 instruction slots used
