//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __s2                              sampler      NA          NA             s2      1 
// __V__CinematicDOF__texCDCoC       texture  float4          2d             t8      1 
// __V__CinematicDOF__texCDBuffer1    texture  float4          2d            t20      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 1     z         1     NONE   float     z 
// TEXCOORD                 2      w        1     NONE   float      w
// TEXCOORD                 3   x           2     NONE   float       
// TEXCOORD                 4    y          2     NONE   float       
// TEXCOORD                 5     z         2     NONE   float       
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
dcl_sampler s1, mode_default
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t20
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.z
dcl_input_ps linear v1.w
dcl_output o0.xyzw
dcl_temps 10
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t20.xyzw, s1, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t8.xyzw, s2, l(0.000000)
lt r1.y, r1.x, l(0.000000)
ge r1.z, l(0.000000), v1.w
or r1.y, r1.z, r1.y
if_z r1.y
  mul r1.yzw, r0.xxyz, r1.xxxx
  mul r1.yzw, r1.yyzw, l(0.000000, 0.500000, 0.500000, 0.500000)
  mul r2.x, r1.x, v1.w
  mul r2.xy, r2.xxxx, l(0.000521, 0.000926, 0.000000, 0.000000)
  div r2.xy, r2.xyxx, v1.zzzz
  div r1.x, r1.x, v1.z
  add r2.zw, v1.xxxy, l(0.000000, 0.000000, -0.500000, -0.500000)
  dp2 r3.x, r2.zwzz, r2.zwzz
  rsq r3.x, r3.x
  mul r2.zw, r2.zzzw, r3.xxxx
  max r2.w, r2.w, l(-0.500000)
  min r2.w, r2.w, l(0.500000)
  min r3.x, |r2.z|, |r2.w|
  max r3.y, |r2.z|, |r2.w|
  div r3.y, l(1.000000, 1.000000, 1.000000, 1.000000), r3.y
  mul r3.x, r3.y, r3.x
  mul r3.y, r3.x, r3.x
  mad r3.z, r3.y, l(0.020835), l(-0.085133)
  mad r3.z, r3.y, r3.z, l(0.180141)
  mad r3.z, r3.y, r3.z, l(-0.330299)
  mad r3.y, r3.y, r3.z, l(0.999866)
  mul r3.z, r3.y, r3.x
  lt r3.w, |r2.z|, |r2.w|
  mad r3.z, r3.z, l(-2.000000), l(1.570796)
  and r3.z, r3.w, r3.z
  mad r3.x, r3.x, r3.y, r3.z
  lt r3.y, r2.z, -r2.z
  and r3.y, r3.y, l(0xc0490fdb)
  add r3.x, r3.y, r3.x
  min r3.y, r2.z, r2.w
  max r2.z, r2.z, r2.w
  lt r2.w, r3.y, -r3.y
  ge r2.z, r2.z, -r2.z
  and r2.z, r2.z, r2.w
  movc r2.z, r2.z, -r3.x, r3.x
  add r2.z, r2.z, l(-3.141593)
  sincos r3.x, r4.x, r2.z
  mov r5.x, -r3.x
  mov r5.y, r4.x
  mov r5.z, r3.x
  mov r3.xyz, r1.yzwy
  mov r2.zw, r2.xxxy
  mov r3.w, l(0.500000)
  mov r4.xy, l(7.000000,0,0,0)
  loop 
    ge r4.z, r4.y, v1.z
    breakc_nz r4.z
    div r4.z, l(6.283185), r4.x
    div r4.w, r4.y, v1.z
    add r5.w, -r4.w, l(1.000000)
    mad r4.w, r5.w, l(0.500000), r4.w
    mov r6.xyz, r3.xyzx
    mov r5.w, r3.w
    mov r6.w, r4.z
    mov r7.x, l(0)
    loop 
      ge r7.y, r7.x, r4.x
      breakc_nz r7.y
      sincos r8.x, r9.x, r6.w
      mov r9.y, r8.x
      dp2 r8.x, r9.yxyy, r5.xyxx
      dp2 r8.y, r9.yxyy, r5.yzyy
      mad r7.yz, r8.xxyx, r2.zzwz, v1.xxyx
      sample_l_indexable(texture2d)(float,float,float,float) r7.w, r7.yzyy, t8.yzwx, s2, l(0.000000)
      ge r8.x, r7.w, l(0.000000)
      and r8.x, r8.x, l(0x3f800000)
      mul r8.x, r4.w, r8.x
      mad r7.w, -r1.x, r4.y, r7.w
      add_sat r7.w, r7.w, l(0.500000)
      mul r8.y, r7.w, r8.x
      sample_l_indexable(texture2d)(float,float,float,float) r9.xyz, r7.yzyy, t20.xyzw, s1, l(0.000000)
      mad r6.xyz, r9.xyzx, r8.yyyy, r6.xyzx
      mad r5.w, r8.x, r7.w, r5.w
      add r6.w, r4.z, r6.w
      add r7.x, r7.x, l(1.000000)
    endloop 
    mov r3.xyz, r6.xyzx
    mov r3.w, r5.w
    add r2.zw, r2.xxxy, r2.zzzw
    add r4.xy, r4.xyxx, l(7.000000, 1.000000, 0.000000, 0.000000)
  endloop 
  eq r1.x, r3.w, l(0.000000)
  and r1.x, r1.x, l(0x3f800000)
  add r1.x, r1.x, r3.w
  div r0.xyz, r3.xyzx, r1.xxxx
endif 
mov o0.xyzw, r0.xyzw
ret 
// Approximately 94 instruction slots used