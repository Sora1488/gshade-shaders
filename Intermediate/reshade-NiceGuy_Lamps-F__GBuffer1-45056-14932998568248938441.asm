//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
add r0.xyzw, v1.xyxy, l(0.000000, 0.001852, -0.000000, -0.001852)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r0.zwzz, t2.yzxw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.z, l(999.000000), l(1000.000000)
div r0.y, r0.z, r0.y
add r1.xyzw, v1.xyxy, l(0.000000, 0.000926, -0.000000, -0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
mul r2.xyw, r0.zzzz, l(523.598816, 2000.000000, 0.000000, 1000.000000)
mad r0.y, -r0.y, l(1000.000000), r2.y
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
mul r3.xw, r0.zzzz, l(523.598816, 0.000000, 0.000000, 1000.000000)
mov o0.w, r0.z
add r0.y, r0.y, -r3.w
mad r0.z, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.xyxx, t2.yzxw, s0, l(0.000000)
mad r1.xyzw, r1.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
mul r4.xyw, r0.zzzz, l(523.598816, 2000.000000, 0.000000, 1000.000000)
mad r0.x, -r0.x, l(1000.000000), r4.y
add r0.x, -r3.w, r0.x
lt r0.x, |r0.y|, |r0.x|
mul r4.xy, r1.xyxx, r4.xxxx
mul r2.xy, r2.xxxx, r1.zwzz
mul r4.z, r4.x, l(1.777778)
mad r0.yz, v1.xxyx, l(0.000000, 2.000000, 2.000000, 0.000000), l(0.000000, -1.000000, -1.000000, 0.000000)
mul r3.xy, r3.xxxx, r0.yzyy
mul r3.z, r3.x, l(1.777778)
add r0.yzw, -r3.wwzy, r4.wwzy
mul r2.z, r2.x, l(1.777778)
mad r1.xyz, r3.wxyw, l(1.000000, 1.777778, 1.000000, 0.000000), -r2.wzyw
movc r0.xyz, r0.xxxx, r1.xyzx, r0.yzwy
add r1.xyzw, v1.xyxy, l(0.001042, 0.000000, -0.001042, -0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.xyxx, t2.yzwx, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.x, r1.zwzz, t2.xyzw, s0, l(0.000000)
mad r1.y, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.y
add r2.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, -0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.y, r2.xyxx, t2.yxzw, s0, l(0.000000)
mad r1.z, -r1.y, l(999.000000), l(1000.000000)
div r1.y, r1.y, r1.z
mul r4.xyw, r1.yyyy, l(523.598816, 2000.000000, 0.000000, 1000.000000)
mad r0.w, -r0.w, l(1000.000000), r4.y
add r0.w, -r3.w, r0.w
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
sample_l_indexable(texture2d)(float,float,float,float) r1.y, r2.zwzz, t2.yxzw, s0, l(0.000000)
mad r2.xyzw, r2.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
mad r1.z, -r1.y, l(999.000000), l(1000.000000)
div r1.y, r1.y, r1.z
mul r5.xyw, r1.yyyy, l(523.598816, 2000.000000, 0.000000, 1000.000000)
mad r1.x, -r1.x, l(1000.000000), r5.y
add r1.x, -r3.w, r1.x
lt r0.w, |r0.w|, |r1.x|
mul r5.xy, r2.zwzz, r5.xxxx
mul r4.xy, r4.xxxx, r2.xyxx
mul r5.z, r5.x, l(1.777778)
add r1.xyz, -r3.ywzy, r5.ywzy
mul r4.z, r4.x, l(1.777778)
mad r2.xyz, r3.ywxy, l(1.000000, 1.000000, 1.777778, 0.000000), -r4.ywzy
movc r1.xyz, r0.wwww, r2.xyzx, r1.xyzx
mul r2.xyz, r0.xyzx, r1.xyzx
mad r0.xyz, r0.zxyz, r1.yzxy, -r2.xyzx
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r0.w, r0.w
mul o0.xyz, r0.wwww, r0.xyzx
ret 
// Approximately 72 instruction slots used
