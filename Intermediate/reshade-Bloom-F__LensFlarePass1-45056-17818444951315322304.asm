//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texLensFlare1                texture  float4          2d            t14      1 
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
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
mov r0.x, v1.x
mov r1.xyzw, l(0,0,0,0)
mov r0.z, l(-10)
loop 
  ige r0.w, r0.z, l(11)
  breakc_nz r0.w
  itof r0.w, r0.z
  mad r0.y, r0.w, l(0.001852), v1.y
  sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.xyxx, t14.xyzw, s0
  imax r0.y, -r0.z, r0.z
  mad r1.xyzw, r2.xyzw, icb[r0.y + 0].xxxx, r1.xyzw
  iadd r0.z, r0.z, l(1)
endloop 
mov o0.xyzw, r1.xyzw
ret 
// Approximately 15 instruction slots used
