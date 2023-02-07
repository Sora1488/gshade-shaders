//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__MXAO_DepthTex                texture  float4          2d             t6      1 
// __V__MXAO_NormalTex               texture  float4          2d             t8      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
// TEXCOORD                 0   xy          1     NONE   float       
// TEXCOORD                 1     zw        1     NONE   float     zw
// TEXCOORD                 2   x           2     NONE   float   x   
// TEXCOORD                 4    yzw        2     NONE   float    yzw
// TEXCOORD                 5   xyz         3     NONE   float   xyz 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.zw
dcl_input_ps linear v2.x
dcl_input_ps linear v2.yzw
dcl_input_ps linear v3.xyz
dcl_output o0.xyzw
dcl_temps 8
dcl_indexableTemp x0[4], 4
mad r0.xyz, v1.zwzz, v3.xyzx, v2.yzwy
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.zwzz, t6.yzwx, s0, l(0.000000)
mul r0.xyz, r0.wwww, r0.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.zwzz, t8.xyzw, s0
mad r1.xyz, r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
add r0.w, v0.y, v0.x
add r1.w, r0.w, r0.w
ge r1.w, r1.w, -r1.w
movc r2.xy, r1.wwww, l(2.000000,0.500000,0,0), l(-2.000000,-0.500000,0,0)
mul r0.w, r0.w, r2.y
frc r0.w, r0.w
mul r0.w, r0.w, r2.x
div r1.w, l(0.018000), r0.z
mul r2.xy, r1.wwww, l(1.000000, 1.777778, 0.000000, 0.000000)
mov x0[0].xyz, r1.xyzx
mov x0[1].xyz, r1.xyzx
mov x0[2].xyz, r1.xyzx
mov x0[3].xyz, r1.xyzx
mov r3.yz, l(0,0,-0.000000,0)
mov r1.w, l(1)
loop 
  ilt r2.z, l(5), r1.w
  breakc_nz r2.z
  itof r2.z, r1.w
  exp r2.z, r2.z
  mul r3.x, r2.x, r2.z
  add r4.xy, r3.xyxx, v1.zwzz
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyz, r4.xyxx, t8.xyzw, s0, l(0.000000)
  mad r5.xyz, r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
  mad r6.xyz, r4.xyxx, v3.xyzx, v2.yzwy
  sample_l_indexable(texture2d)(float,float,float,float) r3.x, r4.xyxx, t6.xyzw, s0, l(0.000000)
  mad r4.xyz, r6.xyzx, r3.xxxx, -r0.xyzx
  dp3 r3.x, r4.xyzx, r4.xyzx
  mul r3.x, r3.x, l(20.000000)
  div r3.x, r3.x, r2.z
  add r3.x, -r3.x, l(1.000000)
  max r3.x, r3.x, l(0.000000)
  dp3 r4.x, r1.xyzx, r5.xyzx
  add r4.xy, r4.xxxx, l(-0.300000, -1.000000, 0.000000, 0.000000)
  mul_sat r4.xy, r4.xyxx, l(1.470588, -50.000050, 0.000000, 0.000000)
  mad r4.zw, r4.xxxy, l(0.000000, 0.000000, -2.000000, -2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
  mul r4.xy, r4.xyxx, r4.xyxx
  mul r4.xy, r4.xyxx, r4.zwzz
  mul r4.x, r4.y, r4.x
  mul r3.x, r3.x, r4.x
  mul r3.x, r3.x, l(3.000000)
  div r2.z, r3.x, r2.z
  min r2.z, r2.z, l(1.000000)
  mov r4.xyz, x0[0].xyzx
  add r5.xyz, -r4.xyzx, r5.xyzx
  mad r4.xyz, r2.zzzz, r5.xyzx, r4.xyzx
  mov x0[0].xyz, r4.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mov r2.w, l(1.000000)
mov r3.w, r2.y
mov r1.w, l(1)
loop 
  ilt r2.z, l(5), r1.w
  breakc_nz r2.z
  itof r2.z, r1.w
  exp r2.z, r2.z
  mul r3.xy, r2.zzzz, r2.xwxx
  mad r3.xy, r3.xyxx, r3.zwzz, v1.zwzz
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t8.xyzw, s0, l(0.000000)
  mad r4.xyz, r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
  mad r5.xyz, r3.xyxx, v3.xyzx, v2.yzwy
  sample_l_indexable(texture2d)(float,float,float,float) r3.x, r3.xyxx, t6.xyzw, s0, l(0.000000)
  mad r5.xyz, r5.xyzx, r3.xxxx, -r0.xyzx
  dp3 r3.x, r5.xyzx, r5.xyzx
  mul r3.x, r3.x, l(20.000000)
  div r3.x, r3.x, r2.z
  add r3.x, -r3.x, l(1.000000)
  max r3.x, r3.x, l(0.000000)
  dp3 r3.y, r1.xyzx, r4.xyzx
  add r5.xy, r3.yyyy, l(-0.300000, -1.000000, 0.000000, 0.000000)
  mul_sat r5.xy, r5.xyxx, l(1.470588, -50.000050, 0.000000, 0.000000)
  mad r5.zw, r5.xxxy, l(0.000000, 0.000000, -2.000000, -2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
  mul r5.xy, r5.xyxx, r5.xyxx
  mul r5.xy, r5.xyxx, r5.zwzz
  mul r3.y, r5.y, r5.x
  mul r3.x, r3.x, r3.y
  mul r3.x, r3.x, l(3.000000)
  div r2.z, r3.x, r2.z
  min r2.z, r2.z, l(1.000000)
  mov r5.xyz, x0[1].xyzx
  add r4.xyz, r4.xyzx, -r5.xyzx
  mad r4.xyz, r2.zzzz, r4.xyzx, r5.xyzx
  mov x0[1].xyz, r4.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mov r1.w, l(1)
loop 
  ilt r2.z, l(5), r1.w
  breakc_nz r2.z
  itof r2.z, r1.w
  exp r2.z, r2.z
  mul r3.xy, r2.zzzz, r2.xyxx
  mad r3.xy, r3.xyxx, l(-1.000000, -0.000000, 0.000000, 0.000000), v1.zwzz
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t8.xyzw, s0, l(0.000000)
  mad r4.xyz, r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
  mad r5.xyz, r3.xyxx, v3.xyzx, v2.yzwy
  sample_l_indexable(texture2d)(float,float,float,float) r2.w, r3.xyxx, t6.yzwx, s0, l(0.000000)
  mad r3.xyz, r5.xyzx, r2.wwww, -r0.xyzx
  dp3 r2.w, r3.xyzx, r3.xyzx
  mul r2.w, r2.w, l(20.000000)
  div r2.w, r2.w, r2.z
  add r2.w, -r2.w, l(1.000000)
  max r2.w, r2.w, l(0.000000)
  dp3 r3.x, r1.xyzx, r4.xyzx
  add r3.xy, r3.xxxx, l(-0.300000, -1.000000, 0.000000, 0.000000)
  mul_sat r3.xy, r3.xyxx, l(1.470588, -50.000050, 0.000000, 0.000000)
  mad r3.zw, r3.xxxy, l(0.000000, 0.000000, -2.000000, -2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
  mul r3.xy, r3.xyxx, r3.xyxx
  mul r3.xy, r3.xyxx, r3.zwzz
  mul r3.x, r3.y, r3.x
  mul r2.w, r2.w, r3.x
  mul r2.w, r2.w, l(3.000000)
  div r2.z, r2.w, r2.z
  min r2.z, r2.z, l(1.000000)
  mov r3.xyz, x0[2].xyzx
  add r4.xyz, -r3.xyzx, r4.xyzx
  mad r3.xyz, r2.zzzz, r4.xyzx, r3.xyzx
  mov x0[2].xyz, r3.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mov r1.w, l(1)
loop 
  ilt r2.z, l(5), r1.w
  breakc_nz r2.z
  itof r2.z, r1.w
  exp r2.z, r2.z
  mul r3.xy, r2.zzzz, r2.xyxx
  mad r3.xy, r3.xyxx, l(0.000000, -1.000000, 0.000000, 0.000000), v1.zwzz
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t8.xyzw, s0, l(0.000000)
  mad r4.xyz, r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
  mad r5.xyz, r3.xyxx, v3.xyzx, v2.yzwy
  sample_l_indexable(texture2d)(float,float,float,float) r2.w, r3.xyxx, t6.yzwx, s0, l(0.000000)
  mad r3.xyz, r5.xyzx, r2.wwww, -r0.xyzx
  dp3 r2.w, r3.xyzx, r3.xyzx
  mul r2.w, r2.w, l(20.000000)
  div r2.w, r2.w, r2.z
  add r2.w, -r2.w, l(1.000000)
  max r2.w, r2.w, l(0.000000)
  dp3 r3.x, r1.xyzx, r4.xyzx
  add r3.xy, r3.xxxx, l(-0.300000, -1.000000, 0.000000, 0.000000)
  mul_sat r3.xy, r3.xyxx, l(1.470588, -50.000050, 0.000000, 0.000000)
  mad r3.zw, r3.xxxy, l(0.000000, 0.000000, -2.000000, -2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
  mul r3.xy, r3.xyxx, r3.xyxx
  mul r3.xy, r3.xyxx, r3.zwzz
  mul r3.x, r3.y, r3.x
  mul r2.w, r2.w, r3.x
  mul r2.w, r2.w, l(3.000000)
  div r2.z, r2.w, r2.z
  min r2.z, r2.z, l(1.000000)
  mov r3.xyz, x0[3].xyzx
  add r4.xyz, -r3.xyzx, r4.xyzx
  mad r3.xyz, r2.zzzz, r4.xyzx, r3.xyzx
  mov x0[3].xyz, r3.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mov r1.xyz, x0[0].xyzx
mov r2.xyz, x0[1].xyzx
add r1.xyz, r1.xyzx, r2.xyzx
mov r2.xyz, x0[2].xyzx
add r1.xyz, r1.xyzx, r2.xyzx
mov r2.xyz, x0[3].xyzx
add r1.xyz, r1.xyzx, r2.xyzx
dp3 r1.w, r1.xyzx, r1.xyzx
rsq r1.w, r1.w
mul r1.xyz, r1.wwww, r1.xyzx
mul r2.xyz, r0.zzzz, r1.xyzx
mad r0.xyz, r2.xyzx, l(0.001000, 0.001000, 0.001000, 0.000000), r0.xyzx
add r1.w, r0.z, l(2.000000)
mul r1.w, r1.w, v2.x
div r1.w, l(0.625000), r1.w
mad r2.xy, r0.wwww, l(-0.800000, 24.000000, 0.000000, 0.000000), l(1.000000, 1.000000, 0.000000, 0.000000)
mul r0.w, r1.w, r2.x
mul r1.w, r2.y, l(-0.160000)
mul r2.xyzw, v0.xyxy, l(4.000000, 4.000000, 4.000000, 4.000000)
ge r2.xyzw, r2.xyzw, -r2.zwzw
movc r2.xyzw, r2.xyzw, l(4.000000,4.000000,0.250000,0.250000), l(-4.000000,-4.000000,-0.250000,-0.250000)
mul r2.zw, r2.zzzw, v0.xxxy
frc r2.zw, r2.zzzw
mad r2.xy, r2.xyxx, r2.zwzz, l(0.100000, 0.100000, 0.000000, 0.000000)
round_ni r2.xy, r2.xyxx
dp2 r2.x, r2.xyxx, l(1.000000, 4.000000, 0.000000, 0.000000)
add r2.x, r2.x, l(1.000000)
mul r2.y, r2.x, l(2.399963)
sincos r3.x, r4.x, r2.y
mov r3.y, r4.x
mul r2.yz, r0.wwww, r3.xxyx
mov r3.xy, r2.yzyy
mov r4.w, l(0)
mov r2.w, l(0)
loop 
  itof r3.z, r2.w
  ge r3.w, r3.z, v2.x
  breakc_nz r3.w
  mul r5.xy, r3.xyxx, l(1.000000, 1.777778, 0.000000, 0.000000)
  mad r3.w, r2.x, l(0.062500), r3.z
  mad r5.xy, r5.xyxx, r3.wwww, v1.zwzz
  dp2 r6.x, r3.xyxx, l(0.764650, 0.644440, 0.000000, 0.000000)
  dp2 r6.y, r3.xyxx, l(-0.644440, 0.764650, 0.000000, 0.000000)
  mul r3.z, r0.w, r3.z
  mul_sat r3.z, r3.z, l(20.000000)
  mul r3.z, r3.z, l(3.000000)
  mad r7.xyz, r5.xyxx, v3.xyzx, v2.yzwy
  round_z r3.z, r3.z
  sample_l_indexable(texture2d)(float,float,float,float) r3.z, r5.xyxx, t6.yzxw, s0, r3.z
  mad r5.xyz, r7.xyzx, r3.zzzz, -r0.xyzx
  dp3 r3.z, r5.xyzx, r5.xyzx
  dp3 r3.w, r5.xyzx, r1.xyzx
  rsq r5.x, r3.z
  mad_sat r3.z, r1.w, r3.z, l(1.000000)
  mad_sat r3.w, r3.w, r5.x, l(-0.200000)
  mad r4.w, r3.z, r3.w, r4.w
  iadd r2.w, r2.w, l(1)
  mov r3.xy, r6.xyxx
endloop 
mul r0.x, v2.x, l(0.800000)
mov r4.xyz, l(0,0,0,0)
div_sat r0.xyzw, r4.xyzw, r0.xxxx
sqrt o0.xyzw, r0.xyzw
ret 
// Approximately 225 instruction slots used
