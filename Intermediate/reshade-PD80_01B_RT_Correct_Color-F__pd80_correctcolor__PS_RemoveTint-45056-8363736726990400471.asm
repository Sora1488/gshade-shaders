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
// __s2                              sampler      NA          NA             s2      1 
// __V__texNoiseRGB                  texture  float4          2d             t6      1 
// __V__pd80_correctcolor__texColor    texture  float4          2d            t10      1 
// __V__pd80_correctcolor__texDS_1x1    texture  float4          2d            t18      1 
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
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t18
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
mul r0.xyzw, v1.xyxy, l(3.750000, 2.109375, 0.166667, 1.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t6.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.zwzz, t18.xyzw, s2
mad r1.xyz, cb0[0].xxxx, l(0.618034, 0.618034, 0.618034, 0.000000), r1.xyzx
frc r1.xyz, r1.xyzx
mad r1.xyz, r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t10.xyzw, s0
mad_sat r1.xyz, r1.xyzx, l(0.001961, 0.001961, 0.001961, 0.000000), r2.xyzx
add_sat r1.xyz, -r0.xyzx, r1.xyzx
mad r2.xyzw, v1.xyxy, l(0.166667, 1.000000, 0.166667, 1.000000), l(0.333333, 0.000000, 0.666667, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r2.zwzz, t18.xyzw, s2
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t18.xyzw, s2
add r4.xyz, -r0.xyzx, r3.xyzx
dp3 r3.y, r3.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
dp3 r3.x, r0.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
dp2 r0.x, r3.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
add r0.xyz, -r0.xxxx, r2.xyzx
mul r0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
div r1.xyz, r1.xyzx, r4.xyzx
mul r1.xyz, r3.yyyy, r1.xyzx
dp3 r0.w, r1.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
mad r0.w, r0.w, l(2.000000), l(-1.000000)
add r0.w, -|r0.w|, l(1.000000)
mad r1.xyz, -r0.xyzx, r0.wwww, r1.xyzx
dp3 r0.x, r0.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
mad_sat o0.xyz, r0.xxxx, r0.wwww, r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 28 instruction slots used
