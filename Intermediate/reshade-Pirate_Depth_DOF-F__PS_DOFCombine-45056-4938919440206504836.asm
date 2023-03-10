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
// __V__TexFocus                     texture  float4          2d            t10      1 
// __V__TexDOF1                      texture  float4          2d            t12      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t10.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0
eq r0.y, r0.x, l(0.000000)
if_nz r0.y
  mov o0.xyzw, r1.xyzw
else 
  sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t12.xyzw, s0
  mul_sat r0.x, r0.x, l(3.333333)
  mad r0.y, r0.x, l(-2.000000), l(3.000000)
  mul r0.x, r0.x, r0.x
  mul r0.x, r0.x, r0.y
  add r2.xyzw, -r1.xyzw, r2.xyzw
  mad o0.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
endif 
ret 
// Approximately 15 instruction slots used
