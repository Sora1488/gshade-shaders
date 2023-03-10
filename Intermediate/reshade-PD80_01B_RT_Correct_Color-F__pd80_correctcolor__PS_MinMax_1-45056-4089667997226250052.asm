//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__pd80_correctcolor__texColor    texture  float4          2d            t10      1 
// __V__pd80_correctcolor__texPrevious    texture  float4          2d            t20      1 
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
// SV_TARGET                1   xyzw        1   TARGET   float   xyzw
// SV_TARGET                2   xyzw        2   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t20
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.xyzw
dcl_output o2.xyzw
dcl_temps 11
mul r0.xy, v1.xyxx, l(0.166667, 1.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t20.xyzw, s2
add r1.xyzw, v1.yxyx, l(-0.015625, -0.015625, 0.015625, 0.015625)
mul r1.xyzw, r1.xyzw, l(1080.000000, 1920.000000, 1080.000000, 1920.000000)
mad r2.xy, v1.xyxx, l(0.166667, 1.000000, 0.000000, 0.000000), l(0.666667, 0.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t20.xyzw, s2
dp3 r0.x, r0.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
dp3 r0.y, r2.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
dp2 r0.x, r0.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
round_ni r1.xyzw, r1.xyzw
lt r0.yz, r1.xxyx, r1.zzwz
lt r2.xy, r1.xyxx, l(1080.000000, 1920.000000, 0.000000, 0.000000)
ftoi r1.xy, r1.xyxx
and r0.yz, r0.yyzy, r2.xxyx
mov r2.zw, l(0,0,0,0)
mov r3.xyz, l(0,0,0,0)
mov r4.xyz, l(1.000000,1.000000,1.000000,0)
mov r5.xyz, l(0,0,0,0)
mov r2.y, r1.x
mov r0.w, r0.y
loop 
  breakc_z r0.w
  mov r6.xyz, r3.xyzx
  mov r7.xyz, r4.xyzx
  mov r8.xyz, r5.xyzx
  mov r2.x, r1.y
  mov r3.w, r0.z
  loop 
    breakc_z r3.w
    ld_indexable(texture2d)(float,float,float,float) r9.xyz, r2.xyzw, t10.xyzw
    max r4.w, r9.y, r9.x
    max r4.w, r9.z, r4.w
    dp3 r5.w, r9.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r4.w, r4.w, r5.w
    max r5.w, r7.y, r7.x
    max r5.w, r7.z, r5.w
    dp3 r6.w, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r5.w, r5.w, r6.w
    ge r4.w, r5.w, r4.w
    movc r7.xyz, r4.wwww, r9.xyzx, r7.xyzx
    add r10.xyz, -r0.xxxx, r9.xyzx
    dp3 r4.w, |r10.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r10.xyz, -r0.xxxx, r6.xyzx
    dp3 r5.w, |r10.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r4.w, r5.w, r4.w
    movc r6.xyz, r4.wwww, r9.xyzx, r6.xyzx
    max r8.xyz, r8.xyzx, r9.xyzx
    iadd r2.x, r2.x, l(1)
    itof r4.w, r2.x
    lt r5.w, r4.w, r1.w
    lt r4.w, r4.w, l(1920.000000)
    and r3.w, r4.w, r5.w
  endloop 
  mov r3.xyz, r6.xyzx
  mov r4.xyz, r7.xyzx
  mov r5.xyz, r8.xyzx
  iadd r2.y, r2.y, l(1)
  itof r2.x, r2.y
  lt r3.w, r2.x, r1.z
  lt r2.x, r2.x, l(1080.000000)
  and r0.w, r2.x, r3.w
endloop 
mov o2.xyz, r3.xyzx
mov o0.xyz, r4.xyzx
mov o1.xyz, r5.xyzx
mov o0.w, l(1.000000)
mov o1.w, l(1.000000)
mov o2.w, l(1.000000)
ret 
// Approximately 69 instruction slots used
