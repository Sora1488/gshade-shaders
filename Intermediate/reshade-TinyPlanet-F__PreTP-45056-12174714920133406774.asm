//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__texColorBuffer               texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
lt r0.x, v1.x, l(0.500000)
add r0.y, -v1.x, l(0.500000)
mul_sat r0.y, r0.y, l(10.000000)
add r0.y, -r0.y, l(1.000000)
mul r0.zw, v1.xxxy, l(0.000000, 0.000000, 0.500000, 1.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t4.xyzw, s1
add r2.xyz, v1.xyxx, l(0.500000, 0.000000, -0.500000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyw, r2.xyxx, t4.xywz, s1
mul_sat r0.z, r2.z, l(10.000000)
add r3.xyz, r1.xyzx, -r2.xywx
mad r3.xyz, r0.yyyy, r3.xyzx, r2.xywx
movc r0.xyw, r0.xxxx, r3.xyxz, r1.xyxz
mov o0.w, r1.w
add r1.xyz, -r0.xywx, r2.xywx
mad r1.xyz, r0.zzzz, r1.xyzx, r0.xywx
lt r0.z, l(0.500000), v1.x
movc o0.xyz, r0.zzzz, r1.xyzx, r0.xywx
ret 
// Approximately 18 instruction slots used