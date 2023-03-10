//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__BackBuffer                   texture  float4          2d             t4      1 
// __V__Mean                         texture  float4          2d             t6      1 
// __V__Variance                     texture  float4          2d             t8      1 
// __V__Maximum                      texture  float4          2d            t14      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
mul r0.x, r0.x, l(-0.100989)
exp r0.x, r0.x
sample_l_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t14.yxzw, s0, l(4.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t14.yzxw, s0, l(5.000000)
add r0.y, r0.z, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t14.yzxw, s0, l(6.000000)
add r0.y, r0.z, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t14.yzxw, s0, l(7.000000)
add r0.y, r0.z, r0.y
mul r0.y, r0.y, l(0.250000)
max r0.y, r0.y, l(0.050000)
min r0.y, r0.y, l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t6.yzxw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t8.yzwx, s0, l(7.000000)
sample_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t8.xyzw, s0
add r0.w, -r0.w, r1.x
max r0.w, r0.w, l(0.000000)
div r0.w, r0.w, r1.x
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
min r1.w, r1.y, r1.x
min r1.w, r1.z, r1.w
add r2.x, -r0.z, r1.w
mul_sat r0.w, r0.w, r2.x
add_sat r0.z, r0.w, r0.z
mul r0.z, r1.w, r0.z
div r0.z, r0.z, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t6.yzwx, s0, l(7.000000)
add r0.w, -r0.w, r0.y
lt r1.w, r0.w, l(0.350000)
add r2.x, r0.w, l(0.400000)
ge r0.w, l(0.250000), r0.w
movc r1.w, r1.w, r2.x, l(0.750000)
movc r0.w, r0.w, l(0.550000), r1.w
max r1.w, r1.y, r1.x
max r1.w, r1.z, r1.w
div r2.x, r0.w, r1.w
add r1.w, -r0.y, r1.w
lt r0.w, r1.w, r0.w
mul r1.w, r0.z, r2.x
min r1.w, r1.w, l(1.000000)
movc r0.z, r0.w, r1.w, r0.z
add r0.z, -r0.z, l(1.000000)
mul r0.x, r0.x, r0.z
mul r0.x, r0.x, l(1.221403)
max r0.x, r0.x, l(0.050000)
min r0.x, r0.x, l(1.000000)
dp3 r0.z, r1.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
add r0.z, -r0.y, r0.z
div r0.x, r0.z, r0.x
add r0.x, r0.y, r0.x
mul r0.y, r1.y, l(0.331264)
mad r0.y, r1.x, l(-0.168736), -r0.y
mad r0.y, r1.z, l(0.500000), r0.y
mad r0.z, -r0.y, l(0.344136), r0.x
mad r2.z, r0.y, l(1.772000), r0.x
mul r0.y, r1.y, l(0.418688)
mad r0.y, r1.x, l(0.500000), -r0.y
mad r0.y, -r1.z, l(0.081312), r0.y
mad r2.y, -r0.y, l(0.714136), r0.z
mad r2.x, r0.y, l(1.402000), r0.x
add r0.xyz, -r1.xyzx, r2.xyzx
mad o0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
ret 
// Approximately 66 instruction slots used
