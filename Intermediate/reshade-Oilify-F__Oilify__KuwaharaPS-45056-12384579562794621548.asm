//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Sharpness;                   // Offset:    0 Size:     4
//   float Tuning;                      // Offset:    4 Size:     4
//   float Scale;                       // Offset:    8 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Oilify__BackBuffer           texture  float4          2d             t0      1 
// __V__Oilify__Anisotropy           texture  float4          2d             t2      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 17
mul r0.xyzw, cb0[0].zzzz, l(-0.000521, -0.001852, -0.000521, -0.001389)
add r1.x, cb0[0].y, l(-1.000000)
exp r1.x, r1.x
sample_indexable(texture2d)(float,float,float,float) r1.yzw, v1.xyxx, t2.wxyz, s0
add r1.w, r1.x, r1.w
div r2.x, r1.x, r1.w
div r1.x, r1.w, r1.x
mul r2.xy, r1.yzyy, r2.xxxx
dp2 r3.x, r0.xyxx, r2.xyxx
mul r4.x, r1.x, -r1.z
mul r4.y, r1.x, r1.y
dp2 r3.y, r0.xyxx, r4.xyxx
add r0.xy, r3.xyxx, v1.xyxx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t0.xyzw, s0
mad r0.x, cb0[0].x, l(0.666667), l(0.333333)
mul r0.x, r0.x, r0.x
mul r0.x, r0.x, r0.x
mul r0.x, r0.x, l(1023.000000)
max r0.x, r0.x, l(0.000000)
mul r1.xyz, r0.xxxx, r1.xyzx
mul r3.xyz, r1.xyzx, r1.xyzx
mul r5.xyzw, cb0[0].zzzz, l(-0.001042, 0.002315, -0.000521, -0.003241)
dp2 r6.x, r5.zwzz, r2.xyxx
dp2 r6.y, r5.zwzz, r4.xyxx
add r2.zw, r6.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r2.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r6.xyzx
mad r1.xyz, r6.xyzx, r0.xxxx, r1.xyzx
mad r3.xyz, r7.xyzx, r7.xyzx, r3.xyzx
mul r6.y, r4.y, r5.w
mul r6.x, r2.y, r5.w
add r2.zw, r6.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r2.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r6.xyzx
mad r1.xyz, r6.xyzx, r0.xxxx, r1.xyzx
mad r3.xyz, r7.xyzx, r7.xyzx, r3.xyzx
mul r2.zw, cb0[0].zzzz, l(0.000000, 0.000000, -0.001563, -0.001852)
mul r6.xy, r2.xyxx, r2.zwzz
mul r6.zw, r4.xxxy, r2.zzzw
add r6.xyzw, r6.xzyw, v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r6.zwzz, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r6.xyxx, t0.xyzw, s0
mul r8.xyz, r0.xxxx, r7.xyzx
mad r1.xyz, r7.xyzx, r0.xxxx, r1.xyzx
mad r3.xyz, r8.xyzx, r8.xyzx, r3.xyzx
mul r7.xyzw, cb0[0].zzzz, l(-0.001042, -0.001852, -0.001042, -0.001389)
mul r8.xy, r2.xyxx, r7.xwxx
mul r8.zw, r4.xxxy, r7.xxxw
add r8.xyzw, r8.xzyw, v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r9.xyz, r8.zwzz, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r8.xyz, r8.xyxx, t0.xyzw, s0
mul r10.xyz, r0.xxxx, r9.xyzx
mad r1.xyz, r9.xyzx, r0.xxxx, r1.xyzx
mad r3.xyz, r10.xyzx, r10.xyzx, r3.xyzx
sample_indexable(texture2d)(float,float,float,float) r9.xyz, v1.xyxx, t0.xyzw, s0
mul r10.xyz, r0.xxxx, r9.xyzx
mad r3.xyz, r10.xyzx, r10.xyzx, r3.xyzx
mul r11.xyzw, cb0[0].zzzz, l(-0.000521, 0.002315, 0.000521, -0.003241)
dp2 r12.x, r11.zwzz, r2.xyxx
dp2 r12.y, r11.zwzz, r4.xyxx
add r4.zw, r12.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r12.xyz, r4.zwzz, t0.xyzw, s0
mul r13.xyz, r0.xxxx, r12.xyzx
mad r3.xyz, r13.xyzx, r13.xyzx, r3.xyzx
mul r13.xyzw, cb0[0].zzzz, l(0.000521, -0.001852, 0.000521, -0.001389)
dp2 r14.x, r13.xyxx, r2.xyxx
dp2 r14.y, r13.xyxx, r4.xyxx
add r4.zw, r14.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r14.xyz, r4.zwzz, t0.xyzw, s0
mul r15.xyz, r0.xxxx, r14.xyzx
mad r3.xyz, r15.xyzx, r15.xyzx, r3.xyzx
mad r1.xyz, r9.xyzx, r0.xxxx, r1.xyzx
mad r1.xyz, r12.xyzx, r0.xxxx, r1.xyzx
mad r1.xyz, r14.xyzx, r0.xxxx, r1.xyzx
mul r12.xyz, r1.xyzx, r1.xyzx
mul r1.xyz, r1.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
mad r3.xyz, -r12.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000), r3.xyzx
mul r3.xyz, r3.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.y, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.y, r0.y, l(0.000010)
mul r0.y, r0.y, r0.y
mad r0.y, r0.y, r0.y, l(1.000000)
div r0.y, l(1.000000, 1.000000, 1.000000, 1.000000), r0.y
mul r3.xyzw, cb0[0].zzzz, l(-0.001563, -0.001389, -0.001563, 0.000463)
dp2 r12.x, r3.xyxx, r2.xyxx
dp2 r12.y, r3.xyxx, r4.xyxx
add r3.xy, r12.xyxx, v1.xyxx
sample_indexable(texture2d)(float,float,float,float) r12.xyz, r3.xyxx, t0.xyzw, s0
mul r12.xyz, r0.xxxx, r12.xyzx
mul r14.xyz, r12.xyzx, r12.xyzx
dp2 r3.x, r2.zwzz, r2.xyxx
dp2 r3.y, r2.zwzz, r4.xyxx
add r2.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r15.xyz, r2.zwzz, t0.xyzw, s0
mul r16.xyz, r0.xxxx, r15.xyzx
mad r12.xyz, r15.xyzx, r0.xxxx, r12.xyzx
mad r14.xyz, r16.xyzx, r16.xyzx, r14.xyzx
dp2 r3.x, r7.xyxx, r2.xyxx
dp2 r3.y, r7.xyxx, r4.xyxx
add r2.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r15.xyz, r2.zwzz, t0.xyzw, s0
mul r16.xyz, r0.xxxx, r15.xyzx
mad r12.xyz, r15.xyzx, r0.xxxx, r12.xyzx
mad r14.xyz, r16.xyzx, r16.xyzx, r14.xyzx
dp2 r3.x, r7.zwzz, r2.xyxx
dp2 r3.y, r7.zwzz, r4.xyxx
add r2.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r2.zwzz, t0.xyzw, s0
mul r15.xyz, r0.xxxx, r7.xyzx
mad r7.xyz, r7.xyzx, r0.xxxx, r12.xyzx
mad r12.xyz, r15.xyzx, r15.xyzx, r14.xyzx
dp2 r3.x, r0.zwzz, r2.xyxx
dp2 r3.y, r0.zwzz, r4.xyxx
add r2.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r14.xyz, r2.zwzz, t0.xyzw, s0
mul r15.xyz, r0.xxxx, r14.xyzx
mad r7.xyz, r14.xyzx, r0.xxxx, r7.xyzx
mad r7.xyz, r9.xyzx, r0.xxxx, r7.xyzx
mad r12.xyz, r15.xyzx, r15.xyzx, r12.xyzx
mad r12.xyz, r10.xyzx, r10.xyzx, r12.xyzx
mul r14.xyz, r7.xyzx, r7.xyzx
mul r7.xyz, r7.xyzx, l(0.166667, 0.166667, 0.166667, 0.000000)
mad r12.xyz, -r14.xyzx, l(0.166667, 0.166667, 0.166667, 0.000000), r12.xyzx
mul r12.xyz, r12.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.w, r12.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.w, r0.w, l(0.000010)
mul r0.w, r0.w, r0.w
mad r0.w, r0.w, r0.w, l(1.000000)
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
mul r7.xyz, r0.wwww, r7.xyzx
add r0.w, r0.w, r0.y
mad r1.xyz, r1.xyzx, r0.yyyy, r7.xyzx
dp2 r3.x, r3.zwzz, r2.xyxx
dp2 r3.y, r3.zwzz, r4.xyxx
add r2.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r2.zwzz, t0.xyzw, s0
mul r3.xyz, r0.xxxx, r3.xyzx
mul r7.xyz, r3.xyzx, r3.xyzx
mad r3.xyz, r6.xyzx, r0.xxxx, r3.xyzx
mul r6.xyz, r0.xxxx, r6.xyzx
mad r6.xyz, r6.xyzx, r6.xyzx, r7.xyzx
mul r7.xyzw, cb0[0].zzzz, l(-0.001563, 0.001852, -0.001563, 0.002315)
dp2 r12.x, r7.xyxx, r2.xyxx
dp2 r12.y, r7.xyxx, r4.xyxx
add r2.zw, r12.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r12.xyz, r2.zwzz, t0.xyzw, s0
mul r14.xyz, r0.xxxx, r12.xyzx
mad r3.xyz, r12.xyzx, r0.xxxx, r3.xyzx
mad r6.xyz, r14.xyzx, r14.xyzx, r6.xyzx
dp2 r7.x, r7.zwzz, r2.xyxx
dp2 r7.y, r7.zwzz, r4.xyxx
add r2.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r2.zwzz, t0.xyzw, s0
mul r12.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r3.xyz, r8.xyzx, r0.xxxx, r3.xyzx
mul r7.xyz, r0.xxxx, r8.xyzx
mad r6.xyz, r12.xyzx, r12.xyzx, r6.xyzx
mad r6.xyz, r7.xyzx, r7.xyzx, r6.xyzx
mul r8.xyzw, cb0[0].zzzz, l(-0.001042, 0.000463, -0.001042, 0.001852)
dp2 r7.x, r8.xyxx, r2.xyxx
dp2 r7.y, r8.xyxx, r4.xyxx
add r2.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r2.zwzz, t0.xyzw, s0
mul r12.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r6.xyz, r12.xyzx, r12.xyzx, r6.xyzx
dp2 r7.x, r8.zwzz, r2.xyxx
dp2 r7.y, r8.zwzz, r4.xyxx
add r2.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r2.zwzz, t0.xyzw, s0
mul r8.xzw, r0.xxxx, r7.xxyz
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r6.xyz, r8.xzwx, r8.xzwx, r6.xyzx
dp2 r7.x, r5.xyxx, r2.xyxx
dp2 r7.y, r5.xyxx, r4.xyxx
add r2.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r5.xyz, r2.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r5.xyzx
mad r3.xyz, r5.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r6.xyzx
mul r6.y, r0.z, r4.x
mul r6.x, r0.z, r2.x
add r0.yz, r6.xxyx, v1.xxyx
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r0.yzyy, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r6.xyzx
mad r3.xyz, r6.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r5.xyzx
mul r6.xyzw, cb0[0].zzzz, l(-0.000521, 0.000463, -0.000521, 0.001852)
dp2 r7.x, r6.xyxx, r2.xyxx
dp2 r7.y, r6.xyxx, r4.xyxx
add r0.yz, r7.xxyx, v1.xxyx
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.yzyy, t0.xyzw, s0
mul r8.xzw, r0.xxxx, r7.xxyz
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r3.xyz, r9.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r8.xzwx, r8.xzwx, r5.xyzx
mad r5.xyz, r10.xyzx, r10.xyzx, r5.xyzx
mul r7.xyz, r3.xyzx, r3.xyzx
mul r3.xyz, r3.xyzx, l(0.090909, 0.090909, 0.090909, 0.000000)
mad r5.xyz, -r7.xyzx, l(0.090909, 0.090909, 0.090909, 0.000000), r5.xyzx
mul r5.xyz, r5.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.y, r5.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.y, r0.y, l(0.000010)
mul r0.y, r0.y, r0.y
mad r0.y, r0.y, r0.y, l(1.000000)
div r0.y, l(1.000000, 1.000000, 1.000000, 1.000000), r0.y
mad r1.xyz, r3.xyzx, r0.yyyy, r1.xyzx
add r0.y, r0.y, r0.w
dp2 r3.x, r11.xyxx, r2.xyxx
dp2 r3.y, r11.xyxx, r4.xyxx
add r0.zw, r3.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r0.zwzz, t0.xyzw, s0
mul r3.xyz, r0.xxxx, r3.xyzx
mul r5.xyz, r3.xyzx, r3.xyzx
dp2 r6.x, r6.zwzz, r2.xyxx
dp2 r6.y, r6.zwzz, r4.xyxx
add r0.zw, r6.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r0.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r6.xyzx
mad r3.xyz, r6.xyzx, r0.xxxx, r3.xyzx
mad r3.xyz, r9.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r5.xyzx
mad r5.xyz, r10.xyzx, r10.xyzx, r5.xyzx
mul r6.xyz, r10.xyzx, r10.xyzx
mul r7.y, r4.y, r8.y
mul r7.x, r2.y, r8.y
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mul r8.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r8.xyzx, r8.xyzx, r5.xyzx
mul r7.y, r4.y, r6.w
mul r7.x, r2.y, r6.w
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mul r8.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r8.xyzx, r8.xyzx, r5.xyzx
mul r7.y, r4.y, r7.w
mul r7.x, r2.y, r7.w
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mul r8.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r8.xyzx, r8.xyzx, r5.xyzx
mul r7.xyzw, cb0[0].zzzz, l(0.000521, 0.000463, 0.000521, 0.001852)
dp2 r8.x, r7.zwzz, r2.xyxx
dp2 r8.y, r7.zwzz, r4.xyxx
add r0.zw, r8.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r8.xyz, r0.zwzz, t0.xyzw, s0
mul r10.xyz, r0.xxxx, r8.xyzx
mad r3.xyz, r8.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r10.xyzx, r10.xyzx, r5.xyzx
mul r8.xyzw, cb0[0].zzzz, l(0.000521, 0.002315, 0.001042, -0.001852)
dp2 r10.x, r8.xyxx, r2.xyxx
dp2 r10.y, r8.xyxx, r4.xyxx
add r0.zw, r10.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r10.xyz, r0.zwzz, t0.xyzw, s0
mul r11.xyz, r0.xxxx, r10.xyzx
mad r3.xyz, r10.xyzx, r0.xxxx, r3.xyzx
mad r5.xyz, r11.xyzx, r11.xyzx, r5.xyzx
mul r10.xyz, r3.xyzx, r3.xyzx
mul r3.xyz, r3.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
mad r5.xyz, -r10.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000), r5.xyzx
mul r5.xyz, r5.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.z, r5.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.z, r0.z, l(0.000010)
mul r0.z, r0.z, r0.z
mad r0.z, r0.z, r0.z, l(1.000000)
div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), r0.z
mad r1.xyz, r3.xyzx, r0.zzzz, r1.xyzx
add r0.y, r0.z, r0.y
mul r3.xyzw, cb0[0].zzzz, l(0.001042, -0.001389, 0.001042, 0.000463)
dp2 r5.x, r3.zwzz, r2.xyxx
dp2 r5.y, r3.zwzz, r4.xyxx
add r0.zw, r5.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r5.xyz, r0.zwzz, t0.xyzw, s0
dp2 r8.x, r7.xyxx, r2.xyxx
dp2 r8.y, r7.xyxx, r4.xyxx
add r0.zw, r8.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r7.xyzx
mad r10.xyz, r9.xyzx, r0.xxxx, r7.xyzx
mad r7.xyz, r7.xyzx, r7.xyzx, r6.xyzx
mad r10.xyz, r5.xyzx, r0.xxxx, r10.xyzx
mul r5.xyz, r0.xxxx, r5.xyzx
mad r5.xyz, r5.xyzx, r5.xyzx, r7.xyzx
mul r7.xyzw, cb0[0].zzzz, l(0.001042, 0.001852, 0.001042, 0.002315)
dp2 r8.x, r7.xyxx, r2.xyxx
dp2 r8.y, r7.xyxx, r4.xyxx
add r0.zw, r8.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r11.xyz, r0.zwzz, t0.xyzw, s0
mad r10.xyz, r11.xyzx, r0.xxxx, r10.xyzx
mul r11.xyz, r0.xxxx, r11.xyzx
mad r5.xyz, r11.xyzx, r11.xyzx, r5.xyzx
dp2 r7.x, r7.zwzz, r2.xyxx
dp2 r7.y, r7.zwzz, r4.xyxx
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mad r10.xyz, r7.xyzx, r0.xxxx, r10.xyzx
mul r7.xyz, r0.xxxx, r7.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r5.xyzx
mul r7.xyzw, cb0[0].zzzz, l(0.001563, 0.000463, 0.001563, 0.001852)
dp2 r8.x, r7.xyxx, r2.xyxx
dp2 r8.y, r7.xyxx, r4.xyxx
add r0.zw, r8.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r11.xyz, r0.zwzz, t0.xyzw, s0
mad r10.xyz, r11.xyzx, r0.xxxx, r10.xyzx
mul r11.xyz, r0.xxxx, r11.xyzx
mad r5.xyz, r11.xyzx, r11.xyzx, r5.xyzx
dp2 r7.x, r7.zwzz, r2.xyxx
dp2 r7.y, r7.zwzz, r4.xyxx
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mad r10.xyz, r7.xyzx, r0.xxxx, r10.xyzx
mul r7.xyz, r0.xxxx, r7.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r5.xyzx
mul r0.zw, cb0[0].zzzz, l(0.000000, 0.000000, 0.001563, 0.002315)
dp2 r7.x, r0.zwzz, r2.xyxx
dp2 r7.y, r0.zwzz, r4.xyxx
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mad r10.xyz, r7.xyzx, r0.xxxx, r10.xyzx
mul r7.xyz, r0.xxxx, r7.xyzx
mad r5.xyz, r7.xyzx, r7.xyzx, r5.xyzx
mul r7.xyz, r10.xyzx, r10.xyzx
mul r10.xyz, r10.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
mad r5.xyz, -r7.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000), r5.xyzx
mul r5.xyz, r5.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.z, r5.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.z, r0.z, l(0.000010)
mul r0.z, r0.z, r0.z
mad r0.z, r0.z, r0.z, l(1.000000)
div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), r0.z
mad r1.xyz, r10.xyzx, r0.zzzz, r1.xyzx
add r0.y, r0.z, r0.y
mul r5.x, r2.x, r13.z
mul r5.y, r4.x, r13.z
add r0.zw, r5.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r5.xyz, r0.zwzz, t0.xyzw, s0
dp2 r7.x, r13.zwzz, r2.xyxx
dp2 r7.y, r13.zwzz, r4.xyxx
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mul r7.xyz, r0.xxxx, r7.xyzx
mad r9.xyz, r9.xyzx, r0.xxxx, r7.xyzx
mad r6.xyz, r7.xyzx, r7.xyzx, r6.xyzx
mad r7.xyz, r5.xyzx, r0.xxxx, r9.xyzx
mul r5.xyz, r0.xxxx, r5.xyzx
mad r5.xyz, r5.xyzx, r5.xyzx, r6.xyzx
dp2 r6.x, r8.zwzz, r2.xyxx
dp2 r6.y, r8.zwzz, r4.xyxx
add r0.zw, r6.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r0.zwzz, t0.xyzw, s0
mad r7.xyz, r6.xyzx, r0.xxxx, r7.xyzx
mul r6.xyz, r0.xxxx, r6.xyzx
mad r5.xyz, r6.xyzx, r6.xyzx, r5.xyzx
dp2 r6.x, r3.xyxx, r2.xyxx
dp2 r6.y, r3.xyxx, r4.xyxx
add r0.zw, r6.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r0.zwzz, t0.xyzw, s0
mad r6.xyz, r3.xyzx, r0.xxxx, r7.xyzx
mul r3.xyz, r0.xxxx, r3.xyzx
mad r3.xyz, r3.xyzx, r3.xyzx, r5.xyzx
mul r5.x, r2.x, r8.z
mul r5.y, r4.x, r8.z
add r0.zw, r5.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r5.xyz, r0.zwzz, t0.xyzw, s0
mad r6.xyz, r5.xyzx, r0.xxxx, r6.xyzx
mul r5.xyz, r0.xxxx, r5.xyzx
mad r3.xyz, r5.xyzx, r5.xyzx, r3.xyzx
mul r5.xyzw, cb0[0].zzzz, l(0.001563, -0.001852, 0.001563, -0.001389)
dp2 r7.y, r5.xyxx, r4.xyxx
dp2 r8.y, r5.zwzz, r4.xyxx
mul r4.y, r4.x, r5.x
dp2 r7.x, r5.xyxx, r2.xyxx
add r0.zw, r7.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r0.zwzz, t0.xyzw, s0
mad r6.xyz, r7.xyzx, r0.xxxx, r6.xyzx
mul r7.xyz, r0.xxxx, r7.xyzx
mad r3.xyz, r7.xyzx, r7.xyzx, r3.xyzx
dp2 r8.x, r5.zwzz, r2.xyxx
mul r4.x, r2.x, r5.x
add r0.zw, r4.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r0.zwzz, t0.xyzw, s0
add r0.zw, r8.xxxy, v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r0.zwzz, t0.xyzw, s0
mad r5.xyz, r4.xyzx, r0.xxxx, r6.xyzx
mul r4.xyz, r0.xxxx, r4.xyzx
mad r3.xyz, r4.xyzx, r4.xyzx, r3.xyzx
mad r4.xyz, r2.xyzx, r0.xxxx, r5.xyzx
mul r2.xyz, r0.xxxx, r2.xyzx
mad r2.xyz, r2.xyzx, r2.xyzx, r3.xyzx
mul r3.xyz, r4.xyzx, r4.xyzx
mul r4.xyz, r4.xyzx, l(0.111111, 0.111111, 0.111111, 0.000000)
mad r2.xyz, -r3.xyzx, l(0.111111, 0.111111, 0.111111, 0.000000), r2.xyzx
mul r2.xyz, r2.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
dp3 r0.z, r2.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
max r0.z, r0.z, l(0.000010)
mul r0.z, r0.z, r0.z
mad r0.z, r0.z, r0.z, l(1.000000)
div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), r0.z
mad r1.xyz, r4.xyzx, r0.zzzz, r1.xyzx
add r0.y, r0.z, r0.y
div r0.yzw, r1.xxyz, r0.yyyy
div o0.xyz, r0.yzwy, r0.xxxx
ret 
// Approximately 408 instruction slots used
