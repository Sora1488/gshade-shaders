//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 1
mad r0.xy, -v1.xyxx, v1.xyxx, v1.xyxx
add_sat r0.xy, r0.xyxx, l(-0.000000, -0.000925, 0.000000, 0.000000)
ne r0.xy, l(0.000000, 0.000000, 0.000000, 0.000000), r0.xyxx
and r0.x, r0.y, r0.x
if_nz r0.x
  sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
  mov o0.xyz, r0.xyzx
  ret 
else 
  mov o0.xyz, l(0.700000,0,0,0)
  ret 
endif 
ret 
// Approximately 13 instruction slots used
