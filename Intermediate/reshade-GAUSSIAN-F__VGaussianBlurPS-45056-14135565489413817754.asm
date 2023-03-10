//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int gGaussEffect;                  // Offset:    0 Size:     4 [unused]
//   float gGaussStrength;              // Offset:    4 Size:     4 [unused]
//   bool gAddBloom;                    // Offset:    8 Size:     4 [unused]
//   float gBloomStrength;              // Offset:   12 Size:     4 [unused]
//   float gBloomIntensity;             // Offset:   16 Size:     4 [unused]
//   int gGaussBloomWarmth;             // Offset:   20 Size:     4 [unused]
//   int gN_PASSES;                     // Offset:   24 Size:     4
//   float gBloomHW;                    // Offset:   28 Size:     4 [unused]
//   float gBloomVW;                    // Offset:   32 Size:     4
//   float gBloomSW;                    // Offset:   36 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_immediateConstantBuffer { { 0, 0.168190, 0, 0},
                              { 1.434783, 0.272770, 0, 0},
                              { 3.347826, 0.116901, 0, 0},
                              { 5.260870, 0.024068, 0, 0},
                              { 7.173913, 0.002111, 0, 0} }
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mul r0.xyzw, r0.xyzw, l(0.168190, 0.168190, 0.168190, 0.168190)
mov r1.x, l(0)
mov r2.xyzw, r0.xyzw
mov r1.z, l(1)
loop 
  ige r1.w, r1.z, cb0[1].z
  breakc_nz r1.w
  mul r1.w, cb0[2].x, icb[r1.z + 0].x
  mul r1.y, r1.w, l(0.000926)
  add r3.xy, r1.xyxx, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t0.xyzw, s0, l(0.000000)
  mad r3.xyzw, r3.xyzw, icb[r1.z + 0].yyyy, r2.xyzw
  add r1.yw, -r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r1.ywyy, t0.xyzw, s0, l(0.000000)
  mad r2.xyzw, r4.xyzw, icb[r1.z + 0].yyyy, r3.xyzw
  iadd r1.z, r1.z, l(1)
endloop 
mov o0.xyzw, r2.xyzw
ret 
// Approximately 20 instruction slots used
