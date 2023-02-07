//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Copyright_Texture            texture  float4          2d             t4      1 
// __V__Copyright_Texture_CAb_Gauss_H    texture  float4          2d            t12      1 
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
dcl_immediateConstantBuffer { { 0, 0.132980, 0, 0},
                              { 1.458430, 0.232276, 0, 0},
                              { 3.403985, 0.135326, 0, 0},
                              { 5.351806, 0.051156, 0, 0},
                              { 7.302941, 0.012539, 0, 0},
                              { 9.258160, 0.001991, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
mov r0.xz, v1.xxyx
mov r0.yw, l(0,1.000000,0,1.000000)
dp2 r0.x, r0.xyxx, l(1.000000, -0.500000, 0.000000, 0.000000)
dp2 r0.y, r0.zwzz, l(1.000000, -0.500000, 0.000000, 0.000000)
mul r1.xy, r0.xyxx, l(1.697613, 13.846154, 0.000000, 0.000000)
add r0.xy, r1.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t4.xyzw, s0
mul r0.xyzw, r0.xyzw, l(0.132980, 0.132980, 0.132980, 0.132980)
mov r1.x, l(0)
mov r2.xyzw, r0.xyzw
mov r1.z, l(1)
loop 
  ige r1.w, r1.z, l(6)
  breakc_nz r1.w
  mul r1.y, l(0.000014), icb[r1.z + 0].x
  add r3.xy, r1.xyxx, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t12.xyzw, s0, l(0.000000)
  mad r3.xyzw, r3.xyzw, icb[r1.z + 0].yyyy, r2.xyzw
  add r1.yw, -r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r1.ywyy, t12.xyzw, s0, l(0.000000)
  mad r2.xyzw, r4.xyzw, icb[r1.z + 0].yyyy, r3.xyzw
  iadd r1.z, r1.z, l(1)
endloop 
mov o0.xyzw, r2.xyzw
ret 
// Approximately 25 instruction slots used
