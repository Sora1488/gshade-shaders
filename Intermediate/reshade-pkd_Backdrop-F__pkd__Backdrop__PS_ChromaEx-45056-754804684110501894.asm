//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 CFG_CHROMAEX_ORIGIN;        // Offset:    0 Size:     8
//   float CFG_CHROMAEX_ROTATION;       // Offset:    8 Size:     4
//   float CFG_CHROMAEX_FOREGROUND_LIMIT;// Offset:   12 Size:     4
//   float3 CFG_CHROMAEX_COLOR1;        // Offset:   16 Size:    12
//   float3 CFG_CHROMAEX_COLOR2;        // Offset:   32 Size:    12
//   bool CFG_CHROMAEX_SMOOTH_DIVIDER;  // Offset:   44 Size:     4
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
lt r0.x, r0.x, cb0[0].w
if_nz r0.x
  sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
  mov o0.xyz, r0.xyzx
  ret 
endif 
mul r0.x, cb0[0].z, l(0.017453)
sincos r0.x, r1.x, r0.x
add r0.yz, v1.xxyx, -cb0[0].xxyx
mul r0.x, r0.x, r0.z
mad r0.x, r0.y, r1.x, -r0.x
add r0.x, r0.x, cb0[0].x
if_nz cb0[2].w
  ge r0.y, r0.x, l(0.499740)
  ge r0.z, l(0.500260), r0.x
  and r0.y, r0.z, r0.y
  if_nz r0.y
    add r0.y, r0.x, l(-0.499740)
    mul r0.y, r0.y, l(1919.999878)
    add r1.xyz, -cb0[1].xyzx, cb0[2].xyzx
    mad o0.xyz, r0.yyyy, r1.xyzx, cb0[1].xyzx
    ret 
  endif 
endif 
ge r0.x, l(0.500000), r0.x
if_nz r0.x
  mov o0.xyz, cb0[1].xyzx
  ret 
else 
  mov o0.xyz, cb0[2].xyzx
  ret 
endif 
ret 
// Approximately 36 instruction slots used
