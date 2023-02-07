//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int2 inp_video_size;               // Offset:    0 Size:     8 [unused]
//   int resize_method;                 // Offset:    8 Size:     4 [unused]
//   bool ROTATED;                      // Offset:   12 Size:     4 [unused]
//   int inp_screen_ratio;              // Offset:   16 Size:     4 [unused]
//   int inp_game_ratio;                // Offset:   20 Size:     4 [unused]
//   float2 aspect_ratio;               // Offset:   24 Size:     8 [unused]
//   bool USE_BACKGROUND;               // Offset:   32 Size:     4 [unused]
//   bool USE_OFF_BEZEL;                // Offset:   36 Size:     4 [unused]
//   float2 arts_aspect_ratio;          // Offset:   40 Size:     8 [unused]
//   float3 bg_col;                     // Offset:   48 Size:    12 [unused]
//   bool CRT_EFFECT;                   // Offset:   60 Size:     4 [unused]
//   float2 texture_size;               // Offset:   64 Size:     8 [unused]
//   float2 buffer_offset;              // Offset:   72 Size:     8 [unused]
//   bool CURVATURE;                    // Offset:   80 Size:     4 [unused]
//   bool VERTICAL_SCANLINES;           // Offset:   84 Size:     4 [unused]
//   int aperture_type;                 // Offset:   88 Size:     4 [unused]
//   float dotmask;                     // Offset:   92 Size:     4 [unused]
//   float sharper;                     // Offset:   96 Size:     4 [unused]
//   bool OVERSAMPLE;                   // Offset:  100 Size:     4 [unused]
//   float ovs_boost;                   // Offset:  104 Size:     4 [unused]
//   float lum;                         // Offset:  108 Size:     4 [unused]
//   float CRTgamma;                    // Offset:  112 Size:     4 [unused]
//   float monitorgamma;                // Offset:  116 Size:     4
//   float R;                           // Offset:  120 Size:     4 [unused]
//   float d;                           // Offset:  124 Size:     4 [unused]
//   float2 tilt;                       // Offset:  128 Size:     8 [unused]
//   float cornersize;                  // Offset:  136 Size:     4 [unused]
//   float cornersmooth;                // Offset:  140 Size:     4 [unused]
//   bool BLOOM;                        // Offset:  144 Size:     4 [unused]
//   float BloomBlurOffset;             // Offset:  148 Size:     4 [unused]
//   float BloomStrength;               // Offset:  152 Size:     4 [unused]
//   float BloomContrast;               // Offset:  156 Size:     4 [unused]
//   bool USE_BEZEL;                    // Offset:  160 Size:     4 [unused]
//   bool USE_FRAME;                    // Offset:  164 Size:     4 [unused]
//   bool USE_OVERLAY;                  // Offset:  168 Size:     4 [unused]
//   float2 h_starts;                   // Offset:  176 Size:     8 [unused]
//   float2 v_starts;                   // Offset:  184 Size:     8 [unused]
//   float2 overscan;                   // Offset:  192 Size:     8 [unused]
//   float2 src_offsets;                // Offset:  200 Size:     8 [unused]
//   bool PASS_THROUGH_BORDERS;         // Offset:  208 Size:     4 [unused]
//   float2 ext_zoom;                   // Offset:  212 Size:     8 [unused]
//   float2 ext_offsets;                // Offset:  224 Size:     8 [unused]
//   bool ACTIVATION_PIXEL_TEST;        // Offset:  232 Size:     4 [unused]
//   float test_epsilon;                // Offset:  236 Size:     4 [unused]
//   int2 test_pixel;                   // Offset:  240 Size:     8 [unused]
//   float3 test_color;                 // Offset:  256 Size:    12 [unused]
//   int2 test_pixel2;                  // Offset:  272 Size:     8 [unused]
//   float3 test_color2;                // Offset:  288 Size:    12 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[8], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 1
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
log r0.xyz, |r0.xyzx|
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[7].y
mul r0.xyz, r0.xyzx, r0.wwww
exp o0.xyz, r0.xyzx
ret 
// Approximately 6 instruction slots used
