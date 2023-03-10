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
//   int GI;                            // Offset:    4 Size:     4
//   int UI_QUALITY_PRESET;             // Offset:    8 Size:     4 [unused]
//   float BUMP;                        // Offset:   12 Size:     4 [unused]
//   float roughness;                   // Offset:   16 Size:     4
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
// SV_TARGET                1   x           1   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.x
dcl_temps 9
add r0.xyzw, v1.xyxy, l(0.000000, 0.000926, -0.000000, -0.000926)
mad r1.xyzw, r0.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r2.x, r0.xyxx, t2.xyzw, s0, l(0.000000)
mad r2.y, -r2.x, l(999.000000), l(1000.000000)
div r2.x, r2.x, r2.y
mul r3.zw, r2.xxxx, l(0.000000, 0.000000, 1000.000000, 2000.000000)
mul r1.xy, r1.xyxx, r3.zzzz
mul r3.xy, r1.xyxx, l(0.872665, 0.872665, 0.000000, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r0.zwzz, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
mul r4.zw, r0.zzzz, l(0.000000, 0.000000, 1000.000000, 2000.000000)
mul r0.zw, r1.zzzw, r4.zzzz
mul r4.xy, r0.zwzz, l(0.872665, 0.872665, 0.000000, 0.000000)
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, -0.000000)
mad r5.xyzw, r1.xyzw, l(2.000000, 2.000000, 2.000000, 2.000000), l(-1.000000, -1.000000, -1.000000, -1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
mul r6.zw, r0.zzzz, l(0.000000, 0.000000, 1000.000000, 2000.000000)
mul r2.yz, r5.xxyx, r6.zzzz
mul r6.xy, r2.yzyy, l(0.872665, 0.872665, 0.000000, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t2.yzwx, s0, l(0.000000)
mad r1.z, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.z
mul r7.zw, r0.wwww, l(0.000000, 0.000000, 1000.000000, 2000.000000)
mul r1.zw, r5.zzzw, r7.zzzz
mul r7.xy, r1.zwzz, l(0.872665, 0.872665, 0.000000, 0.000000)
add r5.xyzw, v1.xyxy, l(0.000000, 0.001852, -0.000000, -0.001852)
sample_l_indexable(texture2d)(float,float,float,float) r0.w, r5.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.z, -r0.w, l(999.000000), l(1000.000000)
div r0.w, r0.w, r1.z
sample_l_indexable(texture2d)(float,float,float,float) r1.z, r5.zwzz, t2.yzxw, s0, l(0.000000)
mad r1.w, -r1.z, l(999.000000), l(1000.000000)
div r1.z, r1.z, r1.w
add r5.xyzw, v1.xyxy, l(0.001042, 0.000000, -0.001042, -0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.w, r5.xyxx, t2.yzwx, s0, l(0.000000)
mad r2.y, -r1.w, l(999.000000), l(1000.000000)
div r1.w, r1.w, r2.y
sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t2.yxzw, s0, l(0.000000)
mad r2.z, -r2.y, l(999.000000), l(1000.000000)
div r2.y, r2.y, r2.z
mad r0.w, -r0.w, l(1000.000000), r3.w
mad r1.z, -r1.z, l(1000.000000), r4.w
mad r1.w, -r1.w, l(1000.000000), r6.w
mad r2.y, -r2.y, l(1000.000000), r7.w
mad r2.zw, v1.xxxy, l(0.000000, 0.000000, 2.000000, 2.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r3.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r4.w, -r3.w, l(999.000000), l(1000.000000)
div r5.z, r3.w, r4.w
mul r8.y, r5.z, l(1000.000000)
mul r5.xy, r2.zwzz, r8.yyyy
mul r8.xz, r5.yyxy, l(0.872665, 0.000000, 0.872665, 0.000000)
add r3.xyz, r3.zxyz, -r8.yzxy
add r7.xyz, r7.yzxy, -r8.xyzx
mad r1.z, -r5.z, l(1000.000000), r1.z
mad r0.w, -r5.z, l(1000.000000), r0.w
lt r0.w, |r1.z|, |r0.w|
add r4.xyz, -r4.zxyz, r8.yzxy
movc r3.xyz, r0.wwww, r4.xyzx, r3.xyzx
mad r0.w, -r5.z, l(1000.000000), r1.w
mad r1.z, -r5.z, l(1000.000000), r2.y
lt r0.w, |r0.w|, |r1.z|
add r2.yzw, -r6.yyzx, r8.xxyz
movc r2.yzw, r0.wwww, r2.yyzw, r7.xxyz
mul r4.xyz, r2.yzwy, r3.xyzx
mad r2.yzw, r3.zzxy, r2.zzwy, -r4.xxyz
dp3 r0.w, r2.yzwy, r2.yzwy
rsq r0.w, r0.w
mul r2.yzw, r0.wwww, r2.yyzw
if_z cb0[0].y
  mul r3.xyz, r5.xyzx, l(0.872665, 0.872665, 872.664612, 0.000000)
  dp3 r0.w, r3.xyzx, r3.xyzx
  rsq r0.w, r0.w
  mul r3.xyz, r0.wwww, r3.xyzx
  dp3 r0.w, r2.yzwy, r3.xyzx
  mul r0.w, r0.w, r0.w
  add r1.z, -cb0[1].x, l(1.000000)
  mul_sat r1.w, cb0[1].x, l(10.000000)
  mul r3.x, r1.w, l(0.100000)
  max r3.y, cb0[1].x, l(0.000000)
  log r3.y, r3.y
  mul r3.y, r1.z, r3.y
  exp r3.y, r3.y
  sample_indexable(texture2d)(float,float,float,float) r4.xyz, v1.xyxx, t4.xyzw, s0
  mul r3.z, r4.y, l(0.331000)
  mad r3.z, r4.x, l(-0.169000), -r3.z
  mad r3.z, r4.z, l(0.500000), r3.z
  add r3.z, r3.z, l(0.501961)
  add r0.z, r0.z, -r5.z
  mul r0.z, r0.w, |r0.z|
  lt r0.z, r0.z, l(0.000030)
  if_nz r0.z
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r1.xyxx, t4.xyzw, s0, l(0.000000)
    mul r0.z, r4.y, l(0.331000)
    mad r0.z, r4.x, l(-0.169000), -r0.z
    mad r0.z, r4.z, l(0.500000), r0.z
    add r0.z, r0.z, l(0.501961)
    add r0.z, -r0.z, r3.z
    min r0.z, |r0.z|, l(0.250000)
  else 
    mov r0.z, l(0)
  endif 
  add r4.xyzw, v1.xyxy, l(-0.000521, 0.000000, 0.000000, -0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, r4.xyxx, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
  add r1.x, -r5.z, r1.x
  mul r1.x, r0.w, |r1.x|
  lt r1.x, r1.x, l(0.000030)
  if_nz r1.x
    sample_l_indexable(texture2d)(float,float,float,float) r5.xyw, r4.xyxx, t4.xywz, s0, l(0.000000)
    mul r1.x, r5.y, l(0.331000)
    mad r1.x, r5.x, l(-0.169000), -r1.x
    mad r1.x, r5.w, l(0.500000), r1.x
    add r1.x, r1.x, l(0.501961)
    add r1.x, -r1.x, r3.z
    min r1.x, |r1.x|, l(0.250000)
    add r0.z, r0.z, r1.x
  endif 
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, r4.zwzz, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
  add r1.x, -r5.z, r1.x
  mul r1.x, r0.w, |r1.x|
  lt r1.x, r1.x, l(0.000030)
  if_nz r1.x
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r4.zwzz, t4.xyzw, s0, l(0.000000)
    mul r1.x, r4.y, l(0.331000)
    mad r1.x, r4.x, l(-0.169000), -r1.x
    mad r1.x, r4.z, l(0.500000), r1.x
    add r1.x, r1.x, l(0.501961)
    add r1.x, -r1.x, r3.z
    min r1.x, |r1.x|, l(0.250000)
    add r0.z, r0.z, r1.x
  endif 
  add r1.x, r2.x, -r5.z
  mul r0.w, r0.w, |r1.x|
  lt r0.w, r0.w, l(0.000030)
  if_nz r0.w
    sample_l_indexable(texture2d)(float,float,float,float) r0.xyw, r0.xyxx, t4.xywz, s0, l(0.000000)
    mul r0.y, r0.y, l(0.331000)
    mad r0.x, r0.x, l(-0.169000), -r0.y
    mad r0.x, r0.w, l(0.500000), r0.x
    add r0.x, r0.x, l(0.501961)
    add r0.x, -r0.x, r3.z
    min r0.x, |r0.x|, l(0.250000)
    add r0.z, r0.x, r0.z
  endif 
  mul r0.x, r1.z, l(0.660000)
  log r0.y, r0.z
  mul r0.x, r0.y, r0.x
  exp r0.x, r0.x
  max r0.x, r3.x, r0.x
  min r0.x, r0.x, l(0.800000)
  mad r0.x, -r1.w, l(0.100000), r0.x
  mad r0.y, -r1.w, l(0.100000), l(1.000000)
  div r0.x, r0.x, r0.y
  mul r0.x, r0.x, l(1.250000)
  max r0.x, r0.x, l(0.000000)
  min r0.x, r3.y, r0.x
  min r0.x, r0.x, l(1.000000)
endif 
movc o1.x, cb0[0].y, l(0), r0.x
mov o0.w, r5.z
mov o0.xyz, r2.yzwy
ret 
// Approximately 167 instruction slots used
