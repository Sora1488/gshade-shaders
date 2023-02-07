//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__FXShaders__UnrealLens__LensBTex    texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
add r0.xyzw, v1.xyxy, l(-0.002157, -0.014310, -0.001618, -0.010733)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.zwzz, t4.xyzw, s0
max r2.xyzw, r1.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mad r2.xyzw, -r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r2.xyzw
mul r1.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111)
mad r1.xyzw, r2.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r1.xyzw
max r2.xyzw, r0.xyzw, r1.xyzw
mad r0.xyzw, r0.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.001078, -0.007155, -0.000539, -0.003578)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t4.xyzw, s0
max r3.xyzw, r0.xyzw, r2.xyzw
mad r0.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r2.xyzw, -r0.xyzw, r3.xyzw
mad r0.xyzw, r2.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
max r2.xyzw, r1.xyzw, r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t4.xyzw, s0
max r2.xyzw, r0.xyzw, r1.xyzw
mad r0.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000539, 0.003578, 0.001078, 0.007155)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t4.xyzw, s0
max r3.xyzw, r0.xyzw, r2.xyzw
mad r0.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r2.xyzw, -r0.xyzw, r3.xyzw
mad r0.xyzw, r2.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
max r2.xyzw, r1.xyzw, r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.001618, 0.010733, 0.002157, 0.014310)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t4.xyzw, s0
max r3.xyzw, r0.xyzw, r2.xyzw
mad r0.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r2.xyzw, -r0.xyzw, r3.xyzw
mad r0.xyzw, r2.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
max r2.xyzw, r1.xyzw, r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r0.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad o0.xyzw, r1.xyzw, l(0.200000, 0.200000, 0.200000, 0.200000), r0.xyzw
ret 
// Approximately 50 instruction slots used
