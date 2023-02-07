//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool enable_fade;                  // Offset:    0 Size:     4
//   bool freeze;                       // Offset:    4 Size:     4
//   float transition_speed;            // Offset:    8 Size:     4
//   bool rt_enable_whitepoint_correction;// Offset:   12 Size:     4 [unused]
//   float rt_wp_str;                   // Offset:   16 Size:     4 [unused]
//   bool rt_enable_blackpoint_correction;// Offset:   20 Size:     4 [unused]
//   float rt_bp_str;                   // Offset:   24 Size:     4 [unused]
//   float frametime;                   // Offset:   28 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__pd80_correctcontrast__texDS_1_Max    texture  float4          2d             t4      1 
// __V__pd80_correctcontrast__texDS_1_Min    texture  float4          2d             t6      1 
// __V__pd80_correctcontrast__texPrevious    texture  float4          2d             t8      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   x   
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps_siv linear noperspective v0.x, position
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
mov r0.zw, l(0,0,0,0)
mov r1.xyz, l(1.000000,1.000000,1.000000,0)
mov r2.xyz, l(0,0,0,0)
mov r0.y, l(0)
loop 
  uge r1.w, r0.y, l(32)
  breakc_nz r1.w
  mov r3.xyz, r1.xyzx
  mov r4.xyz, r2.xyzx
  mov r0.x, l(0)
  loop 
    uge r1.w, r0.x, l(32)
    breakc_nz r1.w
    ld_indexable(texture2d)(float,float,float,float) r5.xyz, r0.xyww, t6.xyzw
    min r3.xyz, r3.xyzx, r5.xyzx
    ld_indexable(texture2d)(float,float,float,float) r5.xyz, r0.xyzw, t4.xyzw
    max r4.xyz, r4.xyzx, r5.xyzx
    iadd r0.x, r0.x, l(1)
  endloop 
  mov r1.xyz, r3.xyzx
  mov r2.xyz, r4.xyzx
  iadd r0.y, r0.y, l(1)
endloop 
mad r0.x, cb0[0].z, l(4.000000), l(0.500000)
mul r0.y, cb0[1].w, l(0.001000)
mul r0.x, r0.y, -r0.x
mul r0.x, r0.x, l(1.442695)
exp r0.x, r0.x
add r0.x, -r0.x, l(1.000000)
lt r0.y, v0.x, l(2.000000)
if_nz r0.y
  mul r0.yz, v1.xxyx, l(0.000000, 0.250000, 1.000000, 0.000000)
  sample_indexable(texture2d)(float,float,float,float) r0.yzw, r0.yzyy, t8.wxyz, s1
  add r3.xyz, -r0.yzwy, r1.xyzx
  mad r3.xyz, r0.xxxx, r3.xyzx, r0.yzwy
  movc r1.xyz, cb0[0].xxxx, r3.xyzx, r1.xyzx
  movc o0.xyz, cb0[0].yyyy, r0.yzwy, r1.xyzx
  mov o0.w, l(1.000000)
  ret 
else 
  mad r0.yz, v1.xxyx, l(0.000000, 0.250000, 1.000000, 0.000000), l(0.000000, 0.500000, 0.000000, 0.000000)
  sample_indexable(texture2d)(float,float,float,float) r0.yzw, r0.yzyy, t8.wxyz, s1
  add r1.xyz, -r0.yzwy, r2.xyzx
  mad r1.xyz, r0.xxxx, r1.xyzx, r0.yzwy
  movc r1.xyz, cb0[0].xxxx, r1.xyzx, r2.xyzx
  movc o0.xyz, cb0[0].yyyy, r0.yzwy, r1.xyzx
  mov o0.w, l(1.000000)
  ret 
endif 
ret 
// Approximately 50 instruction slots used
