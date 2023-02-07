//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__Heightfog__texFogNoise       texture  float4          2d             t4      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 8     zw        1     NONE   float       
// TEXCOORD                 6   xy          2     NONE   float       
// TEXCOORD                 9     z         2     NONE   float       
// TEXCOORD                 7   xy          3     NONE   float       
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
mad r0.x, r0.x, l(999.000000), l(1.000000)
mul r0.y, r0.x, l(0.001000)
mad r1.xyz, v1.xyxx, l(2.052801, 1.154701, 0.000000, 0.000000), l(-1.026400, -0.577350, 1.000000, 0.000000)
mul r0.yzw, r0.yyyy, r1.xxyz
dp3 r1.x, r0.yzwy, r0.yzwy
sqrt r1.x, r1.x
div r0.yzw, r0.yyzw, r1.xxxx
dp3 r0.y, r0.yzwy, l(-0.006242, 0.993592, 0.112856, 0.000000)
div r0.y, l(0.001000), r0.y
lt r0.z, r0.y, l(0.000000)
movc r0.y, r0.z, l(10000000.000000), r0.y
sample_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t4.yzxw, s1
mul r0.y, r0.z, r0.y
mul r0.z, r0.z, r0.z
mad r0.x, r0.x, l(0.001000), -r0.y
mul_sat r0.w, r0.y, l(-0.500000)
lt r0.y, r1.x, r0.y
add_sat r0.x, -r0.w, r0.x
mul r0.x, r0.x, r0.x
mul r0.x, r0.x, r0.z
mul_sat r0.x, r0.x, l(250.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r2.xyz, -r1.xyzx, l(0.800000, 0.800000, 0.800000, 0.000000)
mad r0.xzw, r0.xxxx, r2.xxyz, r1.xxyz
movc o0.xyz, r0.yyyy, r1.xyzx, r0.xzwx
mov o0.w, l(1.000000)
ret 
// Approximately 30 instruction slots used
