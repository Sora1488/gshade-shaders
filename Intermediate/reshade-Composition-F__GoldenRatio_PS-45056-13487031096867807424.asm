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
dcl_temps 4
ge r0.xyzw, l(0.618555, 0.382487, 0.618960, 0.382892), v1.xxyy
ge r1.xyzw, v1.xxyy, l(0.617513, 0.381445, 0.617108, 0.381040)
and r0.xy, r0.xyxx, r1.xyxx
add r2.xyzw, v1.yyxx, l(0.000926, -0.000926, 0.000521, -0.000521)
ge r1.xy, r2.xzxx, v1.yxyy
ge r2.xy, v1.yxyy, r2.ywyy
and r0.xy, r0.xyxx, r1.xxxx
and r1.x, r1.y, r2.y
and r0.xy, r2.xxxx, r0.xyxx
and r0.zw, r0.zzzw, r1.xxxx
and r0.zw, r1.zzzw, r0.zzzw
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
movc r2.xyz, r0.xxxx, l(0,0,0,0), r1.xyzx
eq r3.xy, v1.yxyy, l(-1.000000, -1.000000, 0.000000, 0.000000)
movc r2.xyz, r3.xxxx, r1.xyzx, r2.xyzx
movc r2.xyz, r0.yyyy, l(0,0,0,0), r2.xyzx
movc r1.xyz, r3.xxxx, r1.xyzx, r2.xyzx
movc r0.xyz, r0.zzzz, l(0,0,0,0), r1.xyzx
movc r0.xyz, r3.yyyy, r1.xyzx, r0.xyzx
movc r0.xyz, r0.wwww, l(0,0,0,0), r0.xyzx
movc o0.xyz, r3.yyyy, r1.xyzx, r0.xyzx
ret 
// Approximately 22 instruction slots used
