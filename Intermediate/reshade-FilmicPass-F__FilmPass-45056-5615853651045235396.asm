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
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mov_sat r0.xyz, r0.xyzx
rsq r0.xyz, r0.xyzx
div r0.xyz, l(1.000000, 1.000000, 1.000000, 1.000000), r0.xyzx
dp3 r0.w, r0.xyzx, l(0.212656, 0.715158, 0.072186, 0.000000)
add r0.w, r0.w, l(-0.500000)
mul r0.w, r0.w, l(-1.442695)
exp r0.w, r0.w
add r0.w, r0.w, l(1.000000)
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
add r0.w, r0.w, l(-0.377541)
mul r0.w, r0.w, l(4.082988)
log r0.w, r0.w
mul r0.w, r0.w, l(1.538462)
exp r0.w, r0.w
mad r1.x, r0.w, l(2.000000), l(-1.000000)
lt r0.w, r0.w, l(0.500000)
sqrt r2.xyzw, r0.xyzy
add r2.xyzw, -r0.xyzy, r2.xyzw
mad r2.xyzw, r1.xxxx, r2.xyzw, r0.xyzy
mad r3.xyzw, -r0.xyzy, r0.xyzy, r0.xyzy
mad r1.xyzw, r1.xxxx, r3.xyzw, r0.xyzy
movc r1.xyzw, r0.wwww, r1.xyzw, r2.xyzw
add r1.xyzw, -r0.xyzy, r1.xyzw
mad r1.xyzw, r1.xyzw, l(0.850000, 0.850000, 0.850000, 0.850000), r0.xyzy
add r1.xyzw, r1.xyzw, l(-0.500000, -0.500000, -0.500000, -0.500000)
mul r1.xyzw, r1.xyzw, l(-2.164042, -2.164042, -2.164042, -2.164042)
exp r1.xyzw, r1.xyzw
add r1.xyzw, r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
div r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
add r1.xyzw, r1.xyzw, l(-0.320821, -0.320821, -0.320821, -0.320821)
mul r2.xyz, r1.xywx, l(-0.418577, 2.092883, 0.697628, 0.000000)
add r2.xy, r2.yzyy, r2.xxxx
mad r3.y, r1.z, l(0.697628), r2.x
mad r3.z, r1.z, l(2.092883), r2.y
dp3 r3.x, r1.xwzx, l(3.209087, -0.418577, -0.418577, 0.000000)
sqrt r1.xyz, r3.xyzx
add r1.xyz, -r3.xyzx, r1.xyzx
dp3 r0.w, r3.xyzx, l(0.212656, 0.715158, 0.072186, 0.000000)
mad r1.w, r0.w, l(2.000000), l(-1.000000)
lt r0.w, r0.w, l(0.500000)
mad r1.xyz, r1.wwww, r1.xyzx, r3.xyzx
mad r2.xyz, -r3.xyzx, r3.xyzx, r3.xyzx
mad r2.xyz, r1.wwww, r2.xyzx, r3.xyzx
movc r1.xyz, r0.wwww, r2.xyzx, r1.xyzx
max r1.xyz, r1.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
mad r1.xyz, r1.xyzx, r1.xyzx, -r0.xyzx
mad o0.xyz, r1.xyzx, l(0.850000, 0.850000, 0.850000, 0.000000), r0.xyzx
ret 
// Approximately 49 instruction slots used