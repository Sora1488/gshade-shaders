//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float fMXAOAmbientOcclusionAmount; // Offset:    0 Size:     4 [unused]
//   float fMXAOSampleRadius;           // Offset:    4 Size:     4 [unused]
//   float iMXAOSampleCount;            // Offset:    8 Size:     4 [unused]
//   float iMXAOBayerDitherLevel;       // Offset:   12 Size:     4
//   float fMXAONormalBias;             // Offset:   16 Size:     4 [unused]
//   bool bMXAOSmoothNormalsEnable;     // Offset:   20 Size:     4 [unused]
//   float fMXAOBlurSharpness;          // Offset:   24 Size:     4 [unused]
//   float fMXAOBlurSteps;              // Offset:   28 Size:     4 [unused]
//   bool bMXAODebugViewEnable;         // Offset:   32 Size:     4 [unused]
//   float fMXAOFadeoutStart;           // Offset:   36 Size:     4 [unused]
//   float fMXAOFadeoutEnd;             // Offset:   40 Size:     4 [unused]
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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
// SV_TARGET                1   xyzw        1   TARGET   float   xyzw
// SV_TARGET                2   xyzw        2   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.xyzw
dcl_output o2.xyzw
dcl_temps 6
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
mad r1.xy, v1.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
mul r0.yz, r0.xxxx, r1.xxyx
mul r0.xyz, r0.xyzx, l(1000.000000, 1000.000000, 1000.000000, 0.000000)
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, -0.000000)
mad r2.xyzw, r1.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r3.y, r0.w, r1.x
mul r3.xz, r2.yyxy, r3.yyyy
mad r3.xyz, r3.xyzx, l(1000.000000, 1000.000000, 1000.000000, 0.000000), -r0.zxyz
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div r1.y, r0.w, r1.x
mul r1.xz, r1.yyyy, r2.wwzw
mad r1.xyz, -r1.xyzx, l(1000.000000, 1000.000000, 1000.000000, 0.000000), r0.zxyz
add r2.xyzw, v1.xyxy, l(0.000000, 0.000926, -0.000000, -0.000926)
mad r4.xyzw, r2.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r2.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.w, -r0.w, l(999.000000), l(1000.000000)
div r5.x, r0.w, r1.w
mul r5.yz, r4.xxyx, r5.xxxx
mad r5.xyz, r5.xyzx, l(1000.000000, 1000.000000, 1000.000000, 0.000000), -r0.xyzx
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r2.zwzz, t2.yzwx, s0, l(0.000000)
mad r1.w, -r0.w, l(999.000000), l(1000.000000)
div r2.x, r0.w, r1.w
mul r2.yz, r2.xxxx, r4.zzwz
mad r0.yzw, -r2.xxyz, l(0.000000, 1000.000000, 1000.000000, 1000.000000), r0.xxyz
lt r1.w, |r1.y|, |r3.y|
and r1.w, r1.w, l(0x3f800000)
add r1.xyz, -r3.xyzx, r1.xyzx
mad r1.xyz, r1.wwww, r1.xyzx, r3.xyzx
lt r1.w, |r0.y|, |r5.x|
and r1.w, r1.w, l(0x3f800000)
add r0.yzw, -r5.xxyz, r0.yyzw
mad r0.yzw, r1.wwww, r0.yyzw, r5.xxyz
mul r2.xyz, r1.xyzx, r0.yzwy
mad r0.yzw, r0.wwyz, r1.yyzx, -r2.xxyz
dp3 r1.x, r0.yzwy, r0.yzwy
rsq r1.x, r1.x
mul r0.yzw, r0.yyzw, r1.xxxx
mad o2.xyz, r0.yzwy, l(0.500000, 0.500000, 0.500000, 0.000000), l(0.500000, 0.500000, 0.500000, 0.000000)
ftoi r0.y, cb0[0].w
iadd r0.y, -r0.y, l(1)
itof r0.y, r0.y
round_z r0.z, cb0[0].w
mov r1.x, l(0)
mov r1.y, r0.y
loop 
  lt r0.w, l(0.000000), r1.y
  breakc_nz r0.w
  exp r0.w, r1.y
  mul r1.zw, r0.wwww, v0.xxxy
  round_ni r1.zw, r1.zzzw
  add r2.xyzw, r1.zwzw, r1.zwzw
  ge r2.xyzw, r2.xyzw, -r2.zwzw
  movc r2.xyzw, r2.xyzw, l(2.000000,2.000000,0.500000,0.500000), l(-2.000000,-2.000000,-0.500000,-0.500000)
  mul r1.zw, r1.zzzw, r2.zzzw
  frc r1.zw, r1.zzzw
  mul r1.zw, r1.zzzw, r2.xxxy
  add r0.w, r1.z, r1.z
  mul r1.z, r1.z, r1.w
  mad r0.w, -r1.z, l(4.000000), r0.w
  mad r0.w, r1.w, l(3.000000), r0.w
  add r1.z, r0.z, r1.y
  add r1.z, r1.z, r1.z
  exp r1.z, r1.z
  mad r1.x, r1.z, r0.w, r1.x
  add r1.y, r1.y, l(1.000000)
endloop 
add r0.y, r0.z, r0.z
exp r0.y, r0.y
mad r0.z, r0.y, l(4.000000), l(-4.000000)
div r0.z, r1.x, r0.z
div r0.y, l(1.000000, 1.000000, 1.000000, 1.000000), r0.y
add o2.w, r0.y, r0.z
mov o1.xyzw, r0.xxxx
ret 
// Approximately 81 instruction slots used
