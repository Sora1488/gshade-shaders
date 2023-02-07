//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__TempTex0                     texture  float4          2d             t4      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 2   xyz         2     NONE   float       
// TEXCOORD                 3   xyz         3     NONE   float       
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
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
sample_aoffimmi_indexable(-1,0,0)(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t4.xyzw, s0
sample_aoffimmi_indexable(-1,-1,0)(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
mad r0.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r1.xyzx
sample_aoffimmi_indexable(-1,1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t4.xyzw, s0
add r0.xyz, r0.xyzx, r2.xyzx
add r1.xyz, r1.xyzx, -r2.xyzx
sample_aoffimmi_indexable(1,-1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t4.xyzw, s0
add r0.xyz, r0.xyzx, -r2.xyzx
sample_aoffimmi_indexable(1,0,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t4.xyzw, s0
mad r0.xyz, r3.xyzx, l(-2.000000, -2.000000, -2.000000, 0.000000), r0.xyzx
sample_aoffimmi_indexable(1,1,0)(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t4.xyzw, s0
add r0.xyz, r0.xyzx, -r3.xyzx
dp3 r0.x, r0.xyzx, r0.xyzx
sample_aoffimmi_indexable(0,-1,0)(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t4.wxyz, s0
mad r0.yzw, r0.yyzw, l(0.000000, 2.000000, 2.000000, 2.000000), r1.xxyz
sample_aoffimmi_indexable(0,1,0)(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
mad r0.yzw, r1.xxyz, l(0.000000, -2.000000, -2.000000, -2.000000), r0.yyzw
add r0.yzw, r2.xxyz, r0.yyzw
add r0.yzw, -r3.xxyz, r0.yyzw
dp3 r0.y, r0.yzwy, r0.yzwy
add r0.x, r0.y, r0.x
mul r0.x, r0.x, l(0.020000)
log r0.x, r0.x
mul r0.x, r0.x, l(1.500000)
exp r0.x, r0.x
add r0.yz, v1.xxyx, l(0.000000, -0.500000, -0.500000, 0.000000)
max r0.y, |r0.z|, |r0.y|
add r0.y, r0.y, l(-0.500000)
mul_sat r0.y, r0.y, l(-49.999973)
mad r0.z, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.z
mul o0.xyz, r0.yyyy, r0.xxxx
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t4.wxyz, s0
mov o0.w, r0.x
ret 
// Approximately 36 instruction slots used