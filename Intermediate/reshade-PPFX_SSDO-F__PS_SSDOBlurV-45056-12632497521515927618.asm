//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float pSSDOIntensity;              // Offset:    0 Size:     4 [unused]
//   float pSSDOAmount;                 // Offset:    4 Size:     4 [unused]
//   float pSSDOBounceMultiplier;       // Offset:    8 Size:     4 [unused]
//   float pSSDOBounceSaturation;       // Offset:   12 Size:     4 [unused]
//   int pSSDOSampleAmount;             // Offset:   16 Size:     4 [unused]
//   float pSSDOSampleRange;            // Offset:   20 Size:     4
//   int pSSDOSourceLOD;                // Offset:   24 Size:     4 [unused]
//   int pSSDOBounceLOD;                // Offset:   28 Size:     4 [unused]
//   float pSSDOFilterRadius;           // Offset:   32 Size:     4
//   float pSSDOAngleThreshold;         // Offset:   36 Size:     4 [unused]
//   float pSSDOFadeStart;              // Offset:   40 Size:     4 [unused]
//   float pSSDOFadeEnd;                // Offset:   44 Size:     4 [unused]
//   int pSSDODebugMode;                // Offset:   48 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texSSDOC                     texture  float4          2d            t14      1 
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t14.xyzw, s0
mul r0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
mov r1.xz, v1.xxxx
mov r2.xyz, r0.xyzx
mov r2.w, l(0.500000)
mov r3.x, l(1.500000)
loop 
  ge r3.y, r3.x, cb0[2].x
  breakc_nz r3.y
  mad r1.y, r3.x, l(0.000926), v1.y
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r1.xyxx, t14.xyzw, s0, l(0.000000)
  add r1.y, r0.w, -r4.w
  mad r1.y, cb0[1].y, l(0.000093), -|r1.y|
  lt r3.y, l(0.000000), r1.y
  lt r1.y, r1.y, l(0.000000)
  iadd r1.y, -r3.y, r1.y
  itof r1.y, r1.y
  mov_sat r1.y, r1.y
  mad r3.yzw, r4.xxyz, r1.yyyy, r2.xxyz
  add r1.y, r1.y, r2.w
  mad r1.w, -r3.x, l(0.000926), v1.y
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r1.zwzz, t14.xyzw, s0, l(0.000000)
  add r1.w, r0.w, -r4.w
  mad r1.w, cb0[1].y, l(0.000093), -|r1.w|
  lt r4.w, l(0.000000), r1.w
  lt r1.w, r1.w, l(0.000000)
  iadd r1.w, -r4.w, r1.w
  itof r1.w, r1.w
  mov_sat r1.w, r1.w
  mad r2.xyz, r4.xyzx, r1.wwww, r3.yzwy
  add r2.w, r1.w, r1.y
  add r3.x, r3.x, l(2.000000)
endloop 
div o0.xyz, r2.xyzx, r2.wwww
mov o0.w, l(1.000000)
ret 
// Approximately 36 instruction slots used