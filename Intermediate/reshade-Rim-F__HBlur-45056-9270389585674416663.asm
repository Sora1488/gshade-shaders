//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int Blend;                         // Offset:    0 Size:     4 [unused]
//   float smooth;                      // Offset:    4 Size:     4 [unused]
//   float Rim;                         // Offset:    8 Size:     4 [unused]
//   float3 light;                      // Offset:   16 Size:    12 [unused]
//   int BLUR_ITERATION_;               // Offset:   28 Size:     4
//   float bloom;                       // Offset:   32 Size:     4 [unused]
//   float MaxDepth;                    // Offset:   36 Size:     4 [unused]
//   float MinDepth;                    // Offset:   40 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__TexRim                       texture  float4          2d             t8      1 
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
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
ineg r0.x, cb0[1].w
mov r1.y, l(0)
mov r0.yzw, l(0,0,0,0)
mov r1.z, r0.x
loop 
  ilt r1.w, cb0[1].w, r1.z
  breakc_nz r1.w
  imax r1.w, -r1.z, r1.z
  iadd r1.w, -r1.w, cb0[1].w
  ishl r2.x, r1.z, l(1)
  itof r2.x, r2.x
  add r2.x, r2.x, l(0.500000)
  mul r1.x, r2.x, l(0.000521)
  add r2.xy, r1.xyxx, v1.xyxx
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t8.xyzw, s0
  itof r1.x, r1.w
  mad r0.yzw, r1.xxxx, r2.xxyz, r0.yyzw
  iadd r1.z, r1.z, l(1)
endloop 
imul null, r0.x, cb0[1].w, cb0[1].w
itof r0.x, r0.x
div o0.xyz, r0.yzwy, r0.xxxx
ret 
// Approximately 23 instruction slots used
