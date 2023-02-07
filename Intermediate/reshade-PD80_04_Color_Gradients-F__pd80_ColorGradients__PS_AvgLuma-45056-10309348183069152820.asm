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
//   int luma_mode;                     // Offset:    8 Size:     4 [unused]
//   int separation_mode;               // Offset:   12 Size:     4 [unused]
//   bool enable_dither;                // Offset:   16 Size:     4 [unused]
//   float dither_strength;             // Offset:   20 Size:     4 [unused]
//   float CGdesat;                     // Offset:   24 Size:     4 [unused]
//   float finalmix;                    // Offset:   28 Size:     4 [unused]
//   float3 blendcolor_ls_m;            // Offset:   32 Size:    12 [unused]
//   int blendmode_ls_m;                // Offset:   44 Size:     4 [unused]
//   float opacity_ls_m;                // Offset:   48 Size:     4 [unused]
//   float3 blendcolor_ls_s;            // Offset:   52 Size:    12 [unused]
//   int blendmode_ls_s;                // Offset:   64 Size:     4 [unused]
//   float opacity_ls_s;                // Offset:   68 Size:     4 [unused]
//   bool enable_ds;                    // Offset:   72 Size:     4 [unused]
//   float3 blendcolor_ds_m;            // Offset:   80 Size:    12 [unused]
//   int blendmode_ds_m;                // Offset:   92 Size:     4 [unused]
//   float opacity_ds_m;                // Offset:   96 Size:     4 [unused]
//   float3 blendcolor_ds_s;            // Offset:  100 Size:    12 [unused]
//   int blendmode_ds_s;                // Offset:  112 Size:     4 [unused]
//   float opacity_ds_s;                // Offset:  116 Size:     4 [unused]
//   float minlevel;                    // Offset:  120 Size:     4 [unused]
//   float maxlevel;                    // Offset:  124 Size:     4 [unused]
//   float Frametime;                   // Offset:  128 Size:     4
//   float2 pingpong;                   // Offset:  132 Size:     8 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__pd80_ColorGradients__texLuma    texture  float4          2d            t10      1 
// __V__pd80_ColorGradients__texPrevAvgLuma    texture  float4          2d            t14      1 
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
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[9], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_output o0.x
dcl_temps 1
mul_sat r0.x, cb0[8].x, l(0.003000)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, l(0.500000, 0.500000, 0.000000, 0.000000), t10.yxzw, s0, l(8.000000)
sample_indexable(texture2d)(float,float,float,float) r0.z, l(0.500000, 0.500000, 0.000000, 0.000000), t14.yzxw, s0
add r0.y, -r0.z, r0.y
mad o0.x, r0.x, r0.y, r0.z
ret 
// Approximately 6 instruction slots used