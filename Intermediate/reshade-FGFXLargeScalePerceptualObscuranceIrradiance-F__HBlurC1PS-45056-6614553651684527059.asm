//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int _1;                            // Offset:    0 Size:     4 [unused]
//   bool LSPOIrrEffectEnabled;         // Offset:    4 Size:     4 [unused]
//   float LSPOIrrEffectIntensity;      // Offset:    8 Size:     4 [unused]
//   float LSPOIrrOcclusionIntensity;   // Offset:   12 Size:     4 [unused]
//   float LSPOIrrIrradianceIntensity;  // Offset:   16 Size:     4 [unused]
//   float LSPOIrrEffectRadius;         // Offset:   20 Size:     4
//   float LSPOIrrEffectSaturation;     // Offset:   24 Size:     4 [unused]
//   float LSPOIrrOcclusionIrradianceRecovery;// Offset:   28 Size:     4 [unused]
//   float LSPOIrrAutoGain;             // Offset:   32 Size:     4 [unused]
//   float LSPOIrrGamma;                // Offset:   36 Size:     4 [unused]
//   float LSPOIrrGain;                 // Offset:   40 Size:     4 [unused]
//   float LSPOIrrContrast;             // Offset:   44 Size:     4 [unused]
//   float LSPOIrrSaturation;           // Offset:   48 Size:     4 [unused]
//   int LSPOIrrDebugType;              // Offset:   52 Size:     4 [unused]
//   int _15;                           // Offset:   56 Size:     4 [unused]
//   int _16;                           // Offset:   60 Size:     4 [unused]
//   int _17;                           // Offset:   64 Size:     4 [unused]
//   int _18;                           // Offset:   68 Size:     4 [unused]
//   int _19;                           // Offset:   72 Size:     4 [unused]
//   float FrameTime;                   // Offset:   76 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__VBlurTex                     texture  float4          2d            t14      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t14.xyzw, s0
mad r1.x, -cb0[1].y, l(0.037500), v1.x
mov r1.yw, v1.yyyy
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t14.xyzw, s0
add r0.xyz, r0.xyzx, r2.xyzx
mad r1.z, cb0[1].y, l(0.037500), v1.x
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t14.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
mul o0.xyz, r0.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
ret 
// Approximately 10 instruction slots used
