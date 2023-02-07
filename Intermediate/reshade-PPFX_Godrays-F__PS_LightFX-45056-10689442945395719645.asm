//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int pGodraysSampleAmount;          // Offset:    0 Size:     4
//   float2 pGodraysSource;             // Offset:    4 Size:     8
//   float pGodraysExposure;            // Offset:   12 Size:     4
//   float pGodraysFreq;                // Offset:   16 Size:     4
//   float pGodraysThreshold;           // Offset:   20 Size:     4
//   float pGodraysFalloff;             // Offset:   24 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s1                              sampler      NA          NA             s1      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__texColorGRB                  texture  float4          2d             t6      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 4
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
add r1.xy, v1.xyxx, -cb0[0].yzyy
itof r1.z, cb0[0].x
mul r1.z, r1.z, cb0[1].x
div r1.xy, r1.xyxx, r1.zzzz
mov r1.z, l(1.000000)
mov r1.w, r0.w
mov r2.xyzw, l(0,0,0,1)
loop 
  ige r3.x, r2.w, cb0[0].x
  breakc_nz r3.x
  itof r3.x, r2.w
  mad r3.xy, -r1.xyxx, r3.xxxx, v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r3.xyxx, t6.xyzw, s1, l(0.000000)
  mov_sat r3.xyz, r3.xyzx
  add_sat r3.xyz, r3.xyzx, -cb0[1].yyyy
  mul r3.xyz, r1.zzzz, r3.xyzx
  mad r2.xyz, r3.xyzx, cb0[0].wwww, r2.xyzx
  mad r1.w, r1.z, cb0[0].w, r1.w
  div r1.z, r1.z, cb0[1].z
  iadd r2.w, r2.w, l(1)
endloop 
dp3 r0.w, r2.xyzx, l(0.212600, 0.715200, 0.072200, 0.000000)
add r1.x, r1.w, -cb0[1].y
div r0.w, r0.w, r1.x
add o0.xyz, r0.wwww, r0.xyzx
mov o0.w, r1.w
ret 
// Approximately 28 instruction slots used