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
//   bool fxaa_enabled;                 // Offset:    4 Size:     4 [unused]
//   bool sharp_enabled;                // Offset:    8 Size:     4 [unused]
//   bool ao_enabled;                   // Offset:   12 Size:     4 [unused]
//   bool dof_enabled;                  // Offset:   16 Size:     4 [unused]
//   bool depth_detect;                 // Offset:   20 Size:     4 [unused]
//   bool sky_detect;                   // Offset:   24 Size:     4 [unused]
//   float sharp_strength;              // Offset:   28 Size:     4 [unused]
//   float ao_strength;                 // Offset:   32 Size:     4 [unused]
//   float ao_shine_strength;           // Offset:   36 Size:     4 [unused]
//   float dof_strength;                // Offset:   40 Size:     4 [unused]
//   float gi_strength;                 // Offset:   44 Size:     4 [unused]
//   float gi_saturation;               // Offset:   48 Size:     4 [unused]
//   float gi_contrast;                 // Offset:   52 Size:     4 [unused]
//   bool gi_use_depth;                 // Offset:   56 Size:     4
//   float gi_ao_strength;              // Offset:   60 Size:     4 [unused]
//   float gi_local_ao_strength;        // Offset:   64 Size:     4 [unused]
//   float bounce_multiplier;           // Offset:   68 Size:     4 [unused]
//   float gi_shape;                    // Offset:   72 Size:     4 [unused]
//   bool gi_dof_safe_mode;             // Offset:   76 Size:     4 [unused]
//   int debug_mode;                    // Offset:   80 Size:     4 [unused]
//   bool ao_big_dither;                // Offset:   84 Size:     4 [unused]
//   float reduce_ao_in_light_areas;    // Offset:   88 Size:     4 [unused]
//   float ao_fog_fix;                  // Offset:   92 Size:     4 [unused]
//   float gi_max_distance;             // Offset:   96 Size:     4 [unused]
//   float ao_radius;                   // Offset:  100 Size:     4 [unused]
//   float ao_shape_modifier;           // Offset:  104 Size:     4 [unused]
//   float ao_max_depth_diff;           // Offset:  108 Size:     4 [unused]
//   float fxaa_bias;                   // Offset:  112 Size:     4 [unused]
//   float tone_map;                    // Offset:  116 Size:     4
//   float max_sharp_diff;              // Offset:  120 Size:     4 [unused]
//   bool edge_detect_sharpen;          // Offset:  124 Size:     4 [unused]
//   bool big_sharpen;                  // Offset:  128 Size:     4 [unused]
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
dcl_constantbuffer CB0[8], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t1.xyzw, s0
mov_sat r0.xyz, r0.xyzx
rcp r0.w, cb0[7].y
add r0.w, -r0.w, l(1.000000)
mad r1.xyz, -r0.wwww, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
div r0.xyz, r0.xyzx, r1.xyzx
if_nz cb0[3].z
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
  mad r1.x, -r0.w, l(999.000000), l(1000.000000)
  div r0.w, r0.w, r1.x
  dp3 r1.x, r0.xyzx, r0.xyzx
  sqrt r1.x, r1.x
  mul r1.y, r0.w, r0.w
  mad r1.xzw, r1.xxxx, l(0.707107, 0.000000, 0.707107, 0.707107), -r0.xxyz
  mad o0.xyz, r1.yyyy, r1.xzwx, r0.xyzx
  mov o0.w, r0.w
else 
  mov o0.xyz, r0.xyzx
  mov o0.w, l(0.500000)
endif 
ret 
// Approximately 21 instruction slots used
