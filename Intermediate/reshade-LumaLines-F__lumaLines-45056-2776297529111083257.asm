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
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
dp3 r0.x, r0.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.yzw, r1.xyxx, t0.wxyz, s0, l(0.000000)
dp3 r0.y, r0.yzwy, l(0.333333, 0.333333, 0.333333, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
dp3 r0.z, r1.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
add r1.xyzw, v1.xyxy, l(0.000000, 0.000926, 0.000000, -0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t0.xyzw, s0, l(0.000000)
dp3 r0.w, r2.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
dp3 r1.x, r1.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
mov r1.yzw, l(0,0,0.100000,-1)
loop 
  breakc_z r1.w
  ge r2.xyz, r1.zzzz, r0.xyzx
  movc r2.yz, r2.yyzy, l(0,0,0,0), l(0,1,1,0)
  ieq r2.x, r2.x, l(0)
  iadd r2.yz, r2.xxxx, r2.yyzy
  iadd r2.y, r1.y, r2.y
  iadd r2.y, r2.z, r2.y
  ge r2.z, r1.z, r0.w
  movc r2.z, r2.z, l(0), l(1)
  iadd r2.z, r2.x, r2.z
  iadd r2.y, r2.z, r2.y
  ge r2.z, r1.z, r1.x
  movc r2.z, r2.z, l(0), l(1)
  iadd r2.x, r2.x, r2.z
  iadd r1.y, r2.x, r2.y
  add r1.z, r1.z, l(0.100000)
  ge r1.w, l(0.900000), r1.z
endloop 
ge r0.xy, l(0.100000, 0.900000, 0.000000, 0.000000), r0.xxxx
and r0.xy, r0.xyxx, l(0x3f800000, 0x3f800000, 0, 0)
itof r0.z, r1.y
max r0.x, r0.x, r0.z
min r0.x, r0.y, r0.x
add o0.xyz, -r0.xxxx, l(1.000000, 1.000000, 1.000000, 0.000000)
ret 
// Approximately 39 instruction slots used
