//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texHDR1                      texture  float4          2d             t0      1 
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
dcl_temps 10
dcl_indexableTemp x0[13], 4
mul r0.xy, v1.xyxx, l(1.666667, 1.666667, 0.000000, 0.000000)
mov_sat r0.zw, r0.xxxy
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t0.xyzw, s0
mad r0.z, r1.w, l(2.000000), l(-1.000000)
lt r0.w, r1.w, l(0.500000)
mul r2.xy, |r0.zzzz|, l(15.000000, 4.687500, 0.000000, 0.000000)
movc r0.z, r0.w, r2.y, r2.x
max r0.w, r0.y, r0.x
ge r0.w, l(1.050000), r0.w
ge r2.x, r0.z, l(1.200000)
and r0.w, r0.w, r2.x
if_nz r0.w
  sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r0.xyxx, t0.xyzw, s0, l(0.000000)
  mul r3.xy, r0.zzzz, l(0.000521, 0.000926, 0.000000, 0.000000)
  mad r0.z, r0.z, l(1.066667), l(1.000000)
  round_ne r0.z, r0.z
  mul r2.xyz, |r2.xyzx|, |r2.xyzx|
  mul r2.xyz, r2.xyzx, r2.xyzx
  mov x0[0].y, l(0.258819)
  mov x0[0].x, l(0.965926)
  mov x0[1].y, l(0.707107)
  mov x0[1].x, l(0.707107)
  mov x0[2].y, l(0.965926)
  mov x0[2].x, l(0.258819)
  mov x0[3].y, l(0.965926)
  mov x0[3].x, l(-0.258819)
  mov x0[4].y, l(0.707107)
  mov x0[4].x, l(-0.707107)
  mov x0[5].y, l(0.258819)
  mov x0[5].x, l(-0.965926)
  mov x0[6].y, l(-0.258819)
  mov x0[6].x, l(-0.965926)
  mov x0[7].y, l(-0.707107)
  mov x0[7].x, l(-0.707107)
  mov x0[8].y, l(-0.965926)
  mov x0[8].x, l(-0.258819)
  mov x0[9].y, l(-0.965926)
  mov x0[9].x, l(0.258819)
  mov x0[10].y, l(-0.707107)
  mov x0[10].x, l(0.707106)
  mov x0[11].y, l(-0.258820)
  mov x0[11].x, l(0.965926)
  mov x0[12].y, l(0.258819)
  mov x0[12].x, l(0.965926)
  mul r0.w, r1.w, l(0.990000)
  mov r4.xyz, r2.xyzx
  mov r2.w, l(1.000000)
  mov r3.z, l(1.000000)
  loop 
    lt r3.w, r0.z, r3.z
    breakc_nz r3.w
    div r3.w, r3.z, r0.z
    mov r5.xyz, r4.xyzx
    mov r4.w, r2.w
    mov r5.w, l(1)
    loop 
      ilt r6.x, l(12), r5.w
      breakc_nz r6.x
      iadd r6.xy, r5.wwww, l(-1, 1, 0, 0)
      mov r6.xz, x0[r6.x + 0].xxyx
      mov r7.xy, x0[r5.w + 0].xyxx
      add r7.xy, -r6.xzxx, r7.xyxx
      mov r8.xyz, r5.xyzx
      mov r6.w, r4.w
      mov r7.z, l(0)
      loop 
        ge r7.w, r7.z, r3.z
        breakc_nz r7.w
        div r7.w, r7.z, r3.z
        mad r9.xy, r7.wwww, r7.xyxx, r6.xzxx
        mul r9.xy, r3.wwww, r9.xyxx
        mad r9.xy, r9.xyxx, r3.xyxx, r0.xyxx
        sample_l_indexable(texture2d)(float,float,float,float) r9.xyzw, r9.xyxx, t0.xyzw, s0, l(0.000000)
        ge r7.w, r9.w, r0.w
        mad r8.w, r9.w, l(2.000000), l(-1.000000)
        mul r8.w, |r8.w|, |r8.w|
        mul r8.w, r8.w, r8.w
        movc r7.w, r7.w, l(1.000000), r8.w
        mul r9.xyz, |r9.xyzx|, |r9.xyzx|
        mul r9.xyz, r9.xyzx, r9.xyzx
        mad r8.xyz, r9.xyzx, r7.wwww, r8.xyzx
        add r6.w, r6.w, r7.w
        add r7.z, r7.z, l(1.000000)
      endloop 
      mov r5.xyz, r8.xyzx
      mov r4.w, r6.w
      mov r5.w, r6.y
    endloop 
    mov r4.xyz, r5.xyzx
    mov r2.w, r4.w
    add r3.z, r3.z, l(1.000000)
  endloop 
  div r0.xyz, r4.xyzx, r2.wwww
  max r0.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r0.xyz, r0.xyzx
  mul r0.xyz, r0.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000)
  exp r1.xyz, r0.xyzx
endif 
mov o0.xyzw, r1.xyzw
ret 
// Approximately 100 instruction slots used
