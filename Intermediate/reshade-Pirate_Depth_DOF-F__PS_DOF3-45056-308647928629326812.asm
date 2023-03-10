//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__TexFocus                     texture  float4          2d            t10      1 
// __V__TexDOF2                      texture  float4          2d            t14      1 
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
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 10
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t14.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t10.xyzw, s0
ne r1.y, r1.x, l(0.000000)
if_nz r1.y
  ge r1.y, r1.x, l(0.001042)
  if_nz r1.y
    dp3 r1.y, r0.xyzx, l(0.210000, 0.720000, 0.070000, 0.000000)
    mul r1.y, r1.x, r1.y
    mul r2.xyz, r0.xyzx, r1.yyyy
    mul r1.xz, r1.xxxx, l(-0.000521, 0.000000, 0.001075, 0.000000)
    mov r3.xyz, r2.xyzx
    mov r4.xyz, r0.xyzx
    mov r1.w, r1.y
    mov r4.w, r1.y
    mov r2.w, l(1)
    loop 
      ilt r3.w, l(4), r2.w
      breakc_nz r3.w
      itof r3.w, r2.w
      mad r5.xy, r1.xzxx, r3.wwww, v1.xyxx
      sample_l_indexable(texture2d)(float,float,float,float) r6.xyz, r5.xyxx, t14.xyzw, s0, l(0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r5.x, r5.xyxx, t10.xyzw, s0, l(0.000000)
      dp3 r5.y, r6.xyzx, l(0.210000, 0.720000, 0.070000, 0.000000)
      mul r6.w, r5.y, r5.x
      lt r5.z, r4.w, r6.w
      and r5.z, r5.z, l(0x3f800000)
      mul r5.z, r6.w, r5.z
      add r7.xyzw, -r4.xyzw, r6.xyzw
      mad r7.xyzw, r5.zzzz, r7.xyzw, r4.xyzw
      mad r6.xyz, r6.xyzx, r6.wwww, r3.xyzx
      mad r5.x, r5.x, r5.y, r1.w
      mad r5.yz, -r1.xxzx, r3.wwww, v1.xxyx
      sample_l_indexable(texture2d)(float,float,float,float) r8.xyz, r5.yzyy, t14.xyzw, s0, l(0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r3.w, r5.yzyy, t10.yzwx, s0, l(0.000000)
      dp3 r5.y, r8.xyzx, l(0.210000, 0.720000, 0.070000, 0.000000)
      mul r8.w, r3.w, r5.y
      lt r5.z, r7.w, r8.w
      and r5.z, r5.z, l(0x3f800000)
      mul r5.z, r8.w, r5.z
      add r9.xyzw, -r7.xyzw, r8.xyzw
      mad r4.xyzw, r5.zzzz, r9.xyzw, r7.xyzw
      mad r3.xyz, r8.xyzx, r8.wwww, r6.xyzx
      mad r1.w, r3.w, r5.y, r5.x
      iadd r2.w, r2.w, l(1)
    endloop 
    div r1.xyz, r3.xyzx, r1.wwww
    mov_sat r4.w, r4.w
    add r2.xyz, -r1.xyzx, r4.xyzx
    mad r1.xyz, r4.wwww, r2.xyzx, r1.xyzx
    dp3 r1.w, r1.xyzx, l(0.210000, 0.720000, 0.070000, 0.000000)
    div r1.xyz, r1.xyzx, r1.wwww
    log r1.w, |r1.w|
    mul r1.w, r1.w, l(1.004000)
    exp r1.w, r1.w
    mul o0.xyz, r1.wwww, r1.xyzx
    mov o0.w, l(1.000000)
  else 
    mov o0.xyzw, r0.xyzw
  endif 
else 
  mov o0.xyzw, r0.xyzw
endif 
ret 
// Approximately 63 instruction slots used
