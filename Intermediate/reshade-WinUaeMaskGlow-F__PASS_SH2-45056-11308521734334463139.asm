//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Shinra02L                    texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t6.xyzw, s0
add r1.xyzw, v1.xyxy, l(0.000000, 0.000926, -0.000000, -0.000926)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s0
mul r2.xyzw, r2.xyzw, l(0.241730, 0.241730, 0.241730, 0.241730)
mad r0.xyzw, r0.xyzw, l(0.382925, 0.382925, 0.382925, 0.382925), r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.241730, 0.241730, 0.241730, 0.241730), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.001852, -0.000000, -0.001852)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.060598, 0.060598, 0.060598, 0.060598), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.060598, 0.060598, 0.060598, 0.060598), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.002778, -0.000000, -0.002778)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.005977, 0.005977, 0.005977, 0.005977), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.005977, 0.005977, 0.005977, 0.005977), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.003704, -0.000000, -0.003704)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.000229, 0.000229, 0.000229, 0.000229), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.000229, 0.000229, 0.000229, 0.000229), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.004630, -0.000000, -0.004630)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t6.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t6.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.000003, 0.000003, 0.000003, 0.000003), r0.xyzw
mad o0.xyzw, r1.xyzw, l(0.000003, 0.000003, 0.000003, 0.000003), r0.xyzw
ret 
// Approximately 28 instruction slots used
