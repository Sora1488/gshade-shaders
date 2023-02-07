//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool GammaCorrectionEnable;        // Offset:    0 Size:     4
//   float BlurMulti;                   // Offset:    4 Size:     4
//   int BlackPoint;                    // Offset:    8 Size:     4 [unused]
//   int WhitePoint;                    // Offset:   12 Size:     4 [unused]
//   float MidTonesShift;               // Offset:   16 Size:     4 [unused]
//   float BlendStrength;               // Offset:   20 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__OrtonGaussianBlurTex         texture  float4          2d             t4      1 
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
dcl_immediateConstantBuffer { { 0, 0.033245, 0, 0},
                              { 1.495371, 0.065916, 0, 0},
                              { 3.489199, 0.063671, 0, 0},
                              { 5.483031, 0.059819, 0, 0},
                              { 7.476869, 0.054664, 0, 0},
                              { 9.470713, 0.048587, 0, 0},
                              { 11.464565, 0.042005, 0, 0},
                              { 13.458429, 0.035321, 0, 0},
                              { 15.452306, 0.028888, 0, 0},
                              { 17.446196, 0.022981, 0, 0},
                              { 19.466198, 0.017782, 0, 0},
                              { 21.462744, 0.013382, 0, 0},
                              { 23.459291, 0.009796, 0, 0},
                              { 25.455845, 0.006975, 0, 0},
                              { 27.452402, 0.004830, 0, 0},
                              { 29.448961, 0.003253, 0, 0},
                              { 31.445528, 0.002132, 0, 0},
                              { 33.442101, 0.001358, 0, 0} }
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t4.xyzw, s0
mad r0.w, r0.x, l(2.000000), r0.z
mul r1.xyz, r0.xyzx, l(0.033245, 0.033245, 0.033245, 0.000000)
mad r0.x, r0.y, l(3.000000), r0.w
mul r0.x, r0.x, l(0.166667)
log r0.y, |r0.x|
mul r0.y, r0.y, l(0.454545)
exp r0.y, r0.y
movc r0.z, cb0[0].x, r0.y, r0.x
mov r0.xw, cb0[0].yyyy
mov r2.xyz, r1.xyzx
mov r1.w, l(1)
loop 
  ige r2.w, r1.w, l(18)
  breakc_nz r2.w
  mul r0.y, r0.z, icb[r1.w + 0].x
  mul r3.xy, r0.zwzz, r0.xyxx
  mad r3.zw, r3.xxxy, l(0.000000, 0.000000, 0.000000, 0.000926), v1.xxxy
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t4.xyzw, s0
  mad r4.xyz, r4.xyzx, icb[r1.w + 0].yyyy, r2.xyzx
  mad r3.xy, -r3.xyxx, l(0.000000, 0.000926, 0.000000, 0.000000), v1.xyxx
  sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.xyxx, t4.xyzw, s0
  mad r2.xyz, r3.xyzx, icb[r1.w + 0].yyyy, r4.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mov_sat o0.xyz, r2.xyzx
ret 
// Approximately 27 instruction slots used
