//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_VERTEXID              0   x           0   VERTID    uint   x   
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
vs_5_0
dcl_globalFlags refactoringAllowed
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_sgv v0.x, vertex_id
dcl_output_siv o0.xyzw, position
dcl_temps 3
and r0.x, v0.x, l(3)
ubfe r0.y, l(7), l(2), v0.x
imul null, r1.x, r0.y, l(15)
ushr r0.y, v0.x, l(9)
imul null, r1.y, r0.y, l(15)
switch r0.x
  case l(0)
  mov r1.z, l(0)
  ld_indexable(texture2d)(float,float,float,float) r2.xyz, r1.xyzz, t0.xyzw
  dp3 r0.x, r2.xyzx, l(0.333333, 0.333333, 0.333333, 0.000000)
  mov r0.y, l(0.750000)
  break 
  case l(1)
  mov r1.w, l(0)
  ld_indexable(texture2d)(float,float,float,float) r0.x, r1.xyww, t0.xyzw
  mov r0.y, l(0.250000)
  break 
  case l(2)
  mov r1.zw, l(0,0,0,0)
  ld_indexable(texture2d)(float,float,float,float) r0.x, r1.xyzw, t0.yxzw
  mov r0.y, l(-0.250000)
  break 
  case l(3)
  mov r1.zw, l(0,0,0,0)
  ld_indexable(texture2d)(float,float,float,float) r0.x, r1.xyzw, t0.zxyw
  mov r0.y, l(-0.750000)
  break 
endswitch 
mov o0.y, r0.y
mad r0.x, r0.x, l(255.000000), l(0.500000)
mad o0.x, r0.x, l(0.007812), l(-1.000000)
mov o0.zw, l(0,0,0,1.000000)
ret 
// Approximately 33 instruction slots used