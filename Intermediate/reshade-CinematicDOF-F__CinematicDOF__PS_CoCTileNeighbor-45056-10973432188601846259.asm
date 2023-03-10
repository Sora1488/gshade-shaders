//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s2                              sampler      NA          NA             s2      1 
// __V__CinematicDOF__texCDCoCTile    texture  float4          2d            t12      1 
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
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.x
dcl_temps 2
mov r0.xy, l(10.000000,-1.000000,0,0)
loop 
  ge r0.z, r0.y, l(2.000000)
  breakc_nz r0.z
  mul r1.x, r0.y, l(0.001563)
  mov r0.z, r0.x
  mov r0.w, l(-1.000000)
  loop 
    ge r1.z, r0.w, l(2.000000)
    breakc_nz r1.z
    mul r1.y, r0.w, l(0.001458)
    add r1.yz, r1.xxyx, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.yzyy, t12.yxzw, s2, l(0.000000)
    min r0.z, r0.z, r1.y
    add r0.w, r0.w, l(1.000000)
  endloop 
  mov r0.x, r0.z
  add r0.y, r0.y, l(1.000000)
endloop 
mov o0.x, r0.x
ret 
// Approximately 21 instruction slots used
