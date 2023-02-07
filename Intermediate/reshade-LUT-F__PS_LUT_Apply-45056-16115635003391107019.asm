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
// __V__texLUT                       texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul r0.w, r0.z, l(31.000000)
frc r0.w, r0.w
mad r0.z, r0.z, l(31.000000), -r0.w
mad r0.xy, r0.xyxx, l(31.000000, 31.000000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
mul r1.yz, r0.xxyx, l(0.000000, 0.000977, 0.031250, 0.000000)
mad r1.x, r0.z, l(0.031250), r1.y
add r1.w, r1.x, l(0.031250)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r1.xzxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.wzww, t4.xyzw, s0
add r1.xyz, -r0.xyzx, r1.xyzx
mad r0.xyz, r0.wwww, r1.xyzx, r0.xyzx
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r1.x, r0.w
sqrt r0.w, r0.w
mul r0.xyz, r0.xyzx, r1.xxxx
mul o0.xyz, r0.wwww, r0.xyzx
ret 
// Approximately 18 instruction slots used
