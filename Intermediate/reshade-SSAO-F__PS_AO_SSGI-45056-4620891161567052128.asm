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
// __V__texHDR3                      texture  float4          2d            t10      1 
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
dcl_immediateConstantBuffer { { -0.137648, 0.284202, 0.516250, 0},
                              { -0.626618, 0.459412, 0.244334, 0},
                              { -0.890314, -0.058654, 0.101482, 0},
                              { 0.287142, 0.851168, 0.157460, 0},
                              { -0.152525, -0.387012, 0.653892, 0},
                              { 0.697870, -0.217677, 0.563764, 0},
                              { 0.734301, 0.377433, 0.634728, 0},
                              { 0.140880, -0.889150, 0.246765, 0},
                              { -0.664262, -0.543601, 0.564232, 0},
                              { -0.324815, -0.093939, 0.003569, 0},
                              { -0.120858, 0.915206, 0.638453, 0},
                              { -0.452815, -0.965942, 0.395655, 0},
                              { -0.605974, 0.771908, 0.704962, 0},
                              { -0.688625, -0.538031, 0.348286, 0},
                              { 0.538031, -0.217677, 0.748404, 0},
                              { 0.734301, 0.999934, 0.230486, 0},
                              { -0.997607, -0.796926, 0.004316, 0},
                              { -0.577536, 0.284202, 0.542373, 0},
                              { -0.626618, 0.911518, 0.502570, 0},
                              { -0.298189, -0.086542, 0.406666, 0},
                              { 0.916124, 0.851168, 0.265420, 0},
                              { -0.152525, -0.071040, 0.886518, 0},
                              { 0.702279, -0.823825, 0.950557, 0},
                              { 0.602507, 0.645259, 0.993658, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
lt r0.xy, l(1.000000, 1.000000, 0.000000, 0.000000), v1.xyxx
or r0.x, r0.y, r0.x
discard_nz r0.x
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
lt r0.y, l(0.999900), r0.x
if_nz r0.y
  mov o0.xyzw, l(0,0,0,1.000000)
else 
  mad r0.yz, v1.yyxy, l(0.000000, -2.000000, 2.000000, 0.000000), l(0.000000, 1.000000, -1.000000, 0.000000)
  mul r0.yz, r0.xxxx, r0.yyzy
  mul r0.yz, r0.yyzy, l(0.000000, 0.767327, 0.431621, 0.000000)
  deriv_rtx_coarse r1.yz, r0.zzyz
  deriv_rtx_coarse r1.x, r0.x
  deriv_rty_coarse r2.xz, r0.yyzy
  deriv_rty_coarse r2.y, r0.x
  mul r0.yzw, r1.xxyz, r2.xxyz
  mad r0.yzw, r1.zzxy, r2.yyzx, -r0.yyzw
  dp3 r1.x, r0.yzwy, r0.yzwy
  rsq r1.x, r1.x
  mul r1.xyz, r0.yzwy, r1.xxxx
  dp2 r0.y, v1.xyxx, l(25.979601, 156.466003, 0.000000, 0.000000)
  sincos r0.y, null, r0.y
  mul r0.y, r0.y, l(43758.542969)
  frc r2.x, r0.y
  mad r0.y, -r2.x, r2.x, l(1.000000)
  sqrt r2.y, r0.y
  mul r0.xyz, r0.xxxx, l(2071.783203, 2071.782959, 5000.000000, 0.000000)
  mov r1.w, -r1.y
  div r1.xy, r1.xwxx, r0.xyxx
  mad r1.xy, r1.xyxx, l(1.000000, 1.777778, 0.000000, 0.000000), v1.xyxx
  mad r0.w, r1.z, l(8.000000), r0.z
  mad r0.z, r1.z, l(2.000000), r0.z
  mov r3.xyz, l(0,0,0,0)
  mov r1.zw, l(0,0,0,0)
  mov r2.zw, l(0,0,0,0)
  loop 
    ige r3.w, r2.w, l(9)
    breakc_nz r3.w
    dp4 r3.w, icb[r2.w + 0].xxyy, r2.xxyy
    mad r4.xy, r2.xyxx, -r3.wwww, icb[r2.w + 0].xyxx
    div r4.xy, r4.xyxx, r0.xyxx
    mad r4.xy, r4.xyxx, l(1.000000, 1.777778, 0.000000, 0.000000), r1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r3.w, r4.xyxx, t2.yzwx, s0, l(0.000000)
    mad r4.z, -r3.w, l(999.000000), l(1000.000000)
    div r3.w, r3.w, r4.z
    mul r4.z, r3.w, l(5000.000000)
    mad r4.w, icb[r2.w + 0].z, l(2.000000), r0.z
    mad r3.w, -r3.w, l(5000.000000), r4.w
    mul r4.w, l(4.000000), icb[r2.w + 0].z
    max r5.x, r3.w, l(0.000000)
    min r5.x, r4.w, r5.x
    add r5.x, r1.z, r5.x
    add r3.w, r3.w, l(-10.000000)
    max r3.w, r3.w, l(0.000000)
    min r3.w, r4.w, r3.w
    add r1.z, -r3.w, r5.x
    mad r3.w, icb[r2.w + 0].z, l(8.000000), r0.w
    lt r3.w, r4.z, r3.w
    mad r4.w, -icb[r2.w + 0].z, l(8.000000), r0.w
    lt r4.z, r4.w, r4.z
    and r3.w, r3.w, r4.z
    if_nz r3.w
      sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r4.xyxx, t10.xyzw, s0, l(0.000000)
      add r3.xyz, r3.xyzx, r4.xyzx
    endif 
    add r1.w, r1.w, l(1.000000)
    mad r2.z, icb[r2.w + 0].z, l(4.000000), r2.z
    iadd r2.w, r2.w, l(1)
  endloop 
  mul r0.x, r1.w, l(5.000000)
  div r0.xyz, r3.xyzx, r0.xxxx
  div r0.w, r1.z, r2.z
  mul r1.xyz, r0.xyzx, l(4.500000, 4.500000, 4.500000, 0.000000)
  mad o0.w, -r0.w, l(0.800000), l(1.000000)
  dp3 r0.w, r1.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
  mad r0.xyz, r0.xyzx, l(4.500000, 4.500000, 4.500000, 0.000000), -r0.wwww
  mad o0.xyz, r0.xyzx, l(1.800000, 1.800000, 1.800000, 0.000000), r0.wwww
endif 
ret 
// Approximately 81 instruction slots used
