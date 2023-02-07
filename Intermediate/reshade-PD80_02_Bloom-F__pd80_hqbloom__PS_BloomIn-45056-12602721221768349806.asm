//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 pp;                         // Offset:    0 Size:     8 [unused]
//   bool debugBloom;                   // Offset:    8 Size:     4 [unused]
//   float dither_strength;             // Offset:   12 Size:     4 [unused]
//   float BloomMix;                    // Offset:   16 Size:     4 [unused]
//   float BloomLimit;                  // Offset:   20 Size:     4 [unused]
//   float GreyValue;                   // Offset:   24 Size:     4
//   float bExposure;                   // Offset:   28 Size:     4
//   float BlurSigma;                   // Offset:   32 Size:     4 [unused]
//   float BloomSaturation;             // Offset:   36 Size:     4 [unused]
//   bool enableBKelvin;                // Offset:   40 Size:     4 [unused]
//   uint BKelvin;                      // Offset:   44 Size:     4 [unused]
//   float frametime;                   // Offset:   48 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__pd80_hqbloom__texPrepLOD     texture  float4          2d            t10      1 
// __V__pd80_hqbloom__texBAvgLuma    texture  float4          2d            t14      1 
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
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_l_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t10.xyzw, s0, l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.w, l(0.500000, 0.500000, 0.000000, 0.000000), t14.yzwx, s0
max r0.w, r0.w, l(0.000001)
min r0.w, r0.w, l(0.999999)
add_sat r0.xyz, -r0.wwww, r0.xyzx
add r1.x, -r0.w, l(1.000000)
div r0.w, cb0[1].z, r0.w
log r0.w, r0.w
add r0.w, r0.w, cb0[1].w
exp r0.w, r0.w
div r0.xyz, r0.xyzx, r1.xxxx
mul o0.xyz, r0.xyzx, r0.wwww
mov o0.w, l(1.000000)
ret 
// Approximately 14 instruction slots used