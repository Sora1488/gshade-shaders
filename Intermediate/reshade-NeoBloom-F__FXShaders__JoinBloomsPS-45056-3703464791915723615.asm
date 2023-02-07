//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__FXShaders__NeoBloom_AtlasA    texture  float4          2d             t6      1 
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
dcl_temps 3
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
mad r1.xyzw, r0.xyxy, l(0.909091, 0.909091, 0.833333, 0.833333), l(0.500000, 1.500000, 2.500000, 0.500000)
mad r0.xy, r0.xyxx, l(0.769231, 0.769231, 0.000000, 0.000000), l(6.500000, 7.500000, 0.000000, 0.000000)
mul r0.xy, r0.xyxx, l(0.125000, 0.125000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t6.xyzw, s1
mul r1.xyzw, r1.xyzw, l(0.500000, 0.500000, 0.250000, 0.250000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.zwzz, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.xyxx, t6.xyzw, s1
mul r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mad r1.xyzw, r1.xyzw, l(0.079788, 0.079788, 0.079788, 0.079788), r2.xyzw
mad r0.xyzw, r0.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000), r1.xyzw
mul o0.xyzw, r0.xyzw, l(12.533089, 12.533089, 12.533089, 12.533089)
ret 
// Approximately 13 instruction slots used
