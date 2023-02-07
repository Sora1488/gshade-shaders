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
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mov_sat r0.xyz, r0.xyzx
add r1.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r2.xyz, r0.xyzx, r1.yxyy
mul r3.xyz, r1.zzxz, r2.xyzx
mad r4.xyz, -r3.yxyy, l(0.000000, 0.200000, 0.000000, 0.000000), r0.xyzx
mad r1.xyz, r2.xyzx, r1.zzxz, r4.xyzx
mad r1.xyz, -r3.zzxz, l(0.200000, 0.200000, 0.200000, 0.000000), r1.xyzx
add r1.xyz, -r0.xyzx, r1.xyzx
mad r0.xyz, r1.xyzx, l(0.320000, 0.320000, 0.320000, 0.000000), r0.xyzx
dp3 r0.w, r0.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
add r0.xyz, -r0.wwww, r0.xyzx
mad o0.xyz, r0.xyzx, l(0.886000, 0.886000, 0.886000, 0.000000), r0.wwww
ret 
// Approximately 14 instruction slots used