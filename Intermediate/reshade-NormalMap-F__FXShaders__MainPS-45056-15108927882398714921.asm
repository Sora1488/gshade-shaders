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
// __V__FXShaders__BackBufferTex     texture  float4          2d             t0      1 
// __V__FXShaders__NormalTex         texture  float4          2d             t2      1 
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
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 1
add r0.xyzw, v1.xxyy, l(-0.500000, -0.500000, -0.500000, -0.500000)
mad r0.xyzw, r0.xyzw, l(6.000000, 6.000000, 3.375000, 3.375000), l(0.500000, 0.500000, 0.500000, 0.500000)
mad r0.xyzw, r0.xyzw, l(1024.000000, 1024.000000, 1024.000000, 1024.000000), l(-512.000000, -512.000000, -512.000000, -512.000000)
mul r0.xyzw, r0.xyzw, l(1.000000, 0.000000, 0.000000, 1.000000)
add r0.xy, r0.zwzz, r0.xyxx
add r0.xy, r0.xyxx, l(512.000000, 512.000000, 0.000000, 0.000000)
mul r0.xy, r0.xyxx, l(0.000977, 0.000977, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t2.xyzw, s1
mul r0.xyz, r0.wwww, r0.xyzx
mad r0.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
mul r0.xy, r0.zzzz, r0.xyxx
mad r0.xy, r0.xyxx, l(0.052083, 0.092593, 0.000000, 0.000000), v1.xyxx
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, r0.xyxx, t0.xyzw, s0
ret 
// Approximately 14 instruction slots used
