//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float anim_rate;                   // Offset:    0 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__texColorBuffer               texture  float4          2d             t4      1 
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
dcl_immediateConstantBuffer { { 0.200000, 0, 0, 0},
                              { 0.800000, 0, 0, 0},
                              { -0.200000, 0, 0, 0},
                              { 0.452000, 0, 0, 0},
                              { -0.283200, 0, 0, 0},
                              { 0.800000, 0, 0, 0},
                              { -0.280000, 0, 0, 0},
                              { -1.000000, 0, 0, 0},
                              { -0.420000, 0, 0, 0},
                              { -0.890000, 0, 0, 0},
                              { 0.720000, 0, 0, 0},
                              { -0.290000, 0, 0, 0},
                              { 0.750000, 0, 0, 0},
                              { 0.250000, 0, 0, 0},
                              { 0.330000, 0, 0, 0},
                              { 0.670000, 0, 0, 0},
                              { 0.980000, 0, 0, 0},
                              { 0.010000, 0, 0, 0},
                              { -0.280000, 0, 0, 0},
                              { 0.800000, 0, 0, 0},
                              { -0.320000, 0, 0, 0},
                              { -0.189000, 0, 0, 0},
                              { 0.110000, 0, 0, 0},
                              { 0.840000, 0, 0, 0},
                              { -0.480000, 0, 0, 0},
                              { 0.100000, 0, 0, 0},
                              { -0.232300, 0, 0, 0},
                              { -0.555000, 0, 0, 0},
                              { 0.421000, 0, 0, 0},
                              { 0.230000, 0, 0, 0},
                              { -0.280000, 0, 0, 0},
                              { 0.300000, 0, 0, 0},
                              { -1.333300, 0, 0, 0},
                              { 1.333000, 0, 0, 0},
                              { 4.000000, 0, 0, 0},
                              { 1.000000, 0, 0, 0} }
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 10
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t4.xyzw, s1
sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
lt r1.x, r1.x, l(0.000000)
if_nz r1.x
  mov o0.xyzw, r0.xyzw
else 
  mul r1.xyzw, v1.xyxy, l(5.000000, 5.000000, 0.125000, 0.125000)
  frc r2.xy, r1.xyxx
  add r2.xy, r2.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
  mul r2.xy, r2.xyxx, l(3.141000, 3.141000, 0.000000, 0.000000)
  sincos r2.xy, null, r2.xyxx
  add r2.xy, r2.xyxx, l(1.000000, 1.000000, 0.000000, 0.000000)
  round_ni r2.zw, r1.xxxy
  ftoi r2.zw, r2.zzzw
  round_pi r1.xy, r1.xyxx
  ftoi r1.xy, r1.xyxx
  imad r3.x, r2.z, l(6), r2.w
  udiv r4.x, r5.x, r3.x, l(6)
  mul r3.y, cb0[0].x, l(0.000500)
  sincos r3.y, null, r3.y
  mul r3.y, r3.y, l(3.141593)
  ult r3.z, r4.x, l(5)
  ult r3.w, r5.x, l(5)
  and r3.z, r3.w, r3.z
  mad r3.x, cb0[0].x, l(0.002000), icb[r3.x + 0].x
  sincos r3.x, r6.x, r3.x
  mov r6.y, r3.x
  and r3.xz, r3.zzzz, r6.xxyx
  itof r3.w, r4.x
  mul r4.y, r3.w, l(0.500000)
  round_ni r4.y, r4.y
  mad r3.w, -r4.y, l(2.000000), r3.w
  itof r4.y, r5.x
  mul r4.z, r4.y, l(0.500000)
  round_ni r4.z, r4.z
  mad r4.y, -r4.z, l(2.000000), r4.y
  lt r3.w, r3.w, l(1.000000)
  movc r6.x, r3.w, l(-1.000000), l(1.000000)
  lt r3.w, r4.y, l(1.000000)
  movc r6.y, r3.w, l(-1.000000), l(1.000000)
  mul r4.yz, r1.zzwz, r6.xxyx
  mul r3.xz, r3.xxzx, r4.yyzy
  sincos r6.x, r7.x, r3.y
  mov r8.x, -r6.x
  mov r8.y, r7.x
  dp2 r3.y, r8.yxyy, r3.xzxx
  mov r8.z, r6.x
  dp2 r3.x, r8.zyzz, r3.xzxx
  utof r3.z, r4.x
  add r3.y, r3.y, r3.z
  mul r4.x, r3.y, l(0.200000)
  utof r3.y, r5.x
  add r3.x, r3.x, r3.y
  mul r4.y, r3.x, l(0.200000)
  imad r2.w, r1.x, l(6), r2.w
  udiv r3.x, r5.x, r2.w, l(6)
  ult r3.y, r3.x, l(5)
  ult r3.z, r5.x, l(5)
  and r3.y, r3.z, r3.y
  mad r2.w, cb0[0].x, l(0.002000), icb[r2.w + 0].x
  sincos r6.x, r7.x, r2.w
  mov r7.y, r6.x
  and r3.yz, r3.yyyy, r7.xxyx
  itof r2.w, r3.x
  mul r3.w, r2.w, l(0.500000)
  round_ni r3.w, r3.w
  mad r2.w, -r3.w, l(2.000000), r2.w
  itof r3.w, r5.x
  mul r4.z, r3.w, l(0.500000)
  round_ni r4.z, r4.z
  mad r3.w, -r4.z, l(2.000000), r3.w
  lt r2.w, r2.w, l(1.000000)
  movc r6.x, r2.w, l(-1.000000), l(1.000000)
  lt r2.w, r3.w, l(1.000000)
  movc r6.y, r2.w, l(-1.000000), l(1.000000)
  mul r4.zw, r1.zzzw, r6.xxxy
  mul r3.yz, r3.yyzy, r4.zzwz
  dp2 r2.w, r8.yxyy, r3.yzyy
  dp2 r3.y, r8.zyzz, r3.yzyy
  utof r3.x, r3.x
  add r2.w, r2.w, r3.x
  mul r6.x, r2.w, l(0.200000)
  utof r2.w, r5.x
  add r2.w, r3.y, r2.w
  mul r6.y, r2.w, l(0.200000)
  imad r2.z, r2.z, l(6), r1.y
  udiv r3.x, r5.x, r2.z, l(6)
  ult r2.w, r3.x, l(5)
  ult r3.y, r5.x, l(5)
  and r2.w, r2.w, r3.y
  mad r2.z, cb0[0].x, l(0.002000), icb[r2.z + 0].x
  sincos r7.x, r9.x, r2.z
  mov r9.y, r7.x
  and r2.zw, r2.wwww, r9.xxxy
  itof r3.y, r3.x
  mul r3.z, r3.y, l(0.500000)
  round_ni r3.z, r3.z
  mad r3.y, -r3.z, l(2.000000), r3.y
  itof r3.z, r5.x
  mul r3.w, r3.z, l(0.500000)
  round_ni r3.w, r3.w
  mad r3.z, -r3.w, l(2.000000), r3.z
  lt r3.y, r3.y, l(1.000000)
  movc r7.x, r3.y, l(-1.000000), l(1.000000)
  lt r3.y, r3.z, l(1.000000)
  movc r7.y, r3.y, l(-1.000000), l(1.000000)
  mul r3.yz, r1.zzwz, r7.xxyx
  mul r2.zw, r2.zzzw, r3.yyyz
  dp2 r3.y, r8.yxyy, r2.zwzz
  dp2 r2.z, r8.zyzz, r2.zwzz
  utof r2.w, r3.x
  add r2.w, r3.y, r2.w
  mul r3.x, r2.w, l(0.200000)
  utof r2.w, r5.x
  add r2.z, r2.z, r2.w
  mul r3.y, r2.z, l(0.200000)
  imad r1.x, r1.x, l(6), r1.y
  udiv r5.x, r7.x, r1.x, l(6)
  ult r1.y, r5.x, l(5)
  ult r2.z, r7.x, l(5)
  and r1.y, r1.y, r2.z
  mad r1.x, cb0[0].x, l(0.002000), icb[r1.x + 0].x
  sincos r1.x, r9.x, r1.x
  mov r9.y, r1.x
  and r1.xy, r1.yyyy, r9.xyxx
  itof r2.z, r5.x
  mul r2.xyw, r2.xyxz, l(0.500000, 0.500000, 0.000000, 0.500000)
  round_ni r2.w, r2.w
  mad r2.z, -r2.w, l(2.000000), r2.z
  itof r2.w, r7.x
  mul r3.z, r2.w, l(0.500000)
  round_ni r3.z, r3.z
  mad r2.w, -r3.z, l(2.000000), r2.w
  lt r2.z, r2.z, l(1.000000)
  movc r9.x, r2.z, l(-1.000000), l(1.000000)
  lt r2.z, r2.w, l(1.000000)
  movc r9.y, r2.z, l(-1.000000), l(1.000000)
  mul r1.zw, r1.zzzw, r9.xxxy
  mul r1.xy, r1.zwzz, r1.xyxx
  dp2 r1.z, r8.yxyy, r1.xyxx
  dp2 r1.x, r8.zyzz, r1.xyxx
  utof r1.y, r5.x
  add r1.y, r1.z, r1.y
  mul r5.x, r1.y, l(0.200000)
  utof r1.y, r7.x
  add r1.x, r1.x, r1.y
  mul r5.y, r1.x, l(0.200000)
  add r1.xy, -r4.xyxx, r6.xyxx
  mad r1.xy, r2.xxxx, r1.xyxx, r4.xyxx
  add r1.zw, -r3.xxxy, r5.xxxy
  mad r1.zw, r2.xxxx, r1.zzzw, r3.xxxy
  add r1.zw, -r1.xxxy, r1.zzzw
  mad r1.xy, r2.yyyy, r1.zwzz, r1.xyxx
  sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t4.xyzw, s1
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, r1.xyxx, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
  ge r1.y, r1.x, l(0.000000)
  ge r1.x, l(1.000000), r1.x
  and r1.x, r1.x, r1.y
  movc o0.xyzw, r1.xxxx, r2.xyzw, r0.xyzw
endif 
ret 
// Approximately 165 instruction slots used