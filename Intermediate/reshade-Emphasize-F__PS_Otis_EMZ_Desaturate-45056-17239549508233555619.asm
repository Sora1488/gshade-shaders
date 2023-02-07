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
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, r0.x, l(-0.026000)
mul r0.y, |r0.x|, l(19.607843)
lt r0.x, l(0.051000), |r0.x|
min r0.y, r0.y, l(1.000000)
mad r0.z, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.z
min r0.y, r0.y, l(1.000000)
movc r0.w, r0.x, l(1.000000), r0.y
mul r1.x, r0.w, l(0.900000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t0.xyzw, s0
add r1.y, r2.y, r2.x
add r1.y, r2.z, r1.y
mul r0.xyz, r1.yyyy, l(0.333333, 0.333333, 0.333333, 0.000000)
add r0.xyzw, r0.xyzw, -r2.xyzw
mad o0.xyzw, r1.xxxx, r0.xyzw, r2.xyzw
ret 
// Approximately 20 instruction slots used
