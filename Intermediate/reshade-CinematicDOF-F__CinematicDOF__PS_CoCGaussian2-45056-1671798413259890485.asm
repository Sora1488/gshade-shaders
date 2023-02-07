//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__CinematicDOF__texCDCoCTileNeighbor    texture  float4          2d            t14      1 
// __V__CinematicDOF__texCDCoCTmp1    texture  float4          2d            t16      1 
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
// SV_TARGET                0   xy          0   TARGET   float   xy  
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t16
dcl_input_ps linear v1.xy
dcl_output o0.xy
dcl_temps 2
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t16.xyzw, s2, l(0.000000)
add r1.xyzw, v1.xyxy, l(0.000000, 0.000997, -0.000000, -0.000997)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mul r0.y, |r0.y|, l(0.065916)
mad r0.x, |r0.x|, l(0.033245), r0.y
mad r0.x, |r0.z|, l(0.065916), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.002326, -0.000000, -0.002326)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.063671), r0.x
mad r0.x, |r0.z|, l(0.063671), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.003655, -0.000000, -0.003655)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.059819), r0.x
mad r0.x, |r0.z|, l(0.059819), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.004985, -0.000000, -0.004985)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.054664), r0.x
mad r0.x, |r0.z|, l(0.054664), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.006314, -0.000000, -0.006314)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.048587), r0.x
mad r0.x, |r0.z|, l(0.048587), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.007643, -0.000000, -0.007643)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.042005), r0.x
mad r0.x, |r0.z|, l(0.042005), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.008972, -0.000000, -0.008972)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.035321), r0.x
mad r0.x, |r0.z|, l(0.035321), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.010302, -0.000000, -0.010302)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.028888), r0.x
mad r0.x, |r0.z|, l(0.028888), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.011631, -0.000000, -0.011631)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.022981), r0.x
mad r0.x, |r0.z|, l(0.022981), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.012977, -0.000000, -0.012977)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.017782), r0.x
mad r0.x, |r0.z|, l(0.017782), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.014308, -0.000000, -0.014308)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.013382), r0.x
mad r0.x, |r0.z|, l(0.013382), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.015640, -0.000000, -0.015640)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.009796), r0.x
mad r0.x, |r0.z|, l(0.009796), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.016971, -0.000000, -0.016971)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.006975), r0.x
mad r0.x, |r0.z|, l(0.006975), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.018302, -0.000000, -0.018302)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.004830), r0.x
mad r0.x, |r0.z|, l(0.004830), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.019633, -0.000000, -0.019633)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.003253), r0.x
mad r0.x, |r0.z|, l(0.003253), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.020964, -0.000000, -0.020964)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.002132), r0.x
mad r0.x, |r0.z|, l(0.002132), r0.x
add r1.xyzw, v1.xyxy, l(0.000000, 0.022295, -0.000000, -0.022295)
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.xyxx, t16.yxzw, s2, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.zwzz, t16.yzxw, s2, l(0.000000)
mad r0.x, |r0.y|, l(0.001358), r0.x
mad r0.x, |r0.z|, l(0.001358), r0.x
min o0.x, r0.x, l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t14.xyzw, s2
mov o0.y, r0.x
ret 
// Approximately 91 instruction slots used