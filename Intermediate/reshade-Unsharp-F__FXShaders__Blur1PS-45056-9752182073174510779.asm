//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__FXShaders__ColorTex          texture  float4          2d             t0      1 
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
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
add r0.xyzw, v1.xyxy, l(-0.000000, -0.111111, 0.000000, -0.100000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t0.xyzw, s0
mul r1.xyzw, r1.xyzw, l(0.145356, 0.145356, 0.145356, 0.145356)
mad r0.xyzw, r0.xyzw, l(0.092462, 0.092462, 0.092462, 0.092462), r1.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, -0.088889, 0.000000, -0.077778)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.217880, 0.217880, 0.217880, 0.217880), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.311403, 0.311403, 0.311403, 0.311403), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, -0.066667, 0.000000, -0.055556)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.424373, 0.424373, 0.424373, 0.424373), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.551431, 0.551431, 0.551431, 0.551431), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, -0.044444, 0.000000, -0.033333)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.683210, 0.683210, 0.683210, 0.683210), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.807118, 0.807118, 0.807118, 0.807118), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, -0.022222, 0.000000, -0.011111)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.909156, 0.909156, 0.909156, 0.909156), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.976472, 0.976472, 0.976472, 0.976472), r0.xyzw
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0
add r0.xyzw, r0.xyzw, r1.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.011111, 0.000000, 0.022222)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.976472, 0.976472, 0.976472, 0.976472), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.909156, 0.909156, 0.909156, 0.909156), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.033333, 0.000000, 0.044444)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.807118, 0.807118, 0.807118, 0.807118), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.683210, 0.683210, 0.683210, 0.683210), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.055556, 0.000000, 0.066667)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.551431, 0.551431, 0.551431, 0.551431), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.424373, 0.424373, 0.424373, 0.424373), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.077778, 0.000000, 0.088889)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.311403, 0.311403, 0.311403, 0.311403), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.217880, 0.217880, 0.217880, 0.217880), r0.xyzw
add r1.xyzw, v1.xyxy, l(0.000000, 0.100000, 0.000000, 0.111111)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0
mad r0.xyzw, r2.xyzw, l(0.145356, 0.145356, 0.145356, 0.145356), r0.xyzw
mad r0.xyzw, r1.xyzw, l(0.092462, 0.092462, 0.092462, 0.092462), r0.xyzw
dp2 r1.x, v1.xyxx, l(23.234501, 84.123398, 0.000000, 0.000000)
sincos r1.x, null, r1.x
mul r1.x, r1.x, l(56758.949219)
frc r1.x, r1.x
add r1.x, r1.x, l(-0.500000)
mul r1.x, |r1.x|, l(0.025000)
mad o0.xyzw, r0.xyzw, l(0.088986, 0.088986, 0.088986, 0.088986), r1.xxxx
ret 
// Approximately 60 instruction slots used
