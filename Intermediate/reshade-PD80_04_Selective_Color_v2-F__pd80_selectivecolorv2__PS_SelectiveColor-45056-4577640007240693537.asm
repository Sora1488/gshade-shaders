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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
mov r0.zw, l(0,0,-1.000000,0.666667)
mov r1.zw, l(0,0,0,-0.333333)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
mov_sat r2.xyz, r2.xyzx
max r3.xyw, r2.yzyx, l(0.000001, 0.000001, 0.000000, 0.000001)
mov r0.xy, r3.yxyy
mov r1.xy, r0.yxyy
lt r2.w, r0.y, r3.y
movc r0.xyzw, r2.wwww, r0.xyzw, r1.xyzw
lt r1.x, r3.w, r0.x
mov r3.xyz, r0.xywx
mov r0.xyw, r3.wywx
movc r0.xyzw, r1.xxxx, r3.xyzw, r0.xyzw
min r1.x, r0.y, r0.w
add r1.x, r0.x, -r1.x
mad r0.x, -r1.x, l(0.500000), r0.x
mov_sat r1.y, r0.x
mad r0.x, r0.x, l(2.000000), l(-1.000000)
add r0.x, -|r0.x|, l(1.000001)
div r0.x, r1.x, r0.x
mad r1.x, r1.x, l(6.000000), l(0.000001)
add r1.z, r1.y, l(-0.500000)
lt r1.w, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r1.w, r1.z
itof r1.z, r1.z
add r1.w, r1.z, l(1.000000)
mul r1.w, r1.w, l(0.500000)
mad r1.y, -r1.z, r1.y, r1.w
add r1.y, r1.y, r1.y
max r1.y, r1.y, l(0.000000)
log r1.y, r1.y
mul r1.yz, r1.yyzy, l(0.000000, 1.001000, 0.500000, 0.000000)
exp r1.y, r1.y
mad r1.y, -r1.z, r1.y, r1.w
mad r1.z, r1.y, l(2.000000), l(-1.000000)
add r1.z, -|r1.z|, l(1.000000)
mul r0.x, r0.x, r1.z
add r0.y, -r0.y, r0.w
div r0.y, r0.y, r1.x
add r0.y, r0.z, r0.y
mad r1.xzw, |r0.yyyy|, l(6.000000, 0.000000, 6.000000, 6.000000), l(-3.000000, 0.000000, -2.000000, -4.000000)
mad_sat r1.xzw, |r1.xxzw|, l(1.000000, 0.000000, -1.000000, -1.000000), l(-1.000000, 0.000000, 2.000000, 2.000000)
add r1.xzw, r1.xxzw, l(-0.500000, 0.000000, -0.500000, -0.500000)
mad r0.xzw, r1.xxzw, r0.xxxx, r1.yyyy
add r0.xzw, -r2.xxyz, r0.xxzw
max r1.x, r2.y, r2.x
max r1.x, r2.z, r1.x
min r1.y, r2.y, r2.x
min r1.y, r2.z, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
mad r1.y, -|r0.y|, l(6.000000), l(1.000000)
max r1.y, r1.y, l(0.000000)
mul r1.z, r1.y, r1.y
mad r1.y, -r1.y, l(2.000000), l(3.000000)
add r3.xyzw, |r0.yyyy|, l(-1.000000, -0.083333, -1.083333, -0.166667)
mul r3.xyzw, r3.xyzw, l(6.000000, 6.000000, 6.000000, 6.000000)
add r3.xyzw, -|r3.xyzw|, l(1.000000, 1.000000, 1.000000, 1.000000)
max r3.xyzw, r3.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mul r4.xyzw, r3.xyzw, r3.xyzw
mad r3.xyzw, -r3.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(3.000000, 3.000000, 3.000000, 3.000000)
mul r3.xyzw, r3.xyzw, r4.xyzw
mad r1.y, r1.z, r1.y, r3.x
mul r1.x, r1.x, r1.y
mad r0.xzw, r1.xxxx, r0.xxzw, r2.xxyz
max r1.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r2.x, r1.x, r1.y
mov r4.xy, r1.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r2.xyzw, r2.xxxx, r4.xyzw, r5.xyzw
lt r3.x, r1.w, r2.x
mov r1.xyz, r2.xywx
mov r2.xyw, r1.wywx
movc r1.xyzw, r3.xxxx, r1.xyzw, r2.xyzw
min r2.x, r1.y, r1.w
add r2.x, r1.x, -r2.x
mad r1.x, -r2.x, l(0.500000), r1.x
mov_sat r2.y, r1.x
mad r1.x, r1.x, l(2.000000), l(-1.000000)
add r1.x, -|r1.x|, l(1.000001)
div r1.x, r2.x, r1.x
mad r2.x, r2.x, l(6.000000), l(0.000001)
add r2.z, r2.y, l(-0.500000)
lt r2.w, l(0.000000), r2.z
lt r2.z, r2.z, l(0.000000)
iadd r2.z, -r2.w, r2.z
itof r2.z, r2.z
add r2.w, r2.z, l(1.000000)
mul r2.w, r2.w, l(0.500000)
mad r2.y, -r2.z, r2.y, r2.w
add r2.y, r2.y, r2.y
max r2.y, r2.y, l(0.000000)
log r2.y, r2.y
mul r2.yz, r2.yyzy, l(0.000000, 1.001000, 0.500000, 0.000000)
exp r2.y, r2.y
mad r2.y, -r2.z, r2.y, r2.w
mad r2.z, r2.y, l(2.000000), l(-1.000000)
add r2.z, -|r2.z|, l(1.000000)
mul r1.x, r1.x, r2.z
add r1.y, -r1.y, r1.w
div r1.y, r1.y, r2.x
add r1.y, r1.z, r1.y
mad r1.yzw, |r1.yyyy|, l(0.000000, 6.000000, 6.000000, 6.000000), l(0.000000, -3.000000, -2.000000, -4.000000)
mad_sat r1.yzw, |r1.yyzw|, l(0.000000, 1.000000, -1.000000, -1.000000), l(0.000000, -1.000000, 2.000000, 2.000000)
add r1.yzw, r1.yyzw, l(0.000000, -0.500000, -0.500000, -0.500000)
mad r1.xyz, r1.yzwy, r1.xxxx, r2.yyyy
add r1.xyz, -r0.xzwx, r1.xyzx
max r1.w, r0.z, r0.x
max r1.w, r0.w, r1.w
min r2.x, r0.z, r0.x
min r2.x, r0.w, r2.x
add r1.w, r1.w, -r2.x
mul r2.x, r1.w, r1.w
mul r2.x, r1.w, r2.x
mad r2.y, r1.w, l(6.000000), l(-15.000000)
mad r1.w, r1.w, r2.y, l(10.000000)
mul r1.w, r1.w, r2.x
add r2.x, r3.z, r3.y
mul r1.w, r1.w, r2.x
mad r0.xzw, r1.wwww, r1.xxyz, r0.xxzw
max r1.x, r0.z, r0.x
max r1.x, r0.w, r1.x
min r1.y, r0.z, r0.x
min r1.y, r0.w, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
mul r1.x, r1.x, r3.w
max r2.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.y, r2.x, r2.y
mov r3.xy, r2.yxyy
mov r4.xy, r3.yxyy
mov r3.zw, l(0,0,-1.000000,0.666667)
mov r4.zw, l(0,0,0,-0.333333)
movc r3.xyzw, r1.yyyy, r3.xyzw, r4.xyzw
lt r1.y, r2.w, r3.x
mov r2.xyz, r3.xywx
mov r3.xyw, r2.wywx
movc r2.xyzw, r1.yyyy, r2.xyzw, r3.xyzw
add r1.y, -r2.y, r2.w
min r1.z, r2.y, r2.w
add r1.z, -r1.z, r2.x
mad r1.w, r1.z, l(6.000000), l(0.000001)
div r1.y, r1.y, r1.w
add r1.y, r2.z, r1.y
mad r1.w, -r1.z, l(0.500000), r2.x
mad r2.xyz, |r1.yyyy|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r2.xyz, |r2.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r2.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.y, r1.w, l(2.000000), l(-1.000000)
mov_sat r1.w, r1.w
add r1.y, -|r1.y|, l(1.000001)
div r1.y, r1.z, r1.y
add r1.z, r1.w, l(-0.500000)
lt r2.w, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r2.w, r1.z
itof r1.z, r1.z
add r2.w, r1.z, l(1.000000)
mul r2.w, r2.w, l(0.500000)
mad r1.w, -r1.z, r1.w, r2.w
add r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.000000)
log r1.w, r1.w
mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.500000, 1.001000)
exp r1.w, r1.w
mad r1.z, -r1.z, r1.w, r2.w
mad r1.w, r1.z, l(2.000000), l(-1.000000)
add r1.w, -|r1.w|, l(1.000000)
mul r1.y, r1.y, r1.w
mad r1.yzw, r2.xxyz, r1.yyyy, r1.zzzz
add r1.yzw, -r0.xxzw, r1.yyzw
mad r0.xzw, r1.xxxx, r1.yyzw, r0.xxzw
max r1.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r2.x, r1.x, r1.y
mov r3.xy, r1.yxyy
mov r4.xy, r3.yxyy
mov r3.zw, l(0,0,-1.000000,0.666667)
mov r4.zw, l(0,0,0,-0.333333)
movc r2.xyzw, r2.xxxx, r3.xyzw, r4.xyzw
lt r3.x, r1.w, r2.x
mov r1.xyz, r2.xywx
mov r2.xyw, r1.wywx
movc r1.xyzw, r3.xxxx, r1.xyzw, r2.xyzw
add r2.x, -r1.y, r1.w
min r1.y, r1.y, r1.w
add r1.y, -r1.y, r1.x
mad r1.w, r1.y, l(6.000000), l(0.000001)
div r1.w, r2.x, r1.w
add r1.z, r1.z, r1.w
mad r1.x, -r1.y, l(0.500000), r1.x
mad r2.xyz, |r1.zzzz|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r2.xyz, |r2.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r2.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.z, r1.x, l(2.000000), l(-1.000000)
mov_sat r1.x, r1.x
add r1.z, -|r1.z|, l(1.000001)
div r1.y, r1.y, r1.z
add r1.z, r1.x, l(-0.500000)
lt r1.w, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r1.w, r1.z
itof r1.z, r1.z
add r1.w, r1.z, l(1.000000)
mul r1.w, r1.w, l(0.500000)
mad r1.x, -r1.z, r1.x, r1.w
add r1.x, r1.x, r1.x
max r1.x, r1.x, l(0.000000)
log r1.x, r1.x
mul r1.xz, r1.xxzx, l(1.001000, 0.000000, 0.500000, 0.000000)
exp r1.x, r1.x
mad r1.x, -r1.z, r1.x, r1.w
mad r1.z, r1.x, l(2.000000), l(-1.000000)
add r1.z, -|r1.z|, l(1.000000)
mul r1.y, r1.y, r1.z
mad r1.xyz, r2.xyzx, r1.yyyy, r1.xxxx
add r1.xyz, -r0.xzwx, r1.xyzx
max r1.w, r0.z, r0.x
max r1.w, r0.w, r1.w
min r2.x, r0.z, r0.x
min r2.x, r0.w, r2.x
add r1.w, r1.w, -r2.x
mul r2.x, r1.w, r1.w
mul r2.x, r1.w, r2.x
mad r2.y, r1.w, l(6.000000), l(-15.000000)
mad r1.w, r1.w, r2.y, l(10.000000)
mul r1.w, r1.w, r2.x
add r2.xyzw, |r0.yyyy|, l(-0.250000, -0.333333, -0.416667, -0.500000)
mul r2.xyzw, r2.xyzw, l(6.000000, 6.000000, 6.000000, 6.000000)
add r2.xyzw, -|r2.xyzw|, l(1.000000, 1.000000, 1.000000, 1.000000)
max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mul r3.xyzw, r2.xyzw, r2.xyzw
mad r2.xyzw, -r2.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(3.000000, 3.000000, 3.000000, 3.000000)
mul r2.xyzw, r2.xyzw, r3.xyzw
mul r1.w, r1.w, r2.x
mad r0.xzw, r1.wwww, r1.xxyz, r0.xxzw
max r1.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r2.x, r1.x, r1.y
mov r3.xy, r1.yxyy
mov r4.xy, r3.yxyy
mov r3.zw, l(0,0,-1.000000,0.666667)
mov r4.zw, l(0,0,0,-0.333333)
movc r3.xyzw, r2.xxxx, r3.xyzw, r4.xyzw
lt r2.x, r1.w, r3.x
mov r1.xyz, r3.xywx
mov r3.xyw, r1.wywx
movc r1.xyzw, r2.xxxx, r1.xyzw, r3.xyzw
min r2.x, r1.y, r1.w
add r2.x, r1.x, -r2.x
add r1.y, -r1.y, r1.w
mad r1.w, r2.x, l(6.000000), l(0.000001)
div r1.y, r1.y, r1.w
add r1.y, r1.z, r1.y
mad r1.x, -r2.x, l(0.500000), r1.x
max r1.z, r0.z, r0.x
max r1.z, r0.w, r1.z
min r1.w, r0.z, r0.x
min r1.w, r0.w, r1.w
add r1.z, -r1.w, r1.z
mul r1.w, r1.z, r1.z
mul r1.w, r1.z, r1.w
mad r3.x, r1.z, l(6.000000), l(-15.000000)
mad r1.z, r1.z, r3.x, l(10.000000)
mul r1.z, r1.z, r1.w
mul r1.z, r1.z, r2.y
mad r1.w, r1.x, l(2.000000), l(-1.000000)
mov_sat r1.x, r1.x
add r1.w, -|r1.w|, l(1.000001)
div r1.w, r2.x, r1.w
add r2.x, r1.x, l(-0.500000)
lt r2.y, l(0.000000), r2.x
lt r2.x, r2.x, l(0.000000)
iadd r2.x, -r2.y, r2.x
itof r2.x, r2.x
add r2.y, r2.x, l(1.000000)
mul r2.y, r2.y, l(0.500000)
mad r1.x, -r2.x, r1.x, r2.y
mul r2.x, r2.x, l(0.500000)
add r1.x, r1.x, r1.x
max r1.x, r1.x, l(0.000000)
log r1.x, r1.x
mul r1.x, r1.x, l(1.001000)
exp r1.x, r1.x
mad r1.x, -r2.x, r1.x, r2.y
mad r2.x, r1.x, l(2.000000), l(-1.000000)
add r2.x, -|r2.x|, l(1.000000)
mul r1.w, r1.w, r2.x
mad r3.xyz, |r1.yyyy|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r3.xyz, |r3.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.xyw, r3.xyxz, r1.wwww, r1.xxxx
add r1.xyw, -r0.xzxw, r1.xyxw
mad r0.xzw, r1.zzzz, r1.xxyw, r0.xxzw
max r1.x, r0.z, r0.x
max r1.x, r0.w, r1.x
min r1.y, r0.z, r0.x
min r1.y, r0.w, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
mul r1.x, r1.x, r2.z
max r3.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.y, r3.x, r3.y
mov r4.xy, r3.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r4.xyzw, r1.yyyy, r4.xyzw, r5.xyzw
lt r1.y, r3.w, r4.x
mov r3.xyz, r4.xywx
mov r4.xyw, r3.wywx
movc r3.xyzw, r1.yyyy, r3.xyzw, r4.xyzw
add r1.y, -r3.y, r3.w
min r1.z, r3.y, r3.w
add r1.z, -r1.z, r3.x
mad r1.w, r1.z, l(6.000000), l(0.000001)
div r1.y, r1.y, r1.w
add r1.y, r3.z, r1.y
mad r1.w, -r1.z, l(0.500000), r3.x
mad r2.xyz, |r1.yyyy|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r2.xyz, |r2.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r2.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.y, r1.w, l(2.000000), l(-1.000000)
mov_sat r1.w, r1.w
add r1.y, -|r1.y|, l(1.000001)
div r1.y, r1.z, r1.y
add r1.z, r1.w, l(-0.500000)
lt r3.x, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r3.x, r1.z
itof r1.z, r1.z
add r3.x, r1.z, l(1.000000)
mul r3.x, r3.x, l(0.500000)
mad r1.w, -r1.z, r1.w, r3.x
add r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.000000)
log r1.w, r1.w
mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.500000, 1.001000)
exp r1.w, r1.w
mad r1.z, -r1.z, r1.w, r3.x
mad r1.w, r1.z, l(2.000000), l(-1.000000)
add r1.w, -|r1.w|, l(1.000000)
mul r1.y, r1.y, r1.w
mad r1.yzw, r2.xxyz, r1.yyyy, r1.zzzz
add r1.yzw, -r0.xxzw, r1.yyzw
mad r0.xzw, r1.xxxx, r1.yyzw, r0.xxzw
max r1.x, r0.z, r0.x
max r1.x, r0.w, r1.x
min r1.y, r0.z, r0.x
min r1.y, r0.w, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
mul r1.x, r1.x, r2.w
max r2.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.y, r2.x, r2.y
mov r3.xy, r2.yxyy
mov r4.xy, r3.yxyy
mov r3.zw, l(0,0,-1.000000,0.666667)
mov r4.zw, l(0,0,0,-0.333333)
movc r3.xyzw, r1.yyyy, r3.xyzw, r4.xyzw
lt r1.y, r2.w, r3.x
mov r2.xyz, r3.xywx
mov r3.xyw, r2.wywx
movc r2.xyzw, r1.yyyy, r2.xyzw, r3.xyzw
add r1.y, -r2.y, r2.w
min r1.z, r2.y, r2.w
add r1.z, -r1.z, r2.x
mad r1.w, r1.z, l(6.000000), l(0.000001)
div r1.y, r1.y, r1.w
add r1.y, r2.z, r1.y
mad r1.w, -r1.z, l(0.500000), r2.x
mad r2.xyz, |r1.yyyy|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r2.xyz, |r2.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r2.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.y, r1.w, l(2.000000), l(-1.000000)
mov_sat r1.w, r1.w
add r1.y, -|r1.y|, l(1.000001)
div r1.y, r1.z, r1.y
add r1.z, r1.w, l(-0.500000)
lt r2.w, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r2.w, r1.z
itof r1.z, r1.z
add r2.w, r1.z, l(1.000000)
mul r2.w, r2.w, l(0.500000)
mad r1.w, -r1.z, r1.w, r2.w
add r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.000000)
log r1.w, r1.w
mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.500000, 1.001000)
exp r1.w, r1.w
mad r1.z, -r1.z, r1.w, r2.w
mad r1.w, r1.z, l(2.000000), l(-1.000000)
add r1.w, -|r1.w|, l(1.000000)
mul r1.y, r1.y, r1.w
mad r1.yzw, r2.xxyz, r1.yyyy, r1.zzzz
add r1.yzw, -r0.xxzw, r1.yyzw
mad r0.xzw, r1.xxxx, r1.yyzw, r0.xxzw
max r1.x, r0.z, r0.x
max r1.x, r0.w, r1.x
min r1.y, r0.z, r0.x
min r1.y, r0.w, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
add r2.xyzw, |r0.yyyy|, l(-0.583333, -0.666667, -0.750000, -0.833333)
add r1.yz, |r0.yyyy|, l(0.000000, -0.916667, 0.083333, 0.000000)
mul r2.xyzw, r2.xyzw, l(6.000000, 6.000000, 6.000000, 6.000000)
add r2.xyzw, -|r2.xyzw|, l(1.000000, 1.000000, 1.000000, 1.000000)
max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mul r3.xyzw, r2.xyzw, r2.xyzw
mad r2.xyzw, -r2.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(3.000000, 3.000000, 3.000000, 3.000000)
mul r2.xyzw, r2.xyzw, r3.xyzw
mul r0.y, r1.x, r2.x
max r3.xyw, r0.zwzx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.x, r3.x, r3.y
mov r4.xy, r3.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r4.xyzw, r1.xxxx, r4.xyzw, r5.xyzw
lt r1.x, r3.w, r4.x
mov r3.xyz, r4.xywx
mov r4.xyw, r3.wywx
movc r3.xyzw, r1.xxxx, r3.xyzw, r4.xyzw
add r1.x, -r3.y, r3.w
min r1.w, r3.y, r3.w
add r1.w, -r1.w, r3.x
mad r2.x, r1.w, l(6.000000), l(0.000001)
div r1.x, r1.x, r2.x
add r1.x, r3.z, r1.x
mad r2.x, -r1.w, l(0.500000), r3.x
mad r3.xyz, |r1.xxxx|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r3.xyz, |r3.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.x, r2.x, l(2.000000), l(-1.000000)
mov_sat r2.x, r2.x
add r1.x, -|r1.x|, l(1.000001)
div r1.x, r1.w, r1.x
add r1.w, r2.x, l(-0.500000)
lt r3.w, l(0.000000), r1.w
lt r1.w, r1.w, l(0.000000)
iadd r1.w, -r3.w, r1.w
itof r1.w, r1.w
add r3.w, r1.w, l(1.000000)
mul r3.w, r3.w, l(0.500000)
mad r2.x, -r1.w, r2.x, r3.w
mul r1.w, r1.w, l(0.500000)
add r2.x, r2.x, r2.x
max r2.x, r2.x, l(0.000000)
log r2.x, r2.x
mul r2.x, r2.x, l(1.001000)
exp r2.x, r2.x
mad r1.w, -r1.w, r2.x, r3.w
mad r2.x, r1.w, l(2.000000), l(-1.000000)
add r2.x, -|r2.x|, l(1.000000)
mul r1.x, r1.x, r2.x
mad r3.xyz, r3.xyzx, r1.xxxx, r1.wwww
add r3.xyz, -r0.xzwx, r3.xyzx
mad r0.xyz, r0.yyyy, r3.xyzx, r0.xzwx
max r0.w, r0.y, r0.x
max r0.w, r0.z, r0.w
min r1.x, r0.y, r0.x
min r1.x, r0.z, r1.x
add r0.w, r0.w, -r1.x
mul r1.x, r0.w, r0.w
mul r1.x, r0.w, r1.x
mad r1.w, r0.w, l(6.000000), l(-15.000000)
mad r0.w, r0.w, r1.w, l(10.000000)
mul r0.w, r0.w, r1.x
mul r0.w, r0.w, r2.y
max r3.xyw, r0.yzyx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.x, r3.x, r3.y
mov r4.xy, r3.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r4.xyzw, r1.xxxx, r4.xyzw, r5.xyzw
lt r1.x, r3.w, r4.x
mov r3.xyz, r4.xywx
mov r4.xyw, r3.wywx
movc r3.xyzw, r1.xxxx, r3.xyzw, r4.xyzw
add r1.x, -r3.y, r3.w
min r1.w, r3.y, r3.w
add r1.w, -r1.w, r3.x
mad r2.x, r1.w, l(6.000000), l(0.000001)
div r1.x, r1.x, r2.x
add r1.x, r3.z, r1.x
mad r2.x, -r1.w, l(0.500000), r3.x
mad r3.xyz, |r1.xxxx|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r3.xyz, |r3.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.x, r2.x, l(2.000000), l(-1.000000)
mov_sat r2.x, r2.x
add r1.x, -|r1.x|, l(1.000001)
div r1.x, r1.w, r1.x
add r1.w, r2.x, l(-0.500000)
lt r2.y, l(0.000000), r1.w
lt r1.w, r1.w, l(0.000000)
iadd r1.w, -r2.y, r1.w
itof r1.w, r1.w
add r2.y, r1.w, l(1.000000)
mul r2.y, r2.y, l(0.500000)
mad r2.x, -r1.w, r2.x, r2.y
mul r1.w, r1.w, l(0.500000)
add r2.x, r2.x, r2.x
max r2.x, r2.x, l(0.000000)
log r2.x, r2.x
mul r2.x, r2.x, l(1.001000)
exp r2.x, r2.x
mad r1.w, -r1.w, r2.x, r2.y
mad r2.x, r1.w, l(2.000000), l(-1.000000)
add r2.x, -|r2.x|, l(1.000000)
mul r1.x, r1.x, r2.x
mad r3.xyz, r3.xyzx, r1.xxxx, r1.wwww
add r3.xyz, -r0.xyzx, r3.xyzx
mad r0.xyz, r0.wwww, r3.xyzx, r0.xyzx
max r3.xyw, r0.yzyx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r0.w, r3.x, r3.y
mov r4.xy, r3.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r4.xyzw, r0.wwww, r4.xyzw, r5.xyzw
lt r0.w, r3.w, r4.x
mov r3.xyz, r4.xywx
mov r4.xyw, r3.wywx
movc r3.xyzw, r0.wwww, r3.xyzw, r4.xyzw
min r0.w, r3.y, r3.w
add r0.w, -r0.w, r3.x
add r1.x, -r3.y, r3.w
mad r1.w, r0.w, l(6.000000), l(0.000001)
div r1.x, r1.x, r1.w
mad r1.w, -r0.w, l(0.500000), r3.x
add r1.x, r3.z, r1.x
mad r3.xyz, |r1.xxxx|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r3.xyz, |r3.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.x, r1.w, l(2.000000), l(-1.000000)
mov_sat r1.w, r1.w
max r2.x, r0.y, r0.x
max r2.x, r0.z, r2.x
min r2.y, r0.y, r0.x
min r2.y, r0.z, r2.y
add r2.x, -r2.y, r2.x
mul r2.y, r2.x, r2.x
mul r2.y, r2.x, r2.y
mad r3.w, r2.x, l(6.000000), l(-15.000000)
mad r2.x, r2.x, r3.w, l(10.000000)
mul r2.x, r2.x, r2.y
mul r2.x, r2.x, r2.z
add r1.x, -|r1.x|, l(1.000001)
div r0.w, r0.w, r1.x
add r1.x, r1.w, l(-0.500000)
lt r2.y, l(0.000000), r1.x
lt r1.x, r1.x, l(0.000000)
iadd r1.x, -r2.y, r1.x
itof r1.x, r1.x
add r2.y, r1.x, l(1.000000)
mul r2.y, r2.y, l(0.500000)
mad r1.w, -r1.x, r1.w, r2.y
add r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.000000)
log r1.w, r1.w
mul r1.xw, r1.xxxw, l(0.500000, 0.000000, 0.000000, 1.001000)
exp r1.w, r1.w
mad r1.x, -r1.x, r1.w, r2.y
mad r1.w, r1.x, l(2.000000), l(-1.000000)
add r1.w, -|r1.w|, l(1.000000)
mul r0.w, r0.w, r1.w
mad r3.xyz, r3.xyzx, r0.wwww, r1.xxxx
add r3.xyz, -r0.xyzx, r3.xyzx
mad r0.xyz, r2.xxxx, r3.xyzx, r0.xyzx
max r0.w, r0.y, r0.x
max r0.w, r0.z, r0.w
min r1.x, r0.y, r0.x
min r1.x, r0.z, r1.x
max r3.xyw, r0.yzyx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r1.w, r3.x, r3.y
mov r4.xy, r3.yxyy
mov r5.xy, r4.yxyy
mov r4.zw, l(0,0,-1.000000,0.666667)
mov r5.zw, l(0,0,0,-0.333333)
movc r4.xyzw, r1.wwww, r4.xyzw, r5.xyzw
lt r1.w, r3.w, r4.x
mov r3.xyz, r4.xywx
mov r4.xyw, r3.wywx
movc r3.xyzw, r1.wwww, r3.xyzw, r4.xyzw
add r1.w, -r3.y, r3.w
min r2.x, r3.y, r3.w
add r2.x, -r2.x, r3.x
mad r2.y, r2.x, l(6.000000), l(0.000001)
div r1.w, r1.w, r2.y
add r1.w, r3.z, r1.w
mad r2.y, -r2.x, l(0.500000), r3.x
mad r3.xyz, |r1.wwww|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r3.xyz, |r3.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.w, r2.y, l(2.000000), l(-1.000000)
mov_sat r2.y, r2.y
add r1.w, -|r1.w|, l(1.000001)
div r1.w, r2.x, r1.w
add r2.x, r2.y, l(-0.500000)
lt r2.z, l(0.000000), r2.x
lt r2.x, r2.x, l(0.000000)
iadd r2.x, -r2.z, r2.x
itof r2.x, r2.x
add r2.z, r2.x, l(1.000000)
mul r2.z, r2.z, l(0.500000)
mad r2.y, -r2.x, r2.y, r2.z
add r2.y, r2.y, r2.y
max r2.y, r2.y, l(0.000000)
log r2.y, r2.y
mul r2.xy, r2.xyxx, l(0.500000, 1.001000, 0.000000, 0.000000)
exp r2.y, r2.y
mad r2.x, -r2.x, r2.y, r2.z
mad r2.y, r2.x, l(2.000000), l(-1.000000)
add r2.y, -|r2.y|, l(1.000000)
mul r1.w, r1.w, r2.y
mad r2.xyz, r3.xyzx, r1.wwww, r2.xxxx
add r2.xyz, -r0.xyzx, r2.xyzx
add r0.w, r0.w, -r1.x
mul r1.x, r0.w, r0.w
mul r1.x, r0.w, r1.x
mad r1.w, r0.w, l(6.000000), l(-15.000000)
mad r0.w, r0.w, r1.w, l(10.000000)
mul r0.w, r0.w, r1.x
mul r0.w, r0.w, r2.w
mad r0.xyz, r0.wwww, r2.xyzx, r0.xyzx
mad r0.w, -r1.z, l(6.000000), l(1.000000)
mul r1.x, r1.y, l(6.000000)
add r1.x, -|r1.x|, l(1.000000)
max r1.x, r1.x, l(0.000000)
max r0.w, r0.w, l(0.000000)
mul r1.y, r0.w, r0.w
mad r0.w, -r0.w, l(2.000000), l(3.000000)
mul r0.w, r0.w, r1.y
mul r1.y, r1.x, r1.x
mad r1.x, -r1.x, l(2.000000), l(3.000000)
mad r0.w, r1.y, r1.x, r0.w
max r1.x, r0.y, r0.x
max r1.x, r0.z, r1.x
min r1.y, r0.y, r0.x
min r1.y, r0.z, r1.y
add r1.x, -r1.y, r1.x
mul r1.y, r1.x, r1.x
mul r1.y, r1.x, r1.y
mad r1.z, r1.x, l(6.000000), l(-15.000000)
mad r1.x, r1.x, r1.z, l(10.000000)
mul r1.x, r1.x, r1.y
mul r0.w, r0.w, r1.x
max r1.xyw, r0.yzyx, l(0.000001, 0.000001, 0.000000, 0.000001)
lt r2.x, r1.x, r1.y
mov r3.xy, r1.yxyy
mov r4.xy, r3.yxyy
mov r3.zw, l(0,0,-1.000000,0.666667)
mov r4.zw, l(0,0,0,-0.333333)
movc r2.xyzw, r2.xxxx, r3.xyzw, r4.xyzw
lt r3.x, r1.w, r2.x
mov r1.xyz, r2.xywx
mov r2.xyw, r1.wywx
movc r1.xyzw, r3.xxxx, r1.xyzw, r2.xyzw
add r2.x, -r1.y, r1.w
min r1.y, r1.y, r1.w
add r1.y, -r1.y, r1.x
mad r1.w, r1.y, l(6.000000), l(0.000001)
div r1.w, r2.x, r1.w
add r1.z, r1.z, r1.w
mad r1.x, -r1.y, l(0.500000), r1.x
mad r2.xyz, |r1.zzzz|, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
mad_sat r2.xyz, |r2.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
add r2.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.z, r1.x, l(2.000000), l(-1.000000)
mov_sat r1.x, r1.x
add r1.z, -|r1.z|, l(1.000001)
div r1.y, r1.y, r1.z
add r1.z, r1.x, l(-0.500000)
lt r1.w, l(0.000000), r1.z
lt r1.z, r1.z, l(0.000000)
iadd r1.z, -r1.w, r1.z
itof r1.z, r1.z
add r1.w, r1.z, l(1.000000)
mul r1.w, r1.w, l(0.500000)
mad r1.x, -r1.z, r1.x, r1.w
add r1.x, r1.x, r1.x
max r1.x, r1.x, l(0.000000)
log r1.x, r1.x
mul r1.xz, r1.xxzx, l(1.001000, 0.000000, 0.500000, 0.000000)
exp r1.x, r1.x
mad r1.x, -r1.z, r1.x, r1.w
mad r1.z, r1.x, l(2.000000), l(-1.000000)
add r1.z, -|r1.z|, l(1.000000)
mul r1.y, r1.y, r1.z
mad r1.xyz, r2.xyzx, r1.yyyy, r1.xxxx
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 718 instruction slots used
