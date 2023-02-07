//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float GI_DIFFUSE_RADIUS;           // Offset:    0 Size:     4 [unused]
//   float GI_DIFFUSE_STRENGTH;         // Offset:    4 Size:     4
//   int GI_DIFFUSE_MIPLEVEL;           // Offset:    8 Size:     4 [unused]
//   int GI_DIFFUSE_CURVE_MODE;         // Offset:   12 Size:     4
//   int GI_DIFFUSE_BLEND_MODE;         // Offset:   16 Size:     4
//   float GI_REFLECT_RADIUS;           // Offset:   20 Size:     4 [unused]
//   int GI_DIFFUSE_DEBUG;              // Offset:   24 Size:     4
//   int GI_FOV;                        // Offset:   28 Size:     4 [unused]
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
// __V__TexGI                        texture  float4          2d             t6      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 9
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t6.xyzw, s0
mad r1.xyzw, r0.xyzw, l(3.141593, 3.141593, 3.141593, 3.141593), l(4.712389, 4.712389, 4.712389, 4.712389)
sincos r1.xyzw, null, r1.xyzw
add r1.xyzw, r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
mul r1.xyzw, r1.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000)
mul r2.xyzw, r0.xyzw, l(3.141593, 3.141593, 3.141593, 3.141593)
sincos r2.xyzw, null, r2.xyzw
ieq r3.xyzw, cb0[0].wwww, l(1, 2, 3, 4)
movc r2.xyzw, r3.wwww, r2.xyzw, r0.xyzw
movc r1.xyzw, r3.zzzz, r1.xyzw, r2.xyzw
mul r2.xyzw, r0.xyzw, l(10.000000, 10.000000, 10.000000, 10.000000)
mul r0.xyzw, r0.xyzw, r0.xyzw
log r2.xyzw, r2.xyzw
mul r2.xyzw, r2.xyzw, l(0.301030, 0.301030, 0.301030, 0.301030)
movc r1.xyzw, r3.yyyy, r2.xyzw, r1.xyzw
movc r0.xyzw, r3.xxxx, r0.xyzw, r1.xyzw
mul_sat r0.xyzw, r0.xyzw, cb0[0].yyyy
add r1.xyz, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xyzw, s0
add r3.xyz, r0.xyzx, r2.xyzx
mad r1.xyz, r2.xyzx, r1.xyzx, -r3.xyzx
dp3 r1.w, r2.xyzx, l(0.333300, 0.333300, 0.333300, 0.000000)
mad r1.xyz, r1.wwww, r1.xyzx, r3.xyzx
add r4.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
div r5.xyz, r2.xyzx, r4.xyzx
ieq r6.xyzw, cb0[1].xxxz, l(1, 2, 3, 1)
movc r1.xyz, r6.zzzz, r5.xyzx, r1.xyzx
add r5.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
mad r7.xyz, -r5.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
add r5.xyz, r5.xyzx, r5.xyzx
mul r5.xyz, r2.xyzx, r5.xyzx
mul r8.xyz, r2.xyzx, r2.xyzx
add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r2.xyz, -r2.xyzx, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r4.xyz, r7.xyzx, r8.xyzx, r5.xyzx
movc r1.xyz, r6.yyyy, r4.xyzx, r1.xyzx
movc r1.xyz, r6.xxxx, r2.xyzx, r1.xyzx
movc r1.xyz, cb0[1].xxxx, r1.xyzx, r3.xyzx
ieq r1.w, cb0[1].z, l(2)
movc r1.xyz, r1.wwww, r0.wwww, r1.xyzx
movc o0.xyz, r6.wwww, r0.xyzx, r1.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 43 instruction slots used