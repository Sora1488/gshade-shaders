//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int ResolutionX;                   // Offset:    0 Size:     4 [unused]
//   int ResolutionY;                   // Offset:    4 Size:     4 [unused]
//   float TATE;                        // Offset:    8 Size:     4 [unused]
//   float IOS;                         // Offset:   12 Size:     4 [unused]
//   float OS;                          // Offset:   16 Size:     4 [unused]
//   float blm1;                        // Offset:   20 Size:     4 [unused]
//   float brightboost1;                // Offset:   24 Size:     4 [unused]
//   float brightboost2;                // Offset:   28 Size:     4 [unused]
//   float gsl;                         // Offset:   32 Size:     4 [unused]
//   float scanline1;                   // Offset:   36 Size:     4 [unused]
//   float scanline2;                   // Offset:   40 Size:     4 [unused]
//   float beam_min;                    // Offset:   44 Size:     4 [unused]
//   float beam_max;                    // Offset:   48 Size:     4 [unused]
//   float beam_size;                   // Offset:   52 Size:     4 [unused]
//   float spike;                       // Offset:   56 Size:     4 [unused]
//   float h_sharp;                     // Offset:   60 Size:     4 [unused]
//   float s_sharp;                     // Offset:   64 Size:     4 [unused]
//   float csize;                       // Offset:   68 Size:     4 [unused]
//   float bsize;                       // Offset:   72 Size:     4 [unused]
//   float warpX;                       // Offset:   76 Size:     4 [unused]
//   float warpY;                       // Offset:   80 Size:     4 [unused]
//   float glow;                        // Offset:   84 Size:     4 [unused]
//   uint shadowMask;                   // Offset:   88 Size:     4 [unused]
//   float masksize;                    // Offset:   92 Size:     4 [unused]
//   float vertmask;                    // Offset:   96 Size:     4 [unused]
//   float slotmask;                    // Offset:  100 Size:     4 [unused]
//   float slotwidth;                   // Offset:  104 Size:     4 [unused]
//   float double_slot;                 // Offset:  108 Size:     4 [unused]
//   float slotms;                      // Offset:  112 Size:     4 [unused]
//   float mcut;                        // Offset:  116 Size:     4 [unused]
//   float maskDark;                    // Offset:  120 Size:     4 [unused]
//   float maskLight;                   // Offset:  124 Size:     4 [unused]
//   float CGWG;                        // Offset:  128 Size:     4 [unused]
//   float gamma_in;                    // Offset:  132 Size:     4
//   float gamma_out;                   // Offset:  136 Size:     4 [unused]
//   float inter;                       // Offset:  140 Size:     4 [unused]
//   float interm;                      // Offset:  144 Size:     4 [unused]
//   float blm2;                        // Offset:  148 Size:     4 [unused]
//   float scans;                       // Offset:  152 Size:     4 [unused]
//   int framecount;                    // Offset:  156 Size:     4 [unused]
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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[9], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 1
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
log r0.xyzw, |r0.xyzw|
mul r0.xyzw, r0.xyzw, cb0[8].yyyy
exp o0.xyzw, r0.xyzw
ret 
// Approximately 5 instruction slots used