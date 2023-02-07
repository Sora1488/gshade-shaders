//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s2                              sampler      NA          NA             s2      1 
// __V__edgesTex                     texture  float4          2d             t6      1 
// __V__areaTex                      texture  float4          2d            t10      1 
// __V__searchTex                    texture  float4          2d            t12      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 1     zw        1     NONE   float     zw
// TEXCOORD                 2   xyzw        2     NONE   float   xyzw
// TEXCOORD                 3   xyzw        3     NONE   float   xyzw
// TEXCOORD                 4   xyzw        4     NONE   float   xyzw
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
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.zw
dcl_input_ps linear v2.xyzw
dcl_input_ps linear v3.xyzw
dcl_input_ps linear v4.xyzw
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xy, v1.xyxx, t6.xyzw, s0
lt r0.y, l(0.000000), r0.y
if_nz r0.y
  lt r0.y, l(0.000000), r0.x
  if_nz r0.y
    mov r1.xy, v1.xyxx
    mov r1.z, l(-1.000000)
    mov r2.x, l(1.000000)
    mov r0.yw, l(0,0,0,-1)
    loop 
      breakc_z r0.w
      add r1.xyz, r1.xyzx, l(-0.000521, 0.000926, 1.000000, 0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r0.yz, r1.xyxx, t6.zyxw, s0, r1.y
      dp2 r2.x, r0.zyzz, l(0.500000, 0.500000, 0.000000, 0.000000)
      lt r0.z, r1.z, l(19.000000)
      lt r1.w, l(0.900000), r2.x
      and r0.w, r0.z, r1.w
    endloop 
    lt r0.y, l(0.900000), r0.y
    and r0.y, r0.y, l(0x3f800000)
    add r1.x, r0.y, r1.z
  else 
    mov r1.x, l(0)
    mov r2.x, l(0)
  endif 
  mov r3.xy, v1.xyxx
  mov r3.z, l(-1.000000)
  mov r2.y, l(1.000000)
  mov r0.y, l(-1)
  loop 
    breakc_z r0.y
    add r3.xyz, r3.xyzx, l(0.000521, -0.000926, 1.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r0.zw, r3.xyxx, t6.zwxy, s0, r3.y
    dp2 r2.y, r0.zwzz, l(0.500000, 0.500000, 0.000000, 0.000000)
    lt r0.z, r3.z, l(19.000000)
    lt r0.w, l(0.900000), r2.y
    and r0.y, r0.w, r0.z
  endloop 
  add r0.y, r1.x, r3.z
  lt r0.y, l(2.000000), r0.y
  if_nz r0.y
    add r1.y, -r1.x, l(0.250000)
    mad r1.zw, r3.zzzz, l(0.000000, 0.000000, 1.000000, -1.000000), l(0.000000, 0.000000, 0.000000, -0.250000)
    mad r3.xyzw, r1.yxzw, l(0.000521, 0.000926, 0.000521, 0.000926), v1.xyxy
    sample_l_aoffimmi_indexable(-1,0,0)(texture2d)(float,float,float,float) r0.yz, r3.xyxx, t6.wxyz, s0, r3.y
    sample_l_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r1.yw, r3.zwzz, t6.zxwy, s0, r3.w
    mov r0.w, r1.y
    mad r2.zw, r0.yyyw, l(0.000000, 0.000000, 5.000000, 5.000000), l(0.000000, 0.000000, -3.750000, -3.750000)
    mul r0.yw, r0.yyyw, |r2.zzzw|
    round_ne r0.yw, r0.yyyw
    round_ne r3.y, r0.z
    round_ne r3.w, r1.w
    mad r0.yz, r3.yywy, l(0.000000, 2.000000, 2.000000, 0.000000), r0.yywy
    ge r1.yw, r2.xxxy, l(0.000000, 0.900000, 0.000000, 0.900000)
    movc r0.yz, r1.yywy, l(0,0,0,0), r0.yyzy
    mad r0.yz, r0.yyzy, l(0.000000, 20.000000, 20.000000, 0.000000), r1.xxzx
    mad r0.yz, r0.yyzy, l(0.000000, 0.006250, 0.001786, 0.000000), l(0.000000, 0.503125, 0.000893, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r0.yz, r0.yzyy, t10.zxyw, s0, r0.z
  else 
    mov r0.yz, l(0,0,0,0)
  endif 
  add r0.w, v1.x, l(0.000130)
  mov r1.x, r0.w
  mov r1.y, v1.y
  mov r2.x, l(1.000000)
  mov r1.zw, l(0,0,-1.000000,-1)
  loop 
    breakc_z r1.w
    add r1.xyz, r1.xyzx, l(-0.000521, -0.000926, 1.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r2.zw, r1.xyxx, t6.zwxy, s0, r1.y
    mad r3.x, r2.z, l(5.000000), l(-3.750000)
    mul r2.z, r2.z, |r3.x|
    round_ne r3.xy, r2.zwzz
    dp2 r2.x, r3.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
    lt r2.z, r1.z, l(19.000000)
    lt r2.w, l(0.900000), r2.x
    and r1.w, r2.w, r2.z
  endloop 
  sample_l_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r1.y, v1.xyxx, t6.yxzw, s0, v1.y
  lt r1.y, l(0.000000), r1.y
  if_nz r1.y
    mov r3.x, r0.w
    mov r3.y, v1.y
    mov r1.y, l(0)
    mov r3.z, l(-1.000000)
    mov r2.yz, l(0,1.000000,-1,0)
    loop 
      breakc_z r2.z
      add r3.xyz, r3.xyzx, l(0.000521, 0.000926, 1.000000, 0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r4.xy, r3.xyxx, t6.xyzw, s0, r3.y
      mad r2.w, r4.x, l(5.000000), l(-3.750000)
      mul r2.w, |r2.w|, r4.x
      round_ne r1.w, r2.w
      round_ne r1.y, r4.y
      dp2 r2.y, r1.wyww, l(0.500000, 0.500000, 0.000000, 0.000000)
      lt r1.w, r3.z, l(19.000000)
      lt r2.w, l(0.900000), r2.y
      and r2.z, r1.w, r2.w
    endloop 
    lt r0.w, l(0.900000), r1.y
    and r0.w, r0.w, l(0x3f800000)
    add r1.x, r0.w, r3.z
  else 
    mov r1.x, l(0)
    mov r2.y, l(0)
  endif 
  add r0.w, r1.x, r1.z
  lt r0.w, l(2.000000), r0.w
  if_nz r0.w
    mad r3.xyzw, r1.zzxx, l(-0.000521, -0.000926, 0.000521, 0.000926), v1.xyxy
    sample_l_aoffimmi_indexable(-1,0,0)(texture2d)(float,float,float,float) r4.x, r3.xyxx, t6.yxzw, s0, r3.y
    sample_l_aoffimmi_indexable(0,-1,0)(texture2d)(float,float,float,float) r4.z, r3.xyxx, t6.yzxw, s0, r3.y
    sample_l_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r4.yw, r3.zwzz, t6.zywx, s0, r3.w
    mad r1.yw, r4.xxxy, l(0.000000, 2.000000, 0.000000, 2.000000), r4.zzzw
    ge r2.xy, r2.xyxx, l(0.900000, 0.900000, 0.000000, 0.000000)
    movc r1.yw, r2.xxxy, l(0,0,0,0), r1.yyyw
    mad r1.xy, r1.ywyy, l(20.000000, 20.000000, 0.000000, 0.000000), r1.zxzz
    mad r1.xy, r1.xyxx, l(0.006250, 0.001786, 0.000000, 0.000000), l(0.503125, 0.000893, 0.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r1.xy, r1.xyxx, t10.xyzw, s0, r1.y
    add r0.yz, r0.yyzy, r1.yyxy
  endif 
  eq r0.w, -r0.z, r0.y
  if_nz r0.w
    lt r0.w, v4.x, v2.x
    mov r1.xy, l(0,1.000000,0,0)
    mov r2.xy, v2.xyxx
    mov r1.z, r0.w
    loop 
      breakc_z r1.z
      sample_l_indexable(texture2d)(float,float,float,float) r1.xy, r2.xyxx, t6.xyzw, s0, r2.y
      add r2.xy, r2.xyxx, l(-0.001042, -0.000000, 0.000000, 0.000000)
      lt r1.w, v4.x, r2.x
      lt r2.z, l(0.828100), r1.y
      and r1.w, r1.w, r2.z
      eq r2.z, r1.x, l(0.000000)
      and r1.z, r1.w, r2.z
    endloop 
    mad r1.xy, r1.xyxx, l(0.500000, -2.000000, 0.000000, 0.000000), l(0.007812, 2.031250, 0.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.xyxx, t12.yzwx, s2, r1.y
    mad r0.w, r0.w, l(-2.007874), l(3.250000)
    mad r1.x, r0.w, l(0.000521), r2.x
    mov r1.y, v3.y
    sample_l_indexable(texture2d)(float,float,float,float) r2.x, r1.xyxx, t6.xyzw, s0, v3.y
    lt r0.w, v2.z, v4.y
    mov r2.zw, l(0,0,0,1.000000)
    mov r3.xy, v2.zwzz
    mov r1.w, r0.w
    loop 
      breakc_z r1.w
      sample_l_indexable(texture2d)(float,float,float,float) r2.zw, r3.xyxx, t6.zwxy, s0, r3.y
      add r3.xy, r3.xyxx, l(0.001042, 0.000000, 0.000000, 0.000000)
      lt r3.z, r3.x, v4.y
      lt r3.w, l(0.828100), r2.w
      and r3.z, r3.w, r3.z
      eq r3.w, r2.z, l(0.000000)
      and r1.w, r3.w, r3.z
    endloop 
    mad r2.zw, r2.zzzw, l(0.000000, 0.000000, 0.500000, -2.000000), l(0.000000, 0.000000, 0.523438, 2.031250)
    sample_l_indexable(texture2d)(float,float,float,float) r0.w, r2.zwzz, t12.yzwx, s2, r2.w
    mad r0.w, r0.w, l(-2.007874), l(3.250000)
    mad r1.z, r0.w, l(-0.000521), r3.x
    mad r1.xw, r1.xxxz, l(1920.000000, 0.000000, 0.000000, 1920.000000), -v1.zzzz
    round_ne r1.xw, r1.xxxw
    sqrt r1.xw, |r1.xxxw|
    sample_l_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r2.y, r1.zyzz, t6.yxzw, s0, v3.y
    mul r1.yz, r2.xxyx, l(0.000000, 4.000000, 4.000000, 0.000000)
    round_ne r1.yz, r1.yyzy
    mad r1.xy, r1.yzyy, l(16.000000, 16.000000, 0.000000, 0.000000), r1.xwxx
    mad r1.xy, r1.xyxx, l(0.006250, 0.001786, 0.000000, 0.000000), l(0.003125, 0.000893, 0.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r1.xy, r1.xyxx, t10.xyzw, s0, r1.y
    mov o0.xy, r1.xyxx
  else 
    mov o0.xy, r0.yzyy
    mov r0.x, l(0)
  endif 
else 
  mov o0.xy, l(0,0,0,0)
endif 
lt r0.x, l(0.000000), r0.x
if_nz r0.x
  lt r0.x, v4.z, v3.y
  mov r0.yz, l(0,0,1.000000,0)
  mov r1.xy, v3.xyxx
  mov r0.w, r0.x
  loop 
    breakc_z r0.w
    sample_l_indexable(texture2d)(float,float,float,float) r0.yz, r1.xyxx, t6.zyxw, s0, r1.y
    add r1.xy, r1.xyxx, l(-0.000000, -0.001852, 0.000000, 0.000000)
    lt r1.z, v4.z, r1.y
    lt r1.w, l(0.828100), r0.z
    and r1.z, r1.w, r1.z
    eq r1.w, r0.y, l(0.000000)
    and r0.w, r1.w, r1.z
  endloop 
  mad r0.xy, r0.yzyy, l(0.500000, -2.000000, 0.000000, 0.000000), l(0.007812, 2.031250, 0.000000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t12.xyzw, s2, r0.y
  mad r0.x, r0.x, l(-2.007874), l(3.250000)
  mad r0.x, r0.x, l(0.000926), r1.y
  mov r0.y, v2.x
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, r0.yxyy, t6.yxzw, s0, r0.x
  lt r0.w, v3.w, v4.w
  mov r1.zw, l(0,0,0,1.000000)
  mov r2.xy, v3.zwzz
  mov r2.z, r0.w
  loop 
    breakc_z r2.z
    sample_l_indexable(texture2d)(float,float,float,float) r1.zw, r2.xyxx, t6.zwyx, s0, r2.y
    add r2.xy, r2.xyxx, l(0.000000, 0.001852, 0.000000, 0.000000)
    lt r2.w, r2.y, v4.w
    lt r3.x, l(0.828100), r1.w
    and r2.w, r2.w, r3.x
    eq r3.x, r1.z, l(0.000000)
    and r2.z, r2.w, r3.x
  endloop 
  mad r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.500000, -2.000000), l(0.000000, 0.000000, 0.523438, 2.031250)
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t12.yzwx, s2, r1.w
  mad r0.w, r0.w, l(-2.007874), l(3.250000)
  mad r0.z, r0.w, l(-0.000926), r2.y
  mad r0.xw, r0.xxxz, l(1080.000000, 0.000000, 0.000000, 1080.000000), -v1.wwww
  round_ne r0.xw, r0.xxxw
  sqrt r0.xw, |r0.xxxw|
  sample_l_aoffimmi_indexable(0,1,0)(texture2d)(float,float,float,float) r1.y, r0.yzyy, t6.xyzw, s0, r0.z
  mul r0.yz, r1.xxyx, l(0.000000, 4.000000, 4.000000, 0.000000)
  round_ne r0.yz, r0.yyzy
  mad r0.xy, r0.yzyy, l(16.000000, 16.000000, 0.000000, 0.000000), r0.xwxx
  mad r0.xy, r0.xyxx, l(0.006250, 0.001786, 0.000000, 0.000000), l(0.003125, 0.000893, 0.000000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r0.xy, r0.xyxx, t10.xyzw, s0, r0.y
  mov o0.zw, r0.xxxy
else 
  mov o0.zw, l(0,0,0,0)
endif 
ret 
// Approximately 232 instruction slots used
