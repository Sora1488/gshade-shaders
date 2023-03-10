//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texBloom3                    texture  float4          2d             t8      1 
// __V__texBloom5                    texture  float4          2d            t12      1 
// __V__ReShade__BackBufferTex       texture  float4          2d            t18      1 
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
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t12
dcl_resource_texture2d (float,float,float,float) t18
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t8.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t12.xyzw, s0
mad r0.xyz, r1.xyzx, l(9.000000, 9.000000, 9.000000, 0.000000), r0.xyzx
mul_sat r0.xyz, r0.xyzx, l(0.100000, 0.100000, 0.100000, 0.000000)
dp3 r0.w, r0.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
add r0.xyz, -r0.wwww, r0.xyzx
mad r0.xyz, r0.xyzx, l(0.800000, 0.800000, 0.800000, 0.000000), r0.wwww
mul_sat r0.xyz, r0.xyzx, l(0.700000, 0.800000, 1.000000, 0.000000)
add r0.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
mad r0.xyz, -r0.xyzx, r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t18.xyzw, s0
max o0.xyz, r0.xyzx, r1.xyzx
mov o0.w, r1.w
ret 
// Approximately 14 instruction slots used
