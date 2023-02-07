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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.w, r0.xyzx, l(0.029957, 0.184309, 1.467090, 0.000000)
mul r1.x, r0.w, l(-2.525810)
dp3 r1.y, r0.xyzx, l(3.455650, 27.155399, 3.867140, 0.000000)
mad r1.x, r1.y, l(2.023440), r1.x
mul r1.yzw, r1.yyyy, l(0.000000, -0.130504, 0.054019, -0.004122)
mad r1.xyz, r1.xxxx, l(0.080944, -0.010249, -0.000365, 0.000000), r1.yzwy
mad r1.xyz, r0.wwww, l(0.116721, -0.113615, 0.693511, 0.000000), r1.xyzx
add r1.xyz, r0.xyzx, -r1.xyzx
mad r1.yz, r1.xxxx, l(0.000000, 0.700000, 0.700000, 0.000000), r1.yyzy
mov r1.x, l(0)
add o0.xyz, r0.xyzx, r1.xyzx
ret 
// Approximately 13 instruction slots used
