//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ArcaneBloom_____tArcaneBloom_Bloom2    texture  float4          2d             t4      1 
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
dcl_temps 3
add r0.xyzw, v1.xyxy, l(-0.008333, -0.014815, 0.008333, 0.014815)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.zwzz, t4.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
add r1.xyzw, v1.xyxy, l(-0.008333, 0.014815, 0.008333, -0.014815)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t4.xyzw, s0
add r0.xyz, r0.xyzx, r2.xyzx
add r0.xyz, r1.xyzx, r0.xyzx
mul o0.xyz, r0.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000)
mov o0.w, l(1.000000)
ret 
// Approximately 12 instruction slots used
