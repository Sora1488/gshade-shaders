//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float center_x;                    // Offset:    0 Size:     4
//   float center_y;                    // Offset:    4 Size:     4
//   float2 offset;                     // Offset:    8 Size:     8
//   float scale;                       // Offset:   16 Size:     4
//   float z_rotation;                  // Offset:   20 Size:     4
//   float seam_scale;                  // Offset:   24 Size:     4 [unused]
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
dcl_temps 9
mov r0.z, l(0.562500)
mov r1.w, cb0[1].x
add r2.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
add r0.xy, r2.xyxx, -cb0[0].zwzz
mul r1.z, r0.y, cb0[1].x
mul r1.xy, r0.xzxx, r1.wzww
mul r0.xy, r1.xzxx, l(2.000000, 1.125000, 0.000000, 0.000000)
dp2 r1.x, r1.xyxx, r1.xyxx
add r0.zw, r1.xxxx, l(0.000000, 0.000000, -1.000000, 1.000000)
div r0.xyz, r0.xyzx, r0.wwww
mul r1.xy, cb0[0].xyxx, l(0.017453, 0.017453, 0.000000, 0.000000)
sincos r1.x, r2.x, r1.x
sincos r3.x, r4.x, r1.y
mul r0.w, r2.x, r3.x
mul r1.y, cb0[1].y, l(0.017453)
sincos r5.x, r6.x, r1.y
mul r1.y, r0.w, r6.x
mul r0.w, r0.w, r5.x
mad r7.y, r1.x, r6.x, r0.w
mad r7.x, r1.x, r5.x, -r1.y
mul r7.z, r2.x, r4.x
dp3 r7.z, r0.xyzx, r7.xyzx
mul r0.w, r1.x, r3.x
mul r1.y, r6.x, r0.w
mul r0.w, r5.x, r0.w
mad r8.y, r2.x, r6.x, -r0.w
mad r8.x, r2.x, r5.x, r1.y
mul r8.z, -r1.x, r4.x
dp3 r7.y, r0.xyzx, r8.xyzx
mul r1.x, r4.x, r6.x
mul r1.y, -r4.x, r5.x
mov r1.z, r3.x
dp3 r7.x, r0.xyzx, r1.xyzx
dp3 r0.x, r7.xyzx, r7.xyzx
sqrt r0.x, r0.x
div r0.x, r7.z, r0.x
mad r0.y, |r0.x|, l(-0.018729), l(0.074261)
mad r0.y, r0.y, |r0.x|, l(-0.212114)
mad r0.y, r0.y, |r0.x|, l(1.570729)
add r0.z, -|r0.x|, l(1.000000)
lt r0.x, r0.x, -r0.x
sqrt r0.z, r0.z
mul r0.w, r0.z, r0.y
mad r0.w, r0.w, l(-2.000000), l(3.141593)
and r0.x, r0.x, r0.w
mad r0.y, r0.y, r0.z, r0.x
max r0.z, |r7.x|, |r7.y|
div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), r0.z
min r0.w, |r7.x|, |r7.y|
mul r0.z, r0.z, r0.w
mul r0.w, r0.z, r0.z
mad r1.x, r0.w, l(0.020835), l(-0.085133)
mad r1.x, r0.w, r1.x, l(0.180141)
mad r1.x, r0.w, r1.x, l(-0.330299)
mad r0.w, r0.w, r1.x, l(0.999866)
mul r1.x, r0.w, r0.z
mad r1.x, r1.x, l(-2.000000), l(1.570796)
lt r1.y, |r7.x|, |r7.y|
and r1.x, r1.y, r1.x
mad r0.z, r0.z, r0.w, r1.x
lt r0.w, r7.x, -r7.x
and r0.w, r0.w, l(0xc0490fdb)
add r0.z, r0.w, r0.z
min r0.w, r7.x, r7.y
max r1.x, r7.x, r7.y
ge r1.x, r1.x, -r1.x
lt r0.w, r0.w, -r0.w
and r0.w, r1.x, r0.w
movc r0.x, r0.w, -r0.z, r0.z
mul r0.xy, r0.xyxx, l(0.159155, 0.318310, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, r0.xyxx, t4.xyzw, s1
ret 
// Approximately 72 instruction slots used
