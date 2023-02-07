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
// __V__pd80_filmicadaptation__texAvgLuma    texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.x, l(0.500000, 0.500000, 0.000000, 0.000000), t6.xyzw, s0
mad r0.x, r0.x, l(7.000000), l(1.000000)
mul r0.x, r0.x, l(0.550000)
max r0.x, r0.x, l(0.550000)
mul r0.yz, r0.xxxx, l(0.000000, 0.050000, 0.570000, 0.000000)
mad r0.xw, r0.xxxx, l(0.050000, 0.000000, 0.000000, 0.570000), l(0.805550, 0.000000, 0.000000, 0.735000)
div r0.x, r0.x, r0.w
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
mad r2.xyz, r1.xyzx, l(0.650000, 0.650000, 0.650000, 0.000000), l(0.155550, 0.155550, 0.155550, 0.000000)
mad r2.xyz, r1.xyzx, r2.xyzx, r0.yyyy
mad r3.xyz, r1.xyzx, l(0.650000, 0.650000, 0.650000, 0.000000), l(0.085000, 0.085000, 0.085000, 0.000000)
mad r0.yzw, r1.xxyz, r3.xxyz, r0.zzzz
div r0.yzw, r2.xxyz, r0.yyzw
add r0.xyzw, r0.xyzw, l(-0.087719, -0.087719, -0.087719, -0.087719)
div o0.xyz, r0.yzwy, r0.xxxx
mov o0.w, l(1.000000)
ret 
// Approximately 17 instruction slots used
