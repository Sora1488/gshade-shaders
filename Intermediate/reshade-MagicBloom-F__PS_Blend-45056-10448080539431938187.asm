//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__tMagicBloom_1                texture  float4          2d             t4      1 
// __V__tMagicBloom_2                texture  float4          2d             t6      1 
// __V__tMagicBloom_3                texture  float4          2d             t8      1 
// __V__tMagicBloom_4                texture  float4          2d            t10      1 
// __V__tMagicBloom_5                texture  float4          2d            t12      1 
// __V__tMagicBloom_6                texture  float4          2d            t14      1 
// __V__tMagicBloom_7                texture  float4          2d            t16      1 
// __V__tMagicBloom_8                texture  float4          2d            t18      1 
// __V__tMagicBloom_Adapt            texture  float4          2d            t22      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t18
dcl_resource_texture2d (float,float,float,float) t22
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t6.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t8.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t10.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t12.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t14.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t16.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t18.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
mul r0.xyz, r0.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.w, l(0.000000, 0.000000, 0.000000, 0.000000), t22.yzwx, s1
max r0.w, r0.w, l(0.000010)
div r0.w, l(0.500000), r0.w
mul r0.xyz, r0.wwww, r0.xyzx
mad r1.xyz, r0.xyzx, l(0.150000, 0.150000, 0.150000, 0.000000), l(0.050000, 0.050000, 0.050000, 0.000000)
mad r1.xyz, r0.xyzx, r1.xyzx, l(0.004000, 0.004000, 0.004000, 0.000000)
mad r2.xyz, r0.xyzx, l(0.150000, 0.150000, 0.150000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
mad r0.xyz, r0.xyzx, r2.xyzx, l(0.060000, 0.060000, 0.060000, 0.000000)
div r0.xyz, r1.xyzx, r0.xyzx
add r0.xyz, r0.xyzx, l(-0.066667, -0.066667, -0.066667, 0.000000)
mad r0.xyz, -r0.xyzx, l(1.379064, 1.379064, 1.379064, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad o0.xyz, -r1.xyzx, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mov o0.w, l(1.000000)
ret 
// Approximately 34 instruction slots used