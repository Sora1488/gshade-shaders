//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Sigma0;                      // Offset:    0 Size:     4
//   float Sigma1;                      // Offset:    4 Size:     4
//   int Anisotropy;                    // Offset:    8 Size:     4
//   float EdgeThreshold;               // Offset:   12 Size:     4 [unused]
//   float EdgeStrength;                // Offset:   16 Size:     4 [unused]
//   bool QuantizeLuma;                 // Offset:   20 Size:     4 [unused]
//   int LevelCount;                    // Offset:   24 Size:     4 [unused]
//   bool IgnoreSky;                    // Offset:   28 Size:     4 [unused]
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
// __V__BackBuffer                   texture  float4          2d             t4      1 
// __V__Luma                         texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
max r0.x, cb0[0].x, l(0.001000)
mul r0.y, cb0[0].y, l(1.442695)
exp r0.y, r0.y
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
add r2.xyzw, r1.xyzz, l(0.000000, 0.000000, 0.000000, 1.000000)
dp3 r0.z, r1.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
ilt r0.w, l(0), cb0[0].z
if_nz r0.w
  ieq r0.w, cb0[0].z, l(1)
  if_nz r0.w
    sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
    mad r1.x, -r0.w, l(999.000000), l(1000.000000)
    div r0.w, r0.w, r1.x
    ne r0.w, r0.w, l(0.000000)
    not r1.x, r0.w
    if_nz r0.w
      add r3.xyzw, v1.xyxy, l(-0.000521, -0.000000, -0.001042, -0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r0.w, r3.xyxx, t2.yzwx, s0, l(0.000000)
      mad r1.y, -r0.w, l(999.000000), l(1000.000000)
      div r0.w, r0.w, r1.y
      sample_l_indexable(texture2d)(float,float,float,float) r1.y, r3.zwzz, t2.yxzw, s0, l(0.000000)
      mad r1.z, -r1.y, l(999.000000), l(1000.000000)
      div r1.y, r1.y, r1.z
      add r3.xyzw, v1.xyxy, l(-0.000000, -0.000926, -0.000000, -0.001852)
      sample_l_indexable(texture2d)(float,float,float,float) r1.z, r3.xyxx, t2.yzxw, s0, l(0.000000)
      mad r1.w, -r1.z, l(999.000000), l(1000.000000)
      div r1.z, r1.z, r1.w
      sample_l_indexable(texture2d)(float,float,float,float) r1.w, r3.zwzz, t2.yzwx, s0, l(0.000000)
      mad r3.x, -r1.w, l(999.000000), l(1000.000000)
      div r1.w, r1.w, r3.x
    else 
      mov r0.w, l(0)
      mov r1.yzw, l(0,0,0,0)
    endif 
    mov r3.xy, l(1.000000,1.000000,0,0)
  else 
    ieq r3.z, cb0[0].z, l(2)
    if_nz r3.z
      sample_l_aoffimmi_indexable(-1,0,0)(texture2d)(float,float,float,float) r0.w, v1.xyxx, t6.yzwx, s0, l(0.000000)
      sample_l_aoffimmi_indexable(-2,0,0)(texture2d)(float,float,float,float) r1.y, v1.xyxx, t6.yxzw, s0, l(0.000000)
      sample_l_aoffimmi_indexable(0,-1,0)(texture2d)(float,float,float,float) r1.z, v1.xyxx, t6.yzxw, s0, l(0.000000)
      sample_l_aoffimmi_indexable(0,-2,0)(texture2d)(float,float,float,float) r1.w, v1.xyxx, t6.yzwx, s0, l(0.000000)
    else 
      mov r0.w, l(0)
      mov r1.yzw, l(0,0,0,0)
    endif 
    mov r1.x, l(0)
  endif 
  add r4.xz, v1.yyxy, l(0.000000, 0.000000, -0.000521, 0.000000)
  mov r4.y, l(1.000000)
  add r5.xz, v1.yyxy, l(0.000000, 0.000000, -0.001042, 0.000000)
  mov r5.y, l(1.000000)
  mul r5.xyz, r1.yyyy, r5.xyzx
  mad r4.xyz, r4.xyzx, r0.wwww, -r5.xyzx
  add r5.yz, v1.xxyx, l(0.000000, 0.000000, -0.000926, 0.000000)
  mov r5.x, l(1.000000)
  add r6.yz, v1.xxyx, l(0.000000, 0.000000, -0.001852, 0.000000)
  mov r6.x, l(1.000000)
  mul r6.xyz, r1.wwww, r6.xyzx
  mad r1.yzw, r5.xxyz, r1.zzzz, -r6.xxyz
  mul r5.xyz, r4.xyzx, -r1.yzwy
  mad r1.yzw, -r1.wwyz, r4.yyzx, -r5.xxyz
  min r1.yzw, r1.yyzw, l(0.000000, 0.000010, 0.000010, 0.000010)
  dp3 r0.w, r1.yzwy, r1.yzwy
  rsq r0.w, r0.w
  mul r1.yz, r0.wwww, r1.yyzy
  mad r1.yz, r1.yyzy, l(0.000000, 0.500000, 0.500000, 0.000000), l(0.000000, 0.500000, 0.500000, 0.000000)
  movc r1.xy, r1.xxxx, r3.xyxx, r1.yzyy
else 
  mov r1.xy, l(1.000000,1.000000,0,0)
endif 
mad r3.xyzw, r1.xyxy, l(-0.001042, -0.001852, -0.001042, -0.000926), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mul r0.x, r0.x, r0.x
div r5.xyz, l(-8.000000, -5.000000, -2.000000, 0.000000), r0.xxxx
mad r0.x, r0.z, l(255.000000), -r0.w
mul r0.xy, r0.xyxx, r0.xyxx
div r0.x, r0.x, r0.y
add r0.x, -r0.x, r5.x
mul r0.x, r0.x, l(0.721348)
exp r0.x, r0.x
mad r2.xyz, r4.xyzx, r0.xxxx, r2.xyzx
add r0.x, r0.x, l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(-0.001042, 0.000926, -0.001042, 0.001852), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.x
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(-0.000521, -0.001852, -0.000521, -0.000926), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.z
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(-0.000521, 0.000926, -0.000521, 0.001852), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.z
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(0.000521, -0.001852, 0.000521, -0.000926), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.z
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(0.000521, 0.000926, 0.000521, 0.001852), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.z
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r3.xyzw, r1.xyxy, l(0.001042, -0.001852, 0.001042, -0.000926), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r4.xyz, r3.xyxx, t4.xyzw, s0
dp3 r0.w, r4.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.x
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r4.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r3.zwzz, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
mad r1.xyzw, r1.xyxy, l(0.001042, 0.000926, 0.001042, 0.001852), v1.xyxy
sample_indexable(texture2d)(float,float,float,float) r3.xyz, r1.xyxx, t4.xyzw, s0
dp3 r0.w, r3.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.w, r0.z, l(255.000000), -r0.w
mul r0.w, r0.w, r0.w
div r0.w, r0.w, r0.y
add r0.w, -r0.w, r5.y
mul r0.w, r0.w, l(0.721348)
exp r0.w, r0.w
mad r2.xyz, r3.xyzx, r0.wwww, r2.xyzx
add r0.x, r0.w, r0.x
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t4.xyzw, s0
dp3 r0.w, r1.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r0.z, r0.z, l(255.000000), -r0.w
mul r0.z, r0.z, r0.z
div r0.y, r0.z, r0.y
add r0.y, -r0.y, r5.x
mul r0.y, r0.y, l(0.721348)
exp r0.y, r0.y
mad r1.xyz, r1.xyzx, r0.yyyy, r2.xyzx
add r0.x, r0.y, r0.x
div o0.xyz, r1.xyzx, r0.xxxx
mov o0.w, r2.w
ret 
// Approximately 244 instruction slots used
