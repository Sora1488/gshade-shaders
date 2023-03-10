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
//   int EffectType;                    // Offset:    4 Size:     4
//   bool Spiral;                       // Offset:    8 Size:     4
//   float InnerRing;                   // Offset:   12 Size:     4
//   float OuterRing;                   // Offset:   16 Size:     4
//   float Zoom;                        // Offset:   20 Size:     4
//   float Frequency;                   // Offset:   24 Size:     4
//   float X_Offset;                    // Offset:   28 Size:     4
//   float Y_Offset;                    // Offset:   32 Size:     4
//   int Buffer4;                       // Offset:   36 Size:     4 [unused]
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
add r0.xy, cb0[1].wwww, l(-0.500000, 0.500000, 0.000000, 0.000000)
movc r1.xyz, cb0[0].yyyy, l(1.000000,-0.500000,0.500000,0), l(1.777778,-0.888889,0.888889,0)
add r0.z, v1.x, cb0[1].w
add r0.z, r0.z, l(-0.500000)
mul r0.xyz, r0.xyzx, r1.xxxx
div r0.xy, r0.xyxx, r0.zzzz
lt r0.w, r0.z, l(0.000000)
movc r0.x, r0.w, r0.x, r0.y
mul r0.y, r0.z, r0.z
mul r0.x, r0.y, r0.x
add r2.xy, cb0[2].xxxx, l(-0.500000, 0.500000, 0.000000, 0.000000)
add r0.y, v1.y, cb0[2].x
add r0.y, r0.y, l(-0.500000)
div r2.xy, r2.xyxx, r0.yyyy
lt r1.w, r0.y, l(0.000000)
movc r2.x, r1.w, r2.x, r2.y
mul r2.y, r0.y, r0.y
mul r2.x, r2.y, r2.x
mad r2.y, r0.z, r0.z, r2.y
add r0.x, |r0.x|, |r2.x|
add r2.xw, |r0.yyyy|, |r0.zzzy|
div r0.x, r0.x, r2.x
mad_sat r0.x, r0.x, l(2.000000), l(-0.400000)
add r0.x, r0.x, l(0.150000)
add r2.x, -r0.x, l(1.000000)
mad r2.x, r2.x, r1.x, r0.x
div r2.x, |r0.z|, r2.x
add r2.x, r2.x, r2.x
max r2.x, r2.x, l(0.000000)
log r2.x, r2.x
div r2.z, l(2.000000), r0.x
mul r0.x, r0.x, l(0.500000)
mul r2.x, r2.x, r2.z
exp r2.x, r2.x
log r2.w, r2.w
mul r2.z, r2.w, r2.z
exp r2.z, r2.z
add r2.x, r2.z, r2.x
log r2.x, r2.x
mul r0.x, r0.x, r2.x
exp r0.x, r0.x
sqrt r2.x, r2.y
rsq r2.y, r2.y
mul r2.y, r0.y, r2.y
div r0.x, r2.x, r0.x
div r2.zw, l(0.000000, 0.000000, -0.500000, 0.500000), r0.yyyy
movc r1.w, r1.w, r2.z, r2.w
div r1.yz, r1.yyzy, r0.zzzz
movc r1.y, r0.w, r1.y, r1.z
movc r0.w, r0.w, l(-1.000000), l(1.000000)
min r1.y, r1.w, r1.y
mul r1.z, r0.y, r1.y
mul r1.w, r1.z, r1.z
mul r2.z, r0.z, r1.y
mad r1.y, r0.y, r1.y, cb0[2].x
max r0.y, |r0.y|, |r0.z|
mad r0.z, r2.z, r2.z, r1.w
sqrt r0.z, r0.z
div r0.x, r0.x, r0.z
mul r0.z, r0.x, r2.z
mad r0.x, r1.z, r0.x, cb0[2].x
movc r0.x, cb0[0].y, r1.y, r0.x
mad r1.y, cb0[1].w, r1.x, r2.z
div r0.z, r0.z, r1.x
add r0.z, r0.z, cb0[1].w
movc r0.z, cb0[0].y, r1.y, r0.z
mad r1.x, |r2.y|, l(-0.018729), l(0.074261)
mad r1.x, r1.x, |r2.y|, l(-0.212114)
mad r1.x, r1.x, |r2.y|, l(1.570729)
add r1.y, -|r2.y|, l(1.000000)
lt r1.z, r2.y, -r2.y
sqrt r1.y, r1.y
mul r1.w, r1.y, r1.x
mad r1.w, r1.w, l(-2.000000), l(3.141593)
and r1.z, r1.z, r1.w
mad r1.x, r1.x, r1.y, r1.z
mad r0.w, r1.x, r0.w, l(3.141593)
mul r0.w, r0.w, l(0.159155)
movc r0.w, cb0[0].z, r0.w, l(0)
add r1.x, -cb0[1].y, l(10.000000)
mul r1.y, r1.x, r2.x
mul r0.y, r0.y, r1.x
log r0.y, r0.y
mul r0.y, r0.y, cb0[1].z
mad r0.y, r0.y, l(0.693147), r0.w
log r1.x, r1.y
mul r1.x, r1.x, cb0[1].z
mad r0.w, r1.x, l(0.693147), r0.w
movc r0.y, cb0[0].y, r0.y, r0.w
round_ni r0.w, r0.y
add r0.y, -r0.w, r0.y
mul r0.y, r0.y, l(1.442695)
exp r0.y, r0.y
add r0.y, r0.y, l(-1.000000)
mad r0.w, -r0.y, l(0.581977), l(1.000000)
mul r0.y, r0.y, l(0.581977)
mul r0.y, r0.y, cb0[1].x
mad r0.y, r0.w, cb0[0].w, r0.y
mad r0.z, r0.z, r0.y, l(0.500000)
mad r0.x, r0.x, r0.y, l(0.500000)
add r0.y, r0.x, -cb0[2].x
add r0.x, r0.z, -cb0[1].w
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, r0.xyxx, t0.xyzw, s0
ret 
// Approximately 104 instruction slots used
