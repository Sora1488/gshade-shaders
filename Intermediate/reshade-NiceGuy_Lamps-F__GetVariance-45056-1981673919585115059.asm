//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ShadowTex                    texture  float4          2d            t14      1 
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
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.x
dcl_temps 12
add r0.xyzw, v1.xyxy, l(-0.001563, -0.002778, -0.000521, -0.002778)
gather4_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.zwzz, t14.xyzw, s0.x
mul r2.xy, r1.xyxx, r1.xyxx
add r2.x, r2.y, r2.x
mad r2.x, r1.z, r1.z, r2.x
mad r2.x, r1.w, r1.w, r2.x
mul r2.yz, r0.xxyx, r0.xxyx
add r2.y, r2.z, r2.y
mad r2.y, r0.z, r0.z, r2.y
mad r2.y, r0.w, r0.w, r2.y
add r2.x, r2.y, r2.x
add r3.xyzw, v1.xyxy, l(0.000521, -0.002778, 0.001563, -0.002778)
gather4_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r2.yz, r3.zwzz, t14.yxwz, s0.x
mul r3.xy, r4.xyxx, r4.xyxx
add r2.w, r3.y, r3.x
mad r2.w, r4.z, r4.z, r2.w
mad r2.w, r4.w, r4.w, r2.w
mul r3.xy, r2.yzyy, r2.yzyy
add r2.xy, r2.wzww, r2.xyxx
add r2.z, r3.y, r3.x
add r2.x, r2.z, r2.x
add r3.xyzw, v1.xyxy, l(-0.001563, -0.000926, -0.000521, -0.000926)
gather4_indexable(texture2d)(float,float,float,float) r5.xyzw, r3.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.zwzz, t14.xyzw, s0.x
mul r2.zw, r5.xxxy, r5.xxxy
add r2.z, r2.w, r2.z
mad r2.z, r5.z, r5.z, r2.z
mad r2.z, r5.w, r5.w, r2.z
add r2.x, r2.z, r2.x
mul r2.zw, r3.xxxy, r3.xxxy
add r2.z, r2.w, r2.z
mad r2.z, r3.z, r3.z, r2.z
mad r2.z, r3.w, r3.w, r2.z
add r2.x, r2.z, r2.x
add r6.xyzw, v1.xyxy, l(0.000521, -0.000926, 0.001563, -0.000926)
gather4_indexable(texture2d)(float,float,float,float) r7.xyzw, r6.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r2.zw, r6.zwzz, t14.yzxw, s0.x
mul r6.xy, r7.xyxx, r7.xyxx
add r6.x, r6.y, r6.x
mad r6.x, r7.z, r7.z, r6.x
mad r6.x, r7.w, r7.w, r6.x
add r2.x, r2.x, r6.x
mul r6.xy, r2.zwzz, r2.zwzz
add r2.z, r2.w, r2.z
add r2.w, r6.y, r6.x
add r2.x, r2.w, r2.x
add r6.xyzw, v1.xyxy, l(-0.001563, 0.000926, -0.000521, 0.000926)
gather4_indexable(texture2d)(float,float,float,float) r8.xyzw, r6.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r6.xyzw, r6.zwzz, t14.xyzw, s0.x
mul r9.xy, r8.xyxx, r8.xyxx
add r2.w, r9.y, r9.x
mad r2.w, r8.z, r8.z, r2.w
mad r2.w, r8.w, r8.w, r2.w
add r2.x, r2.w, r2.x
mul r9.xy, r6.xyxx, r6.xyxx
add r2.w, r9.y, r9.x
mad r2.w, r6.z, r6.z, r2.w
mad r2.w, r6.w, r6.w, r2.w
add r2.x, r2.w, r2.x
add r9.xyzw, v1.xyxy, l(0.000521, 0.000926, 0.001563, 0.000926)
gather4_indexable(texture2d)(float,float,float,float) r10.xyzw, r9.xyxx, t14.xyzw, s0.x
gather4_indexable(texture2d)(float,float,float,float) r9.xy, r9.zwzz, t14.xwyz, s0.x
mul r9.zw, r10.xxxy, r10.xxxy
add r2.w, r9.w, r9.z
mad r2.w, r10.z, r10.z, r2.w
mad r2.w, r10.w, r10.w, r2.w
add r2.x, r2.w, r2.x
mul r9.zw, r9.xxxy, r9.xxxy
add r2.w, r9.y, r9.x
add r9.x, r9.w, r9.z
add r2.x, r2.x, r9.x
add r9.xyzw, v1.xyxy, l(-0.001563, 0.002778, -0.000521, 0.002778)
gather4_indexable(texture2d)(float,float,float,float) r9.xy, r9.xyxx, t14.zwxy, s0.x
gather4_indexable(texture2d)(float,float,float,float) r9.zw, r9.zwzz, t14.xyzw, s0.x
mul r11.xy, r9.xyxx, r9.xyxx
add r9.x, r9.y, r9.x
add r9.y, r11.y, r11.x
add r2.x, r2.x, r9.y
mul r11.xy, r9.zwzz, r9.zwzz
add r9.y, r9.w, r9.z
add r9.z, r11.y, r11.x
add r2.x, r2.x, r9.z
add r11.xyzw, v1.xyxy, l(0.000521, 0.002778, 0.001563, 0.002778)
gather4_indexable(texture2d)(float,float,float,float) r9.zw, r11.xyxx, t14.xyzw, s0.x
sample_indexable(texture2d)(float,float,float,float) r11.x, r11.zwzz, t14.xyzw, s0
mul r11.yz, r9.zzwz, r9.zzwz
add r9.z, r9.w, r9.z
add r9.w, r11.z, r11.y
add r2.x, r2.x, r9.w
mad r2.x, r11.x, r11.x, r2.x
mul r2.x, r2.x, l(0.020408)
add r1.x, r1.y, r1.x
add r1.x, r1.z, r1.x
add r1.x, r1.w, r1.x
add r0.x, r0.y, r0.x
add r0.x, r0.z, r0.x
add r0.x, r0.w, r0.x
add r0.x, r0.x, r1.x
add r0.y, r4.y, r4.x
add r0.y, r4.z, r0.y
add r0.y, r4.w, r0.y
add r0.x, r0.y, r0.x
add r0.x, r2.y, r0.x
add r0.y, r5.y, r5.x
add r0.y, r5.z, r0.y
add r0.y, r5.w, r0.y
add r0.x, r0.y, r0.x
add r0.y, r3.y, r3.x
add r0.y, r3.z, r0.y
add r0.y, r3.w, r0.y
add r0.x, r0.y, r0.x
add r0.y, r7.y, r7.x
add r0.y, r7.z, r0.y
add r0.y, r7.w, r0.y
add r0.x, r0.y, r0.x
add r0.x, r2.z, r0.x
add r0.y, r8.y, r8.x
add r0.y, r8.z, r0.y
add r0.y, r8.w, r0.y
add r0.x, r0.y, r0.x
add r0.y, r6.y, r6.x
add r0.y, r6.z, r0.y
add r0.y, r6.w, r0.y
add r0.x, r0.y, r0.x
add r0.y, r10.y, r10.x
add r0.y, r10.z, r0.y
add r0.y, r10.w, r0.y
add r0.x, r0.y, r0.x
add r0.x, r2.w, r0.x
add r0.x, r9.x, r0.x
add r0.x, r9.y, r0.x
add r0.x, r9.z, r0.x
add r0.x, r11.x, r0.x
mul r0.x, r0.x, l(0.020408)
mad r0.x, r0.x, r0.x, -r2.x
sqrt o0.x, |r0.x|
ret 
// Approximately 139 instruction slots used
