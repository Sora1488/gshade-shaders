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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.x, l(1.000000)
lt r0.x, r0.x, l(0.970000)
if_nz r0.x
  sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
  mul r1.xyzw, v1.xyxy, l(480.000000, 270.000000, 480.000000, 270.000000)
  round_ni r1.xyzw, r1.xyzw
  mad r2.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(0.500000, 0.500000, 0.500000, 1.500000)
  mul r2.xyzw, r2.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r2.xyxx, t0.xyzw, s0
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r2.xyxx, t0.xyzw, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r2.xyzw, r2.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(0.500000, 2.500000, 0.500000, 3.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(1.500000, 0.500000, 1.500000, 1.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(1.500000, 2.500000, 1.500000, 3.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(2.500000, 0.500000, 2.500000, 1.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(2.500000, 2.500000, 2.500000, 3.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r4.xyzw, r1.zwzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(3.500000, 0.500000, 3.500000, 1.500000)
  mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r5.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r4.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  mad r1.xyzw, r1.xyzw, l(4.000000, 4.000000, 4.000000, 4.000000), l(3.500000, 2.500000, 3.500000, 3.500000)
  mul r1.xyzw, r1.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r1.xyxx, t0.xyzw, s0, l(0.000000)
  add r2.xyzw, r2.xyzw, r4.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t0.xyzw, s0, l(0.000000)
  add r1.xyzw, r1.xyzw, r2.xyzw
  mul r2.xyzw, r3.xyzw, l(0.667000, 0.667000, 0.667000, 0.667000)
  mad r1.xyzw, r1.xyzw, l(0.020813, 0.020813, 0.020813, 0.020813), r2.xyzw
  mov r2.xz, v1.xxyx
  mov r2.yw, l(0,1.000000,0,1.000000)
  dp2 r0.w, r2.xyxx, l(1.000000, -0.500000, 0.000000, 0.000000)
  dp2 r2.x, r2.zwzz, l(1.000000, -0.500000, 0.000000, 0.000000)
  mul r3.x, r0.w, l(0.999001)
  mul r3.y, r2.x, l(0.999001)
  add r2.xy, r3.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  mov_sat r2.zw, r2.xxxy
  eq r2.xy, r2.zwzz, r2.xyxx
  and r0.w, r2.y, r2.x
  and r0.w, r0.w, l(0x3f800000)
  mul r1.w, r0.w, r1.w
  mad r1.xyz, r1.xyzx, r0.wwww, -r0.xyzx
  mad o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
  mov o0.w, r1.w
else 
  sample_indexable(texture2d)(float,float,float,float) o0.xyzw, v1.xyxx, t0.xyzw, s0
endif 
ret 
// Approximately 78 instruction slots used