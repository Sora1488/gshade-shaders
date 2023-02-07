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
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__TexColor                     texture  float4          2d             t4      1 
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
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.y, -r0.x, l(1.000000)
ne r0.y, l(0.000000, 0.000000, 0.000000, 0.000000), r0.y
and r0.y, r0.y, l(0x3f800000)
mul r0.x, r0.y, r0.x
sample_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t4.wxyz, s1
log r1.xyz, |r0.yzwy|
mul r1.xyz, r1.xyzx, l(3.500000, 3.500000, 3.500000, 0.000000)
exp r1.xyz, r1.xyzx
add r1.xyz, -r0.yzwy, r1.xyzx
mad r0.xyz, r0.xxxx, r1.xyzx, r0.yzwy
dp3 o0.xyz, r0.xyzx, l(0.212395, 0.701049, 0.086556, 0.000000)
ret 
// Approximately 15 instruction slots used
