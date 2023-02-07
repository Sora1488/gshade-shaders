//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float sstr;                        // Offset:    0 Size:     4 [unused]
//   float cstr;                        // Offset:    4 Size:     4 [unused]
//   float xstr;                        // Offset:    8 Size:     4
//   float xrep;                        // Offset:   12 Size:     4
//   float lstr;                        // Offset:   16 Size:     4 [unused]
//   float pstr;                        // Offset:   20 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
add r0.xyzw, v1.xyxy, l(0.000000, -0.000926, -0.000521, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r0.x, r0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.y, r0.zwzz, t0.yxzw, s0
add r0.x, r0.y, r0.x
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, 0.000000, 0.000926)
sample_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t0.yxzw, s0
sample_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t0.yzxw, s0
add r0.x, r0.y, r0.x
add r0.x, r0.z, r0.x
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t0.xyzw, s0
mad r0.x, -r1.x, l(4.000000), r0.x
mul_sat r0.x, |r0.x|, cb0[0].w
add r0.x, -r0.x, l(1.000000)
mul r0.x, r0.x, cb0[0].z
add r0.y, -r1.w, r1.x
mad o0.x, r0.x, r0.y, r1.w
mov o0.yzw, r1.yyzw
ret 
// Approximately 18 instruction slots used
