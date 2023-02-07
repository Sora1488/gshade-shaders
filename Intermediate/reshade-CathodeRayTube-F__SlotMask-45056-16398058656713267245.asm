//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__SMSUt                        texture  float4          2d             t8      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
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
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t8.xyzw, s1
add r1.xyzw, v1.xyxy, l(0.000521, 0.000000, -0.000521, 0.000000)
sample_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyxx, t8.xyzw, s1
add r0.xyz, r0.xyzx, r2.xyzx
sample_indexable(texture2d)(float,float,float,float) r1.xyz, r1.zwzz, t8.xyzw, s1
add r0.xyz, r0.xyzx, r1.xyzx
mul r1.xyzw, v0.xxyy, l(8.000000, 8.000000, 4.000000, 4.000000)
ge r1.xyzw, r1.xyzw, -r1.yyww
movc r1.xyzw, r1.xyzw, l(8.000000,0.125000,4.000000,0.250000), l(-8.000000,-0.125000,-4.000000,-0.250000)
mul r1.yw, r1.yyyw, v0.xxxy
frc r1.yw, r1.yyyw
mul r1.xy, r1.ywyy, r1.xzxx
ge r1.xy, l(1.000000, 1.000000, 0.000000, 0.000000), r1.xyxx
and r0.w, r1.y, r1.x
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(1.000000, 0.000000, 0.000000, 0.000000)
  ret 
endif 
add r0.w, v0.x, l(7.000000)
mul r1.x, r0.w, l(8.000000)
ge r1.x, r1.x, -r1.x
movc r1.xz, r1.xxxx, l(8.000000,0,0.125000,0), l(-8.000000,0,-0.125000,0)
mul r0.w, r0.w, r1.z
frc r0.w, r0.w
mul r0.w, r0.w, r1.x
ge r0.w, l(1.000000), r0.w
and r0.w, r1.y, r0.w
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(0.000000, 1.000000, 0.000000, 0.000000)
  ret 
endif 
add r0.w, v0.x, l(6.000000)
mul r1.x, r0.w, l(8.000000)
ge r1.x, r1.x, -r1.x
movc r1.xz, r1.xxxx, l(8.000000,0,0.125000,0), l(-8.000000,0,-0.125000,0)
mul r0.w, r0.w, r1.z
frc r0.w, r0.w
mul r0.w, r0.w, r1.x
ge r0.w, l(1.000000), r0.w
and r0.w, r1.y, r0.w
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(0.000000, 0.000000, 1.000000, 0.000000)
  ret 
endif 
add r1.xy, v0.xyxx, l(4.000000, 2.000000, 0.000000, 0.000000)
mul r2.xyzw, r1.xxyy, l(8.000000, 8.000000, 4.000000, 4.000000)
ge r2.xyzw, r2.xyzw, -r2.yyww
movc r2.xyzw, r2.xyzw, l(8.000000,0.125000,4.000000,0.250000), l(-8.000000,-0.125000,-4.000000,-0.250000)
mul r1.xy, r1.xyxx, r2.ywyy
frc r1.xy, r1.xyxx
mul r1.xy, r1.xyxx, r2.xzxx
ge r1.xy, l(1.000000, 1.000000, 0.000000, 0.000000), r1.xyxx
and r0.w, r1.y, r1.x
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(1.000000, 0.000000, 0.000000, 0.000000)
  ret 
endif 
add r0.w, v0.x, l(11.000000)
mul r1.x, r0.w, l(8.000000)
ge r1.x, r1.x, -r1.x
movc r1.xz, r1.xxxx, l(8.000000,0,0.125000,0), l(-8.000000,0,-0.125000,0)
mul r0.w, r0.w, r1.z
frc r0.w, r0.w
mul r0.w, r0.w, r1.x
ge r0.w, l(1.000000), r0.w
and r0.w, r1.y, r0.w
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(0.000000, 1.000000, 0.000000, 0.000000)
  ret 
endif 
add r0.w, v0.x, l(10.000000)
mul r1.x, r0.w, l(8.000000)
ge r1.x, r1.x, -r1.x
movc r1.xz, r1.xxxx, l(8.000000,0,0.125000,0), l(-8.000000,0,-0.125000,0)
mul r0.w, r0.w, r1.z
frc r0.w, r0.w
mul r0.w, r0.w, r1.x
ge r0.w, l(1.000000), r0.w
and r0.w, r1.y, r0.w
if_nz r0.w
  mul o0.xyz, r0.xyzx, l(0.000000, 0.000000, 1.000000, 0.000000)
  ret 
endif 
mov o0.xyz, l(0,0,0,0)
ret 
// Approximately 85 instruction slots used
