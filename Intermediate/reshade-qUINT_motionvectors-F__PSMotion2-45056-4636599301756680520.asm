//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int UI_ME_LAYER_MAX;               // Offset:    0 Size:     4
//   float UI_ME_PYRAMID_UPSCALE_FILTER_RADIUS;// Offset:    4 Size:     4
//   bool SHOWME;                       // Offset:    8 Size:     4 [unused]
//   uint FRAME_COUNT;                  // Offset:   12 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__FeatureCurr                  texture  float4          2d             t8      1 
// __V__FeaturePrev                  texture  float4          2d            t10      1 
// __V__MotionTexCur3                texture  float4          2d            t22      1 
// __V__MVJitterTex                  texture  float4          2d            t30      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
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
dcl_immediateConstantBuffer { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} }
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t22
dcl_resource_texture2d (float,float,float,float) t30
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 16
dcl_indexableTemp x0[9], 4
and r0.x, cb0[0].w, l(15)
utof r0.y, r0.x
mad r0.y, r0.y, l(0.618034), l(0.422800)
frc r0.y, r0.y
mul r0.y, r0.y, l(1.570796)
sincos r1.x, r2.x, r0.y
sincos r2.y, null, -r0.y
mov r2.z, r1.x
mul r0.yzw, r2.xxyz, cb0[0].yyyy
sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.xy, v1.xyxx, t8.xyzw, s0, l(0.000000)
mov r2.xyzw, l(0,0,0,0)
mov r1.zw, l(0,0,0.000001,-1)
loop 
  ilt r3.x, l(1), r1.w
  breakc_nz r3.x
  itof r3.x, r1.w
  imax r3.z, -r1.w, r1.w
  dp3 r3.z, l(1.000000, 0.850000, 0.650000, 0.000000), icb[r3.z + 0].xyzx
  mov r4.xyzw, r2.xyzw
  mov r3.w, r1.z
  mov r5.x, l(-1)
  loop 
    ilt r5.y, l(1), r5.x
    breakc_nz r5.y
    itof r3.y, r5.x
    dp2 r6.x, r3.xyxx, r0.ywyy
    dp2 r6.y, r3.yxyy, r0.yzyy
    mad r5.yz, r6.xxyx, l(0.000000, 0.004167, 0.007407, 0.000000), v1.xxyx
    sample_l_aoffimmi_indexable(3,0,0)(texture2d)(float,float,float,float) r3.y, r5.yzyy, t8.xyzw, s0, l(0.000000)
    sample_l_aoffimmi_indexable(0,0,0)(texture2d)(float,float,float,float) r6.xyzw, r5.yzyy, t22.xyzw, s0, l(0.000000)
    add r3.y, -r1.y, r3.y
    mad_sat r5.yz, -r6.wwzw, l(0.000000, 4.000000, 128.000000, 0.000000), l(0.000000, 1.000000, 1.000000, 0.000000)
    dp2 r5.w, r6.xyxx, r6.xyxx
    mad r3.y, |r3.y|, l(4.000000), r5.y
    mad r3.y, r5.w, l(4.000000), r3.y
    add r3.y, r5.z, r3.y
    exp r3.y, -r3.y
    mul r3.y, r3.z, r3.y
    imax r5.y, -r5.x, r5.x
    dp3 r5.y, l(1.000000, 0.850000, 0.650000, 0.000000), icb[r5.y + 0].xyzx
    mul r5.z, r3.y, r5.y
    mad r4.xyzw, r6.xyzw, r5.zzzz, r4.xyzw
    mad r3.w, r3.y, r5.y, r3.w
    iadd r5.x, r5.x, l(1)
  endloop 
  mov r2.xyzw, r4.xyzw
  mov r1.z, r3.w
  iadd r1.w, r1.w, l(1)
endloop 
div r2.xyzw, r2.xyzw, r1.zzzz
ige r0.y, l(2), cb0[0].x
if_nz r0.y
  add r3.xyzw, v1.xyxy, l(-0.002083, -0.003704, -0.002083, 0.000000)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r0.yz, r3.xyxx, t8.zxyw, s0, l(0.000000)
  add r4.xyzw, r2.xyxy, r3.xyzw
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r4.xyxx, t10.zwxy, s0, l(0.000000)
  mov x0[0].xy, r0.yzyy
  mul r5.yz, r1.zzwz, r1.zzwz
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r3.zw, r3.zwzz, t8.zwxy, s0, l(0.000000)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r4.xy, r4.zwzz, t10.xyzw, s0, l(0.000000)
  mov x0[1].xy, r3.zwzz
  mul r4.zw, r3.zzzw, r3.zzzw
  mad r4.zw, r0.yyyz, r0.yyyz, r4.zzzw
  mul r6.yz, r4.xxyx, r4.xxyx
  mov r5.x, r1.z
  mov r6.x, r4.x
  add r5.xyz, r5.xyzx, r6.xyzx
  mul r3.zw, r3.zzzw, r4.xxxy
  mad r0.yz, r0.yyzy, r1.zzwz, r3.zzwz
  add r6.xyzw, v1.xyxy, l(-0.002083, 0.003704, 0.000000, -0.003704)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r6.xyxx, t8.zwxy, s0, l(0.000000)
  add r7.xyzw, r2.xyxy, r6.xyzw
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r3.zw, r7.xyxx, t10.zwxy, s0, l(0.000000)
  mov x0[2].xy, r1.zwzz
  mad r4.xy, r1.zwzz, r1.zwzz, r4.zwzz
  mul r8.yz, r3.zzwz, r3.zzwz
  mov r8.x, r3.z
  add r5.xyz, r5.xyzx, r8.xyzx
  mad r0.yz, r1.zzwz, r3.zzwz, r0.yyzy
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r6.zwzz, t8.zwxy, s0, l(0.000000)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r3.zw, r7.zwzz, t10.zwxy, s0, l(0.000000)
  mov x0[3].xy, r1.zwzz
  mad r4.xy, r1.zwzz, r1.zwzz, r4.xyxx
  mul r6.yz, r3.zzwz, r3.zzwz
  mov r6.x, r3.z
  add r5.xyz, r5.xyzx, r6.xyzx
  mad r0.yz, r1.zzwz, r3.zzwz, r0.yyzy
  add r1.zw, r2.xxxy, v1.xxxy
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r1.zwzz, t10.zwxy, s0, l(0.000000)
  mov x0[4].xy, r1.xyxx
  mad r3.zw, r1.xxxy, r1.xxxy, r4.xxxy
  mul r4.yz, r1.zzwz, r1.zzwz
  mov r4.x, r1.z
  add r4.xyz, r4.xyzx, r5.xyzx
  mad r0.yz, r1.xxyx, r1.zzwz, r0.yyzy
  add r1.xyzw, v1.xyxy, l(0.000000, 0.003704, 0.002083, -0.003704)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r5.xy, r1.xyxx, t8.xyzw, s0, l(0.000000)
  add r6.xyzw, r2.xyxy, r1.xyzw
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.xy, r6.xyxx, t10.xyzw, s0, l(0.000000)
  mov x0[5].xy, r5.xyxx
  mad r3.zw, r5.xxxy, r5.xxxy, r3.zzzw
  mul r7.yz, r1.xxyx, r1.xxyx
  mov r7.x, r1.x
  add r4.xyz, r4.xyzx, r7.xyzx
  mad r0.yz, r5.xxyx, r1.xxyx, r0.yyzy
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.xy, r1.zwzz, t8.xyzw, s0, l(0.000000)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r6.zwzz, t10.zwxy, s0, l(0.000000)
  mov x0[6].xy, r1.xyxx
  mad r3.zw, r1.xxxy, r1.xxxy, r3.zzzw
  mul r5.yz, r1.zzwz, r1.zzwz
  mov r5.x, r1.z
  add r4.xyz, r4.xyzx, r5.xyzx
  mad r0.yz, r1.xxyx, r1.zzwz, r0.yyzy
  add r1.xyzw, v1.xyxy, l(0.002083, 0.000000, 0.002083, 0.003704)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r5.xy, r1.xyxx, t8.xyzw, s0, l(0.000000)
  add r6.xyzw, r2.xyxy, r1.xyzw
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.xy, r6.xyxx, t10.xyzw, s0, l(0.000000)
  mov x0[7].xy, r5.xyxx
  mad r3.zw, r5.xxxy, r5.xxxy, r3.zzzw
  mul r7.yz, r1.xxyx, r1.xxyx
  mov r7.x, r1.x
  add r4.xyz, r4.xyzx, r7.xyzx
  mad r0.yz, r5.xxyx, r1.xxyx, r0.yyzy
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.xy, r1.zwzz, t8.xyzw, s0, l(0.000000)
  sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r1.zw, r6.zwzz, t10.zwxy, s0, l(0.000000)
  mov x0[8].xy, r1.xyxx
  mad r3.zw, r1.xxxy, r1.xxxy, r3.zzzw
  mul r5.yz, r1.zzwz, r1.zzwz
  mov r5.x, r1.z
  add r4.xyz, r4.xyzx, r5.xyzx
  mad r0.yz, r1.xxyx, r1.zzwz, r0.yyzy
  mul r1.xy, r3.zwzz, l(0.111111, 0.111111, 0.000000, 0.000000)
  mov r1.z, l(0.111111)
  mul r4.xyz, r1.zzyz, r4.xyzx
  mul r0.yz, r0.yyzy, l(0.000000, 0.111111, 0.111111, 0.000000)
  mul r3.zw, r1.xxxz, r4.yyyz
  rsq r3.zw, r3.zzzw
  mul r0.yz, r0.yyzy, r3.zzwz
  min_sat r0.y, r0.z, r0.y
  mad r0.z, r4.x, r4.x, -r4.y
  ftou r3.zw, v0.xxxy
  and r4.xy, r3.zwzz, l(31, 31, 0, 0)
  mov r4.zw, l(0,0,0,0)
  ld_indexable(texture2d)(float,float,float,float) r0.w, r4.xyzw, t30.yzwx
  imul null, r0.x, r0.x, l(5)
  ishl r0.x, r0.x, l(1)
  utof r0.x, r0.x
  mad r0.x, r0.x, l(0.618034), r0.w
  frc r0.x, r0.x
  mul r0.x, r0.x, l(6.283000)
  sincos r0.x, r4.x, r0.x
  lt r0.w, r0.y, l(0.999999)
  mov r5.xy, l(0,0,0,0)
  mov r6.xy, l(0,0,0,0)
  mov r6.z, r0.x
  mov r6.w, r4.x
  mov r3.zw, r2.xxxy
  mov r4.yz, l(0,0.002083,0.003704,0)
  mov r1.w, r0.y
  mov r4.w, |r0.z|
  mov r7.x, l(0)
  mov r7.y, r0.w
  loop 
    breakc_z r7.y
    lt r7.z, r1.w, l(0.999999)
    add r8.xy, r3.zwzz, r3.xyxx
    mov r9.zw, r6.xxxy
    mov r5.zw, r6.zzzw
    mov r9.x, r1.w
    mov r9.y, r4.w
    mov r7.w, l(1)
    mov r8.z, r7.z
    loop 
      breakc_z r8.z
      dp2 r10.x, r5.zwzz, l(-0.737369, -0.675490, 0.000000, 0.000000)
      dp2 r10.y, r5.zwzz, l(0.675490, -0.737369, 0.000000, 0.000000)
      mul r11.zw, r4.yyyz, r10.xxxy
      mad r10.zw, r10.xxxy, r4.yyyz, r8.xxxy
      mov r12.xyz, l(0,0,0,0)
      mov r13.xy, l(0,0,0,0)
      mov r8.w, l(0)
      loop 
        uge r12.w, r8.w, l(9)
        breakc_nz r12.w
        udiv r14.x, r15.x, r8.w, l(3)
        utof r14.x, r14.x
        utof r14.y, r15.x
        mad r13.zw, r14.xxxy, l(0.000000, 0.000000, 0.002083, 0.003704), r10.zzzw
        sample_l_aoffimmi_indexable(2,0,0)(texture2d)(float,float,float,float) r13.zw, r13.zwzz, t10.zwxy, s0, l(0.000000)
        mul r14.yz, r13.zzwz, r13.zzwz
        mov r14.x, r13.z
        add r12.xyz, r12.xyzx, r14.xyzx
        mov r14.xy, x0[r8.w + 0].xyxx
        mad r13.xy, r13.zwzz, r14.xyxx, r13.xyxx
        iadd r8.w, r8.w, l(1)
      endloop 
      mul r14.xyz, r1.zzyz, r12.xyzx
      mul r10.zw, r13.xxxy, l(0.000000, 0.000000, 0.111111, 0.111111)
      mul r13.zw, r1.xxxz, r14.yyyz
      rsq r13.zw, r13.zzzw
      mul r10.zw, r10.zzzw, r13.zzzw
      min_sat r11.x, r10.w, r10.z
      lt r8.w, r9.x, r11.x
      mad r10.z, r14.x, r14.x, -r14.y
      mov r11.y, |r10.z|
      movc r9.xyzw, r8.wwww, r11.xyzw, r9.xyzw
      iadd r7.w, r7.w, l(1)
      ilt r8.w, r7.w, l(5)
      lt r10.z, r9.x, l(0.999999)
      and r8.z, r8.w, r10.z
      mov r5.zw, r10.xxxy
    endloop 
    mov r1.w, r9.x
    mov r4.w, r9.y
    add r3.zw, r3.zzzw, r9.zzzw
    mul r4.yz, r4.yyzy, l(0.000000, 0.500000, 0.500000, 0.000000)
    iadd r7.x, r7.x, l(1)
    ilt r7.z, r7.x, l(2)
    lt r7.w, r1.w, l(0.999999)
    and r7.y, r7.w, r7.z
    mov r6.xyzw, r5.xyzw
  endloop 
  mov o0.xy, r3.zwzz
  sqrt o0.z, r4.w
  mul r0.x, r1.w, r1.w
  mul o0.w, r0.x, r0.x
else 
  mov o0.xyzw, r2.xyzw
endif 
ret 
// Approximately 230 instruction slots used
