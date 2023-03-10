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
// __V__LumaInputTex                 texture  float4          2d             t4      1 
// __V__LumaTex                      texture  float4          2d             t6      1 
// __V__texLUTDay                    texture  float4          2d            t10      1 
// __V__texLUTNight                  texture  float4          2d            t12      1 
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
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul r0.w, r0.z, l(31.000000)
frc r0.w, r0.w
mad r0.z, r0.z, l(31.000000), -r0.w
mad r0.xy, r0.xyxx, l(31.000000, 31.000000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
mul r1.yz, r0.xxyx, l(0.000000, 0.000977, 0.031250, 0.000000)
mad r1.x, r0.z, l(0.031250), r1.y
add r1.w, r1.x, l(0.031250)
sample_indexable(texture2d)(float,float,float,float) r0.xyz, r1.wzww, t10.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xzxx, t10.xyzw, s0
add r0.xyz, r0.xyzx, -r2.xyzx
mad r0.xyz, r0.wwww, r0.xyzx, r2.xyzx
add r1.yw, r1.xxxz, l(0.000000, 0.031250, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xzxx, t12.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.ywyy, t12.xyzw, s0
add r1.xyz, -r2.xyzx, r1.xyzx
mad r1.xyz, r0.wwww, r1.xyzx, r2.xyzx
add r2.xyz, r0.xyzx, -r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r0.w, l(0.500000, 0.500000, 0.000000, 0.000000), t6.yzwx, s0
add r1.w, r0.w, l(-0.200000)
mul r1.w, r1.w, l(1.818182)
mad r2.xyz, r1.wwww, r2.xyzx, r1.xyzx
lt r3.xy, r0.wwww, l(0.200000, 0.500000, 0.000000, 0.000000)
movc r1.xyz, r3.xxxx, r1.xyzx, r2.xyzx
lt r1.w, l(0.750000), r0.w
add r0.w, -r0.w, l(0.500000)
mul_sat r0.w, r0.w, l(10.000000)
movc r0.xyz, r1.wwww, r0.xyzx, r1.xyzx
mul r1.x, r0.z, l(31.000000)
frc r1.x, r1.x
mad r1.y, r0.z, l(31.000000), -r1.x
mad r1.zw, r0.xxxy, l(0.000000, 0.000000, 31.000000, 31.000000), l(0.000000, 0.000000, 0.500000, 0.500000)
mul r2.yz, r1.zzwz, l(0.000000, 0.000977, 0.031250, 0.000000)
mad r2.x, r1.y, l(0.031250), r2.y
add r2.w, r2.x, l(0.031250)
sample_indexable(texture2d)(float,float,float,float) r1.yzw, r2.xzxx, t10.wxyz, s0
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r2.wzww, t10.xyzw, s0
add r2.xyz, -r1.yzwy, r2.xyzx
mad r1.xyz, r1.xxxx, r2.xyzx, r1.yzwy
add r1.xyz, -r0.xyzx, r1.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.w, v1.xyxx, t4.yzwx, s0
add r2.x, r1.w, l(-0.500000)
lt r1.w, l(0.500000), r1.w
and r1.w, r1.w, r3.y
mul_sat r2.x, r2.x, l(3.333333)
mul r0.w, r0.w, r2.x
mad r1.xyz, r0.wwww, r1.xyzx, r0.xyzx
movc o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
ret 
// Approximately 49 instruction slots used
