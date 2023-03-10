//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_immediateConstantBuffer { { 0, 0.132980, 0, 0},
                              { 1.458430, 0.232276, 0, 0},
                              { 3.403985, 0.135326, 0, 0},
                              { 5.351806, 0.051156, 0, 0},
                              { 7.302941, 0.012539, 0, 0},
                              { 9.258160, 0.001991, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul r0.xyz, r0.xyzx, l(0.132980, 0.132980, 0.132980, 0.000000)
mov r1.y, l(0)
mov r2.xyz, r0.xyzx
mov r0.w, l(1)
loop 
  ige r1.z, r0.w, l(6)
  breakc_nz r1.z
  mul r1.x, l(0.000521), icb[r0.w + 0].x
  add r1.zw, r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
  mad r3.xyz, r3.xyzx, icb[r0.w + 0].yyyy, r2.xyzx
  add r1.xz, -r1.xxyx, v1.xxyx
  sample_l_indexable(texture2d)(float,float,float,float) r1.xzw, r1.xzxx, t0.xwyz, s0, l(0.000000)
  mad r2.xyz, r1.xzwx, icb[r0.w + 0].yyyy, r3.xyzx
  iadd r0.w, r0.w, l(1)
endloop 
mov_sat o0.xyz, r2.xyzx
ret 
// Approximately 19 instruction slots used
