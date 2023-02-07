//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int _844;                          // Offset:    0 Size:     4 [unused]
//   float Brightness;                  // Offset:    4 Size:     4 [unused]
//   float Saturation;                  // Offset:    8 Size:     4 [unused]
//   float Threshold;                   // Offset:   12 Size:     4 [unused]
//   float EdgesMasking;                // Offset:   16 Size:     4 [unused]
//   int Tonemapper;                    // Offset:   20 Size:     4 [unused]
//   float BokehAngle;                  // Offset:   24 Size:     4
//   float BokehSize;                   // Offset:   28 Size:     4
//   float BokehDefinition;             // Offset:   32 Size:     4
//   float4 Tint1;                      // Offset:   48 Size:    16 [unused]
//   float4 Tint2;                      // Offset:   64 Size:    16 [unused]
//   float4 Tint3;                      // Offset:   80 Size:    16 [unused]
//   float4 Tint4;                      // Offset:   96 Size:    16 [unused]
//   float4 Tint5;                      // Offset:  112 Size:    16 [unused]
//   float4 Tint6;                      // Offset:  128 Size:    16 [unused]
//   float4 Tint7;                      // Offset:  144 Size:    16 [unused]
//   float Scale1;                      // Offset:  160 Size:     4 [unused]
//   float Scale2;                      // Offset:  164 Size:     4 [unused]
//   float Scale3;                      // Offset:  168 Size:     4 [unused]
//   float Scale4;                      // Offset:  172 Size:     4 [unused]
//   float Scale5;                      // Offset:  176 Size:     4 [unused]
//   float Scale6;                      // Offset:  180 Size:     4 [unused]
//   float Scale7;                      // Offset:  184 Size:     4 [unused]
//   bool ShowLens;                     // Offset:  188 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__FXShaders__UnrealLens__LensATex    texture  float4          2d             t2      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
mul r0.xy, cb0[1].wzww, l(4.000000, 1.047197, 0.000000, 0.000000)
sincos r1.x, r2.x, r0.y
mov r2.xz, r2.xxxx
mov r2.yw, r1.xxxx
mul r0.xyzw, r0.xxxx, r2.xyzw
mad r0.zw, -r0.zzzw, l(0.000000, 0.000000, 0.002083, 0.003704), v1.xxxy
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r2.xyzw, r1.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
mad r2.xyzw, -r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r2.xyzw
mul r1.xyzw, r1.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111)
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r3.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r3.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r3.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r3.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r3.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r3.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r3.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r3.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
max r3.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r3.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r0.zwzz, t2.xyzw, s0
mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926), r0.zzzw
mad r0.xy, r0.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000), r0.zwzz
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r0.zwzz, t2.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.xyxx, t2.xyzw, s0
max r4.xyzw, r1.xyzw, r2.xyzw
mad r1.xyzw, r2.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r4.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
max r2.xyzw, r3.xyzw, r1.xyzw
mad r1.xyzw, r3.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r2.xyzw, -r1.xyzw, r2.xyzw
mad r1.xyzw, cb0[2].xxxx, r2.xyzw, r1.xyzw
max r2.xyzw, r0.xyzw, r1.xyzw
mad r0.xyzw, r0.xyzw, l(0.111111, 0.111111, 0.111111, 0.111111), r1.xyzw
add r1.xyzw, -r0.xyzw, r2.xyzw
mad o0.xyzw, cb0[2].xxxx, r1.xyzw, r0.xyzw
ret 
// Approximately 60 instruction slots used
