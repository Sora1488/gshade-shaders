//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__tMagicBloom_6                texture  float4          2d            t14      1 
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
dcl_immediateConstantBuffer { { 0.026996, 0, 0, 0},
                              { 0.064759, 0, 0, 0},
                              { 0.120985, 0, 0, 0},
                              { 0.176033, 0, 0, 0},
                              { 0.199471, 0, 0, 0},
                              { 0.176033, 0, 0, 0},
                              { 0.120985, 0, 0, 0},
                              { 0.064759, 0, 0, 0},
                              { 0.026996, 0, 0, 0} }
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t14
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
mov r0.xyzw, l(0,0,0,-4)
loop 
  ilt r1.x, l(4), r0.w
  breakc_nz r1.x
  iadd r1.xy, r0.wwww, l(4, 1, 0, 0)
  itof r2.x, r0.w
  mov r3.xyz, r0.xyzx
  mov r1.z, l(-4)
  loop 
    ilt r1.w, l(4), r1.z
    breakc_nz r1.w
    iadd r2.zw, r1.zzzz, l(0, 0, 4, 1)
    mul r1.w, icb[r2.z + 0].x, icb[r1.x + 0].x
    itof r2.y, r1.z
    mad r2.yz, r2.xxyx, l(0.000000, 0.033333, 0.059259, 0.000000), v1.xxyx
    sample_indexable(texture2d)(float,float,float,float) r4.xyz, r2.yzyy, t14.xyzw, s0
    mad r3.xyz, r4.xyzx, r1.wwww, r3.xyzx
    mov r1.z, r2.w
  endloop 
  mov r0.xyz, r3.xyzx
  mov r0.w, r1.y
endloop 
mul o0.xyz, r0.xyzx, l(1.023520, 1.023520, 1.023520, 0.000000)
mov o0.w, l(1.000000)
ret 
// Approximately 25 instruction slots used