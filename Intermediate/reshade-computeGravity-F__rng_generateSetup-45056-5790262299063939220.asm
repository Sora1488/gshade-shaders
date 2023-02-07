//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
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
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_input_ps linear v1.xy
dcl_output o0.x
dcl_temps 3
add r0.xy, v1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
mad r0.xy, r0.xyxx, l(0.056907, 0.032010, 0.000000, 0.000000), l(-0.675000, -0.460000, 0.000000, 0.000000)
mov r0.zw, r0.xxxy
mov r1.x, l(0)
loop 
  ige r1.y, r1.x, l(100)
  breakc_nz r1.y
  mul r1.y, r0.w, r0.w
  mad r1.y, r0.z, r0.z, -r1.y
  add r2.x, r0.x, r1.y
  dp2 r1.y, r0.wwww, r0.zzzz
  add r2.y, r0.y, r1.y
  dp2 r1.y, r2.xyxx, r2.xyxx
  lt r1.y, l(4.000000), r1.y
  if_nz r1.y
    break 
  endif 
  mov r0.zw, r2.xxxy
  iadd r1.x, r1.x, l(1)
endloop 
ieq r0.x, r1.x, l(100)
itof r0.y, r1.x
mad r0.y, r0.y, l(0.010000), l(-0.800000)
mul_sat r0.y, r0.y, l(4.545455)
movc o0.x, r0.x, l(0), r0.y
ret 
// Approximately 26 instruction slots used