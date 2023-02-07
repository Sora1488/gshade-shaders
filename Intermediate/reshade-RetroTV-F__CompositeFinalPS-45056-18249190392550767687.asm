//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float framecount;                  // Offset:    0 Size:     4 [unused]
//   float fTimer;                      // Offset:    4 Size:     4
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
// __V__target0                      texture  float4          2d             t0      1 
// __V__pixel_mask                   texture  float4          2d             t4      1 
// __V__tv_border                    texture  float4          2d             t6      1 
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
// TEXCOORD                 1     zw        1     NONE   float       
// TEXCOORD                 2   xy          2     NONE   float   xy  
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_input_ps linear v2.xy
dcl_output o0.xyzw
dcl_temps 3
mul r0.x, cb0[0].y, l(0.001000)
frc r0.y, |r0.x|
lt r0.x, -r0.x, l(0.000000)
movc r0.x, r0.x, -r0.y, r0.y
add r0.x, r0.x, v1.y
lt r0.y, -r0.x, l(0.000000)
frc r0.z, |r0.x|
lt r0.x, r0.x, l(0.000000)
movc r0.y, r0.y, -r0.z, r0.z
add r0.y, -r0.y, l(1.000000)
movc r0.x, r0.x, r0.y, r0.z
add r0.x, r0.x, l(-1.000000)
mad r0.x, r0.x, l(0.250000), l(1.000000)
add r1.xyzw, v1.xyxy, l(0.001563, 0.000000, -0.001563, -0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t0.yxzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.z, r1.xyxx, t0.yzxw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
mad r0.z, r1.x, l(2.000000), -r0.z
add r0.y, -r0.y, r0.z
add r1.x, r0.y, r1.x
dp3 r2.x, l(1.000000, 0.956000, 0.621000, 0.000000), r1.xyzx
dp3 r2.y, l(1.000000, -0.272000, -0.647000, 0.000000), r1.xyzx
dp3 r2.z, l(1.000000, -1.106000, 1.703000, 0.000000), r1.xyzx
mul r0.xyz, r0.xxxx, r2.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v2.xyxx, t4.xyzw, s1
mul r0.xyz, r0.xyzx, r1.xyzx
mul r0.xyz, r0.xyzx, l(1.500000, 1.500000, 1.500000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t6.xyzw, s0
mul o0.xyz, r0.xyzx, r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 31 instruction slots used