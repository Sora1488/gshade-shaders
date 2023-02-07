//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __srgbV__FXShaders__UnrealLens__BackBufferTex    texture  float4          2d             t1      1 
// __V__FXShaders__UnrealLens__LensATex    texture  float4          2d             t2      1 
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
dcl_resource_texture2d (float,float,float,float) t1
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
mad r1.xyzw, r0.xyxy, l(2.400000, 2.400000, 0.800000, 0.800000), l(0.500000, 0.500000, 0.500000, 0.500000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t2.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t2.xyzw, s0
add r1.xyz, r1.xyzx, r2.xyzx
mad r2.xyzw, r0.xyxy, l(0.400000, 0.400000, 0.200000, 0.200000), l(0.500000, 0.500000, 0.500000, 0.500000)
mad r0.xy, r0.xyxx, l(-4.000000, -4.000000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t2.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t2.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.zwzz, t2.xyzw, s0
add r1.xyz, r1.xyzx, r3.xyzx
add r1.xyz, r2.xyzx, r1.xyzx
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t1.xyzw, s0
mad r2.xyz, r1.xyzx, l(0.983729, 0.983729, 0.983729, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
mul r3.xyz, r2.xyzx, l(4.000000, 4.000000, 4.000000, 0.000000)
add r2.xyz, r2.xyzx, r2.xyzx
mad r4.xyz, r1.xyzx, l(0.238081, 0.238081, 0.238081, 0.000000), l(0.000091, 0.000091, 0.000091, 0.000000)
mul r3.xyz, r3.xyzx, r4.xyzx
mad r4.xyz, r1.xyzx, l(0.432951, 0.432951, 0.432951, 0.000000), l(-0.024579, -0.024579, -0.024579, 0.000000)
mad r3.xyz, |r4.xyzx|, |r4.xyzx|, -r3.xyzx
sqrt r3.xyz, r3.xyzx
mad r1.xyz, -r1.xyzx, l(0.432951, 0.432951, 0.432951, 0.000000), l(0.024579, 0.024579, 0.024579, 0.000000)
mov o0.w, r1.w
add r1.xyz, -r3.xyzx, r1.xyzx
div r1.xyz, r1.xyzx, r2.xyzx
mad r0.xyz, r0.xyzx, l(0.142857, 0.142857, 0.142857, 0.000000), |r1.xyzx|
add r1.xyz, r0.xyzx, l(0.024579, 0.024579, 0.024579, 0.000000)
mad r1.xyz, r0.xyzx, r1.xyzx, l(-0.000091, -0.000091, -0.000091, 0.000000)
mad r2.xyz, r0.xyzx, l(0.983729, 0.983729, 0.983729, 0.000000), l(0.432951, 0.432951, 0.432951, 0.000000)
mad r0.xyz, r0.xyzx, r2.xyzx, l(0.238081, 0.238081, 0.238081, 0.000000)
div_sat o0.xyz, r1.xyzx, r0.xyzx
ret 
// Approximately 33 instruction slots used