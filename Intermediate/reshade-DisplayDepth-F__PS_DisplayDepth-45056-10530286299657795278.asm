//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   x   
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps_siv linear noperspective v0.x, position
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
add r0.xyzw, v1.xyxy, l(-0.000000, -0.000926, 0.000521, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t2.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r0.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r0.z, r0.z, r0.w
add r1.xz, v1.yyxy, l(-0.500000, 0.000000, -0.500000, 0.000000)
mov r1.y, l(1.000000)
mul r1.xyz, r0.zzzz, r1.xyzx
add r2.yz, v1.xxyx, l(0.000000, -0.500000, -0.500926, 0.000000)
mov r2.x, l(1.000000)
mad r2.xyz, -r2.xyzx, r0.xxxx, r1.yzxy
mad r0.x, -r0.y, l(999.000000), l(1000.000000)
div r0.x, r0.y, r0.x
add r3.xz, v1.yyxy, l(-0.500000, 0.000000, -0.499479, 0.000000)
mov r3.y, l(1.000000)
mad r0.xyw, -r3.xyxz, r0.xxxx, r1.xyxz
mul r1.xyz, r0.xywx, r2.xyzx
mad r0.xyw, r2.zxzy, r0.ywyx, -r1.xyxz
dp3 r1.x, r0.xywx, r0.xywx
rsq r1.x, r1.x
mul r0.xyw, r0.xyxw, r1.xxxx
mad r0.xyw, r0.xyxw, l(0.500000, 0.500000, 0.000000, 0.500000), l(0.500000, 0.500000, 0.000000, 0.500000)
dp2 r1.x, v1.xyxx, l(120.250000, 300.250000, 0.000000, 0.000000)
frc r1.x, r1.x
mad r1.xyz, r1.xxxx, l(-0.003922, 0.003922, -0.003922, 0.000000), r0.zzzz
add r1.xyz, r1.xyzx, l(0.001961, -0.001961, 0.001961, 0.000000)
add r1.xyz, -r0.xywx, r1.xyzx
ge r0.z, v0.x, l(960.000000)
and r0.z, r0.z, l(0x3f800000)
mad o0.xyz, r0.zzzz, r1.xyzx, r0.xywx
ret 
// Approximately 34 instruction slots used
