//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mul r1.xy, v1.xyxx, l(0.000104, 0.000185, 0.000000, 0.000000)
mov r2.xyz, l(0,0,0,0)
mov r1.z, l(2.500000)
loop 
  ge r1.w, l(-2.000000), r1.z
  breakc_nz r1.w
  mul r3.x, r1.x, r1.z
  mul r1.w, r1.z, r1.z
  mul r1.w, r1.w, l(0.200000)
  mov r4.xyz, r2.xyzx
  mov r2.w, l(-2.500000)
  loop 
    ge r3.z, r2.w, l(2.000000)
    breakc_nz r3.z
    mul r3.z, r2.w, r2.w
    mad r3.z, r3.z, l(0.200000), r1.w
    mul r3.y, r1.y, r2.w
    add r3.yw, r3.xxxy, v1.xxxy
    sample_indexable(texture2d)(float,float,float,float) r5.xyz, r3.ywyy, t0.xyzw, s0
    mul r3.y, r3.z, l(0.625000)
    sqrt r3.y, r3.y
    add r6.xyz, r0.xyzx, -r5.xyzx
    mad r3.yzw, r3.yyyy, r6.xxyz, r5.xxyz
    add r4.xyz, r3.yzwy, r4.xyzx
    add r2.w, r2.w, l(1.000000)
  endloop 
  mov r2.xyz, r4.xyzx
  add r1.z, r1.z, l(-1.000000)
endloop 
dp3 r1.x, r0.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
mad r1.yzw, r2.xxyz, l(0.000000, 0.211321, 0.211321, 0.211321), -r0.xxyz
mad_sat o0.xyz, r1.xxxx, r1.yzwy, r0.xyzx
mov_sat o0.w, r0.w
ret 
// Approximately 35 instruction slots used
