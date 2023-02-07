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
// __V__texColorHDRA                 texture  float4          2d             t6      1 
// __V__texBloomA                    texture  float4          2d            t10      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t10.xyzw, s0
log r0.xyz, |r0.xyzx|
mul r0.xyz, r0.xyzx, l(1.500000, 1.500000, 1.500000, 0.000000)
exp r0.xyz, r0.xyzx
dp3 r0.w, r0.xyzx, l(0.212600, 0.715200, 0.072200, 0.000000)
add r0.xyz, -r0.wwww, r0.xyzx
mad r0.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r0.wwww
max r0.w, r0.z, r0.y
max r0.w, r0.w, r0.x
max r0.w, r0.w, l(1.000000)
div r0.xyz, r0.xyzx, r0.wwww
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t6.xyzw, s1
mad o0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
mov o0.w, l(1.500000)
ret 
// Approximately 15 instruction slots used
