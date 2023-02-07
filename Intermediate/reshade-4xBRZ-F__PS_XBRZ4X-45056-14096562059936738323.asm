//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__DownscaleTex                 texture  float4          2d             t4      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
// TEXCOORD                 2   xyzw        3     NONE   float   xyzw
// TEXCOORD                 3   xyzw        4     NONE   float   xyzw
// TEXCOORD                 4   xyzw        5     NONE   float   xyzw
// TEXCOORD                 5   xyzw        6     NONE   float   xyzw
// TEXCOORD                 6   xyzw        7     NONE   float   xyzw
// TEXCOORD                 7   xyzw        8     NONE   float   xyzw
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_input_ps linear v2.xyzw
dcl_input_ps linear v3.xyzw
dcl_input_ps linear v4.xyzw
dcl_input_ps linear v5.xyzw
dcl_input_ps linear v6.xyzw
dcl_input_ps linear v7.xyzw
dcl_input_ps linear v8.xyzw
dcl_output o0.xyz
dcl_temps 28
dcl_indexableTemp x0[16], 4
mul r0.xyzw, v1.xxxy, l(1920.000000, 1920.000000, 1920.000000, 1080.000000)
frc r0.xyzw, r0.xyzw
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v2.ywyy, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v3.xwxx, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r3.xyz, v3.ywyy, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r4.xyz, v3.zwzz, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r5.xyz, v4.xwxx, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r6.xyz, v4.ywyy, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r7.xyz, v4.zwzz, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r8.xyz, v5.xwxx, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r9.xyz, v5.ywyy, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r10.xyz, v5.zwzz, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r11.xyz, v6.ywyy, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r12.xyz, v7.xzxx, t4.xyzw, s1
sample_indexable(texture2d)(float,float,float,float) r13.xyz, v8.xzxx, t4.xyzw, s1
dp3 r1.w, r6.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r2.w, r7.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r3.w, r10.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r4.w, r9.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r5.w, r8.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r6.w, r5.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r7.w, r2.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r8.w, r3.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
dp3 r9.w, r4.xyzx, l(65536.000000, 256.000000, 1.000000, 0.000000)
eq r10.w, r1.w, r2.w
eq r11.w, r3.w, r4.w
and r11.w, r10.w, r11.w
eq r12.w, r1.w, r4.w
eq r13.w, r2.w, r3.w
and r13.w, r12.w, r13.w
or r11.w, r11.w, r13.w
if_z r11.w
  sample_indexable(texture2d)(float,float,float,float) r14.xyz, v6.zwzz, t4.xyzw, s1
  sample_indexable(texture2d)(float,float,float,float) r15.xyz, v8.xwxx, t4.xyzw, s1
  add r16.xyz, -r6.xyzx, r8.xyzx
  dp3 r11.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r11.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r13.w, r16.x, r16.x
  mad r11.w, r11.w, r11.w, r13.w
  mad r11.w, r16.y, r16.y, r11.w
  sqrt r11.w, r11.w
  add r16.xyz, -r4.xyzx, r6.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r13.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r16.x, r16.x
  mad r13.w, r13.w, r13.w, r14.w
  mad r13.w, r16.y, r16.y, r13.w
  sqrt r13.w, r13.w
  add r11.w, r11.w, r13.w
  add r16.xyz, -r10.xyzx, r11.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r13.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r16.x, r16.x
  mad r13.w, r13.w, r13.w, r14.w
  mad r13.w, r16.y, r16.y, r13.w
  sqrt r13.w, r13.w
  add r11.w, r11.w, r13.w
  add r16.xyz, r10.xyzx, -r13.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r13.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r16.x, r16.x
  mad r13.w, r13.w, r13.w, r14.w
  mad r13.w, r16.y, r16.y, r13.w
  sqrt r13.w, r13.w
  add r11.w, r11.w, r13.w
  add r16.xyz, -r7.xyzx, r9.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r13.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r16.x, r16.x
  mad r13.w, r13.w, r13.w, r14.w
  mad r13.w, r16.y, r16.y, r13.w
  sqrt r13.w, r13.w
  mad r11.w, r13.w, l(4.000000), r11.w
  add r16.xyz, r5.xyzx, -r9.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r13.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r16.x, r16.x
  mad r13.w, r13.w, r13.w, r14.w
  mad r13.w, r16.y, r16.y, r13.w
  sqrt r13.w, r13.w
  add r14.xyz, r9.xyzx, -r14.xyzx
  dp3 r14.y, r14.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.xz, -r14.yyyy, r14.zzxz
  mul r14.xz, r14.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r14.x, r14.x, r14.x
  mad r14.x, r14.y, r14.y, r14.x
  mad r14.x, r14.z, r14.z, r14.x
  sqrt r14.x, r14.x
  add r13.w, r13.w, r14.x
  add r14.xyz, r3.xyzx, -r7.xyzx
  dp3 r14.y, r14.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.xz, -r14.yyyy, r14.zzxz
  mul r14.xz, r14.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r14.x, r14.x, r14.x
  mad r14.x, r14.y, r14.y, r14.x
  mad r14.x, r14.z, r14.z, r14.x
  sqrt r14.x, r14.x
  add r13.w, r13.w, r14.x
  add r14.xyz, r7.xyzx, -r15.xyzx
  dp3 r14.y, r14.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.xz, -r14.yyyy, r14.zzxz
  mul r14.xz, r14.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r14.x, r14.x, r14.x
  mad r14.x, r14.y, r14.y, r14.x
  mad r14.x, r14.z, r14.z, r14.x
  sqrt r14.x, r14.x
  add r13.w, r13.w, r14.x
  add r14.xyz, r6.xyzx, -r10.xyzx
  dp3 r14.y, r14.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.xz, -r14.yyyy, r14.zzxz
  mul r14.xz, r14.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r14.x, r14.x, r14.x
  mad r14.x, r14.y, r14.y, r14.x
  mad r14.x, r14.z, r14.z, r14.x
  sqrt r14.x, r14.x
  mad r13.w, r14.x, l(4.000000), r13.w
  mul r14.x, r11.w, l(3.600000)
  lt r14.x, r14.x, r13.w
  lt r11.w, r11.w, r13.w
  ne r13.w, r1.w, r2.w
  and r11.w, r11.w, r13.w
  ne r13.w, r1.w, r4.w
  and r11.w, r11.w, r13.w
  movc r13.w, r14.x, l(2), l(1)
  and r14.x, r11.w, r13.w
else 
  mov r14.x, l(0)
endif 
eq r11.w, r1.w, r6.w
eq r13.w, r4.w, r5.w
and r13.w, r11.w, r13.w
eq r14.z, r5.w, r6.w
and r12.w, r12.w, r14.z
or r12.w, r12.w, r13.w
if_z r12.w
  sample_indexable(texture2d)(float,float,float,float) r15.xyz, v6.xwxx, t4.xyzw, s1
  sample_indexable(texture2d)(float,float,float,float) r16.xyz, v7.xwxx, t4.xyzw, s1
  add r16.xyz, -r5.xyzx, r16.xyzx
  dp3 r12.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r12.wwww, r16.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r13.w, r14.z, r14.z
  mad r12.w, r12.w, r12.w, r13.w
  mad r12.w, r14.w, r14.w, r12.w
  sqrt r12.w, r12.w
  add r16.xyz, -r3.xyzx, r5.xyzx
  dp3 r13.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r16.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  add r12.w, r12.w, r13.w
  add r15.xyz, -r9.xyzx, r15.xyzx
  dp3 r13.w, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  add r12.w, r12.w, r13.w
  add r15.xyz, -r7.xyzx, r9.xyzx
  dp3 r13.w, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  add r12.w, r12.w, r13.w
  add r15.xyz, -r6.xyzx, r8.xyzx
  dp3 r13.w, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  mad r12.w, r13.w, l(4.000000), r12.w
  add r15.xyz, -r8.xyzx, r12.xyzx
  dp3 r13.w, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  add r11.xyz, r8.xyzx, -r11.xyzx
  dp3 r11.y, r11.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.xz, -r11.yyyy, r11.zzxz
  mul r11.xz, r11.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r11.x, r11.x, r11.x
  mad r11.x, r11.y, r11.y, r11.x
  mad r11.x, r11.z, r11.z, r11.x
  sqrt r11.x, r11.x
  add r11.x, r11.x, r13.w
  add r15.xyz, r2.xyzx, -r6.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  add r11.x, r11.y, r11.x
  add r15.xyz, r6.xyzx, -r10.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  add r11.x, r11.y, r11.x
  add r15.xyz, r5.xyzx, -r9.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  mad r11.x, r11.y, l(4.000000), r11.x
  mul r11.y, r11.x, l(3.600000)
  lt r11.xy, r11.xyxx, r12.wwww
  ne r11.z, r1.w, r6.w
  and r11.x, r11.z, r11.x
  ne r11.z, r1.w, r4.w
  and r11.x, r11.z, r11.x
  movc r11.y, r11.y, l(2), l(1)
  and r14.y, r11.y, r11.x
else 
  mov r14.y, l(0)
endif 
eq r11.x, r8.w, r9.w
and r10.w, r10.w, r11.x
eq r11.x, r1.w, r8.w
eq r11.y, r2.w, r9.w
and r11.y, r11.y, r11.x
or r10.w, r10.w, r11.y
if_z r10.w
  sample_indexable(texture2d)(float,float,float,float) r15.xyz, v2.zwzz, t4.xyzw, s1
  sample_indexable(texture2d)(float,float,float,float) r16.xyz, v8.xyxx, t4.xyzw, s1
  add r17.xyz, -r3.xyzx, r5.xyzx
  dp3 r10.w, r17.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.yz, -r10.wwww, r17.zzxz
  mul r11.yz, r11.yyzy, l(0.000000, 0.531519, 0.678150, 0.000000)
  mul r11.y, r11.y, r11.y
  mad r10.w, r10.w, r10.w, r11.y
  mad r10.w, r11.z, r11.z, r10.w
  sqrt r10.w, r10.w
  add r15.xyz, r3.xyzx, -r15.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  add r10.w, r10.w, r11.y
  add r15.xyz, -r7.xyzx, r9.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  add r10.w, r10.w, r11.y
  add r15.xyz, r7.xyzx, -r16.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  add r10.w, r10.w, r11.y
  add r15.xyz, -r4.xyzx, r6.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  sqrt r11.y, r11.y
  mad r10.w, r11.y, l(4.000000), r10.w
  add r15.xyz, r2.xyzx, -r6.xyzx
  dp3 r11.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.yyyy, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r11.z, r14.z, r14.z
  mad r11.y, r11.y, r11.y, r11.z
  mad r11.y, r14.w, r14.w, r11.y
  add r15.xyz, r6.xyzx, -r10.xyzx
  dp3 r11.z, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.zzzz, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r12.w, r14.z, r14.z
  mad r11.z, r11.z, r11.z, r12.w
  mad r11.z, r14.w, r14.w, r11.z
  sqrt r11.yz, r11.yyzy
  add r11.y, r11.z, r11.y
  add r15.xyz, r1.xyzx, -r4.xyzx
  dp3 r11.z, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r11.zzzz, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r12.w, r14.z, r14.z
  mad r11.z, r11.z, r11.z, r12.w
  mad r11.z, r14.w, r14.w, r11.z
  sqrt r11.z, r11.z
  add r11.y, r11.z, r11.y
  add r13.xyz, r4.xyzx, -r13.xyzx
  dp3 r11.z, r13.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r13.xy, -r11.zzzz, r13.zxzz
  mul r13.xy, r13.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r12.w, r13.x, r13.x
  mad r11.z, r11.z, r11.z, r12.w
  mad r11.z, r13.y, r13.y, r11.z
  sqrt r11.z, r11.z
  add r11.y, r11.z, r11.y
  add r13.xyz, r3.xyzx, -r7.xyzx
  dp3 r11.z, r13.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r13.xy, -r11.zzzz, r13.zxzz
  mul r13.xy, r13.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r12.w, r13.x, r13.x
  mad r11.z, r11.z, r11.z, r12.w
  mad r11.z, r13.y, r13.y, r11.z
  sqrt r11.z, r11.z
  mad r11.y, r11.z, l(4.000000), r11.y
  mul r11.z, r11.y, l(3.600000)
  lt r11.z, r11.z, r10.w
  lt r10.w, r11.y, r10.w
  ne r11.y, r1.w, r8.w
  and r10.w, r10.w, r11.y
  ne r11.y, r1.w, r2.w
  and r10.w, r10.w, r11.y
  movc r11.y, r11.z, l(2), l(1)
  and r13.y, r10.w, r11.y
else 
  mov r13.y, l(0)
endif 
eq r10.w, r7.w, r8.w
and r10.w, r11.w, r10.w
eq r11.y, r6.w, r7.w
and r11.x, r11.x, r11.y
or r10.w, r10.w, r11.x
if_z r10.w
  sample_indexable(texture2d)(float,float,float,float) r11.xyz, v2.xwxx, t4.xyzw, s1
  sample_indexable(texture2d)(float,float,float,float) r15.xyz, v7.xyxx, t4.xyzw, s1
  add r12.xyz, -r2.xyzx, r12.xyzx
  dp3 r10.w, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r10.wwww, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r11.w, r12.x, r12.x
  mad r10.w, r10.w, r10.w, r11.w
  mad r10.w, r12.y, r12.y, r10.w
  sqrt r10.w, r10.w
  add r1.xyz, -r1.xyzx, r2.xyzx
  dp3 r1.y, r1.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r1.xz, -r1.yyyy, r1.zzxz
  mul r1.xz, r1.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r1.x, r1.x, r1.x
  mad r1.x, r1.y, r1.y, r1.x
  mad r1.x, r1.z, r1.z, r1.x
  sqrt r1.x, r1.x
  add r1.x, r1.x, r10.w
  add r12.xyz, -r6.xyzx, r8.xyzx
  dp3 r1.y, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r1.yyyy, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r12.x, r12.x
  mad r1.y, r1.y, r1.y, r1.z
  mad r1.y, r12.y, r12.y, r1.y
  sqrt r1.y, r1.y
  add r1.x, r1.y, r1.x
  add r12.xyz, -r4.xyzx, r6.xyzx
  dp3 r1.y, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r1.yyyy, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r12.x, r12.x
  mad r1.y, r1.y, r1.y, r1.z
  mad r1.y, r12.y, r12.y, r1.y
  sqrt r1.y, r1.y
  add r1.x, r1.y, r1.x
  add r12.xyz, -r3.xyzx, r5.xyzx
  dp3 r1.y, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r1.yyyy, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r12.x, r12.x
  mad r1.y, r1.y, r1.y, r1.z
  mad r1.y, r12.y, r12.y, r1.y
  sqrt r1.y, r1.y
  mad r1.x, r1.y, l(4.000000), r1.x
  add r12.xyz, -r5.xyzx, r15.xyzx
  dp3 r1.y, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r1.yyyy, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r12.x, r12.x
  mad r1.y, r1.y, r1.y, r1.z
  mad r1.y, r12.y, r12.y, r1.y
  add r12.xyz, r5.xyzx, -r9.xyzx
  dp3 r1.z, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xy, -r1.zzzz, r12.zxzz
  mul r12.xy, r12.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r10.w, r12.x, r12.x
  mad r1.z, r1.z, r1.z, r10.w
  mad r1.z, r12.y, r12.y, r1.z
  sqrt r1.yz, r1.yyzy
  add r1.y, r1.z, r1.y
  add r11.xyz, -r3.xyzx, r11.xyzx
  dp3 r1.z, r11.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.xy, -r1.zzzz, r11.zxzz
  mul r11.xy, r11.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r10.w, r11.x, r11.x
  mad r1.z, r1.z, r1.z, r10.w
  mad r1.z, r11.y, r11.y, r1.z
  sqrt r1.z, r1.z
  add r1.y, r1.z, r1.y
  add r11.xyz, r3.xyzx, -r7.xyzx
  dp3 r1.z, r11.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.xy, -r1.zzzz, r11.zxzz
  mul r11.xy, r11.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r10.w, r11.x, r11.x
  mad r1.z, r1.z, r1.z, r10.w
  mad r1.z, r11.y, r11.y, r1.z
  sqrt r1.z, r1.z
  add r1.y, r1.z, r1.y
  add r11.xyz, r2.xyzx, -r6.xyzx
  dp3 r1.z, r11.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.xy, -r1.zzzz, r11.zxzz
  mul r11.xy, r11.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r10.w, r11.x, r11.x
  mad r1.z, r1.z, r1.z, r10.w
  mad r1.z, r11.y, r11.y, r1.z
  sqrt r1.z, r1.z
  mad r1.y, r1.z, l(4.000000), r1.y
  mul r1.z, r1.x, l(3.600000)
  lt r1.xz, r1.xxzx, r1.yyyy
  ne r1.y, r1.w, r6.w
  and r1.x, r1.y, r1.x
  ne r1.y, r1.w, r8.w
  and r1.x, r1.y, r1.x
  movc r1.y, r1.z, l(2), l(1)
  and r13.x, r1.y, r1.x
else 
  mov r13.x, l(0)
endif 
mov x0[0].xyz, r6.xyzx
mov x0[1].xyz, r6.xyzx
mov x0[2].xyz, r6.xyzx
mov x0[3].xyz, r6.xyzx
mov x0[4].xyz, r6.xyzx
mov x0[5].xyz, r6.xyzx
mov x0[6].xyz, r6.xyzx
mov x0[7].xyz, r6.xyzx
mov x0[8].xyz, r6.xyzx
mov x0[9].xyz, r6.xyzx
mov x0[10].xyz, r6.xyzx
mov x0[11].xyz, r6.xyzx
mov x0[12].xyz, r6.xyzx
mov x0[13].xyz, r6.xyzx
mov x0[14].xyz, r6.xyzx
mov x0[15].xyz, r6.xyzx
or r1.xy, r14.xyxx, r13.xyxx
or r1.x, r1.y, r1.x
if_nz r1.x
  add r1.xyz, r7.xyzx, -r8.xyzx
  dp3 r1.y, r1.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r1.xz, -r1.yyyy, r1.zzxz
  mul r1.xz, r1.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r1.x, r1.x, r1.x
  mad r1.x, r1.y, r1.y, r1.x
  mad r1.x, r1.z, r1.z, r1.x
  add r11.xyz, -r4.xyzx, r9.xyzx
  dp3 r1.y, r11.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r11.xy, -r1.yyyy, r11.zxzz
  mul r11.xy, r11.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r11.x, r11.x
  mad r1.y, r1.y, r1.y, r1.z
  mad r1.y, r11.y, r11.y, r1.y
  sqrt r1.xy, r1.xyxx
  mul r1.z, r1.x, l(2.200000)
  ge r1.z, r1.y, r1.z
  ne r10.w, r1.w, r5.w
  and r1.z, r1.z, r10.w
  ne r11.x, r5.w, r6.w
  and r1.z, r1.z, r11.x
  mul r1.y, r1.y, l(2.200000)
  ge r1.x, r1.x, r1.y
  ne r1.y, r1.w, r9.w
  and r1.x, r1.y, r1.x
  ne r11.x, r8.w, r9.w
  and r1.x, r1.x, r11.x
  ige r11.xy, r14.xyxx, l(2, 2, 0, 0)
  ine r11.zw, r13.yyyx, l(0, 0, 0, 0)
  add r12.xyz, r6.xyzx, -r8.xyzx
  dp3 r12.y, r12.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r12.xz, -r12.yyyy, r12.zzxz
  mul r12.xz, r12.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r12.x, r12.x, r12.x
  mad r12.x, r12.y, r12.y, r12.x
  mad r12.x, r12.z, r12.z, r12.x
  sqrt r12.x, r12.x
  ge r12.x, r12.x, l(0.117647)
  and r12.y, r11.z, r12.x
  ine r12.zw, r14.xxxy, l(0, 0, 0, 0)
  add r15.xyz, -r4.xyzx, r6.xyzx
  dp3 r13.z, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.zzzz, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r13.w, r14.z, r14.z
  mad r13.z, r13.z, r13.z, r13.w
  mad r13.z, r14.w, r14.w, r13.z
  sqrt r13.z, r13.z
  ge r13.z, r13.z, l(0.117647)
  and r13.w, r12.w, r13.z
  or r12.y, r12.y, r13.w
  add r15.xyz, r8.xyzx, -r9.xyzx
  dp3 r13.w, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r14.zw, -r13.wwww, r15.zzzx
  mul r14.zw, r14.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r14.z, r14.z, r14.z
  mad r13.w, r13.w, r13.w, r14.z
  mad r13.w, r14.w, r14.w, r13.w
  sqrt r13.w, r13.w
  lt r13.w, r13.w, l(0.117647)
  add r15.xyz, r9.xyzx, -r10.xyzx
  dp3 r14.z, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r15.xy, -r14.zzzz, r15.zxzz
  mul r15.xy, r15.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r14.w, r15.x, r15.x
  mad r14.z, r14.z, r14.z, r14.w
  mad r14.z, r15.y, r15.y, r14.z
  sqrt r14.z, r14.z
  lt r14.z, r14.z, l(0.117647)
  and r14.w, r13.w, r14.z
  add r15.xyz, -r7.xyzx, r10.xyzx
  dp3 r15.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r15.xz, -r15.yyyy, r15.zzxz
  mul r15.xz, r15.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r15.x, r15.x, r15.x
  mad r15.x, r15.y, r15.y, r15.x
  mad r15.x, r15.z, r15.z, r15.x
  sqrt r15.x, r15.x
  lt r15.x, r15.x, l(0.117647)
  and r14.w, r14.w, r15.x
  add r15.yzw, -r4.xxyz, r7.xxyz
  dp3 r15.z, r15.yzwy, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r15.yw, -r15.zzzz, r15.wwwy
  mul r15.yw, r15.yyyw, l(0.000000, 0.531519, 0.000000, 0.678150)
  mul r15.y, r15.y, r15.y
  mad r15.y, r15.z, r15.z, r15.y
  mad r15.y, r15.w, r15.w, r15.y
  sqrt r15.y, r15.y
  lt r15.y, r15.y, l(0.117647)
  and r14.w, r14.w, r15.y
  add r16.xyz, r6.xyzx, -r10.xyzx
  dp3 r15.z, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r15.zzzz, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r15.w, r16.x, r16.x
  mad r15.z, r15.z, r15.z, r15.w
  mad r15.z, r16.y, r16.y, r15.z
  sqrt r15.z, r15.z
  ge r15.z, r15.z, l(0.117647)
  and r14.w, r14.w, r15.z
  or r14.w, r12.y, r14.w
  not r14.w, r14.w
  or r11.x, r11.x, r14.w
  add r16.xyz, r6.xyzx, -r7.xyzx
  dp3 r14.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r14.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r15.w, r16.x, r16.x
  mad r14.w, r14.w, r14.w, r15.w
  mad r14.w, r16.y, r16.y, r14.w
  sqrt r14.w, r14.w
  add r16.xyz, r6.xyzx, -r9.xyzx
  dp3 r15.w, r16.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r16.xy, -r15.wwww, r16.zxzz
  mul r16.xy, r16.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r16.x, r16.x, r16.x
  mad r15.w, r15.w, r15.w, r16.x
  mad r15.w, r16.y, r16.y, r15.w
  sqrt r15.w, r15.w
  ge r16.x, r15.w, r14.w
  movc r16.xyz, r16.xxxx, r7.xyzx, r9.xyzx
  and r16.w, r11.x, r12.z
  and r17.y, r1.z, r16.w
  not r17.xz, r1.zzxz
  and r17.w, r1.x, r17.y
  add r18.xyz, -r6.xyzx, r16.xyzx
  mad r19.xyz, r18.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000), r6.xyzx
  movc r19.xyz, r17.wwww, r19.xyzx, r6.xyzx
  and r17.w, r17.z, r17.y
  add r20.xyz, r16.xyzx, -r19.xyzx
  mad r20.xyz, r20.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r19.xyzx
  movc r19.xyz, r17.wwww, r20.xyzx, r19.xyzx
  and r17.w, r16.w, r17.x
  and r18.w, r1.x, r17.w
  add r20.xyz, r16.xyzx, -r19.xyzx
  mad r20.xyz, r20.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r19.xyzx
  movc r19.xyz, r18.wwww, r20.xyzx, r19.xyzx
  and r17.w, r17.z, r17.w
  mov x0[2].xyz, r19.xyzx
  and r1.x, r1.x, r16.w
  mad r19.xyz, r18.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r6.xyzx
  movc r20.xyz, r1.xxxx, r19.xyzx, r6.xyzx
  mad r18.xyz, r18.xyzx, l(0.750000, 0.750000, 0.750000, 0.000000), r6.xyzx
  movc r21.xyz, r1.xxxx, r18.xyzx, r6.xyzx
  not r11.x, r11.x
  movc r22.xyz, r1.xxxx, r16.xyzx, r6.xyzx
  and r1.x, r16.w, r17.z
  and r1.z, r1.z, r1.x
  add r23.xyz, r16.xyzx, -r22.xyzx
  mad r23.xyz, r23.xyzx, l(0.750000, 0.750000, 0.750000, 0.000000), r22.xyzx
  movc r22.xyz, r1.zzzz, r23.xyzx, r22.xyzx
  and r1.x, r17.x, r1.x
  add r23.xyz, r16.xyzx, -r22.xyzx
  mad r23.xyz, r23.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r22.xyzx
  movc r23.xyz, r1.xxxx, r23.xyzx, r22.xyzx
  and r1.x, r11.x, r12.z
  add r24.xyz, r16.xyzx, -r23.xyzx
  mad r24.xyz, r24.xyzx, l(0.086777, 0.086777, 0.086777, 0.000000), r23.xyzx
  movc r23.xyz, r1.xxxx, r24.xyzx, r23.xyzx
  movc r22.xyz, r14.xxxx, r23.xyzx, r22.xyzx
  movc r23.xyz, r16.wwww, r16.xyzx, r6.xyzx
  add r24.xyz, r16.xyzx, -r23.xyzx
  mad r24.xyz, r24.xyzx, l(0.684853, 0.684853, 0.684853, 0.000000), r23.xyzx
  movc r23.xyz, r1.xxxx, r24.xyzx, r23.xyzx
  movc r23.xyz, r14.xxxx, r23.xyzx, r6.xyzx
  movc r24.xyz, r17.yyyy, r16.xyzx, r6.xyzx
  add r25.xyz, r16.xyzx, -r24.xyzx
  mad r25.xyz, r25.xyzx, l(0.750000, 0.750000, 0.750000, 0.000000), r24.xyzx
  movc r24.xyz, r18.wwww, r25.xyzx, r24.xyzx
  add r25.xyz, r16.xyzx, -r24.xyzx
  mad r25.xyz, r25.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r24.xyzx
  movc r17.xzw, r17.wwww, r25.xxyz, r24.xxyz
  add r16.xyz, r16.xyzx, -r17.xzwx
  mad r16.xyz, r16.xyzx, l(0.086777, 0.086777, 0.086777, 0.000000), r17.xzwx
  movc r16.xyz, r1.xxxx, r16.xyzx, r17.xzwx
  movc r16.xyz, r14.xxxx, r16.xyzx, r24.xyzx
  movc r17.xzw, r17.yyyy, r18.xxyz, r6.xxyz
  movc r18.xyz, r17.yyyy, r19.xyzx, r6.xyzx
  add r19.xyz, r3.xyzx, -r10.xyzx
  dp3 r1.x, r19.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r19.xy, -r1.xxxx, r19.zxzz
  mul r19.xy, r19.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.z, r19.x, r19.x
  mad r1.x, r1.x, r1.x, r1.z
  mad r1.x, r19.y, r19.y, r1.x
  add r19.xyz, -r2.xyzx, r7.xyzx
  dp3 r1.z, r19.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r19.xy, -r1.zzzz, r19.zxzz
  mul r19.xy, r19.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r11.x, r19.x, r19.x
  mad r1.z, r1.z, r1.z, r11.x
  mad r1.z, r19.y, r19.y, r1.z
  sqrt r1.xz, r1.xxzx
  mul r11.x, r1.x, l(2.200000)
  ge r11.x, r1.z, r11.x
  ne r14.x, r1.w, r3.w
  and r11.x, r11.x, r14.x
  ne r16.w, r3.w, r4.w
  and r11.x, r11.x, r16.w
  mul r1.z, r1.z, l(2.200000)
  ge r1.x, r1.x, r1.z
  ne r1.z, r1.w, r7.w
  and r1.x, r1.z, r1.x
  ne r1.w, r6.w, r7.w
  and r1.x, r1.w, r1.x
  ige r19.xy, r13.yxyy, l(2, 2, 0, 0)
  and r1.w, r11.w, r15.z
  add r24.xyz, -r2.xyzx, r6.xyzx
  dp3 r6.w, r24.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r19.zw, -r6.wwww, r24.zzzx
  mul r19.zw, r19.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r15.z, r19.z, r19.z
  mad r6.w, r6.w, r6.w, r15.z
  mad r6.w, r19.w, r19.w, r6.w
  sqrt r6.w, r6.w
  ge r6.w, r6.w, l(0.117647)
  and r12.z, r6.w, r12.z
  or r1.w, r1.w, r12.z
  and r12.z, r15.y, r15.x
  add r15.xyz, -r3.xyzx, r4.xyzx
  dp3 r15.y, r15.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r15.xz, -r15.yyyy, r15.zzxz
  mul r15.xz, r15.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r15.x, r15.x, r15.x
  mad r15.x, r15.y, r15.y, r15.x
  mad r15.x, r15.z, r15.z, r15.x
  sqrt r15.x, r15.x
  lt r15.x, r15.x, l(0.117647)
  and r12.z, r12.z, r15.x
  add r24.xyz, -r2.xyzx, r3.xyzx
  dp3 r15.y, r24.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r19.zw, -r15.yyyy, r24.zzzx
  mul r19.zw, r19.zzzw, l(0.000000, 0.000000, 0.531519, 0.678150)
  mul r15.z, r19.z, r19.z
  mad r15.y, r15.y, r15.y, r15.z
  mad r15.y, r19.w, r19.w, r15.y
  sqrt r15.y, r15.y
  lt r15.y, r15.y, l(0.117647)
  and r12.z, r12.z, r15.y
  and r12.z, r13.z, r12.z
  or r12.z, r1.w, r12.z
  not r12.z, r12.z
  or r12.z, r12.z, r19.x
  add r19.xzw, -r3.xxyz, r6.xxyz
  dp3 r13.z, r19.xzwx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r19.xz, -r13.zzzz, r19.wwxw
  mul r19.xz, r19.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r15.z, r19.x, r19.x
  mad r13.z, r13.z, r13.z, r15.z
  mad r13.z, r19.z, r19.z, r13.z
  sqrt r13.z, r13.z
  ge r14.w, r14.w, r13.z
  movc r7.xyz, r14.wwww, r3.xyzx, r7.xyzx
  and r11.z, r11.z, r12.z
  movc r19.xz, r1.xxxx, l(0.333333,0,0.750000,0), l(0.250000,0,0.500000,0)
  and r14.w, r1.x, l(0x3e800000)
  movc r14.w, r11.x, r19.x, r14.w
  and r14.w, r11.z, r14.w
  add r24.xyz, -r6.xyzx, r7.xyzx
  mad r25.xyz, r14.wwww, r24.xyzx, r6.xyzx
  mov x0[1].xyz, r25.xyzx
  and r14.w, r1.x, r11.z
  and r19.xw, r14.wwww, l(0x3e800000, 0, 0, 0x3f400000)
  mad r25.xyz, r19.xxxx, r24.xyzx, r6.xyzx
  mad r26.xyz, r19.wwww, r24.xyzx, r6.xyzx
  movc r14.w, r11.x, l(0.750000), l(0.500000)
  movc r1.x, r1.x, l(1.000000), r14.w
  movc r1.x, r12.z, r1.x, l(0.086777)
  movc r1.x, r13.y, r1.x, l(0)
  mad r24.xyz, r1.xxxx, r24.xyzx, r6.xyzx
  movc r1.x, r12.z, l(1.000000), l(0.684853)
  movc r1.x, r13.y, r1.x, l(0)
  add r27.xyz, -r20.xyzx, r7.xyzx
  mad r20.xyz, r1.xxxx, r27.xyzx, r20.xyzx
  movc r1.x, r11.x, l(1.000000), r19.z
  movc r1.x, r12.z, r1.x, l(0.086777)
  movc r1.x, r13.y, r1.x, l(0)
  add r19.xzw, -r21.xxyz, r7.xxyz
  mad r19.xzw, r1.xxxx, r19.xxzw, r21.xxyz
  mov x0[10].xyz, r19.xzwx
  and r1.x, r11.x, r11.z
  and r11.xz, r1.xxxx, l(0x3f400000, 0, 0x3e800000, 0)
  add r19.xzw, -r22.xxyz, r7.xxyz
  mad r19.xzw, r11.xxxx, r19.xxzw, r22.xxyz
  mov x0[11].xyz, r19.xzwx
  add r7.xyz, -r23.xyzx, r7.xyzx
  mad r7.xyz, r11.zzzz, r7.xyzx, r23.xyzx
  add r4.xyz, -r4.xyzx, r5.xyzx
  dp3 r1.x, r4.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r4.xy, -r1.xxxx, r4.zxzz
  mul r4.xy, r4.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r4.x, r4.x, r4.x
  mad r1.x, r1.x, r1.x, r4.x
  mad r1.x, r4.y, r4.y, r1.x
  sqrt r1.x, r1.x
  add r4.xyz, r3.xyzx, -r8.xyzx
  dp3 r4.y, r4.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r4.xz, -r4.yyyy, r4.zzxz
  mul r4.xz, r4.xxzx, l(0.531519, 0.000000, 0.678150, 0.000000)
  mul r4.x, r4.x, r4.x
  mad r4.x, r4.y, r4.y, r4.x
  mad r4.x, r4.z, r4.z, r4.x
  sqrt r4.x, r4.x
  mul r4.y, r1.x, l(2.200000)
  ge r4.y, r4.x, r4.y
  and r1.y, r1.y, r4.y
  ne r4.y, r2.w, r9.w
  mul r4.x, r4.x, l(2.200000)
  ge r1.x, r1.x, r4.x
  and r1.x, r10.w, r1.x
  ne r4.x, r4.w, r5.w
  and r1.xy, r1.xyxx, r4.xyxx
  and r4.x, r15.y, r15.x
  add r4.yzw, r2.xxyz, -r5.xxyz
  dp3 r4.z, r4.yzwy, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r4.yw, -r4.zzzz, r4.wwwy
  mul r4.yw, r4.yyyw, l(0.000000, 0.531519, 0.000000, 0.678150)
  mul r4.y, r4.y, r4.y
  mad r4.y, r4.z, r4.z, r4.y
  mad r4.y, r4.w, r4.w, r4.y
  sqrt r4.y, r4.y
  lt r4.y, r4.y, l(0.117647)
  and r4.x, r4.y, r4.x
  add r8.xyz, r5.xyzx, -r8.xyzx
  dp3 r4.z, r8.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r8.xy, -r4.zzzz, r8.zxzz
  mul r8.xy, r8.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r4.w, r8.x, r8.x
  mad r4.z, r4.z, r4.z, r4.w
  mad r4.z, r8.y, r8.y, r4.z
  sqrt r4.z, r4.z
  lt r4.z, r4.z, l(0.117647)
  and r4.x, r4.z, r4.x
  and r4.x, r6.w, r4.x
  or r4.x, r4.x, r12.y
  not r4.x, r4.x
  or r4.x, r4.x, r19.y
  add r8.xyz, -r5.xyzx, r6.xyzx
  dp3 r4.w, r8.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r8.xy, -r4.wwww, r8.zxzz
  mul r8.xy, r8.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r5.w, r8.x, r8.x
  mad r4.w, r4.w, r4.w, r5.w
  mad r4.w, r8.y, r8.y, r4.w
  sqrt r4.w, r4.w
  ge r5.w, r13.z, r4.w
  movc r3.xyz, r5.wwww, r5.xyzx, r3.xyzx
  and r5.w, r4.x, r11.w
  movc r8.xy, r1.xxxx, l(0.333333,0.750000,0,0), l(0.250000,0.500000,0,0)
  and r6.w, r1.x, l(0x3e800000)
  movc r6.w, r1.y, r8.x, r6.w
  and r6.w, r5.w, r6.w
  add r11.xzw, -r6.xxyz, r3.xxyz
  mad r15.xyz, r6.wwww, r11.xzwx, r6.xyzx
  mov x0[0].xyz, r15.xyzx
  and r6.w, r1.x, r5.w
  and r8.xz, r6.wwww, l(0x3e800000, 0, 0x3f400000, 0)
  add r15.xyz, -r18.xyzx, r3.xyzx
  mad r15.xyz, r8.xxxx, r15.xyzx, r18.xyzx
  mad r18.xyz, r8.zzzz, r11.xzwx, r6.xyzx
  movc r6.w, r1.y, l(0.750000), l(0.500000)
  movc r1.x, r1.x, l(1.000000), r6.w
  movc r1.x, r4.x, r1.x, l(0.086777)
  movc r1.x, r13.x, r1.x, l(0)
  mad r11.xzw, r1.xxxx, r11.xxzw, r6.xxyz
  movc r1.x, r4.x, l(1.000000), l(0.684853)
  movc r1.x, r13.x, r1.x, l(0)
  add r19.xyz, -r25.xyzx, r3.xyzx
  mad r19.xyz, r1.xxxx, r19.xyzx, r25.xyzx
  movc r1.x, r1.y, l(1.000000), r8.y
  movc r1.x, r4.x, r1.x, l(0.086777)
  movc r1.x, r13.x, r1.x, l(0)
  add r8.xyz, -r26.xyzx, r3.xyzx
  mad r8.xyz, r1.xxxx, r8.xyzx, r26.xyzx
  mov x0[7].xyz, r8.xyzx
  and r1.x, r1.y, r5.w
  and r1.xy, r1.xxxx, l(0x3f400000, 0x3e800000, 0, 0)
  add r8.xyz, -r24.xyzx, r3.xyzx
  mad r8.xyz, r1.xxxx, r8.xyzx, r24.xyzx
  mov x0[8].xyz, r8.xyzx
  add r3.xyz, -r20.xyzx, r3.xyzx
  mad r3.xyz, r1.yyyy, r3.xyzx, r20.xyzx
  mov x0[9].xyz, r3.xyzx
  add r2.xyz, -r2.xyzx, r9.xyzx
  dp3 r1.x, r2.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r2.xy, -r1.xxxx, r2.zxzz
  mul r2.xy, r2.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r1.y, r2.x, r2.x
  mad r1.x, r1.x, r1.x, r1.y
  mad r1.x, r2.y, r2.y, r1.x
  add r2.xyz, r5.xyzx, -r10.xyzx
  dp3 r1.y, r2.xyzx, l(0.262700, 0.678000, 0.059300, 0.000000)
  add r2.xy, -r1.yyyy, r2.zxzz
  mul r2.xy, r2.xyxx, l(0.531519, 0.678150, 0.000000, 0.000000)
  mul r2.x, r2.x, r2.x
  mad r1.y, r1.y, r1.y, r2.x
  mad r1.y, r2.y, r2.y, r1.y
  sqrt r1.xy, r1.xyxx
  mul r2.x, r1.x, l(2.200000)
  ge r2.x, r1.y, r2.x
  and r1.z, r1.z, r2.x
  ne r2.x, r7.w, r8.w
  and r1.z, r1.z, r2.x
  mul r1.y, r1.y, l(2.200000)
  ge r1.x, r1.x, r1.y
  and r1.x, r14.x, r1.x
  ne r1.y, r2.w, r3.w
  and r1.x, r1.y, r1.x
  and r1.y, r4.z, r4.y
  and r1.y, r13.w, r1.y
  and r1.y, r14.z, r1.y
  and r1.y, r12.x, r1.y
  or r1.y, r1.y, r1.w
  not r1.y, r1.y
  or r1.y, r1.y, r11.y
  ge r1.w, r4.w, r15.w
  movc r2.xyz, r1.wwww, r9.xyzx, r5.xyzx
  and r1.w, r1.y, r12.w
  movc r3.xy, r1.xxxx, l(0.333333,0.750000,0,0), l(0.250000,0.500000,0,0)
  and r2.w, r1.x, l(0x3e800000)
  movc r2.w, r1.z, r3.x, r2.w
  and r2.w, r1.w, r2.w
  add r3.xzw, -r6.xxyz, r2.xxyz
  mad r3.xzw, r2.wwww, r3.xxzw, r6.xxyz
  mov x0[3].xyz, r3.xzwx
  and r2.w, r1.x, r1.w
  and r3.xz, r2.wwww, l(0x3e800000, 0, 0x3f400000, 0)
  add r4.xyz, -r7.xyzx, r2.xyzx
  mad r4.xyz, r3.xxxx, r4.xyzx, r7.xyzx
  mov x0[12].xyz, r4.xyzx
  add r4.xyz, -r16.xyzx, r2.xyzx
  mad r3.xzw, r3.zzzz, r4.xxyz, r16.xxyz
  mov x0[13].xyz, r3.xzwx
  movc r2.w, r1.z, l(0.750000), l(0.500000)
  movc r1.x, r1.x, l(1.000000), r2.w
  movc r1.x, r1.y, r1.x, l(0.086777)
  movc r1.x, r14.y, r1.x, l(0)
  add r3.xzw, -r17.xxzw, r2.xxyz
  mad r3.xzw, r1.xxxx, r3.xxzw, r17.xxzw
  mov x0[14].xyz, r3.xzwx
  movc r1.x, r1.y, l(1.000000), l(0.684853)
  movc r1.x, r14.y, r1.x, l(0)
  add r3.xzw, -r15.xxyz, r2.xxyz
  mad r3.xzw, r1.xxxx, r3.xxzw, r15.xxyz
  mov x0[15].xyz, r3.xzwx
  movc r1.x, r1.z, l(1.000000), r3.y
  movc r1.x, r1.y, r1.x, l(0.086777)
  movc r1.x, r14.y, r1.x, l(0)
  add r3.xyz, -r18.xyzx, r2.xyzx
  mad r3.xyz, r1.xxxx, r3.xyzx, r18.xyzx
  mov x0[4].xyz, r3.xyzx
  and r1.x, r1.z, r1.w
  and r1.xy, r1.xxxx, l(0x3f400000, 0x3e800000, 0, 0)
  add r3.xyz, -r11.xzwx, r2.xyzx
  mad r1.xzw, r1.xxxx, r3.xxyz, r11.xxzw
  mov x0[5].xyz, r1.xzwx
  add r1.xzw, -r19.xxyz, r2.xxyz
  mad r1.xyz, r1.yyyy, r1.xzwx, r19.xyzx
  mov x0[6].xyz, r1.xyzx
endif 
ge r1.xyzw, r0.xyzw, l(0.250000, 0.750000, 0.500000, 0.250000)
and r1.xyzw, r1.xyzw, l(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000)
mov r0.xyz, x0[6].xyzx
mov r2.xyz, x0[7].xyzx
add r2.xyz, -r0.xyzx, r2.xyzx
mad r0.xyz, r1.xxxx, r2.xyzx, r0.xyzx
mov r2.xyz, x0[8].xyzx
mov r3.xyz, x0[9].xyzx
add r3.xyz, -r2.xyzx, r3.xyzx
mad r2.xyz, r1.yyyy, r3.xyzx, r2.xyzx
add r2.xyz, -r0.xyzx, r2.xyzx
mad r0.xyz, r1.zzzz, r2.xyzx, r0.xyzx
mov r2.xyz, x0[5].xyzx
mov r3.xyz, x0[0].xyzx
add r3.xyz, -r2.xyzx, r3.xyzx
mad r2.xyz, r1.xxxx, r3.xyzx, r2.xyzx
mov r3.xyz, x0[1].xyzx
mov r4.xyz, x0[10].xyzx
add r4.xyz, -r3.xyzx, r4.xyzx
mad r3.xyz, r1.yyyy, r4.xyzx, r3.xyzx
add r3.xyz, -r2.xyzx, r3.xyzx
mad r2.xyz, r1.zzzz, r3.xyzx, r2.xyzx
add r2.xyz, -r0.xyzx, r2.xyzx
mad r0.xyz, r1.wwww, r2.xyzx, r0.xyzx
mov r2.xyz, x0[4].xyzx
mov r3.xyz, x0[3].xyzx
add r3.xyz, -r2.xyzx, r3.xyzx
mad r2.xyz, r1.xxxx, r3.xyzx, r2.xyzx
mov r3.xyz, x0[2].xyzx
mov r4.xyz, x0[11].xyzx
add r4.xyz, -r3.xyzx, r4.xyzx
mad r3.xyz, r1.yyyy, r4.xyzx, r3.xyzx
add r3.xyz, -r2.xyzx, r3.xyzx
mad r2.xyz, r1.zzzz, r3.xyzx, r2.xyzx
mov r3.xyz, x0[15].xyzx
mov r4.xyz, x0[14].xyzx
add r4.xyz, -r3.xyzx, r4.xyzx
mad r3.xyz, r1.xxxx, r4.xyzx, r3.xyzx
mov r4.xyz, x0[13].xyzx
mov r5.xyz, x0[12].xyzx
add r5.xyz, -r4.xyzx, r5.xyzx
mad r1.xyw, r1.yyyy, r5.xyxz, r4.xyxz
add r1.xyw, -r3.xyxz, r1.xyxw
mad r1.xyz, r1.zzzz, r1.xywx, r3.xyzx
ge r3.xy, r0.wwww, l(0.750000, 0.500000, 0.000000, 0.000000)
and r3.xy, r3.xyxx, l(0x3f800000, 0x3f800000, 0, 0)
add r1.xyz, -r2.xyzx, r1.xyzx
mad r1.xyz, r3.xxxx, r1.xyzx, r2.xyzx
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r3.yyyy, r1.xyzx, r0.xyzx
ret 
// Approximately 986 instruction slots used
