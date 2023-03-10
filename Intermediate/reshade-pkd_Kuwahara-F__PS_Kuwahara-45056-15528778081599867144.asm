//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 CFG_KUWAHARA_RADIUS;        // Offset:    0 Size:     8
//   float CFG_KUWAHARA_LOD;            // Offset:    8 Size:     4
//   bool CFG_KUWAHARA_ROTATION;        // Offset:   12 Size:     4
//   bool CFG_KUWAHARA_DEPTHAWARE;      // Offset:   16 Size:     4
//   bool CFG_KUWAHARA_DEPTHAWARE_EXCLUDESKY;// Offset:   20 Size:     4 [unused]
//   int CFG_KUWAHARA_DEPTHAWARE_SKYBLEND_STYLE;// Offset:   24 Size:     4 [unused]
//   float CFG_KUWAHARA_DEPTHAWARE_SKYBLEND_STRENGTH;// Offset:   28 Size:     4 [unused]
//   float2 CFG_KUWAHARA_DEPTHAWARE_CURVE;// Offset:   32 Size:     8
//   float2 CFG_KUWAHARA_DEPTHAWARE_MINRADIUS;// Offset:   40 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 12
dcl_indexableTemp x0[9], 4
dcl_indexableTemp x1[9], 4
if_nz cb0[0].w
  mov x0[0].x, l(-1.000000)
  mov x0[1].x, l(-2.000000)
  mov x0[2].x, l(-1.000000)
  mov x0[3].x, l(0)
  mov x0[4].x, l(0)
  mov x0[5].x, l(0)
  mov x0[6].x, l(1.000000)
  mov x0[7].x, l(2.000000)
  mov x0[8].x, l(1.000000)
  mov x1[0].x, l(-1.000000)
  mov x1[1].x, l(0)
  mov x1[2].x, l(1.000000)
  mov x1[3].x, l(-2.000000)
  mov x1[4].x, l(0)
  mov x1[5].x, l(2.000000)
  mov x1[6].x, l(-1.000000)
  mov x1[7].x, l(0)
  mov x1[8].x, l(1.000000)
  exp r0.x, cb0[0].z
  mul r0.xy, r0.xxxx, l(0.000260, 0.000463, 0.000000, 0.000000)
  mov r1.xyz, l(0,0,0,0)
  mov r0.z, l(-1)
  loop 
    ilt r0.w, l(1), r0.z
    breakc_nz r0.w
    itof r2.x, r0.z
    mov r3.x, r1.z
    mov r3.y, l(-1)
    mov r2.zw, r1.xxxy
    loop 
      ilt r0.w, l(1), r3.y
      breakc_nz r0.w
      itof r2.y, r3.y
      mad r3.zw, r2.xxxy, r0.xxxy, v1.xxxy
      sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t0.xyzw, s0, l(0.000000)
      dp3 r0.w, r4.xyzx, l(0.300000, 0.590000, 0.110000, 0.000000)
      mov r1.w, x0[r3.x + 0].x
      mad r2.z, r0.w, r1.w, r2.z
      mov r1.w, x1[r3.x + 0].x
      mad r2.w, r0.w, r1.w, r2.w
      iadd r3.xy, r3.xyxx, l(1, 1, 0, 0)
    endloop 
    mov r1.z, r3.x
    mov r1.xy, r2.zwzz
    iadd r0.z, r0.z, l(1)
  endloop 
  div r0.x, r1.y, r1.x
  min r0.y, |r0.x|, l(1.000000)
  max r0.z, |r0.x|, l(1.000000)
  div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), r0.z
  mul r0.y, r0.z, r0.y
  mul r0.z, r0.y, r0.y
  mad r0.w, r0.z, l(0.020835), l(-0.085133)
  mad r0.w, r0.z, r0.w, l(0.180141)
  mad r0.w, r0.z, r0.w, l(-0.330299)
  mad r0.z, r0.z, r0.w, l(0.999866)
  mul r0.w, r0.z, r0.y
  lt r1.x, l(1.000000), |r0.x|
  mad r0.w, r0.w, l(-2.000000), l(1.570796)
  and r0.w, r1.x, r0.w
  mad r0.y, r0.y, r0.z, r0.w
  min r0.x, r0.x, l(1.000000)
  lt r0.x, r0.x, -r0.x
  movc r0.x, r0.x, -r0.y, r0.y
  sincos r1.x, r2.x, r0.x
  sincos r0.x, null, -r0.x
  mov r2.y, r1.x
  mov r0.y, r2.x
else 
  mov r2.xy, l(0,0,0,0)
  mov r0.xy, l(0,0,0,0)
endif 
if_nz cb0[1].x
  add r0.zw, cb0[0].xxxy, -cb0[2].zzzw
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
  add r1.y, -cb0[2].x, cb0[2].y
  add r1.x, r1.x, -cb0[2].x
  div r1.y, l(1.000000, 1.000000, 1.000000, 1.000000), r1.y
  mul_sat r1.x, r1.y, r1.x
  mad r1.y, r1.x, l(-2.000000), l(3.000000)
  mul r1.x, r1.x, r1.x
  mul r1.x, r1.x, r1.y
  mad r0.zw, r0.zzzw, r1.xxxx, cb0[2].zzzw
else 
  mov r0.zw, cb0[0].xxxy
endif 
exp r1.x, cb0[0].z
mul r1.xy, r1.xxxx, l(0.000521, 0.000926, 0.000000, 0.000000)
ftoi r1.zw, -r0.zzzw
mov r3.xyz, l(0,0,0,0)
mov r4.xyz, l(0,0,0,0)
mov r2.z, cb0[0].w
mov r2.w, l(0)
mov r3.w, r1.z
loop 
  itof r5.x, r3.w
  lt r4.w, l(0.000000), r5.x
  breakc_nz r4.w
  mov r6.xyz, r3.xyzx
  mov r7.xyz, r4.xyzx
  mov r4.w, r2.z
  mov r5.z, r2.w
  mov r5.w, r1.w
  loop 
    itof r5.y, r5.w
    lt r6.w, l(0.000000), r5.y
    breakc_nz r6.w
    mul r8.xy, r1.xyxx, r5.xyxx
    dp2 r9.x, r8.xyxx, r2.xyxx
    dp2 r9.y, r8.xyxx, r0.xyxx
    movc r8.xy, r4.wwww, r9.xyxx, r8.xyxx
    add r8.xy, r8.xyxx, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r8.xyz, r8.xyxx, t0.xyzw, s0, l(0.000000)
    add r6.xyz, r6.xyzx, r8.xyzx
    mad r7.xyz, r8.xyzx, r8.xyzx, r7.xyzx
    iadd r5.zw, r5.zzzw, l(0, 0, 1, 1)
  endloop 
  mov r3.xyz, r6.xyzx
  mov r4.xyz, r7.xyzx
  mov r2.w, r5.z
  iadd r3.w, r3.w, l(1)
endloop 
itof r2.z, r2.w
div r3.xyz, r3.xyzx, r2.zzzz
div r4.xyz, r4.xyzx, r2.zzzz
mad r4.xyz, -r3.xyzx, r3.xyzx, r4.xyzx
add r2.z, r4.y, r4.x
add r3.w, r4.z, r2.z
mov r5.xyz, l(0,0,0,0)
mov r2.z, cb0[0].w
mov r2.w, l(0)
mov r4.xyzw, l(0,0,0,0)
loop 
  itof r6.x, r4.w
  lt r5.w, r0.z, r6.x
  breakc_nz r5.w
  mov r7.xyz, r4.xyzx
  mov r8.xyz, r5.xyzx
  mov r5.w, r2.z
  mov r6.z, r2.w
  mov r6.w, r1.w
  loop 
    itof r6.y, r6.w
    lt r7.w, l(0.000000), r6.y
    breakc_nz r7.w
    mul r9.xy, r1.xyxx, r6.xyxx
    dp2 r10.x, r9.xyxx, r2.xyxx
    dp2 r10.y, r9.xyxx, r0.xyxx
    movc r9.xy, r5.wwww, r10.xyxx, r9.xyxx
    add r9.xy, r9.xyxx, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r9.xyz, r9.xyxx, t0.xyzw, s0, l(0.000000)
    add r7.xyz, r7.xyzx, r9.xyzx
    mad r8.xyz, r9.xyzx, r9.xyzx, r8.xyzx
    iadd r6.zw, r6.zzzw, l(0, 0, 1, 1)
  endloop 
  mov r4.xyz, r7.xyzx
  mov r5.xyz, r8.xyzx
  mov r2.w, r6.z
  iadd r4.w, r4.w, l(1)
endloop 
itof r1.w, r2.w
div r4.xyz, r4.xyzx, r1.wwww
div r5.xyz, r5.xyzx, r1.wwww
mad r5.xyz, -r4.xyzx, r4.xyzx, r5.xyzx
add r1.w, r5.y, r5.x
add r4.w, r5.z, r1.w
mov r5.xyz, l(0,0,0,0)
mov r6.xyz, l(0,0,0,0)
mov r1.w, cb0[0].w
mov r2.z, l(0)
mov r2.w, r1.z
loop 
  itof r7.x, r2.w
  lt r5.w, l(0.000000), r7.x
  breakc_nz r5.w
  mov r8.xyz, r5.xyzx
  mov r9.xyz, r6.xyzx
  mov r5.w, r1.w
  mov r6.w, r2.z
  mov r7.z, l(0)
  loop 
    itof r7.y, r7.z
    lt r7.w, r0.w, r7.y
    breakc_nz r7.w
    mul r7.yw, r1.xxxy, r7.xxxy
    dp2 r10.x, r7.ywyy, r2.xyxx
    dp2 r10.y, r7.ywyy, r0.xyxx
    movc r7.yw, r5.wwww, r10.xxxy, r7.yyyw
    add r7.yw, r7.yyyw, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r10.xyz, r7.ywyy, t0.xyzw, s0, l(0.000000)
    add r8.xyz, r8.xyzx, r10.xyzx
    mad r9.xyz, r10.xyzx, r10.xyzx, r9.xyzx
    iadd r6.w, r6.w, l(1)
    iadd r7.z, r7.z, l(1)
  endloop 
  mov r5.xyz, r8.xyzx
  mov r6.xyz, r9.xyzx
  mov r2.z, r6.w
  iadd r2.w, r2.w, l(1)
endloop 
itof r1.z, r2.z
div r5.xyz, r5.xyzx, r1.zzzz
div r6.xyz, r6.xyzx, r1.zzzz
mad r6.xyz, -r5.xyzx, r5.xyzx, r6.xyzx
add r1.z, r6.y, r6.x
add r5.w, r6.z, r1.z
mov r6.xyz, l(0,0,0,0)
mov r7.xyz, l(0,0,0,0)
mov r1.z, cb0[0].w
mov r1.w, l(0)
mov r2.z, l(0)
loop 
  itof r8.x, r2.z
  lt r2.w, r0.z, r8.x
  breakc_nz r2.w
  mov r9.xyz, r6.xyzx
  mov r10.xyz, r7.xyzx
  mov r2.w, r1.z
  mov r6.w, r1.w
  mov r7.w, l(0)
  loop 
    itof r8.y, r7.w
    lt r8.z, r0.w, r8.y
    breakc_nz r8.z
    mul r8.yz, r1.xxyx, r8.xxyx
    dp2 r11.x, r8.yzyy, r2.xyxx
    dp2 r11.y, r8.yzyy, r0.xyxx
    movc r8.yz, r2.wwww, r11.xxyx, r8.yyzy
    add r8.yz, r8.yyzy, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r8.yzw, r8.yzyy, t0.wxyz, s0, l(0.000000)
    add r9.xyz, r8.yzwy, r9.xyzx
    mad r10.xyz, r8.yzwy, r8.yzwy, r10.xyzx
    iadd r6.w, r6.w, l(1)
    iadd r7.w, r7.w, l(1)
  endloop 
  mov r6.xyz, r9.xyzx
  mov r7.xyz, r10.xyzx
  mov r1.w, r6.w
  iadd r2.z, r2.z, l(1)
endloop 
itof r0.x, r1.w
div r0.yzw, r6.xxyz, r0.xxxx
div r1.xyz, r7.xyzx, r0.xxxx
mad r1.xyz, -r0.yzwy, r0.yzwy, r1.xyzx
add r0.x, r1.y, r1.x
add r0.x, r1.z, r0.x
lt r1.x, r4.w, r3.w
movc r1.xyzw, r1.xxxx, r4.xyzw, r3.xyzw
lt r2.x, r5.w, r1.w
movc r1.xyzw, r2.xxxx, r5.xyzw, r1.xyzw
lt r0.x, r0.x, r1.w
movc o0.xyz, r0.xxxx, r0.yzwy, r1.xyzx
ret 
// Approximately 256 instruction slots used
