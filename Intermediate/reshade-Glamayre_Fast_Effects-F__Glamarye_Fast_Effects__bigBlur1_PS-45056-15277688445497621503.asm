//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__Glamarye_Fast_Effects__GITexture    texture  float4          2d             t4      1 
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
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
add r0.xyzw, v1.xyxy, l(0.018229, 0.004630, 0.054688, 0.013889)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.xyxx, t4.xyzw, s2
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.zwzz, t4.xyzw, s2
eq r2.x, r1.w, l(0.000000)
add r3.xyzw, v1.xyxy, l(-0.054688, -0.013889, -0.018229, -0.004630)
sample_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.zwzz, t4.xyzw, s2
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t4.xyzw, s2
eq r2.y, r4.w, l(0.000000)
movc r4.w, r2.y, r1.w, r4.w
movc r2.w, r2.x, r4.w, r1.w
add r5.x, r2.w, r4.w
mul r5.x, r5.x, l(0.500000)
min r5.y, r4.w, r5.x
min r5.x, r2.w, r5.x
eq r5.z, r3.w, l(0.000000)
movc r3.w, r5.z, r1.w, r3.w
mov r2.xyz, r1.xyzx
div r1.x, r3.w, r5.y
add r1.x, r1.x, l(-1.000000)
mul r1.x, r1.x, l(5.000000)
min r1.x, |r1.x|, l(1.000000)
add r6.xyzw, r4.xyzw, r3.xyzw
add r6.xyzw, r2.xyzw, r6.xyzw
eq r1.y, r0.w, l(0.000000)
movc r0.w, r1.y, r4.w, r0.w
add r6.xyzw, r0.xyzw, r6.xyzw
mad r7.xyzw, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000), -r3.xyzw
mad r1.xyzw, r1.xxxx, r7.xyzw, r3.xyzw
mad r3.xyzw, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000), -r4.xyzw
mul r5.y, r6.w, l(0.250000)
div r5.z, r4.w, r5.y
div r5.y, r2.w, r5.y
add r5.yz, r5.yyzy, l(0.000000, -1.000000, -1.000000, 0.000000)
mul r5.yz, r5.yyzy, l(0.000000, 3.000000, 3.000000, 0.000000)
min r5.yz, |r5.yyzy|, l(0.000000, 1.000000, 1.000000, 0.000000)
mad r3.xyzw, r5.zzzz, r3.xyzw, r4.xyzw
add r1.xyzw, r1.xyzw, r3.xyzw
mad r3.xyzw, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000), -r2.xyzw
mad r2.xyzw, r5.yyyy, r3.xyzw, r2.xyzw
add r1.xyzw, r1.xyzw, r2.xyzw
mad r2.xyzw, r6.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000), -r0.xyzw
div r3.x, r0.w, r5.x
add r3.x, r3.x, l(-1.000000)
mul r3.x, r3.x, l(5.000000)
min r3.x, |r3.x|, l(1.000000)
mad r0.xyzw, r3.xxxx, r2.xyzw, r0.xyzw
add r0.xyzw, r0.xyzw, r1.xyzw
mul o0.xyzw, r0.xyzw, l(0.250000, 0.250000, 0.250000, 0.250000)
ret 
// Approximately 49 instruction slots used
