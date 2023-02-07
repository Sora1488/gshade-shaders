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
// __V__pd80_filmgrain__texNoise     texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
mov r0.zw, l(0,0,-1.000000,0.666667)
mov r1.zw, l(0,0,0,-0.333333)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
mov r0.xy, r2.zyzz
mov r1.xy, r0.yxyy
lt r2.w, r0.y, r2.z
movc r1.xyzw, r2.wwww, r0.xyzw, r1.xyzw
mov r3.xyz, r1.xywx
mov r3.w, r2.x
mov r1.xyw, r3.wywx
lt r0.x, r2.x, r3.x
movc r1.xyzw, r0.xxxx, r3.xyzw, r1.xyzw
min r0.x, r1.y, r1.w
add r0.x, -r0.x, r1.x
mad r0.x, r0.x, l(6.000000), l(0.000000)
add r0.z, -r1.y, r1.w
div r0.x, r0.z, r0.x
add r0.x, r0.x, r1.z
add r0.xz, |r0.xxxx|, l(-0.166667, 0.000000, -0.333333, 0.000000)
mul r0.xz, r0.xxzx, l(6.000000, 0.000000, 6.000000, 0.000000)
add r0.xz, -|r0.xxzx|, l(1.000000, 0.000000, 1.000000, 0.000000)
max r0.xz, r0.xxzx, l(0.000000, 0.000000, 0.000000, 0.000000)
mul r0.xz, r0.xxzx, l(1.200000, 0.000000, 0.833333, 0.000000)
add r0.x, r0.z, r0.x
mul r0.z, r0.x, l(0.833333)
mad r0.x, -r0.x, l(1.666667), l(3.000000)
mul r0.z, r0.z, r0.z
mul_sat r0.x, r0.x, r0.z
min r0.z, r0.y, r2.x
min r0.z, r2.z, r0.z
max r0.y, r0.y, r2.x
max r0.y, r2.z, r0.y
add r1.xy, r0.yyyy, l(0.000000, -0.200000, 0.000000, 0.000000)
add r0.z, -r0.z, r1.x
mul_sat r0.w, r1.y, l(1.250000)
div r0.z, r0.z, r0.y
mad_sat r0.y, -r0.y, l(5.000000), l(1.000000)
add r0.y, r0.y, r0.w
add_sat r0.z, r0.z, l(0.000000)
mul r0.x, r0.z, r0.x
mul r0.z, r0.y, r0.y
mad r0.y, -r0.y, l(2.000000), l(3.000000)
mad r0.y, -r0.z, r0.y, l(1.000000)
mul r0.x, r0.y, r0.x
mad r0.x, r0.x, l(-0.500000), l(1.000000)
mul r0.x, r0.x, l(0.333000)
sample_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t6.wxyz, s0
mad r0.yzw, r0.yyzw, l(0.000000, 2.000000, 2.000000, 2.000000), l(0.000000, -1.000000, -1.000000, -1.000000)
mad_sat r0.xyz, r0.xxxx, r0.yzwy, r2.xyzx
dp3 r0.x, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
dp3 r0.y, r2.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
add r0.x, -r0.y, r0.x
add r0.xyz, r0.xxxx, r2.xyzx
min r0.w, r0.y, r0.x
min r0.w, r0.z, r0.w
lt r1.x, r0.w, l(0.000000)
dp3 r1.y, r0.xzyx, l(0.333333, 0.333333, 0.333334, 0.000000)
add r2.xyz, r0.xyzx, -r1.yyyy
mul r2.xyz, r1.yyyy, r2.xyzx
add r0.w, -r0.w, r1.y
div r2.xyz, r2.xyzx, r0.wwww
add r2.xyz, r1.yyyy, r2.xyzx
movc r1.xzw, r1.xxxx, r2.xxyz, r0.xxyz
add r2.xyz, -r1.yyyy, r1.xzwx
add r0.w, -r1.y, l(1.000000)
mul r2.xyz, r0.wwww, r2.xyzx
max r0.x, r0.y, r0.x
max r0.x, r0.z, r0.x
add r0.y, -r1.y, r0.x
lt r0.x, l(1.000000), r0.x
div r0.yzw, r2.xxyz, r0.yyyy
add r0.yzw, r0.yyzw, r1.yyyy
movc o0.xyz, r0.xxxx, r0.yzwy, r1.xzwx
mov o0.w, l(1.000000)
ret 
// Approximately 75 instruction slots used
