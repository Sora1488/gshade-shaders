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
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mad r1.xyz, r0.xyzx, l(0.900000, 0.900000, 0.900000, 0.000000), l(-0.310000, -0.310000, -0.290000, 0.000000)
mul r1.xyz, r1.xyzx, l(-11.541560, -11.541560, -11.541560, 0.000000)
exp r1.xyz, r1.xyzx
add r1.xyz, r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
div r1.xyz, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzx
mad r1.xyz, r1.xyzx, l(1.037315, 1.037315, 1.037315, 0.000000), l(-0.018657, -0.018657, -0.018657, 0.000000)
max r0.w, r1.y, r1.x
max r0.w, r1.z, r0.w
div r1.xyz, r1.xyzx, r0.wwww
log r1.xyz, |r1.xyzx|
mul r1.xyz, r1.xyzx, l(0.400000, 0.400000, 0.400000, 0.000000)
exp r1.xyz, r1.xyzx
mul r1.xyz, r0.wwww, r1.xyzx
dp3 r2.x, l(0.500303, 0.338098, 0.164590, 0.000000), r1.xyzx
dp3 r2.y, l(0.257969, 0.676195, 0.065836, 0.000000), r1.xyzx
dp3 r2.z, l(0.023452, 0.112699, 0.866840, 0.000000), r1.xyzx
dp3 r0.w, r2.xyzx, l(0.300000, 0.590000, 0.110000, 0.000000)
mad r1.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), -r0.wwww
dp3 r2.x, l(2.671471, -1.267236, -0.410996, 0.000000), r1.xyzx
dp3 r2.y, l(-1.025107, 1.984091, 0.043950, 0.000000), r1.xyzx
dp3 r2.z, l(0.061001, -0.223671, 1.159021, 0.000000), r1.xyzx
add r1.xyz, -r0.xyzx, r2.xyzx
mad o0.xyz, r1.xyzx, l(0.200000, 0.200000, 0.200000, 0.000000), r0.xyzx
ret 
// Approximately 25 instruction slots used
