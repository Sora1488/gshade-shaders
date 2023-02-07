//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float radius;                      // Offset:    0 Size:     4
//   float magnitude;                   // Offset:    4 Size:     4
//   float tension;                     // Offset:    8 Size:     4
//   float2 coordinates;                // Offset:   16 Size:     8
//   bool use_mouse_point;              // Offset:   24 Size:     4
//   bool use_offset_coords;            // Offset:   28 Size:     4
//   float2 offset_coords;              // Offset:   32 Size:     8
//   float2 depth_bounds;               // Offset:   40 Size:     8
//   float min_depth;                   // Offset:   48 Size:     4
//   float aspect_ratio;                // Offset:   52 Size:     4
//   int animate;                       // Offset:   56 Size:     4
//   int render_type;                   // Offset:   60 Size:     4
//   float blending_amount;             // Offset:   64 Size:     4
//   float anim_rate;                   // Offset:   68 Size:     4
//   float2 mouse_coordinates;          // Offset:   72 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
dcl_constantbuffer CB0[5], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
mad r0.x, cb0[3].y, l(0.004375), l(0.562500)
mul r0.yz, cb0[1].xxyx, l(0.000000, 0.500000, 0.500000, 0.000000)
mul r1.xyz, cb0[4].zwyz, l(0.000260, 0.000463, 0.000873, 0.000000)
movc r2.yz, cb0[1].zzzz, r1.xxyx, r0.yyzy
add r3.yz, -r2.yyzy, v1.xxyx
sample_indexable(texture2d)(float,float,float,float) r4.xyzw, v1.xyxx, t4.xyzw, s1
sample_l_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
div r2.x, r2.y, r0.x
div r3.x, r3.y, r0.x
add r0.zw, -r2.xxxz, r3.xxxz
dp2 r1.x, r0.zwzz, r0.zwzz
sqrt r1.x, r1.x
ieq r1.y, cb0[3].z, l(1)
sincos r1.z, null, r1.z
mul r1.z, r1.z, cb0[0].y
movc r1.y, r1.y, r1.z, cb0[0].y
add r1.z, -r1.x, cb0[0].x
mad r1.z, cb0[0].z, r1.z, r1.x
div r1.w, r1.x, r1.z
lt r2.y, l(0.000000), r1.y
div r2.w, r1.z, r1.x
div r2.w, l(1.000000, 1.000000, 1.000000, 1.000000), r2.w
mul_sat r2.w, r1.w, r2.w
mad r3.x, r2.w, l(-2.000000), l(3.000000)
mul r2.w, r2.w, r2.w
mul r3.y, r1.y, l(0.750000)
mad r2.w, r3.x, r2.w, l(-1.000000)
mad r2.w, r3.y, r2.w, l(1.000000)
mul r3.xy, r0.zwzz, r2.wwww
mad r1.y, r1.y, l(0.750000), l(1.000000)
log r2.w, |r1.w|
mul r1.y, r1.y, r2.w
exp r1.y, r1.y
mul r1.y, r1.z, r1.y
div r1.y, r1.y, r1.x
add r1.w, -r1.w, l(1.000000)
add r1.y, r1.y, l(-1.000000)
mad r1.y, r1.w, r1.y, l(1.000000)
mul r0.zw, r0.zzzw, r1.yyyy
movc r0.zw, r2.yyyy, r3.xxxy, r0.zzzw
mad r2.yw, cb0[2].xxxy, l(0.000000, 2.000000, 0.000000, 2.000000), r0.zzzw
mad r0.zw, r2.xxxz, l(0.000000, 0.000000, 2.000000, 2.000000), r0.zzzw
movc r2.yz, cb0[1].wwww, r2.yywy, r0.zzwz
mul r2.x, r0.x, r2.y
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.xzxx, t2.xyzw, s0, l(0.000000)
mad r0.z, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.z
ge r0.z, r0.x, cb0[2].z
ge r0.x, cb0[2].w, r0.x
and r0.x, r0.x, r0.z
ge r0.z, r1.z, r1.x
and r0.x, r0.x, r0.z
if_nz r0.x
  max r0.x, r1.w, l(0.000000)
  mul r0.x, r0.x, cb0[4].x
  movc r0.x, cb0[3].w, r0.x, cb0[4].x
  if_nz cb0[1].w
    sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r2.xzxx, t4.xyzw, s1
    mov o0.w, r1.w
  else 
    sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r2.xzxx, t4.xyzw, s1
    mov o0.w, r1.w
  endif 
  switch cb0[3].w
    case l(1)
    min r3.xyz, r1.xyzx, r4.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(2)
    mad r3.xyz, r4.xyzx, r1.xyzx, -r4.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(3)
    lt r3.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r1.xyzx
    and r0.z, r3.y, r3.x
    and r0.z, r3.z, r0.z
    add r3.xyz, -r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    div r3.xyz, r3.xyzx, r1.xyzx
    min r3.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r3.xyz, -r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    and r3.xyz, r0.zzzz, r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(4)
    add r3.xyz, r1.xyzx, r4.xyzx
    add r3.xyz, r3.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
    max r3.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(5)
    max r3.xyz, r1.xyzx, r4.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(6)
    add r3.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r5.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r3.xyz, -r3.xyzx, r5.xyzx, -r4.xyzx
    add r3.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(7)
    lt r3.xyz, r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    and r0.z, r3.y, r3.x
    and r0.z, r3.z, r0.z
    add r3.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div r3.xyz, r4.xyzx, r3.xyzx
    min r3.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    movc r3.xyz, r0.zzzz, r3.xyzx, l(1.000000,1.000000,1.000000,0)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(8)
    add r3.xyz, r1.xyzx, r4.xyzx
    min r3.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(9)
    add r3.xyz, r1.xyzx, r4.xyzx
    min r3.xyz, r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(10)
    ge r3.xyz, r4.xyzx, l(0.999999, 0.999999, 0.999999, 0.000000)
    or r0.z, r3.y, r3.x
    or r0.z, r3.z, r0.z
    mul r3.xyz, r1.xyzx, r1.xyzx
    add r5.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div_sat r3.xyz, r3.xyzx, r5.xyzx
    movc r3.xyz, r0.zzzz, r4.xyzx, r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(11)
    mul r3.xyz, r4.xyzx, r1.xyzx
    add r5.xyz, r3.xyzx, r3.xyzx
    add r6.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    add r7.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r6.xyz, -r6.xyzx, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r7.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r3.xyz, -r3.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r3.xyz, r7.xyzx, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(12)
    ge r3.xyz, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
    and r0.z, r3.y, r3.x
    and r0.z, r3.z, r0.z
    mad r3.xyz, -r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
    mul r3.xyz, r4.xyzx, r3.xyzx
    add r5.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad_sat r3.xyz, -r3.xyzx, r5.xyzx, r4.xyzx
    mad r5.xyz, r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
    ge r6.xyz, l(0.250000, 0.250000, 0.250000, 0.000000), r4.xyzx
    and r0.w, r6.y, r6.x
    and r0.w, r6.z, r0.w
    mad r6.xyz, r4.xyzx, l(16.000000, 16.000000, 16.000000, 0.000000), l(-12.000000, -12.000000, -12.000000, 0.000000)
    mad r6.xyz, r6.xyzx, r4.xyzx, l(4.000000, 4.000000, 4.000000, 0.000000)
    mul r6.xyz, r4.xyzx, r6.xyzx
    sqrt r7.xyz, r4.xyzx
    movc r6.xyz, r0.wwww, r6.xyzx, r7.xyzx
    add r6.xyz, -r4.xyzx, r6.xyzx
    mad_sat r5.xyz, r5.xyzx, r6.xyzx, r4.xyzx
    movc r3.xyz, r0.zzzz, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(13)
    mul r3.xyz, r4.xyzx, r1.xyzx
    add r5.xyz, r3.xyzx, r3.xyzx
    add r6.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    add r7.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r6.xyz, -r6.xyzx, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r7.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r3.xyz, -r3.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r3.xyz, r7.xyzx, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(14)
    mul r3.xyz, r4.xyzx, r1.xyzx
    add r5.xyz, r3.xyzx, r3.xyzx
    add r6.xyz, -r4.xyzx, l(1.010000, 1.010000, 1.010000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    div r6.xyz, r1.xyzx, r6.xyzx
    ge r7.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r3.xyz, -r3.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r3.xyz, r7.xyzx, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(15)
    lt r3.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r3.y, r3.x
    or r0.z, r3.z, r0.z
    mad r3.xyz, r1.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r4.xyzx
    add r3.xyz, r3.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
    max r3.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r5.xyz, r1.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    mad r5.xyz, r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r4.xyzx
    min r5.xyz, r5.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    movc r3.xyz, r0.zzzz, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(16)
    lt r3.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r3.y, r3.x
    or r0.z, r3.z, r0.z
    add r3.xyz, r1.xyzx, r1.xyzx
    min r3.xyz, r3.xyzx, r4.xyzx
    add r5.xyz, r1.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    add r5.xyz, r5.xyzx, r5.xyzx
    max r5.xyz, r4.xyzx, r5.xyzx
    movc r3.xyz, r0.zzzz, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(17)
    mul r3.xyz, r4.xyzx, r1.xyzx
    add r5.xyz, r3.xyzx, r3.xyzx
    add r6.xyz, -r4.xyzx, l(1.010000, 1.010000, 1.010000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    div r6.xyz, r1.xyzx, r6.xyzx
    ge r7.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r3.xyz, -r3.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r3.xyz, r7.xyzx, r3.xyzx, r5.xyzx
    lt r3.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r3.y, r3.x
    or r0.z, r3.z, r0.z
    movc r0.z, r0.z, l(0), l(1.000000)
    add r3.xyz, -r4.xyzx, r0.zzzz
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(18)
    add r3.xyz, -r1.xyzx, r4.xyzx
    add r5.xyz, -r4.xyzx, r1.xyzx
    max r3.xyz, r3.xyzx, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(19)
    add r3.xyz, r1.xyzx, r4.xyzx
    mul r5.xyz, r4.xyzx, r1.xyzx
    mad r3.xyz, -r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(20)
    add r3.xyz, -r1.xyzx, r4.xyzx
    max r3.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(21)
    add r3.xyz, r1.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000)
    div_sat r3.xyz, r4.xyzx, r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(22)
    div r3.xyz, r4.xyzx, r1.xyzx
    div r3.xyz, l(1.000000, 1.000000, 1.000000, 1.000000), r3.xyzx
    mov_sat r3.xyz, r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(23)
    div_sat r3.xyz, r4.xyzx, r1.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(24)
    ge r3.xyz, r1.xyzx, l(0.999999, 0.999999, 0.999999, 0.000000)
    or r0.z, r3.y, r3.x
    or r0.z, r3.z, r0.z
    mul r3.xyz, r4.xyzx, r4.xyzx
    add r5.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div_sat r3.xyz, r3.xyzx, r5.xyzx
    movc r3.xyz, r0.zzzz, r1.xyzx, r3.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(25)
    add r3.xyz, r4.xyzx, r1.xyzx
    add_sat r3.xyz, r3.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(26)
    add r3.xyz, -r1.xyzx, r4.xyzx
    add_sat r3.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(27)
    max r0.z, r4.z, r4.y
    max r0.z, r0.z, r4.x
    min r0.w, r4.z, r4.y
    min r0.w, r0.w, r4.x
    add r3.y, -r0.w, r0.z
    max r0.z, r1.z, r1.y
    max r0.z, r0.z, r1.x
    eq r0.w, r0.z, r1.x
    min r1.w, r1.z, r1.y
    min r1.w, r1.w, r1.x
    eq r2.w, r1.w, r1.z
    and r5.x, r0.w, r2.w
    if_nz r5.x
      lt r5.x, r1.z, r1.x
      add r5.yz, -r1.zzzz, r1.yyxy
      mul r5.y, r3.y, r5.y
      div r3.z, r5.y, r5.z
      and r5.xy, r3.yzyy, r5.xxxx
      mov r5.z, l(0)
    else 
      eq r5.w, r1.w, r1.y
      and r0.w, r0.w, r5.w
      if_nz r0.w
        lt r0.w, r1.y, r1.x
        add r6.xy, -r1.yyyy, r1.zxzz
        mul r6.x, r3.y, r6.x
        div r3.w, r6.x, r6.y
        and r5.xz, r0.wwww, r3.yywy
        mov r5.y, l(0)
      else 
        eq r0.w, r0.z, r1.y
        and r2.w, r2.w, r0.w
        if_nz r2.w
          lt r2.w, r1.z, r1.y
          add r6.xy, -r1.zzzz, r1.xyxx
          mul r3.w, r3.y, r6.x
          div r3.x, r3.w, r6.y
          and r5.xy, r3.xyxx, r2.wwww
          mov r5.z, l(0)
        else 
          eq r1.w, r1.w, r1.x
          and r0.w, r0.w, r1.w
          if_nz r0.w
            lt r0.w, r1.x, r1.y
            add r6.xy, -r1.xxxx, r1.zyzz
            mul r2.w, r3.y, r6.x
            div r3.z, r2.w, r6.y
            and r5.yz, r0.wwww, r3.yyzy
            mov r5.x, l(0)
          else 
            eq r0.z, r0.z, r1.z
            and r0.w, r5.w, r0.z
            lt r6.xy, r1.yxyy, r1.zzzz
            add r7.xyzw, -r1.yyxx, r1.xzyz
            mul r6.zw, r3.yyyy, r7.xxxz
            div r3.xz, r6.zzwz, r7.yywy
            and r7.xz, r3.xxyx, r6.xxxx
            and r0.z, r1.w, r0.z
            and r3.yz, r3.zzyz, r6.yyyy
            mov r3.x, l(0)
            movc r3.xyz, r0.zzzz, r3.xyzx, r1.xyzx
            mov r7.y, l(0)
            movc r5.xyz, r0.wwww, r7.xyzx, r3.xyzx
          endif 
        endif 
      endif 
    endif 
    dp3 r0.z, r4.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r5.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r3.xyz, r0.zzzz, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(28)
    max r0.z, r1.z, r1.y
    max r0.z, r0.z, r1.x
    min r0.w, r1.z, r1.y
    min r0.w, r0.w, r1.x
    add r3.y, -r0.w, r0.z
    max r0.z, r4.z, r4.y
    max r0.z, r0.z, r4.x
    eq r0.w, r0.z, r4.x
    min r1.w, r4.z, r4.y
    min r1.w, r1.w, r4.x
    eq r2.w, r1.w, r4.z
    and r5.x, r0.w, r2.w
    if_nz r5.x
      lt r5.x, r4.z, r4.x
      add r5.yz, -r4.zzzz, r4.yyxy
      mul r5.y, r3.y, r5.y
      div r3.z, r5.y, r5.z
      and r5.xy, r3.yzyy, r5.xxxx
      mov r5.z, l(0)
    else 
      eq r5.w, r1.w, r4.y
      and r0.w, r0.w, r5.w
      if_nz r0.w
        lt r0.w, r4.y, r4.x
        add r6.xy, -r4.yyyy, r4.zxzz
        mul r6.x, r3.y, r6.x
        div r3.w, r6.x, r6.y
        and r5.xz, r0.wwww, r3.yywy
        mov r5.y, l(0)
      else 
        eq r0.w, r0.z, r4.y
        and r2.w, r2.w, r0.w
        if_nz r2.w
          lt r2.w, r4.z, r4.y
          add r6.xy, -r4.zzzz, r4.xyxx
          mul r3.w, r3.y, r6.x
          div r3.x, r3.w, r6.y
          and r5.xy, r3.xyxx, r2.wwww
          mov r5.z, l(0)
        else 
          eq r1.w, r1.w, r4.x
          and r0.w, r0.w, r1.w
          if_nz r0.w
            lt r0.w, r4.x, r4.y
            add r6.xy, -r4.xxxx, r4.zyzz
            mul r2.w, r3.y, r6.x
            div r3.z, r2.w, r6.y
            and r5.yz, r0.wwww, r3.yyzy
            mov r5.x, l(0)
          else 
            eq r0.z, r0.z, r4.z
            and r0.w, r5.w, r0.z
            lt r6.xy, r4.yxyy, r4.zzzz
            add r7.xyzw, -r4.yyxx, r4.xzyz
            mul r6.zw, r3.yyyy, r7.xxxz
            div r3.xz, r6.zzwz, r7.yywy
            and r7.xz, r3.xxyx, r6.xxxx
            and r0.z, r1.w, r0.z
            and r3.yz, r3.zzyz, r6.yyyy
            mov r3.x, l(0)
            movc r3.xyz, r0.zzzz, r3.xyzx, r4.xyzx
            mov r7.y, l(0)
            movc r5.xyz, r0.wwww, r7.xyzx, r3.xyzx
          endif 
        endif 
      endif 
    endif 
    dp3 r0.z, r4.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r5.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r3.xyz, r0.zzzz, r5.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(29)
    dp3 r0.z, r4.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r3.xyz, r0.zzzz, r1.xyzx
    add r3.xyz, -r4.xyzx, r3.xyzx
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    case l(30)
    dp3 r0.z, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r4.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r3.xyz, -r0.wwww, r0.zzzz
    mad r2.xyz, r0.xxxx, r3.xyzx, r4.xyzx
    break 
    default 
    add r1.xyz, -r4.xyzx, r1.xyzx
    mad r2.xyz, r0.xxxx, r1.xyzx, r4.xyzx
    break 
  endswitch 
  mov o0.xyz, r2.xyzx
else 
  mov o0.xyzw, r4.xyzw
endif 
lt r0.x, r0.y, cb0[3].x
if_nz r0.x
  mov o0.xyzw, r4.xyzw
endif 
ret 
// Approximately 487 instruction slots used