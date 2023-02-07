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
//   float Frame;                       // Offset:   60 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__SSSR_HitDistTex              texture  float4          2d            t12      1 
// __V__SSSR_FilterTex0              texture  float4          2d            t16      1 
// __V__SSSR_NormTex                 texture  float4          2d            t26      1 
// __V__SSSR_HLTex0                  texture  float4          2d            t34      1 
// __V__SSSR_RoughTex                texture  float4          2d            t38      1 
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
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[4], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t12
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t26
dcl_resource_texture2d (float,float,float,float) t34
dcl_resource_texture2d (float,float,float,float) t38
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
dcl_indexableTemp x0[8], 4
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t34.xyzw, s0
add r0.y, cb0[3].w, cb0[3].w
ge r0.y, r0.y, -r0.y
movc r0.yz, r0.yyyy, l(0,2.000000,0.500000,0), l(0,-2.000000,-0.500000,0)
mul r0.z, r0.z, cb0[3].w
frc r0.z, r0.z
mul r0.y, r0.z, r0.y
ne r0.y, l(0.000000, 0.000000, 0.000000, 0.000000), r0.y
add r0.z, v0.y, l(1.000000)
movc r0.y, r0.y, r0.z, v0.y
add r0.z, v0.x, v0.x
ge r0.z, r0.z, -r0.z
movc r0.zw, r0.zzzz, l(0,0,2.000000,0.500000), l(0,0,-2.000000,-0.500000)
mul r0.w, r0.w, v0.x
frc r0.w, r0.w
mad r0.y, r0.z, r0.w, r0.y
add r0.z, r0.y, r0.y
ge r0.z, r0.z, -r0.z
movc r0.zw, r0.zzzz, l(0,0,2.000000,0.500000), l(0,0,-2.000000,-0.500000)
mul r0.y, r0.w, r0.y
frc r0.y, r0.y
mul r0.y, r0.y, r0.z
if_z cb0[0].y
  sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t38.yzxw, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t12.yzwx, s0, l(3.000000)
  mul_sat r0.w, r0.w, l(0.004000)
  add r1.x, -r0.w, l(1.000000)
  mad r0.w, r0.z, r1.x, r0.w
  mul_sat r0.z, r0.z, l(4.000000)
  mul_sat r0.z, r0.w, r0.z
  max r0.z, r0.z, l(0.000025)
else 
  mov r0.z, l(1.000000)
endif 
mul r0.zw, r0.zzzz, l(0.000000, 0.000000, 0.000521, 0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t26.xyzw, s0, l(0.000000)
mad r2.xy, v1.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
mul r2.z, r1.w, l(1000.000000)
mul r2.xy, r2.zzzz, r2.xyxx
mov r2.z, r1.w
mul r2.xyz, r2.xyzx, l(0.872665, 0.872665, 872.664612, 0.000000)
dp3 r2.w, r2.xyzx, r2.xyzx
rsq r2.w, r2.w
mul r2.xyz, r2.wwww, r2.xyzx
dp3 r2.x, r1.xyzx, r2.xyzx
mul r2.x, r2.x, r2.x
mul r2.yz, r0.xxxx, l(0.000000, 0.250000, 0.062500, 0.000000)
mov_sat r2.y, r2.y
sqrt r0.x, r2.y
mad r0.x, r0.x, l(-0.057000), l(0.060000)
mul r2.yw, r0.xxxx, l(0.000000, 100.000000, 0.000000, 0.400000)
min r0.x, r2.y, l(1.000000)
add r0.x, -r0.x, l(1.000000)
min r2.y, r2.z, l(1.000000)
mad r2.y, r2.y, l(-2.000000), l(2.000000)
round_ne r2.y, r2.y
mul r0.zw, r0.zzzw, r2.yyyy
mad r3.xy, r0.yyyy, r0.zwzz, r0.zwzz
mul r4.xy, r3.xyxx, l(0.707107, 0.707107, 0.000000, 0.000000)
mov x0[0].xy, -r4.xyxx
mov r3.z, l(0)
mov x0[1].xy, r3.zyzz
mov r4.zw, -r4.yyyx
mov x0[2].xy, r4.xzxx
mov r3.w, -r3.x
mov x0[3].xy, r3.wzww
mov x0[4].xy, r3.xzxx
mov x0[5].xy, r4.wyww
mul r0.yz, r3.zzyz, l(0.000000, 1.000000, -1.000000, 0.000000)
mov x0[6].xy, r0.yzyy
mov x0[7].xy, r4.xyxx
sample_l_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t16.wxyz, s0, l(0.000000)
mov r3.xyz, r0.yzwy
mov r2.yz, l(0,1,0,0)
loop 
  ilt r3.w, l(7), r2.z
  breakc_nz r3.w
  mov r4.xy, x0[r2.z + 0].xyxx
  add r4.xy, r4.xyxx, v1.xyxx
  mov x0[r2.z + 0].xy, r4.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.xyxx, t26.xyzw, s0, l(0.000000)
  dp3 r3.w, r5.xyzx, r1.xyzx
  lt r3.w, r0.x, r3.w
  add r4.z, -r1.w, r5.w
  mul r4.z, r2.x, |r4.z|
  lt r4.z, r4.z, r2.w
  and r3.w, r3.w, r4.z
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r4.xyxx, t16.xyzw, s0, l(0.000000)
  and r5.xy, r3.wwww, l(0x3f800000, 1, 0, 0)
  mad r3.xyz, r4.xyzx, r5.xxxx, r3.xyzx
  iadd r2.y, r2.y, r5.y
  iadd r2.z, r2.z, l(1)
endloop 
itof r0.x, r2.y
div r0.xyz, r3.xyzx, r0.xxxx
sample_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t16.xyzw, s0
max o0.xyzw, r0.xyzw, l(0.000001, 0.000001, 0.000001, 0.000001)
ret 
// Approximately 98 instruction slots used
