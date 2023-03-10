//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float2 MouseCoords;                // Offset:    0 Size:     8
//   bool LeftMouseDown;                // Offset:    8 Size:     4
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
// __s2                              sampler      NA          NA             s2      1 
// __s3                              sampler      NA          NA             s3      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__CinematicDOF__texCDCoC       texture  float4          2d             t8      1 
// __V__CinematicDOF__texCDBuffer4    texture  float4          2d            t26      1 
// __V__CinematicDOF__texCDBuffer5    texture  float4          2d            t28      1 
// __V__CinematicDOF__texCDNoise     texture  float4          2d            t30      1 
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
// TEXCOORD                 1     z         1     NONE   float       
// TEXCOORD                 2      w        1     NONE   float       
// TEXCOORD                 3   x           2     NONE   float       
// TEXCOORD                 4    y          2     NONE   float    y  
// TEXCOORD                 5     z         2     NONE   float     z 
// TEXCOORD                 6      w        2     NONE   float      w
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_sampler s2, mode_default
dcl_sampler s3, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t26
dcl_resource_texture2d (float,float,float,float) t28
dcl_resource_texture2d (float,float,float,float) t30
dcl_input_ps linear v1.xy
dcl_input_ps linear v2.y
dcl_input_ps linear v2.z
dcl_input_ps linear v2.w
dcl_output o0.xyzw
dcl_temps 4
sample_l_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t28.xyzw, s1, l(0.000000)
sample_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t26.xyzw, s1
mul r2.xy, v1.xyxx, l(3.750000, 2.109375, 0.000000, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.w, r2.xyxx, t30.yzwx, s3
mad r0.w, r0.w, l(0.003922), l(-0.001961)
add_sat r0.xyz, r0.wwww, r0.xyzx
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t8.yzwx, s2, l(0.000000)
lt r1.w, |r0.w|, l(0.001062)
mul r2.x, |r0.w|, l(4.000000)
min r2.x, r2.x, l(1.000000)
movc r1.w, r1.w, l(0), r2.x
add r0.xyz, -r1.xyzx, r0.xyzx
mad r0.xyz, r1.wwww, r0.xyzx, r1.xyzx
if_nz cb0[0].z
  sample_l_indexable(texture2d)(float,float,float,float) r1.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
  mad r1.y, -r1.x, l(999.000000), l(1000.000000)
  div r1.x, r1.x, r1.y
  mul r1.x, r1.x, l(1000000.000000)
  lt r1.y, r1.x, v2.z
  lt r1.z, l(0.000000), v2.w
  lt r1.x, v2.w, r1.x
  and r1.x, r1.x, r1.z
  or r1.x, r1.x, r1.y
  lt r0.w, |r0.w|, v2.y
  movc r1.yzw, r0.wwww, l(0,0,0,1.000000), r0.xxyz
  movc r1.xyz, r1.xxxx, l(0.800000,0.800000,0.800000,0), r1.yzwy
  add r1.xyz, -r0.xyzx, r1.xyzx
  mad r1.xyz, r1.xyzx, l(0.700000, 0.700000, 0.700000, 0.000000), r0.xyzx
  mad r2.xy, -cb0[0].xyxx, l(0.000521, 0.000926, 0.000000, 0.000000), v1.xyxx
  mul r2.xy, |r2.xyxx|, l(-2769.974365, -1558.110596, 0.000000, 0.000000)
  exp r2.xy, r2.xyxx
  add r3.xyz, -r1.xyzx, l(1.000000, 0.000000, 1.000000, 0.000000)
  mad r1.xyz, r2.xxxx, r3.xyzx, r1.xyzx
  add r2.xzw, -r1.xxyz, l(1.000000, 0.000000, 0.000000, 1.000000)
  mad r0.xyz, r2.yyyy, r2.xzwx, r1.xyzx
endif 
mov o0.xyz, r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 39 instruction slots used
