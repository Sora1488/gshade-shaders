//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__NoiseTex                     texture  float4          2d             t4      1 
// __V__prePassLayer                 texture  float4          2d             t6      1 
// __V__blurLayerVertical            texture  float4          2d            t10      1 
// __V__blurLayerVerticalMedRes      texture  float4          2d            t14      1 
// __V__blurLayerVerticalLoRes       texture  float4          2d            t18      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t18
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t14.xyzw, s0
dp3 r0.w, l(0.333300, 0.333300, 0.333300, 0.000000), r0.xyzx
add r1.xyz, -r0.xyzx, r0.wwww
mad r0.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r0.xyzx
mul r0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
max r0.xyz, r0.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r0.xyz, r0.xyzx
mul r0.xyz, r0.xyzx, l(1.300000, 1.300000, 1.300000, 0.000000)
exp r0.xyz, r0.xyzx
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
mad r1.xyz, -r1.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000), l(1.000000, 1.000000, 1.000000, 0.000000)
mad_sat r0.xyz, -r1.xyzx, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t10.xyzw, s0
dp3 r0.w, l(0.333300, 0.333300, 0.333300, 0.000000), r2.xyzx
add r3.xyz, -r2.xyzx, r0.wwww
mad r2.xyz, r3.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r2.xyzx
mul r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r2.xyz, r2.xyzx
mul r2.xyz, r2.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
exp r2.xyz, r2.xyzx
add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad_sat r2.xyz, -r1.xyzx, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, v1.xyxx, t6.xyzw, s0
add r4.xyz, -r3.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r2.xyz, -r2.xyzx, r4.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r0.xyz, -r0.xyzx, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t18.xyzw, s0
dp3 r0.w, l(0.333300, 0.333300, 0.333300, 0.000000), r2.xyzx
add r4.xyz, -r2.xyzx, r0.wwww
mad r2.xyz, r4.xyzx, l(0.750000, 0.750000, 0.750000, 0.000000), r2.xyzx
mul r2.xyz, r2.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000)
max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
add r2.xyz, -r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad_sat r1.xyz, -r1.xyzx, r2.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
add r1.xyz, -r1.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r3.xyz, -r1.xyzx, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
dp3 r0.x, l(0.333300, 0.333300, 0.333300, 0.000000), r3.xyzx
lt r0.y, l(0.500000), r0.x
add r0.z, -r0.x, l(1.000000)
add r0.x, r0.x, r0.x
mul r1.xyzw, r3.xyzw, r0.xxxx
add r0.x, r0.z, r0.z
add r2.xyzw, -r3.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
mad r2.xyzw, -r0.xxxx, r2.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
movc r0.xyzw, r0.yyyy, r2.xyzw, r1.xyzw
max r0.xyzw, r0.xyzw, l(0.000000, 0.000000, 0.000000, 0.000000)
log r0.xyzw, r0.xyzw
mul r0.xyzw, r0.xyzw, l(0.600000, 0.600000, 0.600000, 0.600000)
exp r0.xyzw, r0.xyzw
add r0.xyzw, -r3.xyzw, r0.xyzw
mad o0.xyzw, r0.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r3.xyzw
ret 
// Approximately 58 instruction slots used