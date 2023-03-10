//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Blend_Amount;                // Offset:    0 Size:     4 [unused]
//   float Contrast_R;                  // Offset:    4 Size:     4
//   float Contrast_G;                  // Offset:    8 Size:     4
//   float Contrast_B;                  // Offset:   12 Size:     4
//   float Gamma_R;                     // Offset:   16 Size:     4
//   float Gamma_G;                     // Offset:   20 Size:     4
//   float Gamma_B;                     // Offset:   24 Size:     4
//   bool Enable_Diffusion;             // Offset:   28 Size:     4 [unused]
//   bool Enable_Static_Dither;         // Offset:   32 Size:     4 [unused]
//   float Diffusion_1_Amount;          // Offset:   36 Size:     4 [unused]
//   int Diffusion_1_Radius;            // Offset:   40 Size:     4 [unused]
//   float Diffusion_1_Gamma;           // Offset:   44 Size:     4 [unused]
//   float Diffusion_1_Quality;         // Offset:   48 Size:     4 [unused]
//   float Diffusion_1_Desaturate;      // Offset:   52 Size:     4 [unused]
//   float Diffusion_2_Amount;          // Offset:   56 Size:     4 [unused]
//   int Diffusion_2_Radius;            // Offset:   60 Size:     4 [unused]
//   float Diffusion_2_Gamma;           // Offset:   64 Size:     4 [unused]
//   float Diffusion_2_Quality;         // Offset:   68 Size:     4 [unused]
//   float Diffusion_2_Desaturate;      // Offset:   72 Size:     4 [unused]
//   float Diffusion_3_Amount;          // Offset:   76 Size:     4 [unused]
//   int Diffusion_3_Radius;            // Offset:   80 Size:     4 [unused]
//   float Diffusion_3_Gamma;           // Offset:   84 Size:     4 [unused]
//   float Diffusion_3_Quality;         // Offset:   88 Size:     4 [unused]
//   float Diffusion_3_Desaturate;      // Offset:   92 Size:     4 [unused]
//   bool Enable_Bleach_Bypass;         // Offset:   96 Size:     4 [unused]
//   float Bleach_Bypass_Amount;        // Offset:  100 Size:     4 [unused]
//   bool Enable_Dither;                // Offset:  104 Size:     4 [unused]
//   float framecount;                  // Offset:  108 Size:     4 [unused]
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
max r1.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r1.xyz, r1.xyzx
mul r1.xyz, r1.xyzx, cb0[1].xyzx
exp r2.xyz, r1.xyzx
mul r1.xyz, r1.xyzx, cb0[0].yzwy
exp r1.xyz, r1.xyzx
add r3.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
lt r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
max r3.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r3.xyz, r3.xyzx
mul r3.xyz, r3.xyzx, cb0[0].yzwy
exp r3.xyz, r3.xyzx
exp r4.xyz, cb0[0].yzwy
mul r3.xyz, r3.xyzx, r4.xyzx
mul r1.xyz, r1.xyzx, r4.xyzx
mul r1.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
mad r3.xyz, -r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
movc r0.xyz, r2.xyzx, r1.xyzx, r3.xyzx
mul r1.xy, r0.yzyy, l(0.800000, 0.200000, 0.000000, 0.000000)
add r0.y, r1.y, r1.x
add r1.x, -r0.y, r0.x
add_sat r1.x, -r0.z, r1.x
mad r1.x, -r1.x, l(0.600000), l(1.000000)
mul r1.xyzw, r0.xyzw, r1.xxxx
add r0.w, -r0.x, r0.y
add r0.x, -r0.x, r0.z
add_sat r0.xw, -r0.yyyz, r0.xxxw
mad r0.x, -r0.x, l(0.300000), l(1.000000)
mad r0.y, -r0.w, l(0.800000), l(1.000000)
mul r1.xyzw, r0.yyyy, r1.xyzw
mul o0.xyzw, r0.xxxx, r1.xyzw
ret 
// Approximately 33 instruction slots used
