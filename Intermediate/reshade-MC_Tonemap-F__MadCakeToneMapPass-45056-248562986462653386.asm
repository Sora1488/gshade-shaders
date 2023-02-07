//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Contrast;                    // Offset:    0 Size:     4
//   float Compression;                 // Offset:    4 Size:     4
//   float BlackLevel;                  // Offset:    8 Size:     4
//   bool DeGamma;                      // Offset:   12 Size:     4
//   float Exposure;                    // Offset:   16 Size:     4
//   float SaturationLuma;              // Offset:   20 Size:     4
//   float Saturation;                  // Offset:   24 Size:     4
//   int LumaCoefs;                     // Offset:   28 Size:     4
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
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
switch cb0[1].w
  case l(0)
  mov r0.xyz, l(0.330000,0.330000,0.330000,0)
  break 
  case l(1)
  mov r0.xyz, l(0,0.590000,0.410000,0)
  break 
  default 
  mov r0.xyz, l(0.212600,0.715200,0.072200,0)
  break 
endswitch 
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
max r2.xyz, r1.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r2.xyz, r2.xyzx
mul r2.xyz, r2.xyzx, l(0.454545, 0.454545, 0.454545, 0.000000)
exp r2.xyz, r2.xyzx
movc r1.xyz, cb0[0].wwww, r2.xyzx, r1.xyzx
mul r1.xyz, r1.xyzx, cb0[1].xxxx
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[0].y
add r1.w, cb0[0].x, l(-1.000000)
mad r2.x, -r1.w, l(0.500000), cb0[0].x
exp r2.x, -r2.x
mul r2.y, r0.w, r2.x
add r2.x, r2.x, l(-1.000000)
add r0.w, -r0.w, r2.x
mad r0.w, r2.y, l(2.000000), r0.w
div r0.w, -r2.y, r0.w
max r1.xyz, r1.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
dp3 r2.x, r1.xyzx, r0.xyzx
mad r2.yzw, -r1.wwww, r1.xxyz, cb0[0].xxxx
log r3.xyz, r1.xyzx
mul r2.yzw, r2.yyzw, r3.xxyz
exp r2.yzw, r2.yyzw
add r3.w, r0.w, l(1.000000)
mul r2.yzw, r2.yyzw, r3.wwww
add r1.xyz, r0.wwww, r1.xyzx
div r1.xyz, r2.yzwy, r1.xyzx
mad r1.w, -r1.w, r2.x, cb0[0].x
mul r2.yzw, r3.xxyz, r1.wwww
exp r2.yzw, r2.yyzw
mul r2.yzw, r3.wwww, r2.yyzw
add r0.w, r0.w, r2.x
div r2.xyz, r2.yzwy, r0.wwww
add r2.xyz, -r1.xyzx, r2.xyzx
mad r1.xyz, r2.xyzx, cb0[1].yyyy, r1.xyzx
dp3 r0.x, r1.xyzx, r0.xyzx
add r0.xyz, -r1.xyzx, r0.xxxx
add r0.w, -cb0[1].z, l(1.000000)
mad r0.xyz, r0.xyzx, r0.wwww, r1.xyzx
add r0.xyz, r0.xyzx, -cb0[0].zzzz
max r1.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r1.xyz, r1.xyzx
mul r1.xyz, r1.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
exp r1.xyz, r1.xyzx
movc o0.xyz, cb0[0].wwww, r1.xyzx, r0.xyzx
ret 
// Approximately 56 instruction slots used
