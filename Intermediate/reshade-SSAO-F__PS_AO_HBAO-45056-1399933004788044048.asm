//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
dcl_immediateConstantBuffer { { 1.000000, 0, 0, 0},
                              { 0.707100, 0.707100, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { -0.707100, 0.707100, 0, 0},
                              { -1.000000, 0, 0, 0},
                              { -0.707100, -0.707100, 0, 0},
                              { 0, -1.000000, 0, 0},
                              { 0.707100, -0.707100, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
lt r0.xy, l(1.000000, 1.000000, 0.000000, 0.000000), v1.xyxx
or r0.x, r0.y, r0.x
discard_nz r0.x
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.z, r0.x, r0.y
add r1.xyzw, v1.xyxy, l(0.000000, 0.001000, 0.001000, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.x
sample_l_indexable(texture2d)(float,float,float,float) r1.x, r1.zwzz, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
add r2.y, -r0.z, r0.w
add r2.x, -r0.z, r1.x
mul r1.xy, r2.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
mov r1.z, l(0.000001)
dp3 r0.w, r1.xyzx, r1.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, r1.xyzx
dp3 r0.w, r1.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
mul o0.w, r0.w, l(0.100000)
lt r0.w, l(0.600000), r0.z
if_nz r0.w
  mov o0.xyz, l(1.000000,1.000000,1.000000,0)
else 
  mad r1.xy, v1.xyxx, l(2.000000, -2.000000, 0.000000, 0.000000), l(-1.000000, 1.000000, 0.000000, 0.000000)
  mul r1.xy, r0.zzzz, r1.xyxx
  mul r0.xy, r1.xyxx, l(0.431621, 0.767327, 0.000000, 0.000000)
  deriv_rtx_coarse r1.xyz, r0.zxyz
  deriv_rty_coarse r2.xyz, r0.yzxy
  mul r3.xyz, r1.xyzx, r2.xyzx
  mad r1.xyz, r1.zxyz, r2.yzxy, -r3.xyzx
  dp3 r0.w, r1.xyzx, r1.xyzx
  rsq r0.w, r0.w
  mul r1.xyz, r0.wwww, r1.xyzx
  dp2 r0.w, v1.xyxx, l(25.979601, 156.466003, 0.000000, 0.000000)
  sincos r0.w, null, r0.w
  mul r0.w, r0.w, l(43758.542969)
  frc r2.x, r0.w
  mad r0.w, -r2.x, r2.x, l(1.000000)
  sqrt r2.y, r0.w
  mul r0.w, r0.z, l(318.735840)
  mov r1.w, l(0)
  mov r2.z, l(0)
  loop 
    ige r2.w, r2.z, l(8)
    breakc_nz r2.w
    dp4 r2.w, icb[r2.z + 0].xxyy, r2.xxyy
    mad r3.xy, r2.xyxx, -r2.wwww, icb[r2.z + 0].xyxx
    div r3.xy, r3.xyxx, r0.wwww
    mul r3.xy, r3.xyxx, l(0.111111, 0.197531, 0.000000, 0.000000)
    itof r2.w, r2.z
    mul r2.w, r2.w, l(0.500000)
    frc r2.w, r2.w
    mov r4.x, r1.w
    mov r4.yz, l(0,0,0,0)
    mov r3.z, l(1)
    loop 
      ilt r3.w, l(9), r3.z
      breakc_nz r3.w
      itof r3.w, r3.z
      add r3.w, -r2.w, r3.w
      mad r5.xy, r3.xyxx, r3.wwww, v1.xyxx
      sample_l_indexable(texture2d)(float,float,float,float) r3.w, r5.xyxx, t2.yzwx, s0, l(0.000000)
      mad r4.w, -r3.w, l(999.000000), l(1000.000000)
      div r6.z, r3.w, r4.w
      mad r5.xy, r5.xyxx, l(2.000000, -2.000000, 0.000000, 0.000000), l(-1.000000, 1.000000, 0.000000, 0.000000)
      mul r5.xy, r6.zzzz, r5.xyxx
      mul r6.xy, r5.xyxx, l(0.431621, 0.767327, 0.000000, 0.000000)
      add r5.xyz, -r0.xyzx, r6.xyzx
      dp3 r3.w, r5.xyzx, r5.xyzx
      rsq r4.w, r3.w
      mul r5.xyz, r4.wwww, r5.xyzx
      dp3 r5.y, r1.xyzx, r5.xyzx
      lt r4.w, r4.y, r5.y
      mad r5.w, -r5.y, r5.y, l(1.000000)
      sqrt r5.w, r5.w
      add r5.z, -r5.w, l(1.000000)
      sqrt r3.w, r3.w
      mul r3.w, r3.w, l(1923.076904)
      mul r3.w, r3.w, r3.w
      mad r3.w, r3.w, l(0.020000), l(1.000000)
      div r3.w, l(1.000000, 1.000000, 1.000000, 1.000000), r3.w
      add r5.w, -r4.z, r5.z
      mad r5.x, r3.w, r5.w, r4.x
      movc r4.xyz, r4.wwww, r5.xyzx, r4.xyzx
      iadd r3.z, r3.z, l(1)
    endloop 
    mov r1.w, r4.x
    iadd r2.z, r2.z, l(1)
  endloop 
  mad r0.x, -r1.w, l(0.375000), l(1.000000)
  max r0.x, r0.x, l(0.100000)
  min o0.xyz, r0.xxxx, l(1.000000, 1.000000, 1.000000, 0.000000)
endif 
ret 
// Approximately 97 instruction slots used
