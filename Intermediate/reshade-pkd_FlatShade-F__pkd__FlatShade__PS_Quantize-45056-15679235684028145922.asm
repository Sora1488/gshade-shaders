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
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
max r0.w, r0.z, r0.y
max r0.w, r0.w, r0.x
mul r1.x, r0.w, l(10.000000)
round_ni r1.y, r1.x
round_pi r1.x, r1.x
mad r1.z, -r1.y, l(0.100000), r0.w
mul r1.xy, r1.xyxx, l(0.100000, 0.100000, 0.000000, 0.000000)
ne r1.z, l(0.000000, 0.000000, 0.000000, 0.000000), |r1.z|
movc r1.x, r1.z, r1.y, r1.x
div r0.w, r1.x, r0.w
mul r0.xyz, r0.wwww, r0.xyzx
max r0.xyz, r0.yzxy, l(0.000001, 0.000001, 0.000001, 0.000000)
lt r1.x, r0.x, r0.y
mov r2.xy, r0.yxyy
mov r3.xy, r2.yxyy
mov r2.zw, l(0,0,-1.000000,0.666667)
mov r3.zw, l(0,0,0,-0.333333)
movc r1.xyzw, r1.xxxx, r2.xyzw, r3.xyzw
lt r2.x, r0.z, r1.x
mov r0.xyw, r1.xwxz
movc r0.xyz, r2.xxxx, r0.xyzx, r0.zwxz
add r0.w, -r1.y, r0.z
min r0.z, r1.y, r0.z
add r0.z, -r0.z, r0.x
mad r1.x, r0.z, l(6.000000), l(0.000001)
div r0.w, r0.w, r1.x
add r0.y, r0.y, r0.w
mad r0.x, -r0.z, l(0.500000), r0.x
mad r1.xyz, |r0.yyyy|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r1.xyz, |r1.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r1.xyz, r1.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r0.y, r0.x, l(2.000000), l(-1.000000)
mul r0.x, r0.x, l(6.250000)
round_z r0.x, r0.x
add r0.y, -|r0.y|, l(1.000001)
div r0.y, r0.z, r0.y
mad r0.z, r0.x, l(0.320000), l(-1.000000)
mul r0.x, r0.x, l(0.160000)
add r0.z, -|r0.z|, l(1.000000)
mul r0.y, r0.y, r0.z
mad o0.xyz, r1.xyzx, r0.yyyy, r0.xxxx
ret 
// Approximately 43 instruction slots used
