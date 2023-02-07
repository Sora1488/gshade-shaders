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
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
add r0.xyzw, v1.xyxy, l(0.001042, 0.001852, -0.001042, -0.001852)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r0.xyxx, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r0.zyzz, t0.xyzw, s0, l(0.000000)
add r1.xyz, r1.xyzx, r2.xyzx
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r0.zwzz, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xwxx, t0.xyzw, s0, l(0.000000)
add r1.xyz, r1.xyzx, r2.xyzx
add r0.xyz, r0.xyzx, r1.xyzx
mul r0.xyz, r0.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0
mad r0.xyz, r1.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000), r0.xyzx
add r1.xyzw, v1.xyxy, l(0.002083, 0.003704, -0.002083, -0.003704)
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zyzz, t0.xyzw, s0, l(0.000000)
add r2.xyz, r2.xyzx, r3.xyzx
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r1.xwxx, t0.xyzw, s0, l(0.000000)
add r2.xyz, r2.xyzx, r3.xyzx
add r1.xyz, r1.xyzx, r2.xyzx
mad r0.xyz, r1.xyzx, l(0.031250, 0.031250, 0.031250, 0.000000), r0.xyzx
add r1.xyzw, v1.xyxy, l(0.002083, 0.000000, -0.002083, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t0.xyzw, s0, l(0.000000)
add r1.xyz, r1.xyzx, r2.xyzx
add r2.xyzw, v1.xyxy, l(0.000000, 0.003704, 0.000000, -0.003704)
sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.xyxx, t0.xyzw, s0, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r2.zwzz, t0.xyzw, s0, l(0.000000)
add r1.xyz, r1.xyzx, r3.xyzx
add r1.xyz, r2.xyzx, r1.xyzx
mad r0.xyz, r1.xyzx, l(0.062500, 0.062500, 0.062500, 0.000000), r0.xyzx
dp3_sat r0.w, r0.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
add r0.xyz, -r0.wwww, r0.xyzx
mad r0.xyz, r0.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), r0.wwww
log r1.x, r0.w
mul r1.x, r1.x, l(1.500000)
exp r1.x, r1.x
mul r1.x, r1.x, l(1.728000)
add r1.y, r0.w, l(0.001000)
mov o0.w, r0.w
div r0.w, r1.x, r1.y
mul o0.xyz, r0.wwww, r0.xyzx
ret 
// Approximately 42 instruction slots used
