//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 pp;                         // Offset:    0 Size:     8 [unused]
//   int debug_mode;                    // Offset:    8 Size:     4 [unused]
//   bool enable_fade;                  // Offset:   12 Size:     4
//   bool freeze;                       // Offset:   16 Size:     4
//   float transition_speed;            // Offset:   20 Size:     4
//   bool enable_dither;                // Offset:   24 Size:     4 [unused]
//   float dither_strength;             // Offset:   28 Size:     4 [unused]
//   bool rt_enable_whitepoint_correction;// Offset:   32 Size:     4 [unused]
//   bool rt_whitepoint_respect_luma;   // Offset:   36 Size:     4 [unused]
//   int rt_whitepoint_method;          // Offset:   40 Size:     4
//   float rt_wp_str;                   // Offset:   44 Size:     4 [unused]
//   float rt_wp_rl_str;                // Offset:   48 Size:     4 [unused]
//   bool rt_enable_blackpoint_correction;// Offset:   52 Size:     4 [unused]
//   bool rt_blackpoint_respect_luma;   // Offset:   56 Size:     4 [unused]
//   int rt_blackpoint_method;          // Offset:   60 Size:     4
//   float rt_bp_str;                   // Offset:   64 Size:     4 [unused]
//   float rt_bp_rl_str;                // Offset:   68 Size:     4 [unused]
//   bool rt_enable_midpoint_correction;// Offset:   72 Size:     4 [unused]
//   bool rt_midpoint_respect_luma;     // Offset:   76 Size:     4 [unused]
//   bool mid_use_alt_method;           // Offset:   80 Size:     4 [unused]
//   float midCC_scale;                 // Offset:   84 Size:     4 [unused]
//   float frametime;                   // Offset:   88 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__pd80_correctcolor__texDS_1_Max    texture  float4          2d            t12      1 
// __V__pd80_correctcolor__texDS_1_Min    texture  float4          2d            t14      1 
// __V__pd80_correctcolor__texDS_1_Mid    texture  float4          2d            t16      1 
// __V__pd80_correctcolor__texPrevious    texture  float4          2d            t20      1 
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
dcl_constantbuffer CB0[6], immediateIndexed
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t12
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t20
dcl_input_ps_siv linear noperspective v0.x, position
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 12
mov r0.zw, l(0,0,0,0)
mov r2.xyz, l(1.000000,1.000000,1.000000,0)
mov r3.xyz, l(1.000000,1.000000,1.000000,0)
mov r4.xyz, l(0,0,0,0)
mov r5.xyz, l(0,0,0,0)
mov r1.xyzw, l(0,0,0,0)
mov r0.y, l(0)
loop 
  ige r2.w, r0.y, l(32)
  breakc_nz r2.w
  mov r6.xyz, r1.xyzx
  mov r7.xyz, r2.xyzx
  mov r8.xyz, r3.xyzx
  mov r9.xyz, r4.xyzx
  mov r10.xyz, r5.xyzx
  mov r2.w, r1.w
  mov r0.x, l(0)
  loop 
    ige r3.w, r0.x, l(32)
    breakc_nz r3.w
    ld_indexable(texture2d)(float,float,float,float) r11.xyz, r0.xyww, t14.xyzw
    min r7.xyz, r7.xyzx, r11.xyzx
    max r3.w, r11.y, r11.x
    max r3.w, r11.z, r3.w
    dp3 r4.w, r11.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r3.w, r3.w, r4.w
    max r4.w, r8.y, r8.x
    max r4.w, r8.z, r4.w
    dp3 r5.w, r8.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r4.w, r4.w, r5.w
    ge r3.w, r4.w, r3.w
    movc r8.xyz, r3.wwww, r11.xyzx, r8.xyzx
    ld_indexable(texture2d)(float,float,float,float) r11.xyz, r0.xyww, t16.xyzw
    add r6.xyz, r6.xyzx, r11.xyzx
    add r2.w, r2.w, l(1.000000)
    ld_indexable(texture2d)(float,float,float,float) r11.xyz, r0.xyzw, t12.xyzw
    max r9.xyz, r9.xyzx, r11.xyzx
    dp3 r3.w, r11.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    dp3 r4.w, r10.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r3.w, r3.w, r4.w
    movc r10.xyz, r3.wwww, r11.xyzx, r10.xyzx
    iadd r0.x, r0.x, l(1)
  endloop 
  mov r1.xyz, r6.xyzx
  mov r2.xyz, r7.xyzx
  mov r3.xyz, r8.xyzx
  mov r4.xyz, r9.xyzx
  mov r5.xyz, r10.xyzx
  mov r1.w, r2.w
  iadd r0.y, r0.y, l(1)
endloop 
movc r0.xyz, cb0[3].wwww, r3.xyzx, r2.xyzx
mad r0.w, cb0[1].y, l(4.000000), l(1.000000)
mul r2.x, cb0[5].z, l(0.001000)
mul r0.w, -r0.w, r2.x
mul r0.w, r0.w, l(1.442695)
exp r0.w, r0.w
add r0.w, -r0.w, l(1.000000)
lt r2.x, v0.x, l(2.000000)
if_nz r2.x
  mul r2.xy, v1.xyxx, l(0.166667, 1.000000, 0.000000, 0.000000)
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t20.xyzw, s2
  add r3.xyz, r0.xyzx, -r2.xyzx
  mad r3.xyz, r0.wwww, r3.xyzx, r2.xyzx
  movc r3.xyz, cb0[0].wwww, r3.xyzx, r0.xyzx
  movc o0.xyz, cb0[1].xxxx, r2.xyzx, r3.xyzx
  mov o0.w, l(1.000000)
  ret 
else 
  lt r2.x, v0.x, l(4.000000)
  if_nz r2.x
    div r1.xyz, r1.xyzx, r1.wwww
    mad r2.xy, v1.xyxx, l(0.166667, 1.000000, 0.000000, 0.000000), l(0.333333, 0.000000, 0.000000, 0.000000)
    sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t20.xyzw, s2
    add r3.xyz, r1.xyzx, -r2.xyzx
    mad r3.xyz, r0.wwww, r3.xyzx, r2.xyzx
    movc r1.xyz, cb0[0].wwww, r3.xyzx, r1.xyzx
    movc o0.xyz, cb0[1].xxxx, r2.xyzx, r1.xyzx
    mov o0.w, l(1.000000)
    ret 
  else 
    movc r1.xyz, cb0[2].zzzz, r5.xyzx, r4.xyzx
    ge r0.xyz, r0.xyzx, r1.xyzx
    movc r0.xyz, r0.xyzx, l(1.000000,1.000000,1.000000,0), r1.xyzx
    mad r1.xy, v1.xyxx, l(0.166667, 1.000000, 0.000000, 0.000000), l(0.666667, 0.000000, 0.000000, 0.000000)
    sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.xyxx, t20.xyzw, s2
    add r2.xyz, r0.xyzx, -r1.xyzx
    mad r2.xyz, r0.wwww, r2.xyzx, r1.xyzx
    movc r0.xyz, cb0[0].wwww, r2.xyzx, r0.xyzx
    movc o0.xyz, cb0[1].xxxx, r1.xyzx, r0.xyzx
    mov o0.w, l(1.000000)
    ret 
  endif 
endif 
ret 
// Approximately 95 instruction slots used
