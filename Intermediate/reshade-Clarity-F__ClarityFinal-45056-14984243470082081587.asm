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
// __V__ClarityTex3                  texture  float4          2d             t8      1 
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
dcl_immediateConstantBuffer { { 0, 0.044327, 0, 0},
                              { 1.495371, 0.087299, 0, 0},
                              { 3.489199, 0.082089, 0, 0},
                              { 5.483031, 0.073482, 0, 0},
                              { 7.476869, 0.062617, 0, 0},
                              { 9.470713, 0.050796, 0, 0},
                              { 11.464565, 0.039226, 0, 0},
                              { 13.458429, 0.028837, 0, 0},
                              { 15.452306, 0.020181, 0, 0},
                              { 17.446196, 0.013445, 0, 0},
                              { 19.440104, 0.008527, 0, 0},
                              { 21.434029, 0.005148, 0, 0},
                              { 23.427973, 0.002959, 0, 0},
                              { 25.421940, 0.001619, 0, 0},
                              { 27.415928, 0.000843, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t8.xyzw, s0
mul r0.x, r0.x, l(0.044327)
mov r1.x, l(2.000000)
mov r0.y, r0.x
mov r0.z, l(1)
loop 
  ige r0.w, r0.z, l(15)
  breakc_nz r0.w
  mov r1.y, icb[r0.z + 0].x
  mad r1.zw, l(0.000000, 0.000000, 0.000000, 0.001852), r1.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t8.yzwx, s0, l(0.000000)
  mad r0.w, r0.w, icb[r0.z + 0].y, r0.y
  mad r1.yz, l(-0.000000, -0.000000, -0.001852, -0.000000), r1.xxyx, v1.xxyx
  sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.yzyy, t8.yxzw, s0, l(0.000000)
  mad r0.y, r1.y, icb[r0.z + 0].y, r0.w
  iadd r0.z, r0.z, l(1)
endloop 
sample_indexable(texture2d)(float,float,float,float) r0.xzw, v1.xyxx, t0.xwyz, s0
dp3 r1.x, r0.xzwx, l(0.327869, 0.655738, 0.016393, 0.000000)
div r1.yzw, r0.xxzw, r1.xxxx
add r0.y, -r0.y, r1.x
add r0.y, r0.y, l(1.000000)
mul r2.x, r0.y, l(0.500000)
mov_sat r2.y, r2.x
mad r2.z, r2.y, l(-2.000000), l(3.000000)
mul r2.y, r2.y, r2.y
mad r2.y, r2.z, r2.y, -r2.x
mad r2.x, r2.y, l(0.400000), r2.x
ge r2.y, r0.y, l(1.000000)
and r2.y, r2.y, l(0x3f800000)
mad r0.y, r0.y, l(0.500000), -r2.x
mad r0.y, r2.y, r0.y, r2.x
dp2 r2.x, r0.yyyy, r1.xxxx
add r2.y, -r1.x, l(1.000000)
add r2.y, r2.y, r2.y
add r2.z, -r0.y, l(1.000000)
mad r2.y, -r2.y, r2.z, l(1.000000)
ge r0.y, r0.y, l(0.500000)
and r0.y, r0.y, l(0x3f800000)
add r2.y, -r2.x, r2.y
mad r0.y, r0.y, r2.y, r2.x
dp3 r0.x, r0.xzwx, l(0.333333, 0.333333, 0.333333, 0.000000)
add r0.xz, r0.xxxx, l(-0.156943, 0.000000, -0.643057, 0.000000)
mul_sat r0.xz, r0.xxzx, l(12.743503, 0.000000, 3.110142, 0.000000)
mad r2.xy, r0.xzxx, l(-2.000000, -2.000000, 0.000000, 0.000000), l(3.000000, 3.000000, 0.000000, 0.000000)
mul r0.xz, r0.xxzx, r0.xxzx
mul r0.xz, r0.xxzx, r2.xxyx
mad r0.x, r0.z, -r0.x, r0.x
add r0.y, -r1.x, r0.y
mul r0.x, r0.y, r0.x
mad r0.x, r0.x, l(0.400000), r1.x
mul_sat o0.xyz, r1.yzwy, r0.xxxx
ret 
// Approximately 53 instruction slots used