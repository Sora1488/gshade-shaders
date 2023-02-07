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
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__tFocus                       texture  float4          2d             t4      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 4
dcl_indexableTemp x0[12], 4
mov x0[0].xy, l(-0.326000,-0.406000,0,0)
mov x0[1].xy, l(-0.840000,-0.074000,0,0)
mov x0[2].xy, l(-0.696000,0.457000,0,0)
mov x0[3].xy, l(-0.203000,0.621000,0,0)
mov x0[4].xy, l(0.962000,-0.195000,0,0)
mov x0[5].xy, l(0.473000,-0.480000,0,0)
mov x0[6].xy, l(0.519000,0.767000,0,0)
mov x0[7].xy, l(0.185000,-0.893000,0,0)
mov x0[8].xy, l(0.507000,0.064000,0,0)
mov x0[9].xy, l(0.896000,0.412000,0,0)
mov x0[10].xy, l(-0.322000,-0.933000,0,0)
mov x0[11].xy, l(-0.792000,-0.598000,0,0)
dp2 r0.x, v1.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r0.x, null, r0.x
mul r0.x, r0.x, l(43758.542969)
frc r0.x, r0.x
sincos r1.x, r2.x, r0.x
sincos r0.x, null, -r0.x
sample_indexable(texture2d)(float,float,float,float) r0.w, l(0.000000, 0.000000, 0.000000, 0.000000), t4.yzwx, s0
mov r0.y, r2.x
mov r0.z, r1.x
mov r1.xyzw, l(0,0,0,0)
loop 
  ige r2.x, r1.w, l(12)
  breakc_nz r2.x
  mov r2.xy, x0[r1.w + 0].xyxx
  dp2 r3.x, r2.yxyy, r0.xyxx
  dp2 r3.y, r2.yxyy, r0.yzyy
  mul r2.xy, r3.xyxx, l(0.002604, 0.004630, 0.000000, 0.000000)
  mad r2.zw, r3.xxxy, l(0.000000, 0.000000, 0.002604, 0.004630), v1.xxxy
  sample_l_indexable(texture2d)(float,float,float,float) r2.z, r2.zwzz, t2.yzxw, s0, l(0.000000)
  mad r2.w, -r2.z, l(999.000000), l(1000.000000)
  div r2.z, r2.z, r2.w
  add r2.z, -r0.w, r2.z
  mul_sat r2.z, r2.z, l(-10.000000)
  mad r2.xy, r2.zzzz, r2.xyxx, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t0.xyzw, s0, l(0.000000)
  add r1.xyz, r1.xyzx, r2.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mul o0.xyz, r1.xyzx, l(0.083000, 0.083000, 0.083000, 0.000000)
ret 
// Approximately 42 instruction slots used
