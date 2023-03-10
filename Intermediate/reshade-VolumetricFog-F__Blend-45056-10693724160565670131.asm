//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Timer;                       // Offset:    0 Size:     4 [unused]
//   float radius;                      // Offset:    4 Size:     4 [unused]
//   int SampleCount;                   // Offset:    8 Size:     4 [unused]
//   bool TemporalAccum;                // Offset:   12 Size:     4 [unused]
//   float Intensity;                   // Offset:   16 Size:     4
//   float MaxIntensity;                // Offset:   20 Size:     4
//   float Exposure;                    // Offset:   24 Size:     4 [unused]
//   float Gamma;                       // Offset:   28 Size:     4 [unused]
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
// __V__BlurTex                      texture  float4          2d             t8      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 5
add r0.xyzw, v1.xyxy, l(0.001042, 0.000000, 0.003125, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r0.zwzz, t2.xyzw, s0, l(0.000000)
mov r1.w, l(1.000000)
mov r2.w, l(2.000000)
mov r3.w, l(1.000000)
add r4.xyzw, v1.xyxy, l(0.000000, 0.001852, 0.000000, 0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r0.yzw, r4.xyxx, t8.wxyz, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r4.x, r4.zwzz, t2.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t8.xyzw, s0, l(2.000000)
add r2.xyz, r0.yzwy, r3.xyzx
mad r0.y, -r4.x, l(999.000000), l(1000.000000)
div r0.y, r4.x, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
add r0.y, -r0.z, r0.y
lt r0.y, |r0.y|, l(0.010000)
movc r2.xyzw, r0.yyyy, r2.xyzw, r3.xyzw
add r1.xyzw, r1.xyzw, r2.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r1.xyzw, r2.xyzw
add r2.xyzw, v1.xyxy, l(0.000000, -0.001852, 0.000000, -0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
add r2.xyzw, v1.xyxy, l(-0.001042, 0.000000, -0.003125, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
add r2.xyzw, v1.xyxy, l(0.001042, 0.001852, 0.003125, 0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
add r2.xyzw, v1.xyxy, l(-0.001042, 0.001852, -0.003125, 0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
add r2.xyzw, v1.xyxy, l(-0.001042, -0.001852, -0.003125, -0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
add r2.xyzw, v1.xyxy, l(0.001042, -0.001852, 0.003125, -0.005556)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t8.xyzw, s0, l(2.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r2.zwzz, t2.xyzw, s0, l(0.000000)
mov r3.w, l(1.000000)
add r2.xyzw, r1.xyzw, r3.xyzw
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.x, -r0.z, r0.x
mul r0.y, r0.z, cb0[1].x
min r0.y, r0.y, cb0[1].y
lt r0.x, |r0.x|, l(0.010000)
movc r1.xyzw, r0.xxxx, r2.xyzw, r1.xyzw
div r0.xzw, r1.xxyz, r1.wwww
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
add r0.xzw, r0.xxzw, -r1.xxyz
mad o0.xyz, r0.yyyy, r0.xzwx, r1.xyzx
ret 
// Approximately 92 instruction slots used
