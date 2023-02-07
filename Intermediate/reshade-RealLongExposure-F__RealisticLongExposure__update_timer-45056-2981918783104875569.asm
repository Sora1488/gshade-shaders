//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float timer;                       // Offset:    0 Size:     4
//   float RealExposureDuration;        // Offset:    4 Size:     4
//   bool StartExposure;                // Offset:    8 Size:     4
//   bool ShowGreenOnFinish;            // Offset:   12 Size:     4 [unused]
//   float ISO;                         // Offset:   16 Size:     4 [unused]
//   float Gamma;                       // Offset:   20 Size:     4 [unused]
//   uint Delay;                        // Offset:   24 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__RealisticLongExposure__texTimerCopy    texture  float4          2d            t10      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   x   
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.x
dcl_output o0.x
dcl_temps 2
ine r0.x, cb0[0].z, l(0)
utof r0.y, cb0[1].z
sample_indexable(texture2d)(float,float,float,float) r0.z, l(0.250000, 0.500000, 0.000000, 0.000000), t10.yzxw, s0
mad r0.w, -r0.z, l(8388608.000000), cb0[0].x
mul r0.z, r0.z, l(8388608.000000)
movc r0.z, cb0[0].z, r0.z, cb0[0].x
lt r0.y, r0.y, |r0.w|
and r0.x, r0.y, r0.x
sample_indexable(texture2d)(float,float,float,float) r0.y, l(0.750000, 0.500000, 0.000000, 0.000000), t10.yxzw, s0
mad r1.x, r0.y, l(8388608.000000), l(1.000000)
mul r0.y, r0.y, l(8388608.000000)
movc r0.y, cb0[0].z, r0.y, l(0)
and r0.x, r0.x, r1.x
mul r1.x, cb0[0].y, l(1000.000000)
lt r0.w, |r0.w|, r1.x
movc r0.x, r0.w, r0.x, r0.y
lt r0.y, v1.x, l(0.500000)
movc r0.x, r0.y, r0.z, r0.x
mul o0.x, r0.x, l(0.000000)
ret 
// Approximately 20 instruction slots used
