//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__FXShaders__Bloom4Tex         texture  float4          2d            t12      1 
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
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
add r0.xyzw, v1.xyxy, l(-0.400000, -0.000000, -0.333333, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t12.xyzw, s0
mul r1.xyzw, r1.xyzw, l(0.021362, 0.021362, 0.021362, 0.021362)
mad r0.xyzw, r0.xyzw, l(0.003933, 0.003933, 0.003933, 0.003933), r1.xyzw
add r1.xyzw, v1.xyxy, l(-0.266667, 0.000000, -0.200000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t12.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.085304, 0.085304, 0.085304, 0.085304), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.250420, 0.250420, 0.250420, 0.250420), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.133333, 0.000000, -0.066667, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t12.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.540433, 0.540433, 0.540433, 0.540433), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.857404, 0.857404, 0.857404, 0.857404), r0.xyzw
add r1.xyzw, v1.xyxy, l(-0.000000, 0.000000, 0.066667, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t12.xyzw, s0
add r0.xyzw, r0.xyzw, r2.xyzw
mad r0.xyzw, r1.xyzw, l(0.857404, 0.857404, 0.857404, 0.857404), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.133333, 0.000000, 0.200000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t12.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.540433, 0.540433, 0.540433, 0.540433), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.250420, 0.250420, 0.250420, 0.250420), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.266667, 0.000000, 0.333333, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t12.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.085304, 0.085304, 0.085304, 0.085304), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.021362, 0.021362, 0.021362, 0.021362), r0.xyzw
add r1.xy, v1.xyxx, l(0.400000, 0.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.xyxx, t12.xyzw, s0
mad r0.xyzw, r1.xyzw, l(0.003933, 0.003933, 0.003933, 0.003933), r0.xyzw
mul o0.xyzw, r0.xyzw, l(0.221351, 0.221351, 0.221351, 0.221351)
ret 
// Approximately 35 instruction slots used
