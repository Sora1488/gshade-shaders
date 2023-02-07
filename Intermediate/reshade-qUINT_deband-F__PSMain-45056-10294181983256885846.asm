//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float SEARCH_RADIUS;               // Offset:    0 Size:     4
//   int BIT_DEPTH;                     // Offset:    4 Size:     4
//   bool AUTOMATE_BIT_DEPTH;           // Offset:    8 Size:     4
//   int DEBAND_MODE;                   // Offset:   12 Size:     4
//   bool SKY_ONLY;                     // Offset:   16 Size:     4
//   float FRAME_TIME;                  // Offset:   20 Size:     4 [unused]
//   int FRAME_COUNT;                   // Offset:   24 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__qUINT__BackBufferTex         texture  float4          2d             t0      1 
// __V__qUINT__DepthBufferTex        texture  float4          2d             t2      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
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
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
if_nz cb0[1].x
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
  mad r1.x, -r0.w, l(999.000000), l(1000.000000)
  div_sat r0.w, r0.w, r1.x
  lt r0.w, r0.w, l(0.980000)
  if_nz r0.w
    mov o0.xyz, r0.xyzx
    ret 
  endif 
endif 
dp2 r0.w, v0.xyxx, l(0.754878, 0.569840, 0.000000, 0.000000)
add r1.xyz, r0.wwww, l(0.000000, 0.033118, 0.016559, 0.000000)
frc r1.xyz, r1.xyzx
itof r0.w, cb0[0].y
exp r0.w, r0.w
add r0.w, r0.w, l(-1.000000)
rcp r0.w, r0.w
movc r0.w, cb0[0].z, l(0.003922), r0.w
ieq r1.w, cb0[0].w, l(2)
if_nz r1.w
  mul r1.w, r1.x, l(192.850403)
  sincos r2.x, r3.x, r1.w
  mov r2.y, r3.x
  mad r2.xy, r2.xyxx, r1.xxxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
  mul r2.xy, r2.xyxx, cb0[0].xxxx
  mad r2.xy, r2.xyxx, l(0.025000, 0.025000, 0.000000, 0.000000), v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t0.xyzw, s0, l(0.000000)
  add r3.xyz, r0.xyzx, -r2.xyzx
  max r1.w, |r3.y|, |r3.x|
  max r1.w, |r3.z|, r1.w
  ge r1.w, r0.w, r1.w
  and r1.w, r1.w, l(0x3f800000)
  add r2.xyz, -r0.xyzx, r2.xyzx
  mad o0.xyz, r1.wwww, r2.xyzx, r0.xyzx
else 
  ieq r1.w, cb0[0].w, l(1)
  add r1.xyz, r1.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
  mad r1.xyz, r1.xyzx, r0.wwww, r0.xyzx
  movc o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
endif 
ret 
// Approximately 42 instruction slots used
