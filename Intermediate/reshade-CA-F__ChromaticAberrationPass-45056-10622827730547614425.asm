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
add r0.xyzw, v1.xyxy, l(0.001302, -0.000463, -0.001302, 0.000463)
sample_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t0.xzyw, s0
sample_indexable(texture2d)(float,float,float,float) r0.y, r0.zwzz, t0.xzyw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r0.xy, r0.xyxx, -r1.xzxx
mul r0.xz, r0.xxyx, l(0.500000, 0.000000, 0.500000, 0.000000)
mov r0.y, l(0)
add o0.xyz, r0.xyzx, r1.xyzx
ret 
// Approximately 9 instruction slots used
