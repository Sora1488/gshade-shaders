//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 pp;                         // Offset:    0 Size:     8
//   float frametime;                   // Offset:    8 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__texNoiseRGB                  texture  float4          2d             t6      1 
// __V__pd80_hqbloom__texBloomAll    texture  float4          2d            t24      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t24
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
mul r0.xy, v1.xyxx, l(3.750000, 2.109375, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t6.xyzw, s1
mad r0.xyz, cb0[0].xxxx, l(0.618034, 0.618034, 0.618034, 0.000000), r0.xyzx
frc r0.xyz, r0.xyzx
mad r0.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
mul r0.xyz, r0.xyzx, l(0.010455, 0.010455, 0.010455, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t24.xyzw, s0
mul_sat r2.xyz, r1.xyzx, l(83.333336, 83.333336, 83.333336, 0.000000)
mad r3.xyz, r2.xyzx, l(-2.000000, -2.000000, -2.000000, 0.000000), l(3.000000, 3.000000, 3.000000, 0.000000)
mul r2.xyz, r2.xyzx, r2.xyzx
mul r2.xyz, r2.xyzx, r3.xyzx
mad_sat r0.xyz, r0.xyzx, r2.xyzx, r1.xyzx
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r2.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r0.xyz, -r2.xyzx, r0.xyzx, -r1.xyzx
add r0.xyz, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad o0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 20 instruction slots used
