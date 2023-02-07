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
dcl_immediateConstantBuffer { { 0, 0, 0.225806, 0},
                              { 1, 0, 0.150538, 0},
                              { 0, 1, 0.150538, 0},
                              { 1, 1, 0.043011, 0},
                              { 1, -1, 0.043011, 0},
                              { 2, 0, 0, 0},
                              { 0, 2, 0, 0},
                              { 2, 1, 0, 0},
                              { 2, -1, 0, 0},
                              { 1, 2, 0, 0},
                              { 1, -2, 0, 0},
                              { 2, 2, 0, 0},
                              { 2, -2, 0, 0},
                              { 3, 0, 0, 0},
                              { 0, 3, 0, 0},
                              { 3, 1, 0, 0},
                              { 3, -1, 0, 0},
                              { 1, 3, 0, 0},
                              { -1, 3, 0, 0},
                              { 3, 2, 0, 0},
                              { 3, -2, 0, 0},
                              { 2, 3, 0, 0},
                              { 2, -3, 0, 0},
                              { 3, 3, 0, 0},
                              { 3, -3, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.w, r0.xyzx, l(0.327869, 0.655738, 0.016393, 0.000000)
div r1.xyz, r0.xyzx, r0.wwww
mul r0.xyz, r0.xyzx, l(0.225806, 0.225806, 0.225806, 0.000000)
mov r2.xyz, r0.xyzx
mov r1.w, l(1)
loop 
  ige r2.w, r1.w, l(5)
  breakc_nz r2.w
  itof r2.w, icb[r1.w + 0].x
  mul r3.x, r2.w, l(0.000521)
  itof r2.w, icb[r1.w + 0].y
  mul r3.y, r2.w, l(0.000926)
  add r3.zw, r3.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t0.xyzw, s0, l(0.000000)
  mad r4.xyz, r4.xyzx, icb[r1.w + 0].zzzz, r2.xyzx
  add r3.xy, -r3.xyxx, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r3.xyxx, t0.xyzw, s0, l(0.000000)
  mad r2.xyz, r3.xyzx, icb[r1.w + 0].zzzz, r4.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
dp3 r0.x, r2.xyzx, l(0.327869, 0.655738, 0.016393, 0.000000)
add r0.x, -r0.x, r0.w
add r0.x, r0.x, l(1.000000)
mul_sat r0.x, r0.x, l(0.500000)
mad r0.y, r0.x, l(-2.000000), l(3.000000)
mul r0.x, r0.x, r0.x
mul r0.z, r0.x, r0.y
dp2 r0.z, r0.zzzz, r0.wwww
add r1.w, -r0.w, l(1.000000)
add r1.w, r1.w, r1.w
mad r0.x, -r0.y, r0.x, l(1.000000)
mad r0.x, -r1.w, r0.x, l(1.000000)
ge r0.y, r0.w, l(0.500000)
and r0.y, r0.y, l(0x3f800000)
add r0.x, -r0.z, r0.x
mad r0.x, r0.y, r0.x, r0.z
add r0.x, -r0.w, r0.x
mad r0.x, r0.x, l(0.400000), r0.w
mul_sat o0.xyz, r1.xyzx, r0.xxxx
ret 
// Approximately 41 instruction slots used
