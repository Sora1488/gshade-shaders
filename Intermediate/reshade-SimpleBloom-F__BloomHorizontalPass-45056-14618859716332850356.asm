//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t2      1 
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
dcl_immediateConstantBuffer { { 0.082607, 0, 0, 0},
                              { 0.080977, 0, 0, 0},
                              { 0.076276, 0, 0, 0},
                              { 0.069041, 0, 0, 0},
                              { 0.060049, 0, 0, 0},
                              { 0.050187, 0, 0, 0},
                              { 0.040306, 0, 0, 0},
                              { 0.031105, 0, 0, 0},
                              { 0.023066, 0, 0, 0},
                              { 0.016436, 0, 0, 0},
                              { 0.011254, 0, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t2.xyzw, s0
mul r0.xyz, r0.xyzx, l(0.082607, 0.082607, 0.082607, 0.000000)
mov r1.y, l(0)
mov r2.xyz, r0.xyzx
mov r0.w, l(1)
loop 
  ige r1.z, r0.w, l(11)
  breakc_nz r1.z
  itof r1.z, r0.w
  mul r1.x, r1.z, l(0.000641)
  add r1.zw, r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zwzz, t2.xyzw, s0, l(0.000000)
  add r1.xz, -r1.xxyx, v1.xxyx
  sample_l_indexable(texture2d)(float,float,float,float) r1.xzw, r1.xzxx, t2.xwyz, s0, l(0.000000)
  max r1.xzw, r1.xxzw, r3.xxyz
  max r1.xzw, r1.xxzw, r2.xxyz
  mad r2.xyz, r1.xzwx, icb[r0.w + 0].xxxx, r2.xyzx
  iadd r0.w, r0.w, l(1)
endloop 
mov o0.xyz, r2.xyzx
ret 
// Approximately 21 instruction slots used
