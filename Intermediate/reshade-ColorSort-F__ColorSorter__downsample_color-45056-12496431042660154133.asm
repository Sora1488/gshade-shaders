//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int Buffer1;                       // Offset:    0 Size:     4 [unused]
//   uint RotationAngle;                // Offset:    4 Size:     4
//   float BrightnessThresholdStart;    // Offset:    8 Size:     4 [unused]
//   float BrightnessThresholdEnd;      // Offset:   12 Size:     4 [unused]
//   float GradientStrength;            // Offset:   16 Size:     4 [unused]
//   float MaskingNoise;                // Offset:   20 Size:     4 [unused]
//   float NoiseSize;                   // Offset:   24 Size:     4 [unused]
//   bool ReverseSort;                  // Offset:   28 Size:     4 [unused]
//   bool InvertMask;                   // Offset:   32 Size:     4
//   bool ShowMask;                     // Offset:   36 Size:     4
//   bool HotsamplingMode;              // Offset:   40 Size:     4 [unused]
//   int Buffer2;                       // Offset:   44 Size:     4 [unused]
//   bool FilterColor;                  // Offset:   48 Size:     4
//   bool ShowSelectedHue;              // Offset:   52 Size:     4
//   float Value;                       // Offset:   56 Size:     4
//   float ValueRange;                  // Offset:   60 Size:     4
//   float Hue;                         // Offset:   64 Size:     4
//   float HueRange;                    // Offset:   68 Size:     4
//   float Saturation;                  // Offset:   72 Size:     4
//   float SaturationRange;             // Offset:   76 Size:     4
//   int Buffer3;                       // Offset:   80 Size:     4 [unused]
//   bool FilterDepth;                  // Offset:   84 Size:     4
//   float FocusDepth;                  // Offset:   88 Size:     4
//   float FocusRangeDepth;             // Offset:   92 Size:     4
//   bool Spherical;                    // Offset:   96 Size:     4
//   int Sphere_FieldOfView;            // Offset:  100 Size:     4
//   float Sphere_FocusHorizontal;      // Offset:  104 Size:     4
//   float Sphere_FocusVertical;        // Offset:  108 Size:     4
//   int Buffer4;                       // Offset:  112 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__ColorSorter__texMask         texture  float4          2d             t8      1 
// __V__ColorSorter__texBackground    texture  float4          2d            t10      1 
// __V__ColorSorter__texColorSort    texture  float4          2d            t12      1 
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
dcl_constantbuffer CB0[7], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
ieq r0.xyzw, cb0[0].yyyy, l(90, 180, 270, 0)
or r0.w, r0.x, r0.w
or r0.w, r0.y, r0.w
or r0.w, r0.z, r0.w
ieq r1.x, cb0[0].y, l(360)
or r0.w, r0.w, r1.x
if_z r0.w
  iadd r0.w, cb0[0].y, l(180)
  utof r0.w, r0.w
  mul r1.x, r0.w, l(0.002778)
  round_ni r1.x, r1.x
  mad r0.w, -r1.x, l(360.000000), r0.w
  ftou r0.w, r0.w
  utof r0.w, r0.w
  mul r0.w, r0.w, l(0.017453)
  sincos r1.x, r2.x, r0.w
  add r0.w, -r1.x, r2.x
  add r1.y, r1.x, r2.x
  min r1.z, -r1.x, l(0.000000)
  max r1.w, -r1.x, l(0.000000)
  min r1.z, r2.x, r1.z
  max r1.w, r2.x, r1.w
  min r1.z, r0.w, r1.z
  max r1.w, r0.w, r1.w
  mul r2.yz, r1.xxxx, v1.yyxy
  mad r2.y, r2.x, v1.x, -r2.y
  add r2.w, r1.z, -r2.y
  add r1.z, -r1.w, r1.z
  div r3.x, |r2.w|, -r1.z
  mad r1.z, r2.x, v1.y, r2.z
  div r1.w, |r2.y|, |r1.x|
  mul r1.w, r2.x, r1.w
  lt r2.z, l(0.000000), r2.y
  lt r2.w, r2.y, -r1.x
  and r3.z, r2.w, r2.z
  lt r3.w, r2.y, l(0.000000)
  lt r4.x, -r1.x, r2.y
  and r4.y, r3.w, r4.x
  or r3.z, r3.z, r4.y
  movc r4.yz, r3.zzzz, r1.wwww, l(0,1000.000000,-1000.000000,0)
  div r1.w, |r2.y|, |r2.x|
  mul r1.w, r1.x, r1.w
  lt r3.z, r2.y, r2.x
  and r2.z, r2.z, r3.z
  lt r4.w, r2.x, r2.y
  and r3.w, r3.w, r4.w
  or r2.z, r2.z, r3.w
  lt r3.w, r1.w, r4.y
  and r3.w, r2.z, r3.w
  movc r3.w, r3.w, r1.w, r4.y
  lt r4.y, r4.z, r1.w
  and r2.z, r2.z, r4.y
  movc r1.w, r2.z, r1.w, r4.z
  add r2.z, -r1.x, -r2.y
  add r4.y, -r0.w, -r1.x
  div r2.z, |r2.z|, |r4.y|
  add r4.y, -r2.z, l(1.000000)
  mul r2.z, r1.y, r2.z
  mad r2.z, r4.y, r2.x, r2.z
  lt r4.y, r2.y, r0.w
  and r4.x, r4.y, r4.x
  lt r4.z, r0.w, r2.y
  and r2.w, r2.w, r4.z
  or r2.w, r2.w, r4.x
  lt r4.x, r2.z, r3.w
  and r4.x, r2.w, r4.x
  movc r3.w, r4.x, r2.z, r3.w
  lt r4.x, r1.w, r2.z
  and r2.w, r2.w, r4.x
  movc r1.w, r2.w, r2.z, r1.w
  add r2.y, -r2.y, r2.x
  add r0.w, -r0.w, r2.x
  div r0.w, |r2.y|, |r0.w|
  add r2.x, -r0.w, l(1.000000)
  mul r0.w, r1.y, r0.w
  mad r0.w, r2.x, r1.x, r0.w
  and r1.x, r4.y, r4.w
  and r1.y, r3.z, r4.z
  or r1.x, r1.y, r1.x
  lt r1.y, r0.w, r3.w
  and r1.y, r1.y, r1.x
  movc r1.y, r1.y, r0.w, r3.w
  lt r2.x, r1.w, r0.w
  and r1.x, r1.x, r2.x
  movc r0.w, r1.x, r0.w, r1.w
  add r1.x, -r1.z, r0.w
  add r0.w, -r0.w, r1.y
  div r3.y, |r1.x|, |r0.w|
else 
  movc r0.xw, r0.xxxx, v1.yyyx, v1.xxxy
  add r1.xy, -v1.yxyy, l(1.000000, 1.000000, 0.000000, 0.000000)
  movc r0.xy, r0.yyyy, r1.yxyy, r0.xwxx
  movc r3.xy, r0.zzzz, r1.xyxx, r0.xyxx
endif 
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t10.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
ge r1.y, r0.y, r0.z
and r1.y, r1.y, l(0x3f800000)
mov r2.xy, r0.zyzz
mov r2.zw, l(0,0,-1.000000,0.666667)
add r4.xy, r0.yzyy, -r2.xyxx
mov r4.zw, l(0,0,1.000000,-1.000000)
mad r2.xyzw, r1.yyyy, r4.xyzw, r2.xyzw
ge r1.y, r0.x, r2.x
and r1.y, r1.y, l(0x3f800000)
mov r4.xyz, r2.xywx
mov r4.w, r0.x
mov r2.xyw, r4.wywx
add r2.xyzw, -r4.xyzw, r2.xyzw
mad r2.xyzw, r1.yyyy, r2.xyzw, r4.xyzw
min r1.y, r2.y, r2.w
add r1.y, -r1.y, r2.x
add r1.z, -r2.y, r2.w
mad r1.w, r1.y, l(6.000000), l(0.000000)
div r1.z, r1.z, r1.w
add r1.z, r1.z, r2.z
add r1.w, r2.x, l(0.000000)
div r1.y, r1.y, r1.w
add r1.w, r2.x, -cb0[3].z
lt r1.w, |r1.w|, cb0[3].w
add r1.z, |r1.z|, -cb0[4].x
mul r2.x, r1.y, r1.y
mul r2.xy, r2.xxxx, l(-288.538818, -144.269409, 0.000000, 0.000000)
exp r2.xy, r2.xyxx
add r2.xy, r2.xyxx, cb0[4].yyyy
lt r2.x, |r1.z|, r2.x
add r1.z, -|r1.z|, l(1.000000)
lt r1.z, r1.z, r2.y
or r1.z, r1.z, r2.x
add r1.y, r1.y, -cb0[4].z
ge r1.y, cb0[4].w, |r1.y|
and r1.y, r1.z, r1.y
and r1.y, r1.w, r1.y
ieq r1.z, cb0[3].x, l(0)
or r1.y, r1.z, r1.y
add r1.zw, v1.xxxy, -cb0[6].zzzw
mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 1920.000000, 1080.000000)
itof r2.x, cb0[6].y
mul r2.x, r2.x, l(0.000521)
mul r1.zw, r1.zzzw, r1.zzzw
add r1.z, r1.w, r1.z
sqrt r1.z, r1.z
mul r1.z, r2.x, r1.z
mul r1.w, cb0[5].z, cb0[5].z
mad r1.w, r1.x, r1.x, r1.w
dp2 r2.x, cb0[5].zzzz, r1.xxxx
mul r1.z, r1.z, l(0.017453)
sincos null, r1.z, r1.z
mad r1.z, -r2.x, r1.z, r1.w
sqrt r1.z, r1.z
add r1.x, r1.x, -cb0[5].z
movc r1.x, cb0[6].x, r1.z, |r1.x|
lt r1.x, r1.x, cb0[5].w
ieq r1.z, cb0[5].y, l(0)
or r1.x, r1.z, r1.x
and r1.x, r1.x, r1.y
movc r1.yz, cb0[2].xxxx, l(0,1,0,0), l(0,0,1,0)
and r1.w, r1.x, l(1)
movc r1.x, r1.x, l(0), l(1)
imul null, r1.x, r1.x, r1.y
imad r1.x, r1.z, r1.w, r1.x
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, r3.xyxx, t12.xyzw, s0
movc r0.xyzw, r1.xxxx, r2.xyzw, r0.xyzw
movc r1.xy, cb0[3].yxyy, l(1,1,0,0), l(0,0,0,0)
imul null, r1.x, r1.y, r1.x
add r2.xy, v1.xxxx, l(-0.355000, -0.500000, 0.000000, 0.000000)
lt r1.y, |r2.y|, l(0.145000)
lt r1.z, v1.y, l(0.060000)
and r1.y, r1.z, r1.y
mov_sat r2.x, r2.x
mad r2.yz, r2.xxxx, l(0.000000, 20.689655, 20.689655, 0.000000), l(0.000000, 4.000000, 2.000000, 0.000000)
mul r3.xyz, r2.xyzx, l(3.448276, 0.166667, 0.166667, 0.000000)
round_ni r3.xyz, r3.xyzx
mul r2.w, r2.x, l(20.689655)
mad r2.yzw, -r3.xxyz, l(0.000000, 6.000000, 6.000000, 6.000000), r2.wwyz
add r2.yzw, r2.yyzw, l(0.000000, -3.000000, -3.000000, -3.000000)
add_sat r2.yzw, |r2.yyzw|, l(0.000000, -1.000000, -1.000000, -1.000000)
mul r3.xyz, r2.yzwy, r2.yzwy
mad r2.yzw, -r2.yyzw, l(0.000000, 2.000000, 2.000000, 2.000000), l(0.000000, 3.000000, 3.000000, 3.000000)
mul r2.yzw, r2.yyzw, r3.xxyz
mad r1.z, r2.x, l(3.448276), -cb0[4].x
add r1.w, -|r1.z|, l(1.000000)
min r1.z, r1.w, |r1.z|
lt r1.z, r1.z, cb0[4].y
movc r2.xyz, r1.zzzz, r2.yzwy, l(0.500000,0.500000,0.500000,0)
mov r2.w, l(1.000000)
movc r2.xyzw, r1.yyyy, r2.xyzw, r0.xyzw
movc r0.xyzw, r1.xxxx, r2.xyzw, r0.xyzw
sample_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t8.xyzw, s1
movc o0.xyzw, cb0[2].yyyy, r1.xxxx, r0.xyzw
ret 
// Approximately 193 instruction slots used
