//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Intensity;                   // Offset:    0 Size:     4 [unused]
//   float K;                           // Offset:    4 Size:     4 [unused]
//   float Saturation;                  // Offset:    8 Size:     4 [unused]
//   float Threshold;                   // Offset:   12 Size:     4
//   float SoftKnee;                    // Offset:   16 Size:     4
//   float Gamma;                       // Offset:   20 Size:     4
//   int Performance;                   // Offset:   24 Size:     4 [unused]
//   bool Debug;                        // Offset:   28 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Bessel_Bloom__BackBuffer     texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
log r0.xyz, |r0.xyzx|
mul r0.xyz, r0.xyzx, cb0[1].yyyy
exp r0.xyz, r0.xyzx
max r0.w, r0.y, r0.x
max r0.w, r0.z, r0.w
mad r1.x, cb0[0].w, cb0[1].x, l(0.000010)
add r1.y, -r1.x, cb0[0].w
add r1.y, r0.w, -r1.y
max r1.y, r1.y, l(0.000000)
add r1.z, r1.x, r1.x
div r1.x, l(0.250000), r1.x
min r1.y, r1.z, r1.y
mul r1.y, r1.y, r1.y
mul r1.x, r1.x, r1.y
add r1.y, r0.w, -cb0[0].w
max r0.w, r0.w, l(0.000010)
max r1.x, r1.y, r1.x
div r0.w, r1.x, r0.w
mul r0.xyz, r0.wwww, r0.xyzx
add r0.w, -cb0[0].w, l(1.000000)
rcp r0.w, r0.w
mul r0.xyz, r0.wwww, r0.xyzx
rcp r1.xyz, r0.xyzx
min r0.w, r1.y, r1.x
min r0.w, r1.z, r0.w
lt r0.w, l(8.000000), r0.w
movc r1.x, r0.w, l(8.000000), l(1.000000)
and o0.w, r0.w, l(0x3f800000)
mul o0.xyz, r0.xyzx, r1.xxxx
ret 
// Approximately 31 instruction slots used
