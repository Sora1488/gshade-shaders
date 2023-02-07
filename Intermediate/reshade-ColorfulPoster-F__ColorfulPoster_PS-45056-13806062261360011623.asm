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
max r0.w, r0.z, r0.y
max r0.w, r0.w, r0.x
add r0.w, -r0.w, l(1.000000)
add r1.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r1.xyz, -r0.wwww, r1.xyzx
add r0.w, -r0.w, l(1.000000)
div r1.xyz, r1.xyzx, r0.wwww
add_sat r1.xyz, r1.xyzx, l(0.200000, -0.100000, -0.200000, 0.000000)
add r1.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r2.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
dp3 r0.w, r0.xyzx, l(0.212600, 0.715100, 0.072100, 0.000000)
add r0.xyz, -r0.wwww, r0.xyzx
mul r1.w, r0.w, l(16.000000)
ge r0.w, r0.w, l(0.500000)
and r0.w, r0.w, l(0x3f800000)
frc r2.w, r1.w
round_ni r1.w, r1.w
mul r1.w, r1.w, l(0.062500)
add r2.w, r2.w, l(-0.500000)
mul r2.w, r2.w, l(-18.755035)
exp r2.w, r2.w
add r2.w, r2.w, l(1.000000)
div r2.w, l(1.000000, 1.000000, 1.000000, 1.000000), r2.w
mad r1.w, r2.w, l(0.062500), r1.w
add r0.xyz, r0.xyzx, r1.wwww
add r3.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r0.xyz, r0.xyzx, r1.xyzx
add r1.xyz, r3.xyzx, r3.xyzx
mad r1.xyz, -r1.xyzx, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r1.xyz, -r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r1.xyzx
add r0.xyz, r0.xyzx, r0.xyzx
mad o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
ret 
// Approximately 34 instruction slots used
