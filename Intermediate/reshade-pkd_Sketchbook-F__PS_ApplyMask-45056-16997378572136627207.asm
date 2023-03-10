//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float fMask_Intensity;             // Offset:    0 Size:     4
//   bool bDisplayMask;                 // Offset:    4 Size:     4
//   int iMask_Select;                  // Offset:    8 Size:     4
//   float Layer_PencilHatch_Blend;     // Offset:   12 Size:     4 [unused]
//   float Layer_PencilHatch_Scale;     // Offset:   16 Size:     4 [unused]
//   float Layer_PencilHatch_PosX;      // Offset:   20 Size:     4 [unused]
//   float Layer_PencilHatch_PosY;      // Offset:   24 Size:     4 [unused]
//   float Layer_PaperBase_Blend;       // Offset:   28 Size:     4 [unused]
//   float Layer_PaperBase_Scale;       // Offset:   32 Size:     4 [unused]
//   float Layer_PaperBase_PosX;        // Offset:   36 Size:     4 [unused]
//   float Layer_PaperBase_PosY;        // Offset:   40 Size:     4 [unused]
//   float Layer_PaperOverlay_Blend;    // Offset:   44 Size:     4 [unused]
//   float Layer_PaperOverlay_Scale;    // Offset:   48 Size:     4 [unused]
//   float Layer_PaperOverlay_PosX;     // Offset:   52 Size:     4 [unused]
//   float Layer_PaperOverlay_PosY;     // Offset:   56 Size:     4 [unused]
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
// __V__tSketchMask_Backup           texture  float4          2d             t4      1 
// __V__tSketchMask_Mask             texture  float4          2d             t6      1 
// __V__tSketchMask_Mask2            texture  float4          2d             t8      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
if_z cb0[0].z
  sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t6.xyzw, s0
else 
  ieq r0.y, cb0[0].z, l(1)
  if_nz r0.y
    sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t8.xyzw, s0
  else 
    mov r0.x, l(0)
  endif 
endif 
add r0.x, r0.x, l(-1.000000)
mad r0.x, cb0[0].x, r0.x, l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t4.wxyz, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r1.xyz, -r0.yzwy, r1.xyzx
mad r0.yzw, r0.xxxx, r1.xxyz, r0.yyzw
movc o0.xyz, cb0[0].yyyy, r0.xxxx, r0.yzwy
mov o0.w, l(1.000000)
ret 
// Approximately 19 instruction slots used
