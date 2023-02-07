//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Strength;                    // Offset:    0 Size:     4 [unused]
//   bool Sharpen;                      // Offset:    4 Size:     4 [unused]
//   float WeightExponent;              // Offset:    8 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __V__Spatial_IIR_Bilateral__Temp0    texture  float4          2d             t2      1 
// V__Spatial_IIR_Bilateral__wTemp1        UAV  float4          2d             u1      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_resource_texture2d (float,float,float,float) t2
dcl_uav_typed_texture2d (float,float,float,float) u1
dcl_input vThreadID.xy
dcl_temps 7
dcl_thread_group 64, 1, 1
ult r0.x, vThreadID.y, l(9)
if_nz r0.x
  ishl r0.x, vThreadID.y, l(7)
  utof r1.x, vThreadID.x
  utof r1.y, r0.x
  add r0.xyz, r1.xyyx, l(0.500000, 0.500000, -31.500000, 0.000000)
  ftoi r1.xy, r0.xzxx
  mov r1.z, l(0)
  ld_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyzz, t2.xyzw
  ftoi r3.x, r0.x
  mov r3.zw, l(0,0,0,0)
  mov r0.xzw, r2.xxyz
  mov r1.y, l(-31)
  loop 
    ige r1.z, r1.y, l(128)
    breakc_nz r1.z
    itof r1.z, r1.y
    add r1.z, r0.y, r1.z
    ftoi r3.y, r1.z
    ld_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyzw, t2.xyzw
    add r5.xyz, -r0.xzwx, r4.xyzx
    add r5.xyz, -|r5.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
    log r5.xyz, |r5.xyzx|
    mul r5.xyz, r5.xyzx, cb0[0].zzzz
    exp r5.xyz, r5.xyzx
    add r6.xyz, r0.xzwx, -r4.xyzx
    mad r0.xzw, r5.xxyz, r6.xxyz, r4.xxyz
    ige r2.w, r1.y, l(0)
    if_nz r2.w
      ftoi r1.w, r1.z
      store_uav_typed u1.xyzw, r1.xwww, r0.xzwx
    endif 
    iadd r1.y, r1.y, l(1)
  endloop 
else 
  ishl r0.x, vThreadID.y, l(7)
  iadd r0.x, r0.x, l(-1024)
  utof r1.x, vThreadID.x
  utof r1.y, r0.x
  add r0.xyzw, r1.xyyx, l(0.500000, 0.500000, 32.500000, 1920.500000)
  ftoi r1.xy, r0.xzxx
  mov r1.zw, l(0,0,0,0)
  ld_indexable(texture2d)(float,float,float,float) r1.xyz, r1.xyzw, t2.xyzw
  ftoi r2.x, r0.w
  ftoi r3.x, r0.x
  mov r3.zw, l(0,0,0,0)
  mov r0.xzw, r1.xxyz
  mov r1.w, l(31)
  loop 
    ige r4.x, l(-128), r1.w
    breakc_nz r4.x
    itof r4.x, r1.w
    add r4.x, r0.y, r4.x
    ftoi r3.y, r4.x
    ld_indexable(texture2d)(float,float,float,float) r4.yzw, r3.xyzw, t2.wxyz
    add r5.xyz, -r0.xzwx, r4.yzwy
    add r5.xyz, -|r5.xyzx|, l(1.000000, 1.000000, 1.000000, 0.000000)
    log r5.xyz, |r5.xyzx|
    mul r5.xyz, r5.xyzx, cb0[0].zzzz
    exp r5.xyz, r5.xyzx
    add r6.xyz, r0.xzwx, -r4.yzwy
    mad r0.xzw, r5.xxyz, r6.xxyz, r4.yyzw
    ige r3.y, l(0), r1.w
    if_nz r3.y
      ftoi r2.yzw, r4.xxxx
      store_uav_typed u1.xyzw, r2.xyzw, r0.xzwx
    endif 
    iadd r1.w, r1.w, l(-1)
  endloop 
endif 
ret 
// Approximately 71 instruction slots used