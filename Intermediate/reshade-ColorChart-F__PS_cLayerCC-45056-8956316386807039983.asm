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
// __V__Color_Chart_Texture          texture  float4          2d             t4      1 
// __V__Color_Chart_BG_S_Texture     texture  float4          2d             t6      1 
// __V__Color_Chart_BG_Texture       texture  float4          2d            t10      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
mov r0.xz, v1.xxyx
mov r0.yw, l(0,1.000000,0,1.000000)
dp2 r0.x, r0.xyxx, l(1.000000, -0.100000, 0.000000, 0.000000)
dp2 r0.y, r0.zwzz, l(1.000000, -0.500000, 0.000000, 0.000000)
mul r1.xy, r0.xyxx, l(5.397200, 4.553888, 0.000000, 0.000000)
add r0.xy, r1.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
mov_sat r0.zw, r0.xxxy
eq r0.zw, r0.zzzw, r0.xxxy
and r0.z, r0.w, r0.z
and r0.z, r0.z, l(0x3f800000)
sample_indexable(texture2d)(float,float,float,float) r0.w, r0.xyxx, t6.yzwx, s0
mul r1.x, r0.z, r0.w
sample_indexable(texture2d)(float,float,float,float) r2.xyzw, v1.xyxx, t0.xyzw, s0
mad r1.yzw, r0.wwww, r0.zzzz, -r2.xxyz
mad r1.xyz, r1.xxxx, r1.yzwy, r2.xyzx
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, r0.xyxx, t4.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t10.wxyz, s0
mul r0.x, r0.z, r0.x
mad r3.xyz, r3.xyzx, r0.zzzz, -r1.xyzx
mul r0.y, r0.z, r3.w
mad r0.yzw, r0.yyyy, r3.xxyz, r1.xxyz
add r0.yzw, -r2.xxyz, r0.yyzw
mad o0.xyz, r0.xxxx, r0.yzwy, r2.xyzx
mov o0.w, r2.w
ret 
// Approximately 25 instruction slots used