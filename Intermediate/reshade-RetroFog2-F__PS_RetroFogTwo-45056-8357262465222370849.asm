//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float fOpacityTwo;                 // Offset:    0 Size:     4
//   float3 f3ColorTwo;                 // Offset:    4 Size:    12
//   bool bDitheringTwo;                // Offset:   16 Size:     4
//   float fQuantizeTwo;                // Offset:   20 Size:     4
//   float2 f2CurveTwo;                 // Offset:   24 Size:     8
//   float fStartTwo;                   // Offset:   32 Size:     4
//   bool bCurvedTwo;                   // Offset:   36 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __srgbV__ReShade__BackBufferTex    texture  float4          2d             t1      1 
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
dcl_immediateConstantBuffer { { 0, 0, 0, 0},
                              { 48, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 60, 0, 0, 0},
                              { 3, 0, 0, 0},
                              { 51, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 63, 0, 0, 0},
                              { 32, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { 44, 0, 0, 0},
                              { 28, 0, 0, 0},
                              { 35, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 47, 0, 0, 0},
                              { 31, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 56, 0, 0, 0},
                              { 4, 0, 0, 0},
                              { 52, 0, 0, 0},
                              { 11, 0, 0, 0},
                              { 59, 0, 0, 0},
                              { 7, 0, 0, 0},
                              { 55, 0, 0, 0},
                              { 40, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { 36, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { 43, 0, 0, 0},
                              { 27, 0, 0, 0},
                              { 39, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 2, 0, 0, 0},
                              { 50, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 62, 0, 0, 0},
                              { 1, 0, 0, 0},
                              { 49, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 61, 0, 0, 0},
                              { 34, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 46, 0, 0, 0},
                              { 30, 0, 0, 0},
                              { 33, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { 45, 0, 0, 0},
                              { 29, 0, 0, 0},
                              { 10, 0, 0, 0},
                              { 58, 0, 0, 0},
                              { 6, 0, 0, 0},
                              { 54, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 57, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 53, 0, 0, 0},
                              { 42, 0, 0, 0},
                              { 26, 0, 0, 0},
                              { 38, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 41, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { 37, 0, 0, 0},
                              { 21, 0, 0, 0} }
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t1.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.y, r1.x, r1.y
add r1.z, v1.x, l(-0.500000)
dp2 r1.z, r1.zzzz, r1.yyyy
add r1.x, r1.z, l(0.500000)
add r1.z, cb0[2].x, l(-0.450000)
mov r2.x, l(-0.500000)
mov r2.y, -r1.z
add r1.xw, r1.xxxy, r2.xxxy
dp2 r1.x, r1.xwxx, r1.xwxx
sqrt r1.x, r1.x
add r1.y, r1.z, -r1.y
movc r1.x, cb0[2].y, r1.x, |r1.y|
add r1.y, -cb0[1].z, cb0[1].w
add r1.x, r1.x, -cb0[1].z
div r1.y, l(1.000000, 1.000000, 1.000000, 1.000000), r1.y
mul_sat r1.x, r1.y, r1.x
mad r1.y, r1.x, l(-2.000000), l(3.000000)
mul r1.x, r1.x, r1.x
mul r1.x, r1.x, r1.y
if_nz cb0[1].x
  mul r1.y, r1.x, cb0[0].x
  lt r1.z, l(0.000000), cb0[1].y
  mul r1.w, r1.y, cb0[1].y
  round_ne r1.w, r1.w
  div r1.w, r1.w, cb0[1].y
  movc r1.y, r1.z, r1.w, r1.y
  mul r2.xyzw, v1.xyxy, l(1920.000000, 1080.000000, 15360.000000, 8640.000000)
  ge r3.xyzw, r2.zwzw, -r2.zwzw
  movc r3.xyzw, r3.xyzw, l(8.000000,8.000000,0.125000,0.125000), l(-8.000000,-8.000000,-0.125000,-0.125000)
  mul r1.zw, r2.xxxy, r3.zzzw
  frc r1.zw, r1.zzzw
  mul r1.zw, r1.zzzw, r3.xxxy
  lt r2.x, r1.z, l(8.000000)
  if_nz r2.x
    ftoi r1.zw, r1.zzzw
    ishl r1.w, r1.w, l(3)
    iadd r1.z, r1.w, r1.z
    iadd r1.z, l(1), icb[r1.z + 0].x
    itof r1.z, r1.z
    mul r1.z, r1.z, l(0.015625)
  else 
    mov r1.z, l(0)
  endif 
  lt r1.y, r1.y, r1.z
  movc r1.y, r1.y, l(0), l(1.000000)
else 
  mul r1.y, r1.x, cb0[0].x
endif 
add r1.xzw, -r0.xxyz, cb0[0].yyzw
mad o0.xyz, r1.yyyy, r1.xzwx, r0.xyzx
mov o0.w, r0.w
ret 
// Approximately 55 instruction slots used
