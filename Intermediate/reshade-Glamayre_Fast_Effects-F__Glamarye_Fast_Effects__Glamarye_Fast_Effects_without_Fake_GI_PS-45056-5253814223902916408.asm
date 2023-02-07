//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int show_color_space;              // Offset:    0 Size:     4 [unused]
//   bool fxaa_enabled;                 // Offset:    4 Size:     4
//   bool sharp_enabled;                // Offset:    8 Size:     4
//   bool ao_enabled;                   // Offset:   12 Size:     4
//   bool dof_enabled;                  // Offset:   16 Size:     4
//   bool depth_detect;                 // Offset:   20 Size:     4
//   bool sky_detect;                   // Offset:   24 Size:     4
//   float sharp_strength;              // Offset:   28 Size:     4
//   float ao_strength;                 // Offset:   32 Size:     4
//   float ao_shine_strength;           // Offset:   36 Size:     4
//   float dof_strength;                // Offset:   40 Size:     4
//   float gi_strength;                 // Offset:   44 Size:     4 [unused]
//   float gi_saturation;               // Offset:   48 Size:     4 [unused]
//   float gi_contrast;                 // Offset:   52 Size:     4 [unused]
//   bool gi_use_depth;                 // Offset:   56 Size:     4
//   float gi_ao_strength;              // Offset:   60 Size:     4 [unused]
//   float gi_local_ao_strength;        // Offset:   64 Size:     4 [unused]
//   float bounce_multiplier;           // Offset:   68 Size:     4 [unused]
//   float gi_shape;                    // Offset:   72 Size:     4 [unused]
//   bool gi_dof_safe_mode;             // Offset:   76 Size:     4
//   int debug_mode;                    // Offset:   80 Size:     4
//   bool ao_big_dither;                // Offset:   84 Size:     4
//   float reduce_ao_in_light_areas;    // Offset:   88 Size:     4
//   float ao_fog_fix;                  // Offset:   92 Size:     4
//   float gi_max_distance;             // Offset:   96 Size:     4 [unused]
//   float ao_radius;                   // Offset:  100 Size:     4
//   float ao_shape_modifier;           // Offset:  104 Size:     4
//   float ao_max_depth_diff;           // Offset:  108 Size:     4
//   float fxaa_bias;                   // Offset:  112 Size:     4
//   float tone_map;                    // Offset:  116 Size:     4
//   float max_sharp_diff;              // Offset:  120 Size:     4
//   bool edge_detect_sharpen;          // Offset:  124 Size:     4
//   bool big_sharpen;                  // Offset:  128 Size:     4
//   bool abtest;                       // Offset:  132 Size:     4 [unused]
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
// __srgbV__ReShade__BackBufferTex    texture  float4          2d             t1      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
// TEXCOORD                 0   xy          1     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[9], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 13
dcl_indexableTemp x0[2], 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t1.xyzw, s0
ieq r0.w, cb0[4].w, l(0)
or r1.x, cb0[0].w, cb0[3].z
ine r1.x, r1.x, l(0)
and r1.x, r0.w, r1.x
ine r1.yzw, cb0[1].xxyz, l(0, 0, 0, 0)
or r1.x, r1.y, r1.x
ine r1.y, cb0[5].x, l(0)
or r1.x, r1.y, r1.x
or r1.x, r1.z, r1.x
or r1.x, r1.w, r1.x
if_nz r1.x
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
else 
  mov r1.x, l(0)
endif 
eq r2.xy, r1.xxxx, l(0.000000, 1.000000, 0.000000, 0.000000)
and r1.yz, r1.zzwz, r2.xxyx
not r1.yz, r1.yyzy
and r1.y, r1.z, r1.y
if_nz r1.y
  or r1.y, cb0[0].z, cb0[0].y
  or r1.y, r1.y, cb0[1].x
  if_nz r1.y
    movc r2.xyzw, cb0[8].xxxx, l(1.400000,0.000729,0.001296,-1.400000), l(0.500000,0.000260,0.000463,-0.500000)
    add r1.yz, r2.yyzy, v1.xxyx
    sample_indexable(texture2d)(float,float,float,float) r1.yzw, r1.yzyy, t1.wxyz, s0
    movc r2.yz, cb0[8].xxxx, l(0,-0.000729,-0.001296,0), l(0,-0.000260,-0.000463,0)
    add r2.yz, r2.yyzy, v1.xxyx
    sample_indexable(texture2d)(float,float,float,float) r3.xyz, r2.yzyy, t1.xyzw, s0
    mad r2.xyzw, r2.xwwx, l(0.000521, 0.000926, 0.000521, 0.000926), v1.xyxy
    sample_indexable(texture2d)(float,float,float,float) r4.xyz, r2.xyxx, t1.xyzw, s0
    sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.zwzz, t1.xyzw, s0
    add r5.xyz, r1.yzwy, r2.xyzx
    add r6.xyz, r3.xyzx, r4.xyzx
    add r7.xyz, r5.xyzx, r6.xyzx
    add r8.xyz, r0.xyzx, r7.xyzx
    mul r8.xyz, r8.xyzx, l(0.200000, 0.200000, 0.200000, 0.000000)
    mul r9.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
    add r10.xyz, r0.xyzx, r0.xyzx
    max r8.xyz, r8.xyzx, r9.xyzx
    min r8.xyz, r10.xyzx, r8.xyzx
    add r7.xyz, -r0.xyzx, r7.xyzx
    mul r7.xyz, r7.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
    max r7.xyz, r9.xyzx, r7.xyzx
    min r7.xyz, r10.xyzx, r7.xyzx
    movc r7.xyz, cb0[8].xxxx, r8.xyzx, r7.xyzx
    min r7.xyz, r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    ine r8.xy, cb0[0].zyzz, l(0, 0, 0, 0)
    ine r2.w, cb0[7].w, l(0)
    and r2.w, r2.w, r8.x
    or r2.w, r2.w, r8.y
    if_nz r2.w
      add r8.yzw, r5.xxyz, -r6.xxyz
      dp3 r2.w, l(0.212600, 0.715200, 0.072200, 0.000000), |r8.yzwy|
      add r8.yzw, r1.yyzw, r4.xxyz
      add r9.xyz, r3.xyzx, r2.xyzx
      add r10.xyz, r8.yzwy, -r9.xyzx
      dp3 r3.w, l(0.212600, 0.715200, 0.072200, 0.000000), |r10.xyzx|
      lt r2.w, r3.w, r2.w
      movc r8.yzw, r2.wwww, r5.xxyz, r8.yyzw
      movc r6.xyz, r2.wwww, r6.xyzx, r9.xyzx
      mul r9.xyz, r8.yzwy, l(0.500000, 0.500000, 0.500000, 0.000000)
      mul r10.xyz, r6.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
      add r8.yzw, -r0.xxyz, r8.yyzw
      add r6.xyz, -r0.xyzx, r6.xyzx
      movc r8.yzw, cb0[8].xxxx, r9.xxyz, r8.yyzw
      movc r6.xyz, cb0[8].xxxx, r10.xyzx, r6.xyzx
      movc r9.xyzw, r2.wwww, l(-0.001823,0,0.001823,0), l(0,0.003241,0,-0.003241)
      add r9.xyzw, r9.xyzw, v1.xyxy
      sample_indexable(texture2d)(float,float,float,float) r10.xyz, r9.xyxx, t1.xyzw, s0
      sample_indexable(texture2d)(float,float,float,float) r9.xyz, r9.zwzz, t1.xyzw, s0
      add r11.xyz, -r8.yzwy, r10.xyzx
      add r12.xyz, -r6.xyzx, r9.xyzx
      add r11.xyz, r11.xyzx, -r12.xyzx
      add r8.yzw, -r8.yyzw, r9.xxyz
      add r6.xyz, -r6.xyzx, r10.xyzx
      add r6.xyz, -r6.xyzx, r8.yzwy
      add r8.yzw, |r6.xxyz|, |r11.xxyz|
      add r8.yzw, r8.yyzw, l(0.000000, 0.000040, 0.000040, 0.000040)
      max r6.xyz, |r6.xyzx|, |r11.xyzx|
      add r6.xyz, r6.xyzx, l(0.000010, 0.000010, 0.000010, 0.000000)
      sqrt r9.xyz, r7.xyzx
      mad r6.xyz, -cb0[7].xxxx, r9.xyzx, r6.xyzx
      div r6.xyz, r6.xyzx, r8.yzwy
      dp3 r2.w, l(0.212600, 0.715200, 0.072200, 0.000000), r6.xyzx
      mad r2.w, r2.w, l(2.000000), l(-1.000000)
      max r2.w, r2.w, l(0.000000)
    else 
      mov r2.w, l(0)
    endif 
    ne r3.w, l(0.000000, 0.000000, 0.000000, 0.000000), cb0[1].w
    and r3.w, r3.w, r8.x
    add r5.xyz, r4.xyzx, r5.xyzx
    add r5.xyz, r3.xyzx, r5.xyzx
    mad r5.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r5.xyzx
    max r6.xyz, r1.yzwy, r2.xyzx
    max r8.xyz, r3.xyzx, r4.xyzx
    max r6.xyz, r6.xyzx, r8.xyzx
    min r1.yzw, r1.yyzw, r2.xxyz
    min r2.xyz, r3.xyzx, r4.xyzx
    min r1.yzw, r1.yyzw, r2.xxyz
    add r1.yzw, r1.yyzw, r6.xxyz
    mad r1.yzw, -r1.yyzw, l(0.000000, 3.000000, 3.000000, 3.000000), r5.xxyz
    dp3 r1.y, l(0.212600, 0.715200, 0.072200, 0.000000), r1.yzwy
    min r2.xyz, r0.xyzx, r7.xyzx
    max r3.xyz, r0.xyzx, r7.xyzx
    add r3.xyz, -r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
    min r2.xyz, r2.xyzx, r3.xyzx
    max r2.xyz, r2.xyzx, l(0.000010, 0.000010, 0.000010, 0.000000)
    min r2.xyz, r2.xyzx, cb0[7].zzzz
    rcp r1.z, cb0[1].w
    div r2.xyz, |r1.yyyy|, r2.xyzx
    add r2.xyz, r1.zzzz, r2.xyzx
    div r1.yzw, r1.yyyy, r2.xxyz
    add r2.x, -r2.w, l(1.000000)
    mul r2.xyz, r1.yzwy, r2.xxxx
    movc r1.yzw, cb0[7].wwww, r2.xxyz, r1.yyzw
    and r1.yzw, r1.yyzw, r3.wwww
    add r2.xyz, -r0.xyzx, r7.xyzx
    mad r2.xyz, r2.wwww, r2.xyzx, r0.xyzx
    movc r2.xyz, cb0[0].yyyy, r2.xyzx, r0.xyzx
    add r1.yzw, r1.yyzw, r2.xxyz
    mul r2.xyz, r1.yzwy, l(0.500000, 0.500000, 0.500000, 0.000000)
    add r3.xyz, r1.yzwy, r1.yzwy
    max r2.xyz, r2.xyzx, r7.xyzx
    min r2.xyz, r3.xyzx, r2.xyzx
    mul r3.x, r1.x, cb0[2].z
    add r2.xyz, -r1.yzwy, r2.xyzx
    mad r2.xyz, r3.xxxx, r2.xyzx, r1.yzwy
    movc r3.xyz, cb0[1].xxxx, r2.xyzx, r1.yzwy
    mov r0.xyz, r7.xyzx
  else 
    mov r3.xyz, r0.xyzx
    mov r2.w, l(0)
  endif 
  ine r1.y, cb0[0].w, l(0)
  min r2.xyz, r0.xyzx, r3.xyzx
  dp3 r1.z, r2.xyzx, r2.xyzx
  sqrt r1.z, r1.z
  mad r1.z, -cb0[5].z, r1.z, l(1.000000)
  max r4.w, r1.z, l(0.000000)
  mov_sat r2.xyz, r3.xyzx
  rcp r1.z, cb0[7].y
  add r1.z, -r1.z, l(1.000000)
  mad r5.xyz, -r1.zzzz, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  div r4.xyz, r2.xyzx, r5.xyzx
  mov r3.w, l(0)
  movc r3.xyzw, cb0[0].wwww, r4.xyzw, r3.xyzw
  and r0.w, r0.w, r1.y
  lt r1.y, l(0.000000), r1.x
  and r0.w, r0.w, r1.y
  lt r1.y, r1.x, cb0[5].w
  and r0.w, r0.w, r1.y
  if_nz r0.w
    add r0.w, v0.y, v0.x
    ftou r0.w, r0.w
    and r0.w, r0.w, l(1)
    mul r2.xyz, v0.yxyy, l(0.500000, 0.500000, 0.500000, 0.000000)
    ftou r1.y, r2.x
    and r1.y, r1.y, l(1)
    movc r1.y, cb0[5].y, r1.y, l(0)
    mov x0[0].y, l(0.004000)
    mov x0[0].x, l(0.010000)
    mov x0[1].xy, l(0.005500,0.008500,0,0)
    mov r1.w, x0[r1.y + 0].x
    mov r1.y, x0[r1.y + 0].y
    movc r1.y, r0.w, r1.w, r1.y
    mad r1.w, -r1.x, l(0.800000), l(1.000000)
    mul r1.w, r1.w, cb0[6].y
    mul r1.w, r1.y, r1.w
    round_ni r4.xyzw, r2.yzyz
    mad r4.xyzw, r4.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r4.xyzw, r4.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    movc r5.xyzw, r0.wwww, l(0.296955,1.970227,1.108253,0.527921), l(-0.296955,1.970227,0.811297,1.442306)
    mad r5.xyzw, r1.wwww, r5.xyzw, r4.zwzw
    sample_indexable(texture2d)(float,float,float,float) r2.y, r5.xyxx, t2.yxzw, s1
    sample_indexable(texture2d)(float,float,float,float) r5.x, r5.zwzz, t2.xyzw, s1
    movc r6.xyzw, r0.wwww, l(0.811297,-1.442306,-0.296955,-1.970227), l(1.108253,-0.527921,0.296955,-1.970227)
    mad r6.xyzw, r1.wwww, r6.xyzw, r4.zwzw
    sample_indexable(texture2d)(float,float,float,float) r2.z, r6.xyxx, t2.yzxw, s1
    sample_indexable(texture2d)(float,float,float,float) r5.y, r6.zwzz, t2.yxzw, s1
    movc r6.xyzw, r0.wwww, l(-1.108253,-0.527921,-0.811297,1.442307), l(-0.811297,-1.442306,-1.108253,0.527921)
    mad r4.xyzw, r1.wwww, r6.xyzw, r4.xyzw
    sample_indexable(texture2d)(float,float,float,float) r2.x, r4.xyxx, t2.xyzw, s1
    sample_indexable(texture2d)(float,float,float,float) r5.z, r4.zwzz, t2.yzxw, s1
    mad r0.w, cb0[6].w, l(0.010000), r1.x
    sqrt r1.w, r1.x
    mad r1.w, -cb0[6].w, l(0.010000), r1.w
    mul r1.w, r1.w, r1.w
    mad r4.xyz, -r2.xyzx, l(999.000000, 999.000000, 999.000000, 0.000000), l(1000.000000, 1000.000000, 1000.000000, 0.000000)
    div r2.xyz, r2.xyzx, r4.xyzx
    lt r4.xyz, r2.xyzx, r1.wwww
    min r2.xyz, r0.wwww, r2.xyzx
    movc r2.xyz, r4.xyzx, -r1.xxxx, r2.xyzx
    mad r4.xyz, -r5.xyzx, l(999.000000, 999.000000, 999.000000, 0.000000), l(1000.000000, 1000.000000, 1000.000000, 0.000000)
    div r4.xyz, r5.xyzx, r4.xyzx
    lt r5.xyz, r4.xyzx, r1.wwww
    min r4.xyz, r0.wwww, r4.xyzx
    movc r4.xyz, r5.xyzx, -r1.xxxx, r4.xyzx
    ge r5.xyz, r2.zxyz, l(0.000000, 0.000000, 0.000000, 0.000000)
    mad r6.xyz, r1.xxxx, l(2.000000, 2.000000, 2.000000, 0.000000), -|r4.zxyz|
    movc r5.xyz, r5.xyzx, r2.zxyz, r6.xyzx
    ge r6.xyz, r4.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
    mad r2.xyz, r1.xxxx, l(2.000000, 2.000000, 2.000000, 0.000000), -|r2.xyzx|
    movc r2.xyz, r6.xyzx, r4.xyzx, r2.xyzx
    add r4.xyz, -r2.xyzx, r5.zxyz
    add r6.xyz, -r5.xyzx, r2.xyzx
    mul r6.xyz, r6.xyzx, r6.xyzx
    mad r4.xyz, r4.xyzx, r4.xyzx, r6.xyzx
    dp3 r0.w, r4.xyzx, l(0.083333, 0.083333, 0.083333, 0.000000)
    sqrt r0.w, r0.w
    mad r0.w, cb0[6].z, l(0.000000), r0.w
    min r4.xyz, r2.xyzx, r5.zxyz
    max r6.xyz, r2.xyzx, r5.zxyz
    add r4.xyz, -r0.wwww, r4.xyzx
    add r6.xyz, r0.wwww, r6.xyzx
    add r7.xyz, r1.xxxx, -r4.xyzx
    add r4.xyz, -r4.xyzx, r6.xyzx
    div_sat r4.xyz, r7.xyzx, r4.xyzx
    mad r4.xyz, r4.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)
    min r6.xyz, r5.xyzx, r2.xyzx
    max r2.xyz, r5.xyzx, r2.xyzx
    add r5.xyz, -r0.wwww, r6.xyzx
    add r2.xyz, r0.wwww, r2.xyzx
    add r6.xyz, r1.xxxx, -r5.xyzx
    add r2.xyz, -r5.xyzx, r2.xyzx
    div_sat r2.xyz, r6.xyzx, r2.xyzx
    mad r2.xyz, r2.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r4.xyzx
    add r2.xyz, r2.xyzx, l(-1.000000, -1.000000, -1.000000, 0.000000)
    mad r0.w, r1.y, l(50.000000), l(0.500000)
    mul r2.xyz, r0.wwww, r2.xyzx
    dp3 r0.w, r2.xyzx, l(0.166667, 0.166667, 0.166667, 0.000000)
  else 
    mov r0.w, l(0)
  endif 
  ieq r2.xyz, cb0[5].xxxx, l(2, 1, 4, 0)
  mad r1.y, -r1.z, l(0.330000), l(1.000000)
  div r1.y, l(0.330000), r1.y
  movc r3.xyz, r2.xxxx, r1.yyyy, r3.xyzx
  div r1.y, r1.x, cb0[5].w
  add r1.y, -r1.y, l(1.000000)
  add_sat r1.y, r1.y, r1.y
  mul r0.w, r0.w, r1.y
  lt r1.y, r0.w, l(0.000000)
  mul r4.xy, r0.wwww, cb0[2].yxyy
  mul r1.w, r3.w, r4.x
  mad r1.w, -r1.w, l(0.500000), l(1.000000)
  mul r4.xzw, r1.wwww, r3.xxyz
  lt r0.w, l(0.000000), r0.w
  mul r1.w, r4.y, l(1.800000)
  mul r5.xyz, r1.wwww, r3.xyzx
  min r5.xyz, r5.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  mad r1.w, -r1.w, r3.w, l(1.000000)
  mad r5.xyz, r3.xyzx, r1.wwww, r5.xyzx
  mul r6.xyz, r3.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000)
  max r5.xyz, r5.xyzx, r6.xyzx
  min r5.xyz, r3.xyzx, r5.xyzx
  movc r3.xyz, r0.wwww, r5.xyzx, r3.xyzx
  movc r3.xyz, r1.yyyy, r4.xzwx, r3.xyzx
  mad r1.yzw, r1.zzzz, r3.xxyz, l(0.000000, 1.000000, 1.000000, 1.000000)
  div r1.yzw, r3.xxyz, r1.yyzw
  movc r1.yzw, cb0[0].wwww, r1.yyzw, r3.xxyz
  mul r0.w, r2.w, r2.w
  add r3.xyz, -r1.zzzz, l(0.000000, 1.000000, 0.000000, 0.000000)
  mad r3.xyz, r0.wwww, r3.xyzx, r1.zzzz
  movc r1.yzw, r2.yyyy, r3.xxyz, r1.yyzw
  add r2.xyw, -r1.xxxx, l(0.000000, 1.000000, 0.000000, 0.000000)
  mad r2.xyw, r0.wwww, r2.xyxw, r1.xxxx
  movc r0.xyz, r2.zzzz, r2.xywx, r1.yzwy
endif 
ieq r0.w, cb0[5].x, l(3)
movc o0.xyz, r0.wwww, r1.xxxx, r0.xyzx
ret 
// Approximately 276 instruction slots used