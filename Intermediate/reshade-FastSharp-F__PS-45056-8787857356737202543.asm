//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float amount;                      // Offset:    0 Size:     4
//   float mask_amount;                 // Offset:    4 Size:     4
//   int size;                          // Offset:    8 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__TexColor                     texture  float4          2d             t0      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, r0.xyzx, r1.xyzx
sample_aoffimmi_indexable(-1,0,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, r1.xyzx, r2.xyzx
sample_aoffimmi_indexable(0,-1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, r1.xyzx, r2.xyzx
sample_aoffimmi_indexable(0,1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, r1.xyzx, r2.xyzx
ieq r0.w, cb0[0].z, l(1)
if_nz r0.w
  sample_aoffimmi_indexable(1,1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
  sample_aoffimmi_indexable(-1,1,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(1,-1,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(-1,-1,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(0,-2,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(0,2,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000), r2.xyzx
  sample_aoffimmi_indexable(-2,0,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t0.xyzw, s0
  mad r2.xyz, r3.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000), r2.xyzx
  mul r2.xyz, r2.xyzx, l(0.120000, 0.120000, 0.120000, 0.000000)
else 
  mov r2.xyz, l(0,0,0,0)
endif 
mad r1.xyz, -r1.xyzx, l(0.200000, 0.200000, 0.200000, 0.000000), r0.xyzx
mul r1.w, cb0[0].x, l(5.000000)
mul r3.xyz, r1.xyzx, cb0[0].yyyy
mul r3.xyz, r3.xyzx, l(16.000000, 16.000000, 16.000000, 0.000000)
min r3.xyz, |r3.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
if_nz r0.w
  add r2.xyz, r0.xyzx, -r2.xyzx
  mad r2.xyz, r1.wwww, r2.xyzx, r0.xyzx
  add r4.xyz, r0.xyzx, -r2.xyzx
  mad o0.xyz, r3.xyzx, r4.xyzx, r2.xyzx
  ret 
else 
  mad r1.xyz, r1.wwww, r1.xyzx, r0.xyzx
  add r0.xyz, r0.xyzx, -r1.xyzx
  mad o0.xyz, r3.xyzx, r0.xyzx, r1.xyzx
  ret 
endif 
ret 
// Approximately 49 instruction slots used
