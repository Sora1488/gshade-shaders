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
dcl_temps 2
add r0.xyzw, v1.xyxy, l(-0.000521, -0.000926, 0.000521, -0.000926)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r0.zwzz, t0.yzxw, s0
sample_indexable(texture2d)(float,float,float,float) r0.xy, r0.xyxx, t0.xwyz, s0
add r0.x, -r0.x, r0.y
add r0.y, -r0.z, r0.w
lt r0.z, l(0.000000), r0.y
lt r0.w, r0.y, l(0.000000)
iadd r0.z, -r0.z, r0.w
itof r0.z, r0.z
mul r0.w, |r0.y|, l(171.140930)
log r0.w, r0.w
mul r0.zw, r0.zzzw, l(0.000000, 0.000000, 0.007843, 0.786164)
exp r0.w, r0.w
mul r0.z, r0.w, r0.z
mul r0.w, r0.y, r0.y
mad r0.y, r0.y, r0.y, l(0.000032)
div r0.y, r0.w, r0.y
mul r0.y, r0.y, r0.z
lt r0.z, l(0.000000), r0.x
lt r0.w, r0.x, l(0.000000)
iadd r0.z, -r0.z, r0.w
itof r0.z, r0.z
mul r0.w, |r0.x|, l(171.140930)
log r0.w, r0.w
mul r0.zw, r0.zzzw, l(0.000000, 0.000000, 0.007843, 0.786164)
exp r0.w, r0.w
mul r0.z, r0.w, r0.z
mul r0.w, r0.x, r0.x
mad r0.x, r0.x, r0.x, l(0.000032)
div r0.x, r0.w, r0.x
mad r0.x, r0.z, r0.x, r0.y
add r1.xyzw, v1.xyxy, l(-0.000521, 0.000926, 0.000521, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r0.yz, r1.xyxx, t0.yxwz, s0
sample_indexable(texture2d)(float,float,float,float) r1.xy, r1.zwzz, t0.xwyz, s0
add r0.w, -r1.x, r1.y
add r0.y, -r0.y, r0.z
lt r0.z, l(0.000000), r0.y
lt r1.x, r0.y, l(0.000000)
iadd r0.z, -r0.z, r1.x
itof r0.z, r0.z
mul r0.z, r0.z, l(0.007843)
mul r1.x, |r0.y|, l(171.140930)
log r1.x, r1.x
mul r1.x, r1.x, l(0.786164)
exp r1.x, r1.x
mul r0.z, r0.z, r1.x
mul r1.x, r0.y, r0.y
mad r0.y, r0.y, r0.y, l(0.000032)
div r0.y, r1.x, r0.y
mad r0.x, r0.z, r0.y, r0.x
lt r0.y, l(0.000000), r0.w
lt r0.z, r0.w, l(0.000000)
iadd r0.y, -r0.y, r0.z
itof r0.y, r0.y
mul r0.z, |r0.w|, l(171.140930)
log r0.z, r0.z
mul r0.yz, r0.yyzy, l(0.000000, 0.007843, 0.786164, 0.000000)
exp r0.z, r0.z
mul r0.y, r0.z, r0.y
mul r0.z, r0.w, r0.w
mad r0.w, r0.w, r0.w, l(0.000032)
div r0.z, r0.z, r0.w
mad r0.x, r0.y, r0.z, r0.x
add r1.xyzw, v1.xyxy, l(0.000000, -0.000926, -0.000521, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.yz, r1.zwzz, t0.yxwz, s0
sample_indexable(texture2d)(float,float,float,float) r1.xy, r1.xyxx, t0.xwyz, s0
add r0.w, -r1.x, r1.y
add r0.y, -r0.y, r0.z
lt r0.z, l(0.000000), r0.y
lt r1.x, r0.y, l(0.000000)
iadd r0.z, -r0.z, r1.x
itof r0.z, r0.z
mul r0.z, r0.z, l(0.007843)
mul r1.x, |r0.y|, l(171.140930)
log r1.x, r1.x
mul r1.x, r1.x, l(0.786164)
exp r1.x, r1.x
mul r0.z, r0.z, r1.x
mul r1.x, r0.y, r0.y
mad r0.y, r0.y, r0.y, l(0.000032)
div r0.y, r1.x, r0.y
mul r0.y, r0.y, r0.z
lt r0.z, l(0.000000), r0.w
lt r1.x, r0.w, l(0.000000)
iadd r0.z, -r0.z, r1.x
itof r0.z, r0.z
mul r0.z, r0.z, l(0.007843)
mul r1.x, |r0.w|, l(171.140930)
log r1.x, r1.x
mul r1.x, r1.x, l(0.786164)
exp r1.x, r1.x
mul r0.z, r0.z, r1.x
mul r1.x, r0.w, r0.w
mad r0.w, r0.w, r0.w, l(0.000032)
div r0.w, r1.x, r0.w
mad r0.y, r0.z, r0.w, r0.y
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, 0.000000, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r0.zw, r1.xyxx, t0.yzxw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xy, r1.zwzz, t0.xwyz, s0
add r1.x, -r1.x, r1.y
add r0.z, -r0.z, r0.w
lt r0.w, l(0.000000), r0.z
lt r1.y, r0.z, l(0.000000)
iadd r0.w, -r0.w, r1.y
itof r0.w, r0.w
mul r0.w, r0.w, l(0.007843)
mul r1.y, |r0.z|, l(171.140930)
log r1.y, r1.y
mul r1.y, r1.y, l(0.786164)
exp r1.y, r1.y
mul r0.w, r0.w, r1.y
mul r1.y, r0.z, r0.z
mad r0.z, r0.z, r0.z, l(0.000032)
div r0.z, r1.y, r0.z
mad r0.y, r0.w, r0.z, r0.y
lt r0.z, l(0.000000), r1.x
lt r0.w, r1.x, l(0.000000)
iadd r0.z, -r0.z, r0.w
itof r0.z, r0.z
mul r0.w, |r1.x|, l(171.140930)
log r0.w, r0.w
mul r0.zw, r0.zzzw, l(0.000000, 0.000000, 0.007843, 0.786164)
exp r0.w, r0.w
mul r0.z, r0.w, r0.z
mul r0.w, r1.x, r1.x
mad r1.x, r1.x, r1.x, l(0.000032)
div r0.w, r0.w, r1.x
mad r0.y, r0.z, r0.w, r0.y
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0
add r0.z, -r1.x, r1.w
lt r0.w, l(0.000000), r0.z
lt r1.x, r0.z, l(0.000000)
iadd r0.w, -r0.w, r1.x
itof r0.w, r0.w
mul r0.w, r0.w, l(0.007843)
mul r1.x, |r0.z|, l(171.140930)
log r1.x, r1.x
mul r1.x, r1.x, l(0.786164)
exp r1.x, r1.x
mul r0.w, r0.w, r1.x
mul r1.x, r0.z, r0.z
mad r0.z, r0.z, r0.z, l(0.000032)
div r0.z, r1.x, r0.z
mul r1.x, r0.z, r0.w
mad r0.z, r0.w, r0.z, r1.w
mov o0.yz, r1.yyzy
mad r0.y, r1.x, l(2.000000), r0.y
mad r0.x, r0.y, l(2.000000), r0.x
mad o0.xw, -r0.xxxx, l(0.056250, 0.000000, 0.000000, 0.056250), r0.zzzz
ret 
// Approximately 150 instruction slots used
