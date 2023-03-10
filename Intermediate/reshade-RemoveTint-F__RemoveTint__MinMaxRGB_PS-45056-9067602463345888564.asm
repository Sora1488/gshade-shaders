//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float frametime;                   // Offset:    0 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __V__RemoveTint__texBackBuffer    texture  float4          2d             t4      1 
// __V__RemoveTint__texMinRGBLastFrame    texture  float4          2d            t10      1 
// __V__RemoveTint__texMaxRGBLastFrame    texture  float4          2d            t12      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
// SV_TARGET                1   xyzw        1   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[1], immediateIndexed
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_output o0.xyzw
dcl_output o1.xyzw
dcl_temps 6
mov r0.zw, l(0,0,0,0)
mov r1.xyz, l(1.000000,1.000000,1.000000,0)
mov r2.xyz, l(0,0,0,0)
mov r0.y, l(0)
loop 
  ige r1.w, r0.y, l(67)
  breakc_nz r1.w
  mov r1.w, r1.x
  mov r2.w, r1.y
  mov r3.x, r1.z
  mov r3.yzw, r2.xxyz
  mov r0.x, l(0)
  loop 
    ige r4.x, r0.x, l(120)
    breakc_nz r4.x
    ld_indexable(texture2d)(float,float,float,float) r4.xyz, r0.xyzw, t4.xyzw
    ge r4.w, r4.x, r3.y
    and r4.w, r4.w, l(0x3f800000)
    add r5.x, -r3.y, r4.x
    mad r3.y, r4.w, r5.x, r3.y
    ge r4.w, r4.y, r3.z
    and r4.w, r4.w, l(0x3f800000)
    add r5.x, -r3.z, r4.y
    mad r3.z, r4.w, r5.x, r3.z
    ge r4.w, r4.z, r3.w
    and r4.w, r4.w, l(0x3f800000)
    add r5.x, -r3.w, r4.z
    mad r3.w, r4.w, r5.x, r3.w
    ge r4.w, r1.w, r4.x
    and r4.w, r4.w, l(0x3f800000)
    add r4.x, -r1.w, r4.x
    mad r1.w, r4.w, r4.x, r1.w
    ge r4.x, r2.w, r4.y
    and r4.x, r4.x, l(0x3f800000)
    add r4.y, -r2.w, r4.y
    mad r2.w, r4.x, r4.y, r2.w
    ge r4.x, r3.x, r4.z
    and r4.x, r4.x, l(0x3f800000)
    add r4.y, -r3.x, r4.z
    mad r3.x, r4.x, r4.y, r3.x
    iadd r0.x, r0.x, l(1)
  endloop 
  mov r1.x, r1.w
  mov r1.y, r2.w
  mov r1.z, r3.x
  mov r2.xyz, r3.yzwy
  iadd r0.y, r0.y, l(1)
endloop 
ld_indexable(texture2d)(float,float,float,float) r0.xyz, l(0, 0, 0, 0), t10.xyzw
ld_indexable(texture2d)(float,float,float,float) r3.xyz, l(0, 0, 0, 0), t12.xyzw
mul_sat r0.w, cb0[0].x, l(0.001000)
add r1.xyz, -r0.xyzx, r1.xyzx
mad_sat o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
add r0.xyz, r2.xyzx, -r3.xyzx
mad_sat o1.xyz, r0.wwww, r0.xyzx, r3.xyzx
mov o0.w, l(1.000000)
mov o1.w, l(1.000000)
ret 
// Approximately 58 instruction slots used
