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
dcl_temps 9
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
max r0.w, r0.y, r0.x
max r0.w, r0.z, r0.w
mad r1.xy, r0.wwww, l(-0.060000, -0.060000, 0.000000, 0.000000), l(0.120000, 1.120000, 0.000000, 0.000000)
add r0.w, -r1.x, l(1.000000)
mul r1.xyz, r0.xyzx, r1.yyyy
mul r2.xyz, r0.wwww, r0.xyzx
add r3.xyzw, v1.xyxy, l(0.000174, -0.000926, -0.000521, -0.000309)
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t0.xyzw, s0
min r5.xyz, r3.xyzx, r4.xyzx
add r6.xyzw, v1.xyxy, l(0.000521, 0.000309, -0.000174, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r6.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r6.zwzz, t0.xyzw, s0
min r8.xyz, r7.xyzx, r6.xyzx
min r5.xyz, r5.xyzx, r8.xyzx
min r2.xyz, r2.xyzx, r5.xyzx
max r5.xyz, r3.xyzx, r4.xyzx
add r3.xyz, r3.xyzx, r4.xyzx
add r3.xyz, r6.xyzx, r3.xyzx
max r4.xyz, r7.xyzx, r6.xyzx
add r3.xyz, r7.xyzx, r3.xyzx
mad r3.xyz, r3.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), -r0.xyzx
max r4.xyz, r4.xyzx, r5.xyzx
max r1.xyz, r1.xyzx, r4.xyzx
add r4.xyz, -r2.xyzx, r1.xyzx
log r4.xyz, |r4.xyzx|
mul r4.xyz, r4.xyzx, l(0.750000, 0.750000, 0.750000, 0.000000)
exp r4.xyz, r4.xyzx
mad r4.xyz, r4.xyzx, l(0.450000, 0.450000, 0.450000, 0.000000), l(0.450000, 0.450000, 0.450000, 0.000000)
mad r0.xyz, -r4.xyzx, r3.xyzx, r0.xyzx
max r0.xyz, r2.xyzx, r0.xyzx
min o0.xyz, r1.xyzx, r0.xyzx
ret 
// Approximately 34 instruction slots used
