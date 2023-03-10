//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float threshold;                   // Offset:    0 Size:     4
//   float intensity;                   // Offset:    4 Size:     4 [unused]
//   int size;                          // Offset:    8 Size:     4
//   float bias;                        // Offset:   12 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__TexColor                     texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 6
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
ineg r0.w, cb0[0].z
add r1.x, cb0[0].x, l(0.000100)
mov r2.y, l(0)
mov r3.w, l(1.000000)
mov r4.xyzw, l(0,0,0,0)
mov r1.y, r0.w
loop 
  ilt r1.z, cb0[0].z, r1.y
  breakc_nz r1.z
  itof r1.z, r1.y
  mul r2.x, r1.z, l(0.000521)
  add r1.zw, r2.xxxy, v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
  add r2.xzw, -r0.xxyz, r3.xxyz
  dp3 r1.z, l(0.333000, 0.333000, 0.333000, 0.000000), |r2.xzwx|
  lt r1.z, r1.z, r1.x
  add r5.xyzw, r3.xyzw, r4.xyzw
  movc r4.xyzw, r1.zzzz, r5.xyzw, r4.xyzw
  iadd r1.y, r1.y, l(1)
endloop 
div o0.xyz, r4.xyzx, r4.wwww
ret 
// Approximately 23 instruction slots used
