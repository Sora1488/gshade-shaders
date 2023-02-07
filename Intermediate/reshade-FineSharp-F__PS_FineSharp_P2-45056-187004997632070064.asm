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
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
add r0.xyzw, v1.xyxy, l(-0.000521, -0.000926, 0.000000, -0.000926)
sample_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.y, r0.zwzz, t0.yxzw, s0
max r0.z, r0.y, r0.x
min r0.x, r0.y, r0.x
add r1.xyzw, v1.xyxy, l(0.000521, -0.000926, -0.000521, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t0.yxzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.w, r1.zwzz, t0.yzwx, s0
max r1.x, r0.w, r0.y
min r0.y, r0.w, r0.y
max r0.w, r0.z, r1.x
min r0.z, r0.z, r1.x
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r1.z, r1.zwzz, t0.yzxw, s0
sample_indexable(texture2d)(float,float,float,float) r1.x, r1.xyxx, t0.xyzw, s0
add r2.xyzw, v1.xyxy, l(0.000000, 0.000926, 0.000521, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r1.y, r2.xyxx, t0.yxzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.w, r2.zwzz, t0.yzwx, s0
max r2.x, r1.y, r1.z
min r1.y, r1.y, r1.z
sample_indexable(texture2d)(float,float,float,float) r3.xyzw, v1.xyxx, t0.xyzw, s0
max r1.z, r1.x, r3.x
min r1.x, r1.x, r3.x
mov o0.yzw, r3.yyzw
max r2.y, r2.x, r1.z
min r1.z, r2.x, r1.z
min r0.w, r0.w, r2.y
max r2.x, r1.z, r0.w
min r0.w, r1.z, r0.w
min r0.z, r0.z, r2.x
max r1.z, r0.w, r0.z
min r0.z, r0.w, r0.z
min r0.w, r0.y, r0.x
max r0.x, r0.y, r0.x
min r0.y, r1.y, r1.x
max r1.x, r1.y, r1.x
max r0.y, r0.y, r0.w
min r0.w, r0.y, r0.x
max r0.x, r0.y, r0.x
max r0.y, r1.x, r0.w
max r0.w, r0.y, r0.x
min r0.x, r0.y, r0.x
max r0.x, r0.x, r0.z
min r0.y, r0.w, r1.z
min r0.z, r1.w, r0.x
max r0.x, r1.w, r0.x
max r0.y, r0.z, r0.y
min o0.x, r0.x, r0.y
ret 
// Approximately 49 instruction slots used