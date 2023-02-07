//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __srgbV__ReShade__BackBufferTex    texture  float4          2d             t1      1 
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
dcl_immediateConstantBuffer { { 0, 0, 0, 0},
                              { 48, 0, 0, 0},
                              { 12, 0, 0, 0},
                              { 60, 0, 0, 0},
                              { 3, 0, 0, 0},
                              { 51, 0, 0, 0},
                              { 15, 0, 0, 0},
                              { 63, 0, 0, 0},
                              { 32, 0, 0, 0},
                              { 16, 0, 0, 0},
                              { 44, 0, 0, 0},
                              { 28, 0, 0, 0},
                              { 35, 0, 0, 0},
                              { 19, 0, 0, 0},
                              { 47, 0, 0, 0},
                              { 31, 0, 0, 0},
                              { 8, 0, 0, 0},
                              { 56, 0, 0, 0},
                              { 4, 0, 0, 0},
                              { 52, 0, 0, 0},
                              { 11, 0, 0, 0},
                              { 59, 0, 0, 0},
                              { 7, 0, 0, 0},
                              { 55, 0, 0, 0},
                              { 40, 0, 0, 0},
                              { 24, 0, 0, 0},
                              { 36, 0, 0, 0},
                              { 20, 0, 0, 0},
                              { 43, 0, 0, 0},
                              { 27, 0, 0, 0},
                              { 39, 0, 0, 0},
                              { 23, 0, 0, 0},
                              { 2, 0, 0, 0},
                              { 50, 0, 0, 0},
                              { 14, 0, 0, 0},
                              { 62, 0, 0, 0},
                              { 1, 0, 0, 0},
                              { 49, 0, 0, 0},
                              { 13, 0, 0, 0},
                              { 61, 0, 0, 0},
                              { 34, 0, 0, 0},
                              { 18, 0, 0, 0},
                              { 46, 0, 0, 0},
                              { 30, 0, 0, 0},
                              { 33, 0, 0, 0},
                              { 17, 0, 0, 0},
                              { 45, 0, 0, 0},
                              { 29, 0, 0, 0},
                              { 10, 0, 0, 0},
                              { 58, 0, 0, 0},
                              { 6, 0, 0, 0},
                              { 54, 0, 0, 0},
                              { 9, 0, 0, 0},
                              { 57, 0, 0, 0},
                              { 5, 0, 0, 0},
                              { 53, 0, 0, 0},
                              { 42, 0, 0, 0},
                              { 26, 0, 0, 0},
                              { 38, 0, 0, 0},
                              { 22, 0, 0, 0},
                              { 41, 0, 0, 0},
                              { 25, 0, 0, 0},
                              { 37, 0, 0, 0},
                              { 21, 0, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t1
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
mul r0.xyzw, v1.xyxy, l(1920.000000, 1080.000000, 15360.000000, 8640.000000)
ge r1.xyzw, r0.zwzw, -r0.zwzw
movc r1.xyzw, r1.xyzw, l(8.000000,8.000000,0.125000,0.125000), l(-8.000000,-8.000000,-0.125000,-0.125000)
mul r0.xy, r0.xyxx, r1.zwzz
frc r0.xy, r0.xyxx
mul r0.xy, r0.xyxx, r1.xyxx
ftoi r0.xy, r0.xyxx
ishl r0.y, r0.y, l(3)
iadd r0.x, r0.y, r0.x
iadd r0.x, l(1), icb[r0.x + 0].x
itof r0.x, r0.x
mul r0.x, r0.x, l(0.015625)
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t1.xyzw, s0
dp3 r0.y, r1.xyzx, l(0.212600, 0.715200, 0.072200, 0.000000)
ge r0.x, r0.y, r0.x
and r0.x, r0.x, l(0x3f800000)
mul r0.xyz, r0.xxxx, r1.xyzx
mad o0.xyz, r0.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r1.xyzx
mov o0.w, r1.w
ret 
// Approximately 20 instruction slots used
