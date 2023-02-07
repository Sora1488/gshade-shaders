//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float sharp_strength;              // Offset:    0 Size:     4
//   float sharp_clamp;                 // Offset:    4 Size:     4
//   int pattern;                       // Offset:    8 Size:     4
//   float offset_bias;                 // Offset:   12 Size:     4
//   bool debug;                        // Offset:   16 Size:     4
//   float sharpenEndDepth;             // Offset:   20 Size:     4
//   float sharpenMaxDeltaDepth;        // Offset:   24 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 8
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.x
ieq r1.xyz, cb0[0].zzzz, l(1, 2, 3, 0)
if_z cb0[0].z
  mad r2.xyzw, cb0[0].wwww, l(0.000174, 0.000309, -0.000174, -0.000309), v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t0.xyzw, s0
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.zwzz, t0.xyzw, s0
  add r2.xyz, r2.xyzx, r3.xyzx
  mul r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  mul r3.xyz, cb0[0].xxxx, l(0.318900, 1.072800, 0.108300, 0.000000)
else 
  mul r3.xyz, cb0[0].xxxx, l(0.212600, 0.715200, 0.072200, 0.000000)
  mov r2.xyz, l(0,0,0,0)
endif 
if_nz r1.x
  mad r4.xyzw, cb0[0].wwww, l(0.000260, -0.000463, 0.000260, 0.000463), v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r5.xyz, r4.xyxx, t0.xyzw, s0
  mad r6.xyzw, -cb0[0].wwww, l(0.000260, 0.000463, 0.000260, -0.000463), v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r7.xyz, r6.xyxx, t0.xyzw, s0
  add r5.xyz, r5.xyzx, r7.xyzx
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r4.zwzz, t0.xyzw, s0
  add r4.xyz, r4.xyzx, r5.xyzx
  sample_indexable(texture2d)(float,float,float,float) r5.xyz, r6.zwzz, t0.xyzw, s0
  add r4.xyz, r4.xyzx, r5.xyzx
  mul r2.xyz, r4.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000)
endif 
if_nz r1.y
  mad r4.xyzw, cb0[0].wwww, l(0.000208, -0.001111, 0.000625, 0.000370), v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r1.xyw, r4.xyxx, t0.xywz, s0
  mad r5.xyzw, -cb0[0].wwww, l(0.000625, 0.000370, 0.000208, -0.001111), v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r6.xyz, r5.xyxx, t0.xyzw, s0
  add r1.xyw, r1.xyxw, r6.xyxz
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r4.zwzz, t0.xyzw, s0
  add r1.xyw, r1.xyxw, r4.xyxz
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r5.zwzz, t0.xyzw, s0
  add r1.xyw, r1.xyxw, r4.xyxz
  mul r2.xyz, r1.xywx, l(0.250000, 0.250000, 0.250000, 0.000000)
  mul r3.xyz, r3.xyzx, l(0.510000, 0.510000, 0.510000, 0.000000)
endif 
if_nz r1.z
  mov r1.xw, l(0.000260,0,0,-0.000463)
  mul r1.yz, cb0[0].wwww, l(0.000000, -0.000926, -0.000521, 0.000000)
  add r1.xyzw, r1.xyzw, v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r1.xyxx, t0.xyzw, s0
  sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t0.xyzw, s0
  add r1.xyz, r1.xyzx, r4.xyzx
  mul r4.xw, cb0[0].wwww, l(0.000521, 0.000000, 0.000000, 0.000926)
  mov r4.yz, l(0,0.000463,-0.000260,0)
  add r4.xyzw, r4.xyzw, v1.xyxy
  sample_indexable(texture2d)(float,float,float,float) r5.xyz, r4.xyxx, t0.xyzw, s0
  add r1.xyz, r1.xyzx, r5.xyzx
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, r4.zwzz, t0.xyzw, s0
  add r1.xyz, r1.xyzx, r4.xyzx
  mul r2.xyz, r1.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000)
  mul r3.xyz, r3.xyzx, l(0.666000, 0.666000, 0.666000, 0.000000)
endif 
lt r1.x, cb0[1].y, l(1.000000)
div r0.w, r0.w, cb0[1].y
add r0.w, -r0.w, l(1.000000)
mul r1.yzw, r0.wwww, r3.xxyz
movc r1.xyz, r1.xxxx, r1.yzwy, r3.xyzx
add r2.xyz, r0.xyzx, -r2.xyzx
div r0.w, l(0.500000), cb0[0].y
mul r1.xyz, r0.wwww, r1.xyzx
mov r2.w, l(1.000000)
mov r1.w, l(0.500000)
dp4_sat r0.w, r2.xyzw, r1.xyzw
dp2 r0.w, cb0[0].yyyy, r0.wwww
add r0.w, r0.w, -cb0[0].y
if_nz cb0[1].x
  mad r1.x, r0.w, l(4.000000), l(0.500000)
  mov_sat o0.xyz, r1.xxxx
  ret 
endif 
add o0.xyz, r0.wwww, r0.xyzx
ret 
// Approximately 78 instruction slots used
