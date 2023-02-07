//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__Contrast__BackBuffer         texture  float4          2d             t0      1 
// __V__Contrast__CSHistogramLUT     texture  float4          2d            t10      1 
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
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul r0.w, r0.y, l(0.331264)
mad r0.w, r0.x, l(-0.168736), -r0.w
mad r0.w, r0.z, l(0.500000), r0.w
mov r1.y, l(0.500000)
dp3 r1.x, r0.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.x, r1.xyxx, t10.xyzw, s0
mad r1.y, -r0.w, l(0.344136), r1.x
mad o0.z, r0.w, l(1.772000), r1.x
mul r0.y, r0.y, l(0.418688)
mad r0.x, r0.x, l(0.500000), -r0.y
mad r0.x, -r0.z, l(0.081312), r0.x
mad o0.y, -r0.x, l(0.714136), r1.y
mad o0.x, r0.x, l(1.402000), r1.x
ret 
// Approximately 15 instruction slots used