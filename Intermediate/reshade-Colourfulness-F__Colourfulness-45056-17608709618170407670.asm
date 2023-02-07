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
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul_sat r1.xyz, |r0.xyzx|, r0.xyzx
mov_sat r0.xyz, r0.xyzx
dp3 r0.w, r1.xyzx, l(0.255800, 0.651100, 0.093100, 0.000000)
sqrt r0.w, r0.w
add r1.x, -r0.w, l(1.000200)
add r1.yzw, -r0.wwww, r0.xxyz
add r0.w, r0.w, l(0.000200)
max r2.x, r1.w, r1.z
max r2.x, r1.y, r2.x
add r2.x, |r2.x|, l(0.000100)
div r1.x, r1.x, r2.x
min r2.x, r1.w, r1.z
min r2.x, r1.y, r2.x
add r2.x, |r2.x|, l(0.000100)
div r0.w, r0.w, r2.x
min r0.w, r0.w, r1.x
min r0.w, r0.w, l(32.000000)
mad r2.xyz, r1.yzwy, r0.wwww, -r1.yzwy
sqrt r2.xyz, |r2.xyzx|
mad r3.xyz, r1.yzwy, l(0.480000, 0.480000, 0.480000, 0.000000), r0.xyzx
mul r1.xyz, r1.yzwy, l(0.400000, 0.400000, 0.400000, 0.000000)
max r3.xyz, r3.xyzx, l(-0.000100, -0.000100, -0.000100, 0.000000)
min r3.xyz, r3.xyzx, l(1.000100, 1.000100, 1.000100, 0.000000)
add r3.xyz, -r0.xyzx, r3.xyzx
sqrt r3.xyz, |r3.xyzx|
mul r3.xyz, r3.xyzx, l(0.300000, 0.300000, 0.300000, 0.000000)
mad r2.xyz, r2.xyzx, l(0.700000, 0.700000, 0.700000, 0.000000), r3.xyzx
add r2.xyz, r2.xyzx, r2.xyzx
max r2.xyz, r2.xyzx, l(0.000001, 0.000001, 0.000001, 0.000000)
mul r3.xyz, r1.xyzx, r1.xyzx
mul r1.xyz, r1.xyzx, r2.xyzx
mad r2.xyz, r2.xyzx, r2.xyzx, r3.xyzx
sqrt r2.xyz, r2.xyzx
rcp r2.xyz, r2.xyzx
mad_sat o0.xyz, r1.xyzx, r2.xyzx, r0.xyzx
ret 
// Approximately 37 instruction slots used
