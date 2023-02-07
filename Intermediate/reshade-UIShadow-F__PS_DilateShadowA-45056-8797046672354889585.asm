//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__shadowTex                    texture  float4          2d             t4      1 
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
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
add r0.xyzw, v1.xyxy, l(-0.000260, -0.000463, 0.000260, 0.000463)
gather4_indexable(texture2d)(float,float,float,float) r1.xyzw, r0.xyxx, t4.xyzw, s2.x
gather4_indexable(texture2d)(float,float,float,float) r0.xyzw, r0.zwzz, t4.xyzw, s2.x
max r0.xy, r0.ywyy, r0.xzxx
max r0.x, r0.y, r0.x
max r0.yz, r1.yywy, r1.xxzx
max r0.y, r0.z, r0.y
max r0.x, r0.y, r0.x
add r1.xyzw, v1.xyxy, l(0.000260, -0.000463, -0.000260, 0.000463)
gather4_indexable(texture2d)(float,float,float,float) r2.xyzw, r1.xyxx, t4.xyzw, s2.x
gather4_indexable(texture2d)(float,float,float,float) r1.xyzw, r1.zwzz, t4.xyzw, s2.x
max r0.yz, r1.yywy, r1.xxzx
max r0.y, r0.z, r0.y
max r0.zw, r2.yyyw, r2.xxxz
max r0.z, r0.w, r0.z
max r0.x, r0.x, r0.z
max o0.x, r0.x, r0.y
mov o0.yzw, l(0,0,0,0)
ret 
// Approximately 19 instruction slots used
