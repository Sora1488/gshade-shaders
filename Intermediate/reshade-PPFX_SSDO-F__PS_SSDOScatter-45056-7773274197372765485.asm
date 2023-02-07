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
//   float pSSDOAmount;                 // Offset:    4 Size:     4
//   float pSSDOBounceMultiplier;       // Offset:    8 Size:     4
//   float pSSDOBounceSaturation;       // Offset:   12 Size:     4
//   int pSSDOSampleAmount;             // Offset:   16 Size:     4
//   float pSSDOSampleRange;            // Offset:   20 Size:     4
//   int pSSDOSourceLOD;                // Offset:   24 Size:     4
//   int pSSDOBounceLOD;                // Offset:   28 Size:     4
//   float pSSDOFilterRadius;           // Offset:   32 Size:     4 [unused]
//   float pSSDOAngleThreshold;         // Offset:   36 Size:     4
//   float pSSDOFadeStart;              // Offset:   40 Size:     4
//   float pSSDOFadeEnd;                // Offset:   44 Size:     4
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
// __s1                              sampler      NA          NA             s1      1 
// __srgbV__texColorLOD              texture  float4          2d             t5      1 
// __V__texViewSpace                 texture  float4          2d             t8      1 
// __V__texSSDONoise                 texture  float4          2d            t16      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t5
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t16
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
itof r0.xyz, cb0[1].zxwz
exp r0.w, r0.x
mul r1.xy, r0.wwww, l(0.000521, 0.000926, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t8.xyzw, s0
mul r1.zw, v1.xxxy, l(0.000000, 0.000000, 480.000000, 270.000000)
frc r1.zw, r1.zzzw
sample_l_indexable(texture2d)(float,float,float,float) r1.z, r1.zwzz, t16.yzxw, s1, l(0.000000)
mul r0.w, r0.w, r0.y
div r0.w, cb0[1].y, r0.w
mul r1.xy, r1.xyxx, r0.wwww
mul r1.zw, r1.zzzz, l(0.000000, 0.000000, 811.139771, 297.719177)
mul r0.w, cb0[1].y, l(0.000926)
mov r3.w, l(1.000000)
mov r4.xyzw, l(0,0,0,1.000000)
loop 
  lt r5.x, r0.y, r4.w
  breakc_nz r5.x
  mul r5.xy, r1.zwzz, r4.wwww
  frc r5.xy, r5.xyxx
  mad r5.xy, r5.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
  dp2 r5.z, r5.xyxx, r5.xyxx
  rsq r5.z, r5.z
  mul r3.xy, r5.zzzz, r5.xyxx
  mov r3.z, -r3.y
  dp3 r5.x, r3.xzwx, r3.xzwx
  rsq r5.x, r5.x
  mul r5.xyz, r3.xzwx, r5.xxxx
  dp3 r3.z, r5.xyzx, r2.xyzx
  lt r5.x, l(0.000000), r3.z
  lt r3.z, r3.z, l(0.000000)
  iadd r3.z, -r5.x, r3.z
  itof r3.z, r3.z
  mul r3.xy, r3.zzzz, r3.xyxx
  mul r3.xy, r1.xyxx, r3.xyxx
  mul r3.xy, r4.wwww, r3.xyxx
  div r3.z, r4.w, r0.y
  max r3.z, r3.z, l(0.750000)
  mul r5.x, r3.z, r3.x
  mad r3.xy, r3.xyxx, r3.zzzz, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r6.xyzw, r3.xyxx, t8.xyzw, s0, r0.x
  sample_l_indexable(texture2d)(float,float,float,float) r7.xyz, r3.xyxx, t5.xyzw, s0, r0.z
  max r7.xyz, r7.xyzx, l(0.000010, 0.000010, 0.000010, 0.000000)
  log r7.xyz, r7.xyzx
  mul r7.xyz, r7.xyzx, cb0[0].wwww
  exp r7.xyz, r7.xyzx
  dp3 r3.x, r7.xyzx, r7.xyzx
  rsq r3.x, r3.x
  mul r7.xyz, r3.xxxx, r7.xyzx
  mad r7.xyz, -r7.xyzx, cb0[0].zzzz, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r5.z, -r3.y, v1.y
  add r6.xyzw, r2.wxyz, -r6.wxyz
  mul r3.xy, r2.wwww, r5.xzxx
  mov r3.z, r6.x
  dp3 r5.x, r3.xyzx, r3.xyzx
  rsq r5.y, r5.x
  mul r3.xyz, r3.xyzx, r5.yyyy
  dp3 r3.x, r3.xyzx, r2.xyzx
  ge r3.x, r3.x, cb0[2].y
  and r3.x, r3.x, l(0x3f800000)
  dp3 r3.y, r6.yzwy, r6.yzwy
  sqrt r3.y, r3.y
  add_sat r3.y, r3.y, l(-0.010000)
  lt r3.y, l(0.000000), r3.y
  itof r3.y, -r3.y
  mul r3.x, r3.y, r3.x
  sqrt r3.y, r5.x
  mad_sat r3.y, cb0[1].y, l(0.000926), -r3.y
  div r3.y, r3.y, r0.w
  mul r5.xyz, r3.xxxx, r7.xyzx
  mul r3.x, r3.y, r3.y
  mul r3.xyz, r5.xyzx, r3.xxxx
  mad r4.xyz, r3.xyzx, cb0[0].yyyy, r4.xyzx
  add r4.w, r4.w, l(1.000000)
endloop 
div r0.xyz, r4.xyzx, r0.yyyy
add r0.w, -cb0[2].w, cb0[2].z
add r1.x, r2.w, -cb0[2].w
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
mul_sat r0.w, r0.w, r1.x
mad r1.x, r0.w, l(-2.000000), l(3.000000)
mul r0.w, r0.w, r0.w
mul r0.w, r0.w, r1.x
mad_sat o0.xyz, -r0.xyzx, r0.wwww, l(1.000000, 1.000000, 1.000000, 0.000000)
mov o0.w, r2.w
ret 
// Approximately 85 instruction slots used