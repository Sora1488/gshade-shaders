//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__texColorHDRA                 texture  float4          2d             t6      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t6.xyzw, s1
max r0.w, r0.z, r0.y
max r0.w, r0.w, r0.x
add r0.w, r0.w, l(-0.400000)
lt r1.x, l(0.000000), r0.w
lt r0.w, r0.w, l(0.000000)
iadd r0.w, -r1.x, r0.w
itof r0.w, r0.w
mov_sat r0.w, r0.w
mul o0.xyz, r0.wwww, r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 12 instruction slots used
