//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
div r0.zw, l(0.000000, 0.000000, -0.500000, 0.500000), r0.yyyy
lt r1.xy, r0.xyxx, l(0.000000, 0.000000, 0.000000, 0.000000)
movc r0.z, r1.y, r0.z, r0.w
mul r0.w, r0.y, r0.y
mul r0.x, r0.x, l(1.777778)
div r1.zw, l(0.000000, 0.000000, -0.888889, 0.888889), r0.xxxx
movc r1.z, r1.x, r1.z, r1.w
movc r1.x, r1.x, l(-1.000000), l(1.000000)
mul r1.yw, r0.wwwx, r0.zzzx
mul r1.w, r1.w, r1.z
min r0.z, r0.z, r1.z
add r1.y, |r1.y|, |r1.w|
add r1.z, |r0.y|, |r0.x|
div r1.y, r1.y, r1.z
mad_sat r1.y, r1.y, l(2.000000), l(-0.400000)
add r1.y, r1.y, l(0.150000)
add r1.z, -r1.y, l(1.000000)
mad r1.z, r1.z, l(1.777778), r1.y
div r1.z, |r0.x|, r1.z
add r1.z, r1.z, r1.z
max r1.z, r1.z, l(0.000000)
log r1.z, r1.z
div r1.w, l(2.000000), r1.y
mul r1.y, r1.y, l(0.500000)
mul r1.z, r1.z, r1.w
exp r1.z, r1.z
add r2.x, |r0.y|, |r0.y|
log r2.x, r2.x
mul r1.w, r1.w, r2.x
exp r1.w, r1.w
add r1.z, r1.w, r1.z
log r1.z, r1.z
mul r1.y, r1.z, r1.y
exp r1.y, r1.y
mad r0.w, r0.x, r0.x, r0.w
mul r0.x, r0.z, r0.x
mul r0.z, r0.z, r0.y
sqrt r1.z, r0.w
rsq r0.w, r0.w
mul r0.y, r0.w, r0.y
div r0.w, r1.z, r1.y
mul r1.y, r1.z, l(9.000000)
log r1.y, r1.y
mul r1.y, r1.y, l(0.693147)
mul r1.z, r0.z, r0.z
mad r1.z, r0.x, r0.x, r1.z
sqrt r1.z, r1.z
div r0.w, r0.w, r1.z
mul r0.xz, r0.wwww, r0.xxzx
mad r0.w, |r0.y|, l(-0.018729), l(0.074261)
mad r0.w, r0.w, |r0.y|, l(-0.212114)
mad r0.w, r0.w, |r0.y|, l(1.570729)
add r1.z, -|r0.y|, l(1.000000)
lt r0.y, r0.y, -r0.y
sqrt r1.z, r1.z
mul r1.w, r0.w, r1.z
mad r1.w, r1.w, l(-2.000000), l(3.141593)
and r0.y, r0.y, r1.w
mad r0.y, r0.w, r1.z, r0.y
mad r0.y, r0.y, r1.x, l(3.141593)
mad r0.y, r0.y, l(0.159155), r1.y
round_ni r0.w, r0.y
add r0.y, -r0.w, r0.y
mul r0.xy, r0.xyxx, l(0.562500, 1.442695, 0.000000, 0.000000)
exp r0.y, r0.y
add r0.y, r0.y, l(-1.000000)
mul r0.w, r0.y, l(0.581977)
mad r0.y, -r0.y, l(0.581977), l(1.000000)
mad r0.y, r0.y, l(0.300000), r0.w
mad r1.x, r0.x, r0.y, l(0.500000)
mad r1.y, r0.z, r0.y, l(0.500000)
sample_indexable(texture2d)(float,float,float,float) o0.xyzw, r1.xyxx, t0.xyzw, s0
ret 
// Approximately 74 instruction slots used
