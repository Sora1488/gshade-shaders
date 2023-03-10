//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int Hints;                         // Offset:    0 Size:     4 [unused]
//   int GI;                            // Offset:    4 Size:     4 [unused]
//   int UI_QUALITY_PRESET;             // Offset:    8 Size:     4 [unused]
//   float BUMP;                        // Offset:   12 Size:     4
//   float roughness;                   // Offset:   16 Size:     4 [unused]
//   float EXP;                         // Offset:   20 Size:     4 [unused]
//   float AO_Intensity;                // Offset:   24 Size:     4 [unused]
//   float depthfade;                   // Offset:   28 Size:     4 [unused]
//   bool LinearConvert;                // Offset:   32 Size:     4 [unused]
//   float2 SatExp;                     // Offset:   36 Size:     8 [unused]
//   uint debug;                        // Offset:   44 Size:     4 [unused]
//   int Credits;                       // Offset:   48 Size:     4 [unused]
//   int Preprocessordefinitionstooltip;// Offset:   52 Size:     4 [unused]
//   float Timer;                       // Offset:   56 Size:     4 [unused]
//   float Frame;                       // Offset:   60 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__TexColor                     texture  float4          2d             t4      1 
// __V__SSSR_NormTex1                texture  float4          2d            t28      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t28
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t28.xyzw, s0, l(0.000000)
add r1.x, -r0.w, l(1.000000)
add_sat r1.x, r1.x, r1.x
mul r1.x, r1.x, l(2.500000)
max r1.x, r1.x, l(0.000100)
rcp r1.x, r1.x
mov r2.x, l(0)
mov r1.yzw, l(0,0,0,0)
mov r2.zw, l(0,0,0,-1)
loop 
  ilt r3.x, l(1), r2.w
  breakc_nz r3.x
  itof r3.x, r2.w
  mul r2.y, r3.x, l(0.005093)
  add r3.xy, r2.xyxx, v1.xyxx
  sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t28.xyzw, s0
  add r4.xyzw, -r0.xyzw, r3.xyzw
  dp4 r2.y, l(0.333000, 0.333000, 0.333000, 2500.000000), |r4.xyzw|
  dp2 r2.y, r2.yyyy, r1.xxxx
  min r2.y, r2.y, l(1.000000)
  add r2.y, -r2.y, l(1.000000)
  mad r1.yzw, r3.xxyz, r2.yyyy, r1.yyzw
  add r2.z, r2.y, r2.z
  iadd r2.w, r2.w, l(1)
endloop 
div r0.xyz, r1.yzwy, r2.zzzz
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, 0.000000, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zwzz, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r4.xyz, v1.xyxx, t4.xyzw, s0
add r5.xyz, r2.xyzx, r3.xyzx
add r5.xyz, r4.xyzx, r5.xyzx
add r0.w, r5.y, r5.x
add r0.w, r5.z, r0.w
mul r0.w, r0.w, l(0.333333)
rcp r0.w, r0.w
mul r0.w, r0.w, cb0[0].w
mul r4.xyz, r0.wwww, r4.xyzx
sample_l_indexable(texture2d)(float,float,float,float) r1.x, r1.xyxx, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r1.z, -r1.y, l(999.000000), l(1000.000000)
div r1.y, r1.y, r1.z
sample_l_indexable(texture2d)(float,float,float,float) r1.z, v1.xyxx, t2.yzxw, s0, l(0.000000)
mad r1.w, -r1.z, l(999.000000), l(1000.000000)
div r1.z, r1.z, r1.w
mad r2.xyz, -r2.xyzx, r0.wwww, r4.xyzx
mad r3.xyz, -r3.xyzx, r0.wwww, r4.xyzx
add r0.w, r2.y, r2.x
add r0.w, r2.z, r0.w
mul r0.w, r0.w, l(0.333333)
add r1.x, -r1.z, r1.x
mad r1.x, -|r1.x|, l(1000.000000), l(1.000000)
max r1.x, r1.x, l(0.000000)
mul r2.x, r0.w, r1.x
add r0.w, r3.y, r3.x
add r0.w, r3.z, r0.w
mul r0.w, r0.w, l(0.333333)
add r1.x, -r1.z, r1.y
mad r1.x, -|r1.x|, l(1000.000000), l(1.000000)
max r1.x, r1.x, l(0.000000)
mul r2.y, r0.w, r1.x
mov r2.z, l(1.000000)
dp3 r0.w, r2.xyzx, r2.xyzx
rsq r0.w, r0.w
mad r1.xyw, r2.xyxz, r0.wwww, l(0.000000, 0.000000, 0.000000, 1.000000)
mul r2.xyz, r0.xyzx, l(-1.000000, -1.000000, 1.000000, 0.000000)
dp3 r0.w, r1.xywx, r2.xyzx
mul r2.xyz, r0.wwww, r1.xywx
div r1.xyw, r2.xyxz, r1.wwww
mad o0.xyz, -r0.xyzx, l(-1.000000, -1.000000, 1.000000, 0.000000), r1.xywx
mov o0.w, r1.z
ret 
// Approximately 74 instruction slots used
