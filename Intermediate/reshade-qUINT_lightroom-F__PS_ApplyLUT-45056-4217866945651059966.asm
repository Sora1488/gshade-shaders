//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__qUINT__BackBufferTex         texture  float4          2d             t0      1 
// __V__LutTexInternal               texture  float4          2d             t4      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 1   x           2     NONE   float       
// TEXCOORD                 2   x           3     NONE   float       
// TEXCOORD                 3   x           4     NONE   float       
// TEXCOORD                 4   x           5     NONE   float       
// TEXCOORD                 5   x           6     NONE   float       
// TEXCOORD                 6   x           7     NONE   float       
// TEXCOORD                 7   x           8     NONE   float       
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
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mul r0.z, r0.z, l(63.000000)
round_ni r1.x, r0.z
frc r0.z, r0.z
mad r0.xy, r0.xyxx, l(63.000000, 63.000000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
mov o0.w, r0.w
mul r2.yz, r0.xxyx, l(0.000000, 0.000244, 0.015625, 0.000000)
mad r2.x, r1.x, l(0.015625), r2.y
add r2.w, r2.x, l(0.015625)
sample_indexable(texture2d)(float,float,float,float) r0.xyw, r2.xzxx, t4.xywz, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r2.wzww, t4.xyzw, s0
add r1.xyz, -r0.xywx, r1.xyzx
mad o0.xyz, r0.zzzz, r1.xyzx, r0.xywx
ret 
// Approximately 14 instruction slots used