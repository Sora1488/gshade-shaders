//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__tHexLensFlare_Prepare        texture  float4          2d             t2      1 
// __V__tHexLensFlare_VerticalBlur    texture  float4          2d             t4      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
add r0.xy, v1.xyxx, l(0.000521, -0.001604, 0.000000, 0.000000)
mov r1.w, l(1.000000)
mov r2.xyzw, l(0,0,0,0)
mov r0.z, l(0)
loop 
  ige r0.w, r0.z, l(16)
  breakc_nz r0.w
  itof r0.w, r0.z
  mad r3.xy, r0.wwww, l(0.001042, -0.003208, 0.000000, 0.000000), r0.xyxx
  sample_indexable(texture2d)(float,float,float,float) r1.xyz, r3.xyxx, t2.xyzw, s1
  add r2.xyzw, r1.xyzw, r2.xyzw
  iadd r0.z, r0.z, l(1)
endloop 
div r0.xyz, r2.xyzx, r2.wwww
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s1
add o0.xyz, r0.xyzx, r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 18 instruction slots used
