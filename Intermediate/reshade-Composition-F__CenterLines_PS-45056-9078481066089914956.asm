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
dcl_temps 3
ge r0.xy, l(0.500521, 0.500926, 0.000000, 0.000000), v1.xyxx
ge r0.zw, v1.xxxy, l(0.000000, 0.000000, 0.499479, 0.499074)
and r0.x, r0.z, r0.x
add r1.xyzw, v1.yyxx, l(0.000926, -0.000926, 0.000521, -0.000521)
ge r1.xz, r1.xxzx, v1.yyxy
ge r1.yw, v1.yyyx, r1.yyyw
and r0.x, r0.x, r1.x
and r0.z, r1.w, r1.z
and r0.x, r1.y, r0.x
and r0.y, r0.y, r0.z
and r0.y, r0.w, r0.y
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
movc r0.xzw, r0.xxxx, l(0,0,0,0), r1.xxyz
eq r2.xy, v1.yxyy, l(-1.000000, -1.000000, 0.000000, 0.000000)
movc r0.xzw, r2.xxxx, r1.xxyz, r0.xxzw
movc r1.xyz, r0.yyyy, l(0,0,0,0), r0.xzwx
movc o0.xyz, r2.yyyy, r0.xzwx, r1.xyzx
ret 
// Approximately 18 instruction slots used
