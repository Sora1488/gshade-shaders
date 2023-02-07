//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__Clarity2Tex                  texture  float4          2d             t4      1 
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
dp2 r0.x, v1.xyxx, l(12.989800, -78.233002, 0.000000, 0.000000)
sincos r0.x, null, r0.x
mad r0.x, r0.x, l(43758.542969), v1.x
frc r0.x, r0.x
mul r0.yz, v1.xxyx, l(0.000000, 0.125000, 0.125000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.y, r0.yzyy, t4.yxzw, s1
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.z, r1.xyzx, l(0.327869, 0.655738, 0.016393, 0.000000)
div r1.xyz, r1.xyzx, r0.zzzz
add r0.y, -r0.y, r0.z
add r0.y, r0.y, l(1.000000)
mul r0.w, r0.y, l(0.500000)
mul r1.w, r0.w, r0.w
mul r1.w, r0.w, r1.w
mad r2.x, r0.y, l(3.000000), l(-15.000000)
ge r0.y, r0.y, l(1.000000)
mad r2.x, r0.w, r2.x, l(10.000000)
mad r1.w, r1.w, r2.x, -r0.w
mad r1.w, r1.w, l(0.400000), r0.w
movc r2.x, r0.y, l(0), l(1.000000)
and r0.y, r0.y, l(0x3f800000)
mul r0.y, r0.y, r0.w
mad r0.y, r1.w, r2.x, r0.y
mad r0.x, -r0.x, l(0.015873), r0.y
add r0.x, r0.x, l(-0.007937)
add r0.y, -r0.x, l(1.000000)
add r2.xy, -r0.zzzz, l(1.000000, 0.356863, 0.000000, 0.000000)
add r0.w, r2.x, r2.x
mul_sat r1.w, r2.y, l(3.109756)
mad r0.y, -r0.w, r0.y, l(1.000000)
dp2 r0.w, r0.xxxx, r0.zzzz
ge r0.x, r0.x, l(0.500000)
and r0.x, r0.x, l(0x3f800000)
add r0.y, -r0.w, r0.y
mad r0.x, r0.x, r0.y, r0.w
add r0.x, -r0.z, r0.x
mad r0.y, r1.w, l(-2.000000), l(3.000000)
mul r0.w, r1.w, r1.w
mad r0.y, -r0.y, r0.w, l(1.000000)
add r0.w, r0.z, l(-0.643137)
mul_sat r0.w, r0.w, l(3.109756)
mad r1.w, r0.w, l(-2.000000), l(3.000000)
mul r0.w, r0.w, r0.w
mul r0.w, r0.w, r1.w
mad r0.y, r0.w, -r0.y, r0.y
mul r0.x, r0.x, r0.y
mad r0.x, r0.x, l(0.400000), r0.z
mul o0.xyz, r1.xyzx, r0.xxxx
mov o0.w, l(0)
ret 
// Approximately 50 instruction slots used