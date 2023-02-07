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
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.w, l(0.299000, 0.587000, 0.114000, 0.000000), r0.xyzx
min r1.x, r0.w, l(0.500000)
max r0.w, r0.w, l(0.500000)
add r0.w, r1.x, r0.w
add r1.x, r0.w, l(-0.500000)
dp3 r1.y, l(-0.147130, -0.288860, 0.436000, 0.000000), r0.xyzx
dp3 r1.z, l(0.615000, -0.514990, -0.100010, 0.000000), r0.xyzx
dp3 o0.y, l(1.000000, -0.394650, -0.580600, 0.000000), r1.xyzx
dp2 o0.z, l(1.000000, 2.032110, 0.000000, 0.000000), r1.xyxx
dp2 o0.x, l(1.000000, 1.139830, 0.000000, 0.000000), r1.xzxx
ret 
// Approximately 12 instruction slots used