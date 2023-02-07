//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int wave_type;                     // Offset:    0 Size:     4
//   float angle;                       // Offset:    4 Size:     4
//   float period;                      // Offset:    8 Size:     4
//   float amplitude;                   // Offset:   12 Size:     4
//   float phase;                       // Offset:   16 Size:     4
//   float2 depth_bounds;               // Offset:   20 Size:     8
//   float min_depth;                   // Offset:   28 Size:     4
//   int animate;                       // Offset:   32 Size:     4
//   float anim_rate;                   // Offset:   36 Size:     4
//   int render_type;                   // Offset:   40 Size:     4
//   float blending_amount;             // Offset:   44 Size:     4
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t4.xyzw, s1
ieq r0.y, cb0[2].x, l(3)
mul r0.zw, cb0[2].yyyy, l(0.000000, 0.000000, 0.010000, 3.600000)
ge r0.w, r0.w, -r0.w
movc r2.xy, r0.wwww, l(360.000000,0.002778,0,0), l(-360.000000,-0.002778,0,0)
mul r0.z, r0.z, r2.y
frc r0.z, r0.z
mul r0.z, r0.z, r2.x
movc r0.y, r0.y, r0.z, cb0[0].y
mul r0.y, r0.y, l(0.017453)
sincos r2.x, r3.x, r0.y
sincos r4.x, r5.x, -r0.y
mad r0.yz, v1.xxyx, l(0.000000, 1.777778, 1.000000, 0.000000), l(0.000000, -0.888889, -0.500000, 0.000000)
mov r6.x, -r2.x
mov r6.y, r3.x
dp2 r0.w, r0.zyzz, r6.xyxx
mov r6.z, r2.x
dp2 r2.y, r0.zyzz, r6.yzyy
if_z cb0[0].x
  switch cb0[2].x
    case l(1)
    mul r0.y, cb0[2].y, l(0.001000)
    sincos r0.y, null, r0.y
    mul r0.y, r0.y, cb0[0].w
    mul r0.z, r0.w, cb0[0].z
    mad r0.z, r0.z, l(10.000000), cb0[1].x
    sincos r0.z, null, r0.z
    mad r2.x, r0.y, r0.z, r0.w
    break 
    case l(2)
    mul r0.y, r0.w, cb0[0].z
    mul r0.z, cb0[2].y, l(0.001000)
    mad r0.y, r0.y, l(10.000000), r0.z
    sincos r0.y, null, r0.y
    mad r2.x, cb0[0].w, r0.y, r0.w
    break 
    default 
    mul r0.y, r0.w, cb0[0].z
    mad r0.y, r0.y, l(10.000000), cb0[1].x
    sincos r0.y, null, r0.y
    mad r2.x, cb0[0].w, r0.y, r0.w
    break 
  endswitch 
else 
  switch cb0[2].x
    case l(1)
    mul r0.y, cb0[2].y, l(0.001000)
    sincos r0.y, null, r0.y
    mul r0.y, r0.y, cb0[0].w
    mul r0.z, r2.y, cb0[0].z
    mad r0.z, r0.z, l(10.000000), cb0[1].x
    sincos r0.z, null, r0.z
    mad r2.x, r0.y, r0.z, r0.w
    break 
    case l(2)
    mul r0.y, r2.y, cb0[0].z
    mul r0.z, cb0[2].y, l(0.001000)
    mad r0.y, r0.y, l(10.000000), r0.z
    sincos r0.y, null, r0.y
    mad r2.x, cb0[0].w, r0.y, r0.w
    break 
    default 
    mul r0.y, r2.y, cb0[0].z
    mad r0.y, r0.y, l(10.000000), cb0[1].x
    sincos r0.y, null, r0.y
    mad r2.x, cb0[0].w, r0.y, r0.w
    break 
  endswitch 
endif 
mov r3.x, -r4.x
mov r3.y, r5.x
dp2 r5.x, r2.yxyy, r3.xyxx
mov r3.z, r4.x
dp2 r5.y, r2.yxyy, r3.yzyy
add r2.xy, r5.xyxx, l(0.888889, 0.500000, 0.000000, 0.000000)
mul r2.z, r2.x, l(0.562500)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r2.zyzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
ge r0.z, r0.y, cb0[1].y
ge r0.y, cb0[1].z, r0.y
and r0.y, r0.y, r0.z
if_nz r0.y
  mad r0.y, |cb0[0].w|, l(-9.000000), l(10.000000)
  mul r0.y, r0.y, |cb0[0].w|
  mul r0.y, r0.y, cb0[2].w
  min r0.y, r0.y, l(1.000000)
  movc r0.y, cb0[2].z, r0.y, cb0[2].w
  mul r2.w, r2.x, l(0.562500)
  sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r2.wyww, t4.xyzw, s1
  switch cb0[2].z
    case l(1)
    min r4.xyz, r1.xyzx, r2.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(2)
    mad r4.xyz, r1.xyzx, r2.xyzx, -r1.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(3)
    lt r4.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r2.xyzx
    and r0.z, r4.y, r4.x
    and r0.z, r4.z, r0.z
    add r4.xyz, -r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    div r4.xyz, r4.xyzx, r2.xyzx
    min r4.xyz, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r4.xyz, -r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    and r4.xyz, r0.zzzz, r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(4)
    add r4.xyz, r1.xyzx, r2.xyzx
    add r4.xyz, r4.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
    max r4.xyz, r4.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(5)
    max r4.xyz, r1.xyzx, r2.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(6)
    add r4.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r5.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r4.xyz, -r4.xyzx, r5.xyzx, -r1.xyzx
    add r4.xyz, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(7)
    lt r4.xyz, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    and r0.z, r4.y, r4.x
    and r0.z, r4.z, r0.z
    add r4.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div r4.xyz, r1.xyzx, r4.xyzx
    min r4.xyz, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    movc r4.xyz, r0.zzzz, r4.xyzx, l(1.000000,1.000000,1.000000,0)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(8)
    add r4.xyz, r1.xyzx, r2.xyzx
    min r4.xyz, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(9)
    add r4.xyz, r1.xyzx, r2.xyzx
    min r4.xyz, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(10)
    ge r4.xyz, r1.xyzx, l(0.999999, 0.999999, 0.999999, 0.000000)
    or r0.z, r4.y, r4.x
    or r0.z, r4.z, r0.z
    mul r4.xyz, r2.xyzx, r2.xyzx
    add r5.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div_sat r4.xyz, r4.xyzx, r5.xyzx
    movc r4.xyz, r0.zzzz, r1.xyzx, r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(11)
    mul r4.xyz, r1.xyzx, r2.xyzx
    add r5.xyz, r4.xyzx, r4.xyzx
    add r6.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    add r7.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r6.xyz, -r6.xyzx, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r7.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r4.xyz, -r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r4.xyz, r7.xyzx, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(12)
    ge r4.xyz, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
    and r0.z, r4.y, r4.x
    and r0.z, r4.z, r0.z
    mad r4.xyz, -r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
    mul r4.xyz, r1.xyzx, r4.xyzx
    add r5.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad_sat r4.xyz, -r4.xyzx, r5.xyzx, r1.xyzx
    mad r5.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
    ge r6.xyz, l(0.250000, 0.250000, 0.250000, 0.000000), r1.xyzx
    and r0.w, r6.y, r6.x
    and r0.w, r6.z, r0.w
    mad r6.xyz, r1.xyzx, l(16.000000, 16.000000, 16.000000, 0.000000), l(-12.000000, -12.000000, -12.000000, 0.000000)
    mad r6.xyz, r6.xyzx, r1.xyzx, l(4.000000, 4.000000, 4.000000, 0.000000)
    mul r6.xyz, r1.xyzx, r6.xyzx
    sqrt r7.xyz, r1.xyzx
    movc r6.xyz, r0.wwww, r6.xyzx, r7.xyzx
    add r6.xyz, -r1.xyzx, r6.xyzx
    mad_sat r5.xyz, r5.xyzx, r6.xyzx, r1.xyzx
    movc r4.xyz, r0.zzzz, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(13)
    mul r4.xyz, r1.xyzx, r2.xyzx
    add r5.xyz, r4.xyzx, r4.xyzx
    add r6.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    add r7.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    mad r6.xyz, -r6.xyzx, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ge r7.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r4.xyz, -r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r4.xyz, r7.xyzx, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(14)
    mul r4.xyz, r1.xyzx, r2.xyzx
    add r5.xyz, r4.xyzx, r4.xyzx
    add r6.xyz, -r1.xyzx, l(1.010000, 1.010000, 1.010000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    div r6.xyz, r2.xyzx, r6.xyzx
    ge r7.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r4.xyz, -r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r4.xyz, r7.xyzx, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(15)
    lt r4.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r4.y, r4.x
    or r0.z, r4.z, r0.z
    mad r4.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r1.xyzx
    add r4.xyz, r4.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
    max r4.xyz, r4.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r5.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    mad r5.xyz, r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r1.xyzx
    min r5.xyz, r5.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    movc r4.xyz, r0.zzzz, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(16)
    lt r4.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r4.y, r4.x
    or r0.z, r4.z, r0.z
    add r4.xyz, r2.xyzx, r2.xyzx
    min r4.xyz, r1.xyzx, r4.xyzx
    add r5.xyz, r2.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    add r5.xyz, r5.xyzx, r5.xyzx
    max r5.xyz, r1.xyzx, r5.xyzx
    movc r4.xyz, r0.zzzz, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(17)
    mul r4.xyz, r1.xyzx, r2.xyzx
    add r5.xyz, r4.xyzx, r4.xyzx
    add r6.xyz, -r1.xyzx, l(1.010000, 1.010000, 1.010000, 0.000000)
    add r6.xyz, r6.xyzx, r6.xyzx
    div r6.xyz, r2.xyzx, r6.xyzx
    ge r7.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    and r7.xyz, r7.xyzx, l(0x3f800000, 0x3f800000, 0x3f800000, 0)
    mad r4.xyz, -r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r6.xyzx
    mad r4.xyz, r7.xyzx, r4.xyzx, r5.xyzx
    lt r4.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    or r0.z, r4.y, r4.x
    or r0.z, r4.z, r0.z
    movc r0.z, r0.z, l(0), l(1.000000)
    add r4.xyz, -r1.xyzx, r0.zzzz
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(18)
    add r4.xyz, r1.xyzx, -r2.xyzx
    add r5.xyz, -r1.xyzx, r2.xyzx
    max r4.xyz, r4.xyzx, r5.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(19)
    add r4.xyz, r1.xyzx, r2.xyzx
    mul r5.xyz, r1.xyzx, r2.xyzx
    mad r4.xyz, -r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(20)
    add r4.xyz, r1.xyzx, -r2.xyzx
    max r4.xyz, r4.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(21)
    add r4.xyz, r2.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000)
    div_sat r4.xyz, r1.xyzx, r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(22)
    div r4.xyz, r1.xyzx, r2.xyzx
    div r4.xyz, l(1.000000, 1.000000, 1.000000, 1.000000), r4.xyzx
    mov_sat r4.xyz, r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(23)
    div_sat r4.xyz, r1.xyzx, r2.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(24)
    ge r4.xyz, r2.xyzx, l(0.999999, 0.999999, 0.999999, 0.000000)
    or r0.z, r4.y, r4.x
    or r0.z, r4.z, r0.z
    mul r4.xyz, r1.xyzx, r1.xyzx
    add r5.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    div_sat r4.xyz, r4.xyzx, r5.xyzx
    movc r4.xyz, r0.zzzz, r2.xyzx, r4.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(25)
    add r4.xyz, r1.xyzx, r2.xyzx
    add_sat r4.xyz, r4.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(26)
    add r4.xyz, r1.xyzx, -r2.xyzx
    add_sat r4.xyz, r4.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(27)
    max r0.z, r1.z, r1.y
    max r0.z, r0.z, r1.x
    min r0.w, r1.z, r1.y
    min r0.w, r0.w, r1.x
    add r4.y, -r0.w, r0.z
    max r0.z, r2.z, r2.y
    max r0.z, r0.z, r2.x
    eq r0.w, r0.z, r2.x
    min r3.w, r2.z, r2.y
    min r3.w, r2.x, r3.w
    eq r5.x, r2.z, r3.w
    and r5.y, r0.w, r5.x
    if_nz r5.y
      lt r5.y, r2.z, r2.x
      add r5.zw, -r2.zzzz, r2.yyyx
      mul r5.z, r4.y, r5.z
      div r4.z, r5.z, r5.w
      and r6.xy, r4.yzyy, r5.yyyy
      mov r6.z, l(0)
    else 
      eq r5.y, r2.y, r3.w
      and r0.w, r0.w, r5.y
      if_nz r0.w
        lt r0.w, r2.y, r2.x
        add r5.zw, -r2.yyyy, r2.zzzx
        mul r5.z, r4.y, r5.z
        div r4.w, r5.z, r5.w
        and r6.xz, r0.wwww, r4.yywy
        mov r6.y, l(0)
      else 
        eq r0.w, r0.z, r2.y
        and r4.w, r5.x, r0.w
        if_nz r4.w
          lt r4.w, r2.z, r2.y
          add r5.xz, -r2.zzzz, r2.xxyx
          mul r5.x, r4.y, r5.x
          div r4.x, r5.x, r5.z
          and r6.xy, r4.xyxx, r4.wwww
          mov r6.z, l(0)
        else 
          eq r3.w, r2.x, r3.w
          and r0.w, r0.w, r3.w
          if_nz r0.w
            lt r0.w, r2.x, r2.y
            add r5.xz, -r2.xxxx, r2.zzyz
            mul r4.w, r4.y, r5.x
            div r4.z, r4.w, r5.z
            and r6.yz, r0.wwww, r4.yyzy
            mov r6.x, l(0)
          else 
            eq r0.z, r0.z, r2.z
            and r0.w, r5.y, r0.z
            lt r5.xy, r2.yxyy, r2.zzzz
            add r7.xyzw, -r2.yyxx, r2.xzyz
            mul r5.zw, r4.yyyy, r7.xxxz
            div r4.xz, r5.zzwz, r7.yywy
            and r7.xz, r4.xxyx, r5.xxxx
            and r0.z, r3.w, r0.z
            and r4.yz, r4.zzyz, r5.yyyy
            mov r4.x, l(0)
            movc r4.xyz, r0.zzzz, r4.xyzx, r2.xyzx
            mov r7.y, l(0)
            movc r6.xyz, r0.wwww, r7.xyzx, r4.xyzx
          endif 
        endif 
      endif 
    endif 
    dp3 r0.z, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r6.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r4.xyz, r0.zzzz, r6.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(28)
    max r0.z, r2.z, r2.y
    max r0.z, r0.z, r2.x
    min r0.w, r2.z, r2.y
    min r0.w, r0.w, r2.x
    add r4.y, -r0.w, r0.z
    max r0.z, r1.z, r1.y
    max r0.z, r0.z, r1.x
    eq r0.w, r0.z, r1.x
    min r3.w, r1.z, r1.y
    min r3.w, r1.x, r3.w
    eq r5.x, r1.z, r3.w
    and r5.y, r0.w, r5.x
    if_nz r5.y
      lt r5.y, r1.z, r1.x
      add r5.zw, -r1.zzzz, r1.yyyx
      mul r5.z, r4.y, r5.z
      div r4.z, r5.z, r5.w
      and r6.xy, r4.yzyy, r5.yyyy
      mov r6.z, l(0)
    else 
      eq r5.y, r1.y, r3.w
      and r0.w, r0.w, r5.y
      if_nz r0.w
        lt r0.w, r1.y, r1.x
        add r5.zw, -r1.yyyy, r1.zzzx
        mul r5.z, r4.y, r5.z
        div r4.w, r5.z, r5.w
        and r6.xz, r0.wwww, r4.yywy
        mov r6.y, l(0)
      else 
        eq r0.w, r0.z, r1.y
        and r4.w, r5.x, r0.w
        if_nz r4.w
          lt r4.w, r1.z, r1.y
          add r5.xz, -r1.zzzz, r1.xxyx
          mul r5.x, r4.y, r5.x
          div r4.x, r5.x, r5.z
          and r6.xy, r4.xyxx, r4.wwww
          mov r6.z, l(0)
        else 
          eq r3.w, r1.x, r3.w
          and r0.w, r0.w, r3.w
          if_nz r0.w
            lt r0.w, r1.x, r1.y
            add r5.xz, -r1.xxxx, r1.zzyz
            mul r4.w, r4.y, r5.x
            div r4.z, r4.w, r5.z
            and r6.yz, r0.wwww, r4.yyzy
            mov r6.x, l(0)
          else 
            eq r0.z, r0.z, r1.z
            and r0.w, r5.y, r0.z
            lt r5.xy, r1.yxyy, r1.zzzz
            add r7.xyzw, -r1.yyxx, r1.xzyz
            mul r5.zw, r4.yyyy, r7.xxxz
            div r4.xz, r5.zzwz, r7.yywy
            and r7.xz, r4.xxyx, r5.xxxx
            and r0.z, r3.w, r0.z
            and r4.yz, r4.zzyz, r5.yyyy
            mov r4.x, l(0)
            movc r4.xyz, r0.zzzz, r4.xyzx, r1.xyzx
            mov r7.y, l(0)
            movc r6.xyz, r0.wwww, r7.xyzx, r4.xyzx
          endif 
        endif 
      endif 
    endif 
    dp3 r0.z, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r6.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r4.xyz, r0.zzzz, r6.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(29)
    dp3 r0.z, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r2.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r0.z, -r0.w, r0.z
    add r4.xyz, r0.zzzz, r2.xyzx
    add r4.xyz, -r1.xyzx, r4.xyzx
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    case l(30)
    dp3 r0.z, r2.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    dp3 r0.w, r1.xzyx, l(0.333330, 0.333330, 0.333340, 0.000000)
    add r4.xyz, -r0.wwww, r0.zzzz
    mad r3.xyz, r0.yyyy, r4.xyzx, r1.xyzx
    break 
    default 
    add r2.xyz, -r1.xyzx, r2.xyzx
    mad r3.xyz, r0.yyyy, r2.xyzx, r1.xyzx
    break 
  endswitch 
  mov o0.xyz, r3.xyzx
  mov o0.w, r2.w
else 
  mov o0.xyzw, r1.xyzw
endif 
lt r0.x, r0.x, cb0[1].w
if_nz r0.x
  mov o0.xyzw, r1.xyzw
endif 
ret 
// Approximately 516 instruction slots used