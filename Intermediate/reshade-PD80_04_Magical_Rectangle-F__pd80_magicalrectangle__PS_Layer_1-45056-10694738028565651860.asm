//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 pp;                         // Offset:    0 Size:     8 [unused]
//   int shape;                         // Offset:    8 Size:     4
//   bool invert_shape;                 // Offset:   12 Size:     4
//   uint rotation;                     // Offset:   16 Size:     4 [unused]
//   float2 center;                     // Offset:   20 Size:     8 [unused]
//   float ret_size_x;                  // Offset:   28 Size:     4
//   float ret_size_y;                  // Offset:   32 Size:     4
//   float depthpos;                    // Offset:   36 Size:     4
//   float smoothing;                   // Offset:   40 Size:     4
//   float depth_smoothing;             // Offset:   44 Size:     4
//   float dither_strength;             // Offset:   48 Size:     4 [unused]
//   float3 reccolor;                   // Offset:   52 Size:    12
//   float mr_exposure;                 // Offset:   64 Size:     4 [unused]
//   float mr_contrast;                 // Offset:   68 Size:     4 [unused]
//   float mr_brightness;               // Offset:   72 Size:     4 [unused]
//   float mr_hue;                      // Offset:   76 Size:     4 [unused]
//   float mr_saturation;               // Offset:   80 Size:     4 [unused]
//   float mr_vibrance;                 // Offset:   84 Size:     4 [unused]
//   bool enable_gradient;              // Offset:   88 Size:     4
//   bool gradient_type;                // Offset:   92 Size:     4
//   float gradient_curve;              // Offset:   96 Size:     4
//   float intensity_boost;             // Offset:  100 Size:     4 [unused]
//   int blendmode_1;                   // Offset:  104 Size:     4 [unused]
//   float opacity;                     // Offset:  108 Size:     4 [unused]
//   bool hasdepth;                     // Offset:  112 Size:     4
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
// TEXCOORD                 2     zw        1     NONE   float     zw
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
dcl_constantbuffer CB0[8], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.zw
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.x
mad r1.xy, v1.zwzz, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
mad r2.x, cb0[1].w, cb0[2].z, cb0[1].w
mad r2.y, cb0[2].x, cb0[2].z, cb0[2].x
mul r1.zw, r2.xxxy, l(0.000000, 0.000000, 1.147396, 1.147396)
div r1.xy, r1.yxyy, r1.wzww
switch cb0[0].z
  case l(0)
  break 
  case l(1)
  dp2 r1.z, r1.xyxx, r1.xyxx
  dp2 r1.w, r1.xyxx, -r1.xyxx
  movc r2.x, cb0[5].w, l(1.000000), l(0)
  add r1.w, -r1.z, r1.w
  mad r1.xy, r2.xxxx, r1.wwww, r1.zzzz
  break 
  default 
  break 
endswitch 
add r1.xy, r1.xyxx, l(1.000000, 1.000000, 0.000000, 0.000000)
mul r1.zw, r1.xxxy, l(0.000000, 0.000000, 0.500000, 0.500000)
div r2.x, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[2].z
mul_sat r2.yz, r1.wwzw, r2.xxxx
mad r3.xy, r2.yzyy, l(-2.000000, -2.000000, 0.000000, 0.000000), l(3.000000, 3.000000, 0.000000, 0.000000)
mul r2.yz, r2.yyzy, r2.yyzy
mul r3.xy, r2.yzyy, r3.xyxx
mad r1.xy, -r1.yxyy, l(0.500000, 0.500000, 0.000000, 0.000000), l(1.000000, 1.000000, 0.000000, 0.000000)
mul_sat r1.xy, r2.xxxx, r1.xyxx
mad r2.xy, r1.xyxx, l(-2.000000, -2.000000, 0.000000, 0.000000), l(3.000000, 3.000000, 0.000000, 0.000000)
mul r1.xy, r1.xyxx, r1.xyxx
mul r3.zw, r1.xxxy, r2.xxxy
log r1.xy, |r1.zwzz|
mul r1.xy, r1.xyxx, cb0[6].xxxx
exp r1.xy, r1.xyxx
mul r1.xz, r1.xxxx, r3.xxyx
movc r2.xy, cb0[5].wwww, r1.xzxx, r3.xyxx
mul r2.zw, r1.yyyy, r3.zzzw
movc r1.xyzw, cb0[5].zzzz, r2.xyzw, r3.xyzw
add r2.x, -cb0[2].w, cb0[2].y
add r2.y, cb0[2].w, cb0[2].y
add r2.y, -r2.x, r2.y
add r0.w, r0.w, -r2.x
div r2.x, l(1.000000, 1.000000, 1.000000, 1.000000), r2.y
mul_sat r0.w, r0.w, r2.x
mad r2.x, r0.w, l(-2.000000), l(3.000000)
mul r0.w, r0.w, r0.w
mul r0.w, r0.w, r2.x
movc r0.w, cb0[7].x, r0.w, l(1.000000)
mul r1.x, r1.y, r1.x
mul r1.x, r1.z, r1.x
mul r1.x, r1.w, r1.x
mul r1.y, r0.w, r1.x
mad r0.w, -r1.x, r0.w, l(1.000000)
movc r0.w, cb0[0].w, r0.w, r1.y
max r1.x, cb0[3].w, cb0[3].z
max r1.x, r1.x, cb0[3].y
add_sat r1.y, -r0.w, l(1.000000)
mul r1.x, r0.w, r1.x
mad_sat r1.xyz, r0.xyzx, r1.yyyy, r1.xxxx
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
mov o0.w, r0.w
ret 
// Approximately 66 instruction slots used
