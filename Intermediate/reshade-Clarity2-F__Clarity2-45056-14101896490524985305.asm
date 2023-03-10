//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__Clarity2Tex                  texture  float4          2d             t4      1 
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
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { 0, 0.044327, 0, 0},
                              { 0.001385, 0.087299, 0, 0},
                              { 0.003231, 0.082089, 0, 0},
                              { 0.005077, 0.073482, 0, 0},
                              { 0.006923, 0.062617, 0, 0},
                              { 0.008769, 0.050796, 0, 0},
                              { 0.010615, 0.039226, 0, 0},
                              { 0.012462, 0.028837, 0, 0},
                              { 0.014308, 0.020181, 0, 0},
                              { 0.016154, 0.013445, 0, 0},
                              { 0.018000, 0.008527, 0, 0},
                              { 0.019846, 0.005148, 0, 0},
                              { 0.021693, 0.002959, 0, 0},
                              { 0.023539, 0.001619, 0, 0},
                              { 0.025385, 0.000843, 0, 0} }
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.x
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t4.xyzw, s1
mul r0.x, r0.x, l(0.044327)
mov r1.x, l(0)
mov r0.y, r0.x
mov r0.z, l(1)
loop 
  ige r0.w, r0.z, l(15)
  breakc_nz r0.w
  mov r1.y, icb[r0.z + 0].x
  add r1.zw, r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t4.yzwx, s1, l(0.000000)
  mad r0.w, r0.w, icb[r0.z + 0].y, r0.y
  add r1.yz, -r1.xxyx, v1.xxyx
  sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.yzyy, t4.yxzw, s1, l(0.000000)
  mad r0.y, r1.y, icb[r0.z + 0].y, r0.w
  iadd r0.z, r0.z, l(1)
endloop 
mov o0.x, r0.y
ret 
// Approximately 19 instruction slots used
