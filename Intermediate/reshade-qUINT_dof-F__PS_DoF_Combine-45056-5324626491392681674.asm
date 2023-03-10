//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__qUINT__BackBufferTex         texture  float4          2d             t0      1 
// __V__qUINT__DepthBufferTex        texture  float4          2d             t2      1 
// __V__ADOF_FocusTex                texture  float4          2d             t4      1 
// __V__CommonTex1                   texture  float4          2d            t10      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float       
// TEXCOORD                 2   xy          3     NONE   float       
// TEXCOORD                 3   xy          4     NONE   float       
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
mul r0.xy, v1.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t10.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.w, -r0.w, l(999.000000), l(1000.000000)
div_sat r2.x, r0.w, r1.w
sample_indexable(texture2d)(float,float,float,float) r2.y, v1.xyxx, t4.yxzw, s0
mul_sat r2.yz, r2.xxyx, l(0.000000, 10.000000, 10.000000, 0.000000)
lt r0.w, r2.y, r2.z
if_nz r0.w
  div r0.w, r2.y, r2.z
  add r0.w, r0.w, l(-1.000000)
  mul r0.w, r0.w, l(0.000004)
else 
  add r1.w, -r2.z, r2.y
  mul r2.y, r2.z, l(3.756828)
  div_sat r0.w, r1.w, r2.y
endif 
lt r1.w, r2.x, l(0.000034)
movc r0.w, r1.w, l(0), |r0.w|
mul r1.w, r0.w, l(4.000000)
mad r0.w, r0.w, l(23.616001), l(-0.250000)
mul_sat r0.w, r0.w, l(0.571429)
rsq r0.w, r0.w
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
add r0.xyz, r0.xyzx, -r1.xyzx
mad o0.xyz, r0.wwww, r0.xyzx, r1.xyzx
min r0.x, r1.w, l(1.000000)
mad o0.w, r0.x, l(0.500000), l(0.500000)
ret 
// Approximately 30 instruction slots used
