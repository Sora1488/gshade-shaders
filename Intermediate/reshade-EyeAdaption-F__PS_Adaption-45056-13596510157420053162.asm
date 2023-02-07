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
// __V__TexAvgLuma                   texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_l_indexable(texture2d)(float,float,float,float) r0.x, l(0.000000, 0.000000, 0.000000, 0.000000), t6.xyzw, s0, l(0.000000)
mul r0.y, r0.x, l(1.400000)
add r0.z, r0.x, l(0.400000)
div r0.y, r0.y, r0.z
add r0.y, -r0.x, r0.y
mad r0.x, r0.y, l(0.500000), r0.x
add r0.y, r0.x, l(-0.500000)
lt r0.x, r0.x, l(0.500000)
mul r0.y, |r0.y|, |r0.y|
mul r0.y, r0.y, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0, l(0.000000)
log r1.xyz, |r1.xyzx|
mov o0.w, r1.w
mul r1.xyz, r1.xyzx, l(0.454545, 0.454545, 0.454545, 0.000000)
exp r1.xyz, r1.xyzx
dp3 r0.z, r1.xyzx, l(0.212656, 0.715158, 0.072186, 0.000000)
add r1.xyz, -r0.zzzz, r1.xyzx
mul r0.yw, r0.yyyz, l(0.000000, 10.000000, 0.000000, 0.600000)
add r1.w, -r0.z, l(1.000000)
mul r2.x, r1.w, l(0.100000)
mad r0.w, r0.w, r1.w, r2.x
mad r0.w, r0.z, l(0.100000), r0.w
movc r0.x, r0.x, r0.w, -r0.w
mad r0.x, r0.x, r0.y, r0.z
add_sat r0.xyz, r1.xyzx, r0.xxxx
log r0.xyz, r0.xyzx
mul r0.xyz, r0.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
exp o0.xyz, r0.xyzx
ret 
// Approximately 29 instruction slots used