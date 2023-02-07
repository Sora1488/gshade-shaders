//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float depth_near;                  // Offset:    0 Size:     4
//   float depthpos;                    // Offset:    4 Size:     4
//   float depth_far;                   // Offset:    8 Size:     4
//   float depth_smoothing;             // Offset:   12 Size:     4
//   float intensity;                   // Offset:   16 Size:     4
//   float hue;                         // Offset:   20 Size:     4
//   float saturation;                  // Offset:   24 Size:     4
//   int blendmode_1;                   // Offset:   28 Size:     4
//   float opacity;                     // Offset:   32 Size:     4
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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 9
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.x
add r1.x, -cb0[0].x, cb0[0].y
add r1.y, cb0[0].z, cb0[0].y
add r1.z, r1.x, -cb0[0].w
add r1.x, -r1.z, r1.x
add r1.z, r0.w, -r1.z
div r1.x, l(1.000000, 1.000000, 1.000000, 1.000000), r1.x
mul_sat r1.x, r1.x, r1.z
mad r1.z, r1.x, l(-2.000000), l(3.000000)
mul r1.x, r1.x, r1.x
mul r1.x, r1.x, r1.z
add r0.w, r0.w, -r1.y
div r1.y, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[0].w
mul_sat r0.w, r0.w, r1.y
mad r1.y, r0.w, l(-2.000000), l(3.000000)
mul r0.w, r0.w, r0.w
mad r0.w, -r1.y, r0.w, l(1.000000)
mad r0.w, -r1.x, r0.w, l(1.000000)
mul r1.x, r0.w, cb0[1].x
add r1.yzw, cb0[1].yyyy, l(0.000000, 1.000000, 0.666667, 0.333333)
frc r1.yzw, r1.yyzw
mad r1.yzw, r1.yyzw, l(0.000000, 6.000000, 6.000000, 6.000000), l(0.000000, -3.000000, -3.000000, -3.000000)
add_sat r1.yzw, |r1.yyzw|, l(0.000000, -1.000000, -1.000000, -1.000000)
add r1.yzw, r1.yyzw, l(0.000000, -1.000000, -1.000000, -1.000000)
mad r1.yzw, cb0[1].zzzz, r1.yyzw, l(0.000000, 1.000000, 1.000000, 1.000000)
mul r2.xyz, r1.yzwy, r1.xxxx
mul r0.w, r0.w, cb0[2].x
switch cb0[1].w
  case l(0)
  break 
  case l(1)
  min r2.xyz, r0.xyzx, r2.xyzx
  break 
  case l(2)
  mul r2.xyz, r0.xyzx, r2.xyzx
  break 
  case l(3)
  mad r3.xyz, r1.xxxx, r1.yzwy, r0.xyzx
  add r3.xyz, r3.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
  max r2.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  break 
  case l(4)
  ge r3.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r2.xyzx
  add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  div r4.xyz, r4.xyzx, r2.xyzx
  add_sat r4.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  movc r2.xyz, r3.xyzx, r2.xyzx, r4.xyzx
  break 
  case l(5)
  max r2.xyz, r0.xyzx, r2.xyzx
  break 
  case l(6)
  add r3.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  mad r4.xyz, -r1.xxxx, r1.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  mad r2.xyz, -r3.xyzx, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  break 
  case l(7)
  ge r3.xyz, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  mad r4.xyz, -r1.xxxx, r1.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  div_sat r4.xyz, r0.xyzx, r4.xyzx
  movc r2.xyz, r3.xyzx, r2.xyzx, r4.xyzx
  break 
  case l(8)
  mad r3.xyz, r1.xxxx, r1.yzwy, r0.xyzx
  min r2.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  break 
  case l(9)
  lt r3.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  mul r4.xyz, r0.xyzx, r2.xyzx
  add r4.xyz, r4.xyzx, r4.xyzx
  add r5.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r5.xyz, r5.xyzx, r5.xyzx
  mad r6.xyz, -r1.xxxx, r1.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  mad r5.xyz, -r5.xyzx, r6.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  movc r2.xyz, r3.xyzx, r4.xyzx, r5.xyzx
  break 
  case l(10)
  lt r3.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  add r4.xyz, r0.xyzx, r0.xyzx
  mul r5.xyz, r0.xyzx, r0.xyzx
  mad r6.xyz, -r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
  mul r5.xyz, r5.xyzx, r6.xyzx
  mad r5.xyz, r4.xyzx, r2.xyzx, r5.xyzx
  sqrt r6.xyz, r0.xyzx
  mad r7.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
  mad r8.xyz, -r1.xxxx, r1.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  mul r4.xyz, r4.xyzx, r8.xyzx
  mad r4.xyz, r6.xyzx, r7.xyzx, r4.xyzx
  movc r2.xyz, r3.xyzx, r5.xyzx, r4.xyzx
  break 
  case l(11)
  lt r3.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  add r4.xyz, r2.xyzx, r2.xyzx
  ge r5.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r2.xyzx
  add r6.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  div r6.xyz, r6.xyzx, r4.xyzx
  add_sat r6.xyz, -r6.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  movc r4.xyz, r5.xyzx, r4.xyzx, r6.xyzx
  mad r5.xyz, r1.xxxx, r1.yzwy, l(-0.500000, -0.500000, -0.500000, 0.000000)
  add r6.xyz, r5.xyzx, r5.xyzx
  ge r7.xyz, r5.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  mad r5.xyz, -r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
  div_sat r5.xyz, r0.xyzx, r5.xyzx
  movc r5.xyz, r7.xyzx, r6.xyzx, r5.xyzx
  movc r2.xyz, r3.xyzx, r4.xyzx, r5.xyzx
  break 
  case l(12)
  lt r3.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  mad r4.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r0.xyzx
  add r4.xyz, r4.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
  max r4.xyz, r4.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  mad r5.xyz, r1.xxxx, r1.yzwy, l(-0.500000, -0.500000, -0.500000, 0.000000)
  mad r5.xyz, r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r0.xyzx
  min r5.xyz, r5.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  movc r2.xyz, r3.xyzx, r4.xyzx, r5.xyzx
  break 
  case l(13)
  lt r3.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  add r4.xyz, r2.xyzx, r2.xyzx
  min r4.xyz, r0.xyzx, r4.xyzx
  mad r5.xyz, r1.xxxx, r1.yzwy, l(-0.500000, -0.500000, -0.500000, 0.000000)
  add r5.xyz, r5.xyzx, r5.xyzx
  max r5.xyz, r0.xyzx, r5.xyzx
  movc r2.xyz, r3.xyzx, r4.xyzx, r5.xyzx
  break 
  case l(14)
  lt r3.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  add r4.xyz, r2.xyzx, r2.xyzx
  ge r5.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r2.xyzx
  add r6.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  div r6.xyz, r6.xyzx, r4.xyzx
  add_sat r6.xyz, -r6.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  movc r4.xyz, r5.xyzx, r4.xyzx, r6.xyzx
  mad r5.xyz, r1.xxxx, r1.yzwy, l(-0.500000, -0.500000, -0.500000, 0.000000)
  add r6.xyz, r5.xyzx, r5.xyzx
  ge r7.xyz, r5.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  mad r5.xyz, -r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
  div_sat r5.xyz, r0.xyzx, r5.xyzx
  movc r5.xyz, r7.xyzx, r6.xyzx, r5.xyzx
  movc r3.xyz, r3.xyzx, r4.xyzx, r5.xyzx
  lt r3.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
  movc r2.xyz, r3.xyzx, l(0,0,0,0), l(1.000000,1.000000,1.000000,0)
  break 
  case l(15)
  ge r3.xyz, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  mul r4.xyz, r0.xyzx, r0.xyzx
  mad r5.xyz, -r1.xxxx, r1.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  div_sat r4.xyz, r4.xyzx, r5.xyzx
  movc r2.xyz, r3.xyzx, r2.xyzx, r4.xyzx
  break 
  case l(16)
  ge r3.xyz, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  mul r4.xyz, r2.xyzx, r2.xyzx
  add r5.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  div_sat r4.xyz, r4.xyzx, r5.xyzx
  movc r2.xyz, r3.xyzx, r0.xyzx, r4.xyzx
  break 
  case l(17)
  min r2.w, r2.y, r2.x
  min r2.w, r2.z, r2.w
  max r3.x, r2.y, r2.x
  max r3.x, r2.z, r3.x
  add r3.x, -r2.w, r3.x
  min r3.y, r0.y, r0.x
  min r3.y, r0.z, r3.y
  max r3.z, r0.y, r0.x
  max r3.z, r0.z, r3.z
  add r3.y, -r3.y, r3.z
  lt r3.z, l(0.000000), r3.x
  mad r4.xyz, r1.xxxx, r1.yzwy, -r2.wwww
  mul r4.xyz, r3.yyyy, r4.xyzx
  div r3.xyw, r4.xyxz, r3.xxxx
  and r3.xyz, r3.xywx, r3.zzzz
  dp3 r2.w, r3.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  dp3 r3.w, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  add r2.w, -r2.w, r3.w
  add r3.xyz, r2.wwww, r3.xyzx
  dp3 r2.w, r3.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  min r3.w, r3.y, r3.x
  min r3.w, r3.z, r3.w
  max r4.x, r3.y, r3.x
  max r4.x, r3.z, r4.x
  lt r4.y, r3.w, l(0.000000)
  add r5.xyz, -r2.wwww, r3.xyzx
  mul r5.xyz, r2.wwww, r5.xyzx
  add r3.w, r2.w, -r3.w
  div r5.xyz, r5.xyzx, r3.wwww
  add r5.xyz, r2.wwww, r5.xyzx
  movc r3.xyz, r4.yyyy, r5.xyzx, r3.xyzx
  lt r3.w, l(1.000000), r4.x
  add r4.yzw, -r2.wwww, r3.xxyz
  add r5.x, -r2.w, l(1.000000)
  mul r4.yzw, r4.yyzw, r5.xxxx
  add r4.x, -r2.w, r4.x
  div r4.xyz, r4.yzwy, r4.xxxx
  add r4.xyz, r2.wwww, r4.xyzx
  movc r2.xyz, r3.wwww, r4.xyzx, r3.xyzx
  break 
  case l(18)
  min r2.w, r0.y, r0.x
  min r2.w, r0.z, r2.w
  max r3.x, r0.y, r0.x
  max r3.x, r0.z, r3.x
  add r3.x, -r2.w, r3.x
  min r3.y, r2.y, r2.x
  min r3.y, r2.z, r3.y
  max r3.z, r2.y, r2.x
  max r3.z, r2.z, r3.z
  add r3.y, -r3.y, r3.z
  lt r3.z, l(0.000000), r3.x
  add r4.xyz, r0.xyzx, -r2.wwww
  mul r4.xyz, r3.yyyy, r4.xyzx
  div r3.xyw, r4.xyxz, r3.xxxx
  and r3.xyz, r3.xywx, r3.zzzz
  dp3 r2.w, r3.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  dp3 r3.w, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  add r2.w, -r2.w, r3.w
  add r3.xyz, r2.wwww, r3.xyzx
  dp3 r2.w, r3.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  min r3.w, r3.y, r3.x
  min r3.w, r3.z, r3.w
  max r4.x, r3.y, r3.x
  max r4.x, r3.z, r4.x
  lt r4.y, r3.w, l(0.000000)
  add r5.xyz, -r2.wwww, r3.xyzx
  mul r5.xyz, r2.wwww, r5.xyzx
  add r3.w, r2.w, -r3.w
  div r5.xyz, r5.xyzx, r3.wwww
  add r5.xyz, r2.wwww, r5.xyzx
  movc r3.xyz, r4.yyyy, r5.xyzx, r3.xyzx
  lt r3.w, l(1.000000), r4.x
  add r4.yzw, -r2.wwww, r3.xxyz
  add r5.x, -r2.w, l(1.000000)
  mul r4.yzw, r4.yyzw, r5.xxxx
  add r4.x, -r2.w, r4.x
  div r4.xyz, r4.yzwy, r4.xxxx
  add r4.xyz, r2.wwww, r4.xyzx
  movc r2.xyz, r3.wwww, r4.xyzx, r3.xyzx
  break 
  case l(19)
  dp3 r2.w, r2.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  dp3 r3.x, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  add r2.w, -r2.w, r3.x
  mad r1.xyz, r1.xxxx, r1.yzwy, r2.wwww
  dp3 r1.w, r1.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  min r2.w, r1.y, r1.x
  min r2.w, r1.z, r2.w
  max r3.x, r1.y, r1.x
  max r3.x, r1.z, r3.x
  lt r3.y, r2.w, l(0.000000)
  add r4.xyz, -r1.wwww, r1.xyzx
  mul r4.xyz, r1.wwww, r4.xyzx
  add r2.w, r1.w, -r2.w
  div r4.xyz, r4.xyzx, r2.wwww
  add r4.xyz, r1.wwww, r4.xyzx
  movc r1.xyz, r3.yyyy, r4.xyzx, r1.xyzx
  lt r2.w, l(1.000000), r3.x
  add r3.yzw, -r1.wwww, r1.xxyz
  add r4.x, -r1.w, l(1.000000)
  mul r3.yzw, r3.yyzw, r4.xxxx
  add r3.x, -r1.w, r3.x
  div r3.xyz, r3.yzwy, r3.xxxx
  add r3.xyz, r1.wwww, r3.xyzx
  movc r2.xyz, r2.wwww, r3.xyzx, r1.xyzx
  break 
  case l(20)
  dp3 r1.x, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  dp3 r1.y, r2.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  add r1.x, -r1.x, r1.y
  add r1.xyz, r0.xyzx, r1.xxxx
  dp3 r1.w, r1.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
  min r2.w, r1.y, r1.x
  min r2.w, r1.z, r2.w
  max r3.x, r1.y, r1.x
  max r3.x, r1.z, r3.x
  lt r3.y, r2.w, l(0.000000)
  add r4.xyz, -r1.wwww, r1.xyzx
  mul r4.xyz, r1.wwww, r4.xyzx
  add r2.w, r1.w, -r2.w
  div r4.xyz, r4.xyzx, r2.wwww
  add r4.xyz, r1.wwww, r4.xyzx
  movc r1.xyz, r3.yyyy, r4.xyzx, r1.xyzx
  lt r2.w, l(1.000000), r3.x
  add r3.yzw, -r1.wwww, r1.xxyz
  add r4.x, -r1.w, l(1.000000)
  mul r3.yzw, r3.yyzw, r4.xxxx
  add r3.x, -r1.w, r3.x
  div r3.xyz, r3.yzwy, r3.xxxx
  add r3.xyz, r1.wwww, r3.xyzx
  movc r2.xyz, r2.wwww, r3.xyzx, r1.xyzx
  break 
  default 
  mov r2.xyz, l(0,0,0,0)
  break 
endswitch 
add r1.xyz, -r0.xyzx, r2.xyzx
mad_sat o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 302 instruction slots used