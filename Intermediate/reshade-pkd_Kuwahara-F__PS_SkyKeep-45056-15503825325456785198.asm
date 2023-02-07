//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 CFG_KUWAHARA_RADIUS;        // Offset:    0 Size:     8 [unused]
//   float CFG_KUWAHARA_LOD;            // Offset:    8 Size:     4
//   bool CFG_KUWAHARA_ROTATION;        // Offset:   12 Size:     4
//   bool CFG_KUWAHARA_DEPTHAWARE;      // Offset:   16 Size:     4 [unused]
//   bool CFG_KUWAHARA_DEPTHAWARE_EXCLUDESKY;// Offset:   20 Size:     4
//   int CFG_KUWAHARA_DEPTHAWARE_SKYBLEND_STYLE;// Offset:   24 Size:     4 [unused]
//   float CFG_KUWAHARA_DEPTHAWARE_SKYBLEND_STRENGTH;// Offset:   28 Size:     4 [unused]
//   float2 CFG_KUWAHARA_DEPTHAWARE_CURVE;// Offset:   32 Size:     8 [unused]
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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 12
dcl_indexableTemp x0[9], 4
dcl_indexableTemp x1[9], 4
if_z cb0[1].y
  mov o0.xyzw, l(0,0,0,0)
  ret 
endif 
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
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
ge r0.z, l(0.990000), r0.z
if_nz r0.z
  mov o0.xyzw, l(0,0,0,0)
  ret 
endif 
exp r0.z, cb0[0].z
mul r0.zw, r0.zzzz, l(0.000000, 0.000000, 0.000521, 0.000926)
ftoi r1.xy, -cb0[2].zwzz
mov r3.xyz, l(0,0,0,0)
mov r4.xyz, l(0,0,0,0)
mov r1.z, cb0[0].w
mov r1.w, l(0)
mov r2.z, r1.x
loop 
  itof r5.x, r2.z
  lt r2.w, l(0.000000), r5.x
  breakc_nz r2.w
  mov r6.xyz, r3.xyzx
  mov r7.xyz, r4.xyzx
  mov r2.w, r1.z
  mov r3.w, r1.w
  mov r4.w, r1.y
  loop 
    itof r5.y, r4.w
    lt r5.z, l(0.000000), r5.y
    breakc_nz r5.z
    mul r5.yz, r0.zzwz, r5.xxyx
    dp2 r8.x, r5.yzyy, r2.xyxx
    dp2 r8.y, r5.yzyy, r0.xyxx
    movc r5.yz, r2.wwww, r8.xxyx, r5.yyzy
    add r5.yz, r5.yyzy, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r5.yzw, r5.yzyy, t0.wxyz, s0, l(0.000000)
    add r6.xyz, r5.yzwy, r6.xyzx
    mad r7.xyz, r5.yzwy, r5.yzwy, r7.xyzx
    iadd r3.w, r3.w, l(1)
    iadd r4.w, r4.w, l(1)
  endloop 
  mov r3.xyz, r6.xyzx
  mov r4.xyz, r7.xyzx
  mov r1.w, r3.w
  iadd r2.z, r2.z, l(1)
endloop 
itof r1.z, r1.w
div r3.xyz, r3.xyzx, r1.zzzz
div r4.xyz, r4.xyzx, r1.zzzz
mad r4.xyz, -r3.xyzx, r3.xyzx, r4.xyzx
add r1.z, r4.y, r4.x
add r3.w, r4.z, r1.z
mov r4.xyz, l(0,0,0,0)
mov r5.xyz, l(0,0,0,0)
mov r1.z, cb0[0].w
mov r1.w, l(0)
mov r2.z, l(0)
loop 
  itof r6.x, r2.z
  lt r2.w, cb0[2].z, r6.x
  breakc_nz r2.w
  mov r7.xyz, r4.xyzx
  mov r8.xyz, r5.xyzx
  mov r2.w, r1.z
  mov r4.w, r1.w
  mov r5.w, r1.y
  loop 
    itof r6.y, r5.w
    lt r6.z, l(0.000000), r6.y
    breakc_nz r6.z
    mul r6.yz, r0.zzwz, r6.xxyx
    dp2 r9.x, r6.yzyy, r2.xyxx
    dp2 r9.y, r6.yzyy, r0.xyxx
    movc r6.yz, r2.wwww, r9.xxyx, r6.yyzy
    add r6.yz, r6.yyzy, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r6.yzw, r6.yzyy, t0.wxyz, s0, l(0.000000)
    add r7.xyz, r6.yzwy, r7.xyzx
    mad r8.xyz, r6.yzwy, r6.yzwy, r8.xyzx
    iadd r4.w, r4.w, l(1)
    iadd r5.w, r5.w, l(1)
  endloop 
  mov r4.xyz, r7.xyzx
  mov r5.xyz, r8.xyzx
  mov r1.w, r4.w
  iadd r2.z, r2.z, l(1)
endloop 
itof r1.y, r1.w
div r4.xyz, r4.xyzx, r1.yyyy
div r1.yzw, r5.xxyz, r1.yyyy
mad r1.yzw, -r4.xxyz, r4.xxyz, r1.yyzw
add r1.y, r1.z, r1.y
add r4.w, r1.w, r1.y
mov r1.yzw, l(0,0,0,0)
mov r5.xyz, l(0,0,0,0)
mov r2.z, cb0[0].w
mov r2.w, l(0)
mov r5.w, r1.x
loop 
  itof r6.x, r5.w
  lt r6.z, l(0.000000), r6.x
  breakc_nz r6.z
  mov r7.xyz, r1.yzwy
  mov r8.xyz, r5.xyzx
  mov r6.zw, r2.zzzw
  mov r7.w, l(0)
  loop 
    itof r6.y, r7.w
    lt r8.w, cb0[2].w, r6.y
    breakc_nz r8.w
    mul r9.xy, r0.zwzz, r6.xyxx
    dp2 r10.x, r9.xyxx, r2.xyxx
    dp2 r10.y, r9.xyxx, r0.xyxx
    movc r9.xy, r6.zzzz, r10.xyxx, r9.xyxx
    add r9.xy, r9.xyxx, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r9.xyz, r9.xyxx, t0.xyzw, s0, l(0.000000)
    add r7.xyz, r7.xyzx, r9.xyzx
    mad r8.xyz, r9.xyzx, r9.xyzx, r8.xyzx
    iadd r6.w, r6.w, l(1)
    iadd r7.w, r7.w, l(1)
  endloop 
  mov r1.yzw, r7.xxyz
  mov r5.xyz, r8.xyzx
  mov r2.w, r6.w
  iadd r5.w, r5.w, l(1)
endloop 
itof r1.x, r2.w
div r6.xyz, r1.yzwy, r1.xxxx
div r1.xyz, r5.xyzx, r1.xxxx
mad r1.xyz, -r6.xyzx, r6.xyzx, r1.xyzx
add r1.x, r1.y, r1.x
add r6.w, r1.z, r1.x
mov r1.xyz, l(0,0,0,0)
mov r5.xyz, l(0,0,0,0)
mov r1.w, cb0[0].w
mov r2.zw, l(0,0,0,0)
loop 
  itof r7.x, r2.w
  lt r5.w, cb0[2].z, r7.x
  breakc_nz r5.w
  mov r8.xyz, r1.xyzx
  mov r9.xyz, r5.xyzx
  mov r5.w, r1.w
  mov r7.z, r2.z
  mov r7.w, l(0)
  loop 
    itof r7.y, r7.w
    lt r8.w, cb0[2].w, r7.y
    breakc_nz r8.w
    mul r10.xy, r0.zwzz, r7.xyxx
    dp2 r11.x, r10.xyxx, r2.xyxx
    dp2 r11.y, r10.xyxx, r0.xyxx
    movc r10.xy, r5.wwww, r11.xyxx, r10.xyxx
    add r10.xy, r10.xyxx, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r10.xyz, r10.xyxx, t0.xyzw, s0, l(0.000000)
    add r8.xyz, r8.xyzx, r10.xyzx
    mad r9.xyz, r10.xyzx, r10.xyzx, r9.xyzx
    iadd r7.zw, r7.zzzw, l(0, 0, 1, 1)
  endloop 
  mov r1.xyz, r8.xyzx
  mov r5.xyz, r9.xyzx
  mov r2.z, r7.z
  iadd r2.w, r2.w, l(1)
endloop 
itof r0.x, r2.z
div r0.yzw, r1.xxyz, r0.xxxx
div r1.xyz, r5.xyzx, r0.xxxx
mad r1.xyz, -r0.yzwy, r0.yzwy, r1.xyzx
add r0.x, r1.y, r1.x
add r0.x, r1.z, r0.x
lt r1.x, r4.w, r3.w
movc r1.xyzw, r1.xxxx, r4.xyzw, r3.xyzw
lt r2.x, r6.w, r1.w
movc r1.xyzw, r2.xxxx, r6.xyzw, r1.xyzw
lt r0.x, r0.x, r1.w
movc o0.xyz, r0.xxxx, r0.yzwy, r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 253 instruction slots used
