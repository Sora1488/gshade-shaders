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
//   bool LSPOIrrEffectEnabled;         // Offset:    4 Size:     4
//   float LSPOIrrEffectIntensity;      // Offset:    8 Size:     4
//   float LSPOIrrOcclusionIntensity;   // Offset:   12 Size:     4
//   float LSPOIrrIrradianceIntensity;  // Offset:   16 Size:     4
//   float LSPOIrrEffectRadius;         // Offset:   20 Size:     4 [unused]
//   float LSPOIrrEffectSaturation;     // Offset:   24 Size:     4
//   float LSPOIrrOcclusionIrradianceRecovery;// Offset:   28 Size:     4
//   float LSPOIrrAutoGain;             // Offset:   32 Size:     4
//   float LSPOIrrGamma;                // Offset:   36 Size:     4
//   float LSPOIrrGain;                 // Offset:   40 Size:     4
//   float LSPOIrrContrast;             // Offset:   44 Size:     4
//   float LSPOIrrSaturation;           // Offset:   48 Size:     4
//   int LSPOIrrDebugType;              // Offset:   52 Size:     4
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
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__VBlurTex                     texture  float4          2d            t14      1 
// __V__ShortBlurTex                 texture  float4          2d            t16      1 
// __V__BlurMaxHistoryTex            texture  float4          2d            t20      1 
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
dcl_constantbuffer CB0[4], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t20
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 7
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
if_z cb0[0].y
  mov o0.xyz, r0.xyzx
  ret 
endif 
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t14.xyzw, s0
ieq r0.w, cb0[3].y, l(3)
if_nz r0.w
  mov o0.xyz, r1.xyzx
  ret 
endif 
add r0.w, r1.y, r1.x
add r0.w, r1.z, r0.w
mul r1.w, r0.w, l(0.333333)
mad r1.xyz, -r0.wwww, l(0.333333, 0.333333, 0.333333, 0.000000), r1.xyzx
mad r1.xyz, cb0[1].zzzz, r1.xyzx, r1.wwww
ieq r0.w, cb0[3].y, l(4)
if_nz r0.w
  mov o0.xyz, r1.xyzx
  ret 
endif 
ieq r0.w, cb0[3].y, l(7)
if_nz r0.w
  ge r2.xyz, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
  movc r2.xyz, r2.xyzx, l(0,0,0,0), l(1.000000,1.000000,1.000000,0)
  add r2.xyz, -r0.xyzx, r2.xyzx
  mad o0.xyz, r2.xyzx, l(0.650000, 0.650000, 0.650000, 0.000000), r0.xyzx
  ret 
endif 
ieq r0.w, cb0[3].y, l(8)
if_nz r0.w
  add r2.xyzw, -v1.xyxx, l(0.350000, 0.350000, 0.400000, 0.450000)
  mul r3.xyzw, r2.xzwx, l(1.777778, 1.777778, 1.777778, 1.777778)
  mul r0.w, r2.y, r2.y
  mad r2.xyz, r3.wyzw, r3.wyzw, r0.wwww
  sqrt r2.xyz, r2.xyzx
  add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r2.xyz, r2.xyzx
  mul r2.xyz, r2.xyzx, l(100.000000, 100.000000, 100.000000, 0.000000)
  exp r2.xyz, r2.xyzx
  lt r2.xyz, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
  and r2.xyz, r2.xyzx, l(0x3f000000, 0x3f000000, 0x3f000000, 0)
  add r1.w, r2.y, r2.x
  add r1.w, r2.z, r1.w
  add r2.xyzw, -v1.xxxx, l(0.500000, 0.550000, 0.600000, 0.650000)
  mul r2.xyzw, r2.xyzw, l(1.777778, 1.777778, 1.777778, 1.777778)
  mad r4.xyzw, r2.xyzw, r2.xyzw, r0.wwww
  sqrt r4.xyzw, r4.xyzw
  add r4.xyzw, -r4.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r4.xyzw, r4.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r4.xyzw, r4.xyzw
  mul r4.xyzw, r4.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r4.xyzw, r4.xyzw
  lt r4.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r4.xyzw
  and r4.xyzw, r4.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r1.w, r4.x
  add r0.w, r4.y, r0.w
  add r0.w, r4.z, r0.w
  add r0.w, r4.w, r0.w
  add r4.xyzw, -v1.yyyy, l(0.400000, 0.450000, 0.500000, 0.550000)
  mul r4.xyzw, r4.xyzw, r4.xyzw
  mad r5.xyzw, r3.wyzw, r3.wyzw, r4.xxxy
  sqrt r5.xyzw, r5.xyzw
  add r5.xyzw, -r5.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r5.xyzw, r5.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r5.xyzw, r5.xyzw
  mul r5.xyzw, r5.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r5.xyzw, r5.xyzw
  lt r5.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r5.xyzw
  and r5.xyzw, r5.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r5.x
  add r0.w, r5.y, r0.w
  add r0.w, r5.z, r0.w
  mad r6.xyzw, r2.xyzw, r2.xyzw, r4.xxxx
  sqrt r6.xyzw, r6.xyzw
  add r6.xyzw, -r6.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r6.xyzw, r6.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r6.xyzw, r6.xyzw
  mul r6.xyzw, r6.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r6.xyzw, r6.xyzw
  lt r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r6.xyzw
  and r6.xyzw, r6.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r6.x
  add r0.w, r6.y, r0.w
  add r0.w, r6.z, r0.w
  add r0.w, r6.w, r0.w
  add r0.w, r5.w, r0.w
  mad r5.xyzw, r3.yzwy, r3.yzwy, r4.yyzz
  sqrt r5.xyzw, r5.xyzw
  add r5.xyzw, -r5.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r5.xyzw, r5.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r5.xyzw, r5.xyzw
  mul r5.xyzw, r5.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r5.xyzw, r5.xyzw
  lt r5.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r5.xyzw
  and r5.xyzw, r5.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r5.x
  add r0.w, r5.y, r0.w
  mad r6.xyzw, r2.xyzw, r2.xyzw, r4.yyyy
  sqrt r6.xyzw, r6.xyzw
  add r6.xyzw, -r6.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r6.xyzw, r6.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r6.xyzw, r6.xyzw
  mul r6.xyzw, r6.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r6.xyzw, r6.xyzw
  lt r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r6.xyzw
  and r6.xyzw, r6.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r6.x
  add r0.w, r6.y, r0.w
  add r0.w, r6.z, r0.w
  add r0.w, r6.w, r0.w
  add r0.w, r5.z, r0.w
  add r0.w, r5.w, r0.w
  mad r5.xyzw, r3.zwyz, r3.zwyz, r4.zwww
  sqrt r5.xyzw, r5.xyzw
  add r5.xyzw, -r5.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r5.xyzw, r5.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r5.xyzw, r5.xyzw
  mul r5.xyzw, r5.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r5.xyzw, r5.xyzw
  lt r5.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r5.xyzw
  and r5.xyzw, r5.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r5.x
  mad r6.xyzw, r2.xyzw, r2.xyzw, r4.zzzz
  sqrt r6.xyzw, r6.xyzw
  add r6.xyzw, -r6.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r6.xyzw, r6.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r6.xyzw, r6.xyzw
  mul r6.xyzw, r6.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r6.xyzw, r6.xyzw
  lt r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r6.xyzw
  and r6.xyzw, r6.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r6.x
  add r0.w, r6.y, r0.w
  add r0.w, r6.z, r0.w
  add r0.w, r6.w, r0.w
  add r0.w, r5.y, r0.w
  add r0.w, r5.z, r0.w
  add r0.w, r5.w, r0.w
  mad r4.xyzw, r2.xyzw, r2.xyzw, r4.wwww
  sqrt r4.xyzw, r4.xyzw
  add r4.xyzw, -r4.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r4.xyzw, r4.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r4.xyzw, r4.xyzw
  mul r4.xyzw, r4.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r4.xyzw, r4.xyzw
  lt r4.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r4.xyzw
  and r4.xyzw, r4.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r4.x
  add r0.w, r4.y, r0.w
  add r0.w, r4.z, r0.w
  add r0.w, r4.w, r0.w
  add r4.xyzw, -v1.yyyy, l(0.600000, 0.600000, 0.600000, 0.650000)
  mul r4.xyzw, r4.xyzw, r4.xyzw
  mad r5.xyzw, r3.xyzw, r3.xyzw, r4.xyzw
  sqrt r5.xyzw, r5.xyzw
  add r5.xyzw, -r5.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r5.xyzw, r5.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r5.xyzw, r5.xyzw
  mul r5.xyzw, r5.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r5.xyzw, r5.xyzw
  lt r5.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r5.xyzw
  and r5.xyzw, r5.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r5.x
  add r0.w, r5.y, r0.w
  add r0.w, r5.z, r0.w
  mad r6.xyzw, r2.xyzw, r2.xyzw, r4.zzzz
  sqrt r6.xyzw, r6.xyzw
  add r6.xyzw, -r6.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r6.xyzw, r6.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r6.xyzw, r6.xyzw
  mul r6.xyzw, r6.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r6.xyzw, r6.xyzw
  lt r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r6.xyzw
  and r6.xyzw, r6.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r6.x
  add r0.w, r6.y, r0.w
  add r0.w, r6.z, r0.w
  add r0.w, r6.w, r0.w
  add r0.w, r5.w, r0.w
  mad r3.xy, r3.yzyy, r3.yzyy, r4.wwww
  sqrt r3.xy, r3.xyxx
  add r3.xy, -r3.xyxx, l(1.000000, 1.000000, 0.000000, 0.000000)
  max r3.xy, r3.xyxx, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r3.xy, r3.xyxx
  mul r3.xy, r3.xyxx, l(100.000000, 100.000000, 0.000000, 0.000000)
  exp r3.xy, r3.xyxx
  lt r3.xy, l(0.500000, 0.500000, 0.000000, 0.000000), r3.xyxx
  and r3.xy, r3.xyxx, l(0x3f000000, 0x3f000000, 0, 0)
  add r0.w, r0.w, r3.x
  add r0.w, r3.y, r0.w
  mad r2.xyzw, r2.xyzw, r2.xyzw, r4.wwww
  sqrt r2.xyzw, r2.xyzw
  add r2.xyzw, -r2.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
  max r2.xyzw, r2.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
  log r2.xyzw, r2.xyzw
  mul r2.xyzw, r2.xyzw, l(100.000000, 100.000000, 100.000000, 100.000000)
  exp r2.xyzw, r2.xyzw
  lt r2.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r2.xyzw
  and r2.xyzw, r2.xyzw, l(0x3f000000, 0x3f000000, 0x3f000000, 0x3f000000)
  add r0.w, r0.w, r2.x
  add r0.w, r2.y, r0.w
  add r0.w, r2.z, r0.w
  add r2.x, r2.w, r0.w
  mov r2.yz, l(0,0,0,0)
  lt r0.w, r2.x, l(0.010000)
  movc o0.xyz, r0.wwww, r0.xyzx, r2.xyzx
  ret 
endif 
sample_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t20.yzwx, s0
ieq r1.w, cb0[3].y, l(9)
if_nz r1.w
  mov o0.xyz, r0.wwww
  ret 
endif 
ge r1.w, l(0.050000), r0.w
if_nz r1.w
  mul r1.w, r0.w, l(399.999969)
else 
  div r1.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
endif 
max r0.w, r1.w, l(1.000000)
min r2.xyz, r0.wwww, l(4.000000, 4.000000, 4.000000, 0.000000)
ieq r0.w, cb0[3].y, l(10)
if_nz r0.w
  mov o0.xyz, r2.xyzx
  ret 
endif 
add r0.w, r2.z, l(-1.000000)
mad r0.w, cb0[2].x, r0.w, l(1.000000)
mul r2.xyz, r0.wwww, r1.xyzx
ieq r1.w, cb0[3].y, l(5)
if_nz r1.w
  mov o0.xyz, r2.xyzx
  ret 
endif 
mad r1.xyz, r1.xyzx, r0.wwww, l(-0.500000, -0.500000, -0.500000, 0.000000)
lt r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
movc r2.xyz, r2.xyzx, cb0[0].wwww, cb0[1].xxxx
mad r1.xyz, r1.xyzx, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
ieq r0.w, cb0[3].y, l(6)
if_nz r0.w
  mov o0.xyz, r1.xyzx
  ret 
endif 
lt r2.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
if_nz r2.x
  dp2 r0.w, r0.xxxx, r1.xxxx
else 
  add r1.w, -r0.x, l(1.000000)
  add r1.x, -r1.x, l(1.000000)
  dp2 r1.x, r1.wwww, r1.xxxx
  add r0.w, -r1.x, l(1.000000)
endif 
if_nz r2.y
  dp2 r1.x, r0.yyyy, r1.yyyy
else 
  add r1.w, -r0.y, l(1.000000)
  add r1.y, -r1.y, l(1.000000)
  dp2 r1.y, r1.wwww, r1.yyyy
  add r1.x, -r1.y, l(1.000000)
endif 
if_nz r2.z
  dp2 r1.y, r0.zzzz, r1.zzzz
else 
  add r1.w, -r0.z, l(1.000000)
  add r1.z, -r1.z, l(1.000000)
  dp2 r1.z, r1.wwww, r1.zzzz
  add r1.y, -r1.z, l(1.000000)
endif 
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t16.xyzw, s0
add r1.z, r2.y, r2.x
add r1.z, r2.z, r1.z
mad r2.xyz, -r1.zzzz, l(0.333333, 0.333333, 0.333333, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
ieq r1.w, cb0[3].y, l(11)
if_nz r1.w
  mov o0.xyz, r2.xyzx
  ret 
endif 
ieq r1.w, cb0[3].y, l(13)
if_nz r1.w
  ge r1.w, l(0.500000), r2.z
  movc r1.w, r1.w, l(0), l(1.000000)
  add r2.xyz, -r0.xyzx, r1.wwww
  mad o0.xyz, r2.xyzx, l(0.650000, 0.650000, 0.650000, 0.000000), r0.xyzx
  ret 
endif 
mad r1.z, -r1.z, l(0.333333), l(0.500000)
mul r1.w, r1.z, cb0[1].w
mad r1.z, r1.z, cb0[1].w, l(0.500000)
lt r1.z, r1.z, l(0.500000)
movc r1.z, r1.z, cb0[1].x, cb0[0].w
mad r2.xyz, r1.wwww, r1.zzzz, l(0.500000, 0.500000, 0.500000, 0.000000)
ieq r1.z, cb0[3].y, l(12)
if_nz r1.z
  mov o0.xyz, r2.xyzx
  ret 
endif 
lt r1.z, r0.w, l(0.500000)
if_nz r1.z
  dp2 r3.x, r0.wwww, r2.zzzz
else 
  add r0.w, -r0.w, l(1.000000)
  add r1.z, -r2.z, l(1.000000)
  dp2 r0.w, r0.wwww, r1.zzzz
  add r3.x, -r0.w, l(1.000000)
endif 
lt r0.w, r1.x, l(0.500000)
if_nz r0.w
  dp2 r3.y, r1.xxxx, r2.zzzz
else 
  add r0.w, -r1.x, l(1.000000)
  add r1.x, -r2.z, l(1.000000)
  dp2 r0.w, r0.wwww, r1.xxxx
  add r3.y, -r0.w, l(1.000000)
endif 
lt r0.w, r1.y, l(0.500000)
if_nz r0.w
  dp2 r3.z, r1.yyyy, r2.zzzz
else 
  add r0.w, -r1.y, l(1.000000)
  add r1.x, -r2.z, l(1.000000)
  dp2 r0.w, r0.wwww, r1.xxxx
  add r3.z, -r0.w, l(1.000000)
endif 
ieq r0.w, cb0[3].y, l(2)
if_nz r0.w
  mov o0.xyz, r3.xyzx
  ret 
endif 
max r1.xyz, r3.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r1.xyz, r1.xyzx
mul r1.xyz, r1.xyzx, cb0[2].yyyy
exp r1.xyz, r1.xyzx
mad r1.xyz, r1.xyzx, cb0[2].zzzz, l(-0.500000, -0.500000, -0.500000, 0.000000)
mad r1.xyz, r1.xyzx, cb0[2].wwww, l(0.500000, 0.500000, 0.500000, 0.000000)
add r0.w, r1.y, r1.x
add r0.w, r1.z, r0.w
mul r1.w, r0.w, l(0.333333)
mad r1.xyz, -r0.wwww, l(0.333333, 0.333333, 0.333333, 0.000000), r1.xyzx
mad r1.xyz, cb0[3].xxxx, r1.xyzx, r1.wwww
ieq r0.w, cb0[3].y, l(1)
if_nz r0.w
  mov o0.xyz, r1.xyzx
  ret 
endif 
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, cb0[0].zzzz, r1.xyzx, r0.xyzx
ret 
// Approximately 350 instruction slots used