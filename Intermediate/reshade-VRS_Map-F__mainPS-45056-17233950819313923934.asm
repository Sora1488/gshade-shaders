//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int VRS_FrameCount;                // Offset:    0 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __V__VRS                          texture  float4          2d             t0      1 
// __V__VRSUpdated                   texture  float4          2d             t2      1 
// __V__BackBuffer                   texture  float4          2d             t4      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xy  
// TEXCOORD                 0   xy          1     NONE   float       
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps_siv linear noperspective v0.xy, position
dcl_output o0.xyz
dcl_temps 3
ftoi r0.xy, v0.xyxx
mov r0.zw, l(0,0,0,0)
ld_indexable(texture2d)(float,float,float,float) r0.xyz, r0.xyzw, t4.xyzw
ld_indexable(texture2d)(float,float,float,float) r0.w, l(0, 0, 0, 0), t2.yzwx
ieq r1.x, r0.w, cb0[0].x
iadd r1.y, cb0[0].x, l(-1)
ieq r0.w, r0.w, r1.y
or r0.w, r0.w, r1.x
if_z r0.w
  mov r0.w, l(0)
else 
  mul r1.xy, v0.xyxx, l(0.125000, 0.125000, 0.000000, 0.000000)
  ftoi r1.xy, r1.xyxx
  mov r1.zw, l(0,0,0,0)
  ld_indexable(texture2d)(float,float,float,float) r1.xyz, r1.xyzw, t0.xyzw
  mul r2.xy, r1.xyxx, l(0.250000, 0.250000, 0.000000, 0.000000)
  lt r1.z, r1.z, l(0.200000)
  lt r1.w, r2.y, r2.x
  lt r1.xy, l(0.200000, 0.200000, 0.000000, 0.000000), r1.yxyy
  movc r1.xy, r1.xyxx, l(0,0,0,0), l(1,4,0,0)
  movc r1.x, r1.w, r1.x, r1.y
  movc r0.w, r1.z, l(5), r1.x
endif 
switch r0.w
  case l(0)
  mov r1.xyz, l(0.500000,0,0,0)
  break 
  case l(1)
  mov r1.xyz, l(0.500000,0.500000,0,0)
  break 
  case l(4)
  mov r1.xyz, l(0.500000,0.250000,0,0)
  break 
  case l(5)
  mov r1.xyz, l(0,0.500000,0,0)
  break 
  default 
  mov r1.xyz, l(1.000000,1.000000,1.000000,0)
  break 
endswitch 
add r0.xyz, r0.xyzx, -r1.xyzx
mad r0.xyz, r0.xyzx, l(0.350000, 0.350000, 0.350000, 0.000000), r1.xyzx
mul r1.xy, v0.xyxx, l(1.000000, 1.000000, 0.000000, 0.000000)
ftou r1.xy, r1.xyxx
and r1.xy, r1.xyxx, l(7, 7, 0, 0)
ieq r1.xy, r1.xyxx, l(0, 0, 0, 0)
or r0.w, r1.y, r1.x
movc r0.w, r0.w, l(0.500000), l(1.000000)
mul o0.xyz, r0.wwww, r0.xyzx
ret 
// Approximately 50 instruction slots used