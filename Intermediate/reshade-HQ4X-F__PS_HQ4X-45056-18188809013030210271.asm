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
dcl_temps 14
add r0.xyzw, v1.xyxy, l(-0.000781, -0.001389, 0.000781, -0.001389)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.zwzz, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
add r3.xyz, r1.xyzx, -r2.xyzx
dp3 r0.w, |r3.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
add r3.xyzw, v1.xyxy, l(0.000781, 0.001389, -0.000781, 0.001389)
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.xyxx, t0.xyzw, s0
add r5.xyz, -r2.xyzx, r4.xyzx
dp3 r1.w, |r5.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
div r2.w, r1.w, r0.w
add r5.xyz, r0.xyzx, -r2.xyzx
dp3 r3.w, |r5.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
add r5.xyz, -r2.xyzx, r3.xyzx
dp3 r4.w, |r5.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
max r5.x, r3.w, r4.w
add r6.xyzw, v1.xyxy, l(-0.000391, -0.000694, -0.000000, -0.001389)
sample_indexable(texture2d)(float,float,float,float) r5.yzw, r6.xyxx, t0.wxyz, s0
sample_indexable(texture2d)(float,float,float,float) r6.xyz, r6.zwzz, t0.xyzw, s0
add r7.xyzw, v1.xyxy, l(0.000391, 0.000694, 0.000000, 0.001389)
sample_indexable(texture2d)(float,float,float,float) r8.xyz, r7.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r7.xyz, r7.zwzz, t0.xyzw, s0
add r9.xyz, r5.yzwy, -r8.xyzx
dp3 r6.w, |r9.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
min r5.x, r5.x, r6.w
mul r2.w, r2.w, r5.x
lt r6.w, r1.w, r0.w
movc r2.w, r6.w, r2.w, r5.x
mul r1.xyz, r1.xyzx, r2.wwww
lt r6.w, r4.w, r3.w
div r7.w, r4.w, r3.w
max r8.w, r0.w, r1.w
add r9.xyzw, v1.xyxy, l(0.000391, -0.000694, 0.000781, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r10.xyz, r9.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r9.xyz, r9.zwzz, t0.xyzw, s0
add r11.xyzw, v1.xyxy, l(-0.000391, 0.000694, -0.000781, -0.000000)
sample_indexable(texture2d)(float,float,float,float) r12.xyz, r11.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r11.xyz, r11.zwzz, t0.xyzw, s0
add r13.xyz, r10.xyzx, -r12.xyzx
dp3 r9.w, |r13.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
min r8.w, r8.w, r9.w
mul r7.w, r7.w, r8.w
movc r6.w, r6.w, r7.w, r8.w
mad r0.xyz, r6.wwww, r0.xyzx, r1.xyzx
add r1.x, r2.w, r6.w
lt r1.y, r3.w, r4.w
div r1.z, r3.w, r4.w
mul r1.z, r1.z, r8.w
movc r1.y, r1.y, r1.z, r8.w
mad r0.xyz, r1.yyyy, r3.xyzx, r0.xyzx
add r1.x, r1.y, r1.x
div r1.y, r0.w, r1.w
lt r0.w, r0.w, r1.w
mul r1.y, r1.y, r5.x
movc r0.w, r0.w, r1.y, r5.x
mad r0.xyz, r0.wwww, r4.xyzx, r0.xyzx
add r0.w, r0.w, r1.x
add r0.w, r0.w, l(0.001000)
mad r0.xyz, r2.xyzx, l(0.001000, 0.001000, 0.001000, 0.000000), r0.xyzx
div r0.xyz, r0.xyzx, r0.wwww
add r1.xyz, -r0.xyzx, r10.xyzx
add r2.xyz, r10.xyzx, r12.xyzx
add r3.xyz, -r0.xyzx, r12.xyzx
add r1.xyz, |r1.xyzx|, |r3.xyzx|
dp3 r0.w, r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r0.w, r0.w, l(-1.100000)
dp3 r1.x, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r1.x, r1.x, l(0.125000), l(0.330000)
div r0.w, r0.w, r1.x
add r0.w, r0.w, l(1.000000)
max r0.w, r0.w, l(0.030000)
min r0.w, r0.w, l(0.750000)
mul r1.xyz, r2.xyzx, r0.wwww
add r2.xyz, -r0.xyzx, r5.yzwy
add r3.xyz, r5.yzwy, r8.xyzx
add r4.xyz, -r0.xyzx, r8.xyzx
add r2.xyz, |r2.xyzx|, |r4.xyzx|
dp3 r1.w, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r1.w, r1.w, l(-1.100000)
dp3 r2.x, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r2.x, r2.x, l(0.125000), l(0.330000)
div r1.w, r1.w, r2.x
add r1.w, r1.w, l(1.000000)
max r1.w, r1.w, l(0.030000)
min r1.w, r1.w, l(0.750000)
mad r1.xyz, r1.wwww, r3.xyzx, r1.xyzx
add r0.w, r0.w, r1.w
add r2.xyz, -r0.xyzx, r6.xyzx
add r3.xyz, r6.xyzx, r7.xyzx
add r4.xyz, -r0.xyzx, r7.xyzx
add r2.xyz, |r2.xyzx|, |r4.xyzx|
dp3 r1.w, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r1.w, r1.w, l(-1.100000)
dp3 r2.x, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r2.x, r2.x, l(0.125000), l(0.330000)
div r1.w, r1.w, r2.x
add r1.w, r1.w, l(1.000000)
max r1.w, r1.w, l(0.030000)
min r1.w, r1.w, l(0.750000)
mad r1.xyz, r1.wwww, r3.xyzx, r1.xyzx
add r0.w, r0.w, r1.w
add r2.xyz, -r0.xyzx, r9.xyzx
add r3.xyz, r9.xyzx, r11.xyzx
add r4.xyz, -r0.xyzx, r11.xyzx
add r2.xyz, |r2.xyzx|, |r4.xyzx|
dp3 r1.w, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mul r1.w, r1.w, l(-1.100000)
dp3 r2.x, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r2.x, r2.x, l(0.125000), l(0.330000)
div r1.w, r1.w, r2.x
add r1.w, r1.w, l(1.000000)
max r1.w, r1.w, l(0.030000)
min r1.w, r1.w, l(0.750000)
mad r1.xyz, r1.wwww, r3.xyzx, r1.xyzx
add r0.w, r0.w, r1.w
mad r0.w, r0.w, l(2.000000), l(1.000000)
add r0.xyz, r0.xyzx, r1.xyzx
div o0.xyz, r0.xyzx, r0.wwww
ret 
// Approximately 120 instruction slots used