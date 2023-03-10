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
// __V__chromaSubTex                 texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 2
add r0.xy, v1.xyxx, l(0.000521, 0.000000, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t4.xyzw, s0
add r0.xyz, r0.xyzx, r1.xyzx
add r0.w, r0.y, r0.x
add r0.w, r0.z, r0.w
mad r0.xyz, -r0.wwww, l(0.333333, 0.333333, 0.333333, 0.000000), r0.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
add r0.w, r1.y, r1.x
add r0.w, r1.z, r0.w
mad o0.xyz, r0.wwww, l(0.333333, 0.333333, 0.333333, 0.000000), r0.xyzx
ret 
// Approximately 12 instruction slots used
