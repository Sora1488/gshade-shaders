//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __V__Bessel_Bloom__Blur0          texture  float4          2d             t2      1 
// V__Bessel_Bloom__wBlur1               UAV  float4          2d             u1      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Input
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// no Output
cs_5_0
dcl_globalFlags refactoringAllowed
dcl_resource_texture2d (float,float,float,float) t2
dcl_uav_typed_texture2d (float,float,float,float) u1
dcl_input vThreadID.xy
dcl_temps 7
dcl_indexableTemp x0[3], 4
dcl_indexableTemp x1[3], 4
dcl_thread_group 1, 64, 1
ishl r0.x, vThreadID.x, l(8)
iadd r0.x, r0.x, l(256)
utof r0.x, r0.x
utof r0.y, vThreadID.y
add r1.xyzw, r0.xyxy, l(0.500000, 0.500000, 256.500000, 0.500000)
min r0.xz, r1.zzwz, l(1919.000000, 0.000000, 1079.000000, 0.000000)
ftoi r2.xy, r0.xzxx
mov r2.zw, l(0,0,0,0)
ld_indexable(texture2d)(float,float,float,float) r2.xyzw, r2.xyzw, t2.xyzw
mul r0.x, r2.w, l(3.000000)
exp r0.x, -r0.x
mul r0.xzw, r0.xxxx, r2.xxyz
mov x1[0].x, r0.x
mov x1[1].xy, r0.zzzz
mov x1[2].xy, r0.wwww
mov x1[0].y, r0.x
mov x0[0].xy, r0.xxxx
mov x0[1].xy, r0.zzzz
mov x0[2].xy, r0.wwww
ftoi r2.yzw, r1.yyyy
add r0.y, r0.y, l(0.500000)
mov r3.zw, l(0,0,0,0)
mov r0.z, l(255)
loop 
  ige r0.w, l(-256), r0.z
  breakc_nz r0.w
  itof r0.w, r0.z
  add r0.x, r0.w, r1.x
  max r1.yz, r0.xxyx, l(0.000000, 0.000000, 0.000000, 0.000000)
  min r1.yz, r1.yyzy, l(0.000000, 1919.000000, 1079.000000, 0.000000)
  ftoi r3.xy, r1.yzyy
  ld_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.xyzw, t2.xyzw
  mul r0.w, r4.w, l(3.000000)
  exp r0.w, -r0.w
  mul r4.xyz, r0.wwww, r4.zxyz
  mov r4.w, x0[0].x
  mov r5.z, x0[0].y
  mov x0[0].xy, r4.ywyy
  mov r5.xy, r4.ywyy
  dp3 r0.w, r5.xzyx, l(0.000179, 0.000179, 0.000358, 0.000000)
  mov r1.yz, x1[0].xxyx
  dp2 r1.y, r1.yzyy, l(1.953491, -0.954207, 0.000000, 0.000000)
  add r5.x, r0.w, r1.y
  mov r5.y, x1[0].x
  mov x1[0].xy, r5.xyxx
  mov r6.y, x0[1].x
  mov r6.z, x0[1].y
  mov r6.x, r4.z
  mov x0[1].xy, r6.xyxx
  dp3 r0.w, r6.xzyx, l(0.000179, 0.000179, 0.000358, 0.000000)
  mov r1.yz, x1[1].xxyx
  dp2 r1.y, r1.yzyy, l(1.953491, -0.954207, 0.000000, 0.000000)
  add r3.x, r0.w, r1.y
  mov r3.y, x1[1].x
  mov x1[1].xy, r3.xyxx
  mov r4.y, x0[2].x
  mov r4.z, x0[2].y
  mov x0[2].xy, r4.xyxx
  dp3 r0.w, r4.xzyx, l(0.000179, 0.000179, 0.000358, 0.000000)
  mov r1.yz, x1[2].xxyx
  dp2 r1.y, r1.yzyy, l(1.953491, -0.954207, 0.000000, 0.000000)
  add r4.x, r0.w, r1.y
  mov r4.y, x1[2].x
  mov x1[2].xy, r4.xyxx
  ige r0.w, l(0), r0.z
  if_nz r0.w
    ftoi r2.x, r0.x
    rcp r0.x, r5.x
    rcp r0.w, r3.x
    rcp r1.y, r4.x
    min r0.x, r0.w, r0.x
    min r0.x, r1.y, r0.x
    lt r0.x, l(8.000000), r0.x
    and r6.w, r0.x, l(0x3f800000)
    movc r0.x, r0.x, l(8.000000), l(1.000000)
    mov r5.z, r3.x
    mov r5.w, r4.x
    mul r6.xyz, r0.xxxx, r5.xzwx
    store_uav_typed u1.xyzw, r2.xyzw, r6.xyzw
  endif 
  iadd r0.z, r0.z, l(-1)
endloop 
ret 
// Approximately 83 instruction slots used
