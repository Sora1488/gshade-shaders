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
add r0.xyzw, v1.xyxy, l(-0.013542, -0.000000, -0.012500, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t6.xyzw, s1
mul r1.xyzw, r1.xyzw, l(0.011109, 0.011109, 0.011109, 0.011109)
mad r0.xyzw, r0.xyzw, l(0.005086, 0.005086, 0.005086, 0.005086), r1.xyzw
add r1.xyzw, v1.xyxy, l(-0.011458, 0.000000, -0.010417, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.022794, 0.022794, 0.022794, 0.022794), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.043937, 0.043937, 0.043937, 0.043937), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.009375, 0.000000, -0.008333, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.079560, 0.079560, 0.079560, 0.079560), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.135335, 0.135335, 0.135335, 0.135335), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.007292, 0.000000, -0.006250, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.216265, 0.216265, 0.216265, 0.216265), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.324652, 0.324652, 0.324652, 0.324652), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.005208, 0.000000, -0.004167, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.457833, 0.457833, 0.457833, 0.457833), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.606531, 0.606531, 0.606531, 0.606531), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.003125, 0.000000, -0.002083, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.754840, 0.754840, 0.754840, 0.754840), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.882497, 0.882497, 0.882497, 0.882497), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.001042, 0.000000, -0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.969233, 0.969233, 0.969233, 0.969233), r0.xyzw
add r0.xyzw, r1.xyzw, r0.xyzw
add r1.xyzw, v1.xyxy, l(0.001042, 0.000000, 0.002083, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.969233, 0.969233, 0.969233, 0.969233), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.882497, 0.882497, 0.882497, 0.882497), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.003125, 0.000000, 0.004167, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.754840, 0.754840, 0.754840, 0.754840), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.606531, 0.606531, 0.606531, 0.606531), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.005208, 0.000000, 0.006250, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.457833, 0.457833, 0.457833, 0.457833), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.324652, 0.324652, 0.324652, 0.324652), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.007292, 0.000000, 0.008333, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.216265, 0.216265, 0.216265, 0.216265), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.135335, 0.135335, 0.135335, 0.135335), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.009375, 0.000000, 0.010417, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.079560, 0.079560, 0.079560, 0.079560), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.043937, 0.043937, 0.043937, 0.043937), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.011458, 0.000000, 0.012500, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s1
mad r0.xyzw, r2.xyzw, l(0.022794, 0.022794, 0.022794, 0.022794), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.011109, 0.011109, 0.011109, 0.011109), r0.xyzw
add r1.xy, v1.xyxx, l(0.013542, 0.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.xyxx, t6.xyzw, s1
mad r0.xyzw, r1.xyzw, l(0.005086, 0.005086, 0.005086, 0.005086), r0.xyzw
mul o0.xyzw, r0.xyzw, l(0.099807, 0.099807, 0.099807, 0.099807)
ret 
// Approximately 70 instruction slots used
