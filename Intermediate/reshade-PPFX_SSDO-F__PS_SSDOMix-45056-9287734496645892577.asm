//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float pSSDOIntensity;              // Offset:    0 Size:     4
//   float pSSDOAmount;                 // Offset:    4 Size:     4 [unused]
//   float pSSDOBounceMultiplier;       // Offset:    8 Size:     4 [unused]
//   float pSSDOBounceSaturation;       // Offset:   12 Size:     4 [unused]
//   int pSSDOSampleAmount;             // Offset:   16 Size:     4 [unused]
//   float pSSDOSampleRange;            // Offset:   20 Size:     4 [unused]
//   int pSSDOSourceLOD;                // Offset:   24 Size:     4 [unused]
//   int pSSDOBounceLOD;                // Offset:   28 Size:     4 [unused]
//   float pSSDOFilterRadius;           // Offset:   32 Size:     4 [unused]
//   float pSSDOAngleThreshold;         // Offset:   36 Size:     4 [unused]
//   float pSSDOFadeStart;              // Offset:   40 Size:     4 [unused]
//   float pSSDOFadeEnd;                // Offset:   44 Size:     4 [unused]
//   int pSSDODebugMode;                // Offset:   48 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __srgbV__texColorLOD              texture  float4          2d             t5      1 
// __V__texSSDOA                     texture  float4          2d            t10      1 
// __V__texSSDOB                     texture  float4          2d            t12      1 
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
dcl_constantbuffer CB0[4], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t5
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t12.xyzw, s0
log r0.xyz, |r0.xyzx|
mul r0.xyz, r0.xyzx, cb0[0].xxxx
ieq r0.w, cb0[3].x, l(1)
if_nz r0.w
  mul r1.xyz, r0.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
  exp o0.xyz, r1.xyzx
  mov o0.w, l(1.000000)
  ret 
else 
  ieq r0.w, cb0[3].x, l(2)
  if_nz r0.w
    sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t10.xyzw, s0
    log r1.xyz, |r1.xyzx|
    mul r1.xyz, r1.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
    exp o0.xyz, r1.xyzx
    mov o0.w, l(1.000000)
    ret 
  else 
    exp r0.xyz, r0.xyzx
    sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t5.xyzw, s0
    mul o0.xyz, r0.xyzx, r1.xyzx
    mov o0.w, l(1.000000)
    ret 
  endif 
endif 
ret 
// Approximately 27 instruction slots used
