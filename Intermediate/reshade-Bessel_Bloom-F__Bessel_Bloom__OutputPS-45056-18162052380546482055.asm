//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Bessel_Bloom__BackBuffer     texture  float4          2d             t0      1 
// __V__Bessel_Bloom__Blur1          texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t4.xyzw, s0
mul r0.w, r0.w, l(3.000000)
exp r0.w, -r0.w
mul r0.xyz, r0.wwww, r0.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
log r1.xyz, |r1.xyzx|
mul r1.xyz, r1.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
exp r1.xyz, r1.xyzx
mad r0.xyz, r0.xyzx, l(0.300000, 0.300000, 0.300000, 0.000000), r1.xyzx
log r0.xyz, |r0.xyzx|
mul r0.xyz, r0.xyzx, l(0.454545, 0.454545, 0.454545, 0.000000)
exp o0.xyz, r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 14 instruction slots used
