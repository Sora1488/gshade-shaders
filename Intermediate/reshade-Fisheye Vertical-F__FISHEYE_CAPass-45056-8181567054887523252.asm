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
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
mul r0.z, r0.x, r0.x
mad r0.w, |r0.x|, l(0.700000), l(0.010000)
mul r0.xy, r0.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
mad r0.z, r0.z, r0.w, l(1.000000)
mul r1.xyz, r0.zzzz, l(1.821455, 1.820364, 1.819273, 0.000000)
mad r0.zw, r1.zzzz, r0.xxxy, l(0.000000, 0.000000, 0.500000, 0.500000)
mad r1.xyzw, r1.xxyy, r0.xyxy, l(0.500000, 0.500000, 0.500000, 0.500000)
sample_indexable(texture2d)(float,float,float,float) r0.x, r0.zwzz, t0.zxyw, s0
mov o0.z, r0.x
sample_indexable(texture2d)(float,float,float,float) r0.x, r1.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t0.xyzw, s0
mov o0.xy, r0.xyxx
ret 
// Approximately 14 instruction slots used
