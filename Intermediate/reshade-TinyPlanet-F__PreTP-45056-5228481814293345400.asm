//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float center_x;                    // Offset:    0 Size:     4 [unused]
//   float center_y;                    // Offset:    4 Size:     4 [unused]
//   float2 offset;                     // Offset:    8 Size:     8 [unused]
//   float scale;                       // Offset:   16 Size:     4 [unused]
//   float z_rotation;                  // Offset:   20 Size:     4 [unused]
//   float seam_scale;                  // Offset:   24 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__texColorBuffer               texture  float4          2d             t4      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
add r0.xy, -cb0[1].zzzz, l(1.000000, 1.000000, 0.000000, 0.000000)
add r0.w, r0.x, -v1.x
mul_sat r0.w, r0.w, l(10.000000)
add r0.w, -r0.w, l(1.000000)
mov r0.z, l(0)
add r0.yz, r0.yyzy, v1.xxyx
lt r0.x, v1.x, r0.x
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.yzyy, t4.xyzw, s1
mov r2.x, cb0[1].z
mov r2.y, l(1.000000)
mul r0.yz, r2.xxyx, v1.xxyx
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.yzyy, t4.xyzw, s1
add r3.xyz, -r1.xyzx, r2.xyzx
mad r0.yzw, r0.wwww, r3.xxyz, r1.xxyz
movc r0.xyz, r0.xxxx, r0.yzwy, r2.xyzx
mov o0.w, r2.w
add r1.xyz, -r0.xyzx, r1.xyzx
add r0.w, v1.x, -cb0[1].z
mul_sat r0.w, r0.w, l(10.000000)
mad r1.xyz, r0.wwww, r1.xyzx, r0.xyzx
lt r0.w, cb0[1].z, v1.x
movc o0.xyz, r0.wwww, r1.xyzx, r0.xyzx
ret 
// Approximately 23 instruction slots used
