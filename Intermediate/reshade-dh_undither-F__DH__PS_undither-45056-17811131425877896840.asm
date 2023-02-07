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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 9
sample_l_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0, l(0.000000)
min r0.w, r0.z, r0.y
min r0.w, r0.w, r0.x
max r1.x, r0.z, r0.y
max r1.x, r0.x, r1.x
add r1.y, r0.w, r1.x
add r0.w, -r0.w, r1.x
ne r1.z, r0.w, l(0.000000)
add r2.xyz, -r0.zxyz, r1.xxxx
div r2.xyz, r2.xyzx, r0.wwww
add r2.xyz, -r2.zxyz, r2.xyzx
add r2.xyz, r2.xyzx, l(6.000000, 2.000000, 4.000000, 0.000000)
ge r0.xyz, r0.xyzx, r1.xxxx
and r0.xyz, r0.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
mul r0.xyz, r2.xyzx, r0.xyzx
max r0.x, r0.x, r0.z
max r0.x, r0.x, r0.y
mul r0.x, r0.x, l(0.166667)
add r0.z, r1.y, l(-1.000000)
add r0.z, -|r0.z|, l(1.000000)
div r0.y, r0.w, r0.z
and r0.xy, r0.xyxx, r1.zzzz
add_sat r2.xyzw, v1.xyxy, l(-0.001563, -0.002778, 0.001563, 0.002778)
add r0.z, r0.x, l(1.000000)
mov r1.xzw, l(0,0,0,0)
mov r3.x, r2.x
mov r0.w, l(0)
loop 
  lt r3.z, r2.z, r3.x
  breakc_nz r3.z
  mov r4.xyz, r1.xzwx
  mov r3.z, r2.y
  mov r3.w, r0.w
  loop 
    lt r4.w, r2.w, r3.z
    breakc_nz r4.w
    mov r3.y, r3.z
    add r5.xy, r3.xyxx, -v1.xyxx
    mul r5.xy, r5.xyxx, l(1919.999878, 1080.000000, 0.000000, 0.000000)
    round_z r5.xy, r5.xyxx
    dp2 r4.w, r5.xyxx, r5.xyxx
    lt r5.x, l(9.000000), r4.w
    if_nz r5.x
      add r5.x, r3.z, l(0.000926)
      mov r3.z, r5.x
      continue 
    endif 
    sample_l_indexable(texture2d)(float,float,float,float) r5.xyz, r3.xyxx, t0.xyzw, s0, l(0.000000)
    min r3.y, r5.z, r5.y
    min r3.y, r3.y, r5.x
    max r5.w, r5.z, r5.y
    max r5.w, r5.w, r5.x
    add r6.x, r3.y, r5.w
    add r3.y, -r3.y, r5.w
    ne r6.y, r3.y, l(0.000000)
    add r7.xyz, -r5.zxyz, r5.wwww
    div r7.xyz, r7.xyzx, r3.yyyy
    add r7.xyz, -r7.zxyz, r7.xyzx
    add r7.xyz, r7.xyzx, l(6.000000, 2.000000, 4.000000, 0.000000)
    ge r8.xyz, r5.xyzx, r5.wwww
    and r8.xyz, r8.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mul r7.xyz, r7.xyzx, r8.xyzx
    max r5.w, r7.x, r7.z
    max r5.w, r5.w, r7.y
    mul r7.x, r5.w, l(0.166667)
    add r5.w, r6.x, l(-1.000000)
    add r5.w, -|r5.w|, l(1.000000)
    div r7.y, r3.y, r5.w
    and r6.yz, r6.yyyy, r7.xxyx
    add r3.y, r0.y, -r6.z
    lt r5.w, l(0.350000), |r3.y|
    if_nz r5.w
      add r5.w, r3.z, l(0.000926)
      mov r3.z, r5.w
      continue 
    endif 
    mul r5.w, r6.x, l(0.500000)
    mad r5.w, r1.y, l(0.500000), -r5.w
    lt r6.x, l(0.200000), |r5.w|
    if_nz r6.x
      add r6.x, r3.z, l(0.000926)
      mov r3.z, r6.x
      continue 
    endif 
    ne r6.x, r0.x, r6.y
    add r6.z, -r0.x, r6.y
    add r6.y, r0.z, -r6.y
    min r6.y, r6.y, r6.z
    add r6.y, r6.y, r6.y
    and r6.x, r6.y, r6.x
    lt r6.y, l(0.200000), r6.x
    if_nz r6.y
      add r6.y, r3.z, l(0.000926)
      mov r3.z, r6.y
      continue 
    endif 
    add r6.x, -r6.x, l(1.000000)
    add r3.y, -|r3.y|, r6.x
    add r3.y, r3.y, l(1.000000)
    add r3.y, -|r5.w|, r3.y
    add r3.y, r3.y, l(1.000000)
    add r4.w, -r4.w, l(10.000000)
    mad r3.y, r4.w, l(0.100000), r3.y
    add r3.w, r3.y, r3.w
    mad r4.xyz, r3.yyyy, r5.xyzx, r4.xyzx
    add r3.z, r3.z, l(0.000926)
  endloop 
  mov r1.xzw, r4.xxyz
  mov r0.w, r3.w
  add r3.x, r3.x, l(0.000521)
endloop 
div o0.xyz, r1.xzwx, r0.wwww
mov o0.w, l(1.000000)
ret 
// Approximately 114 instruction slots used