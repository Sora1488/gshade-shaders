//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__qUINT__BackBufferTex         texture  float4          2d             t0      1 
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
dcl_temps 8
mov r0.xyzw, l(0,0,0,10000000000.000000)
mov r1.xyzw, l(0,0,0,0)
loop 
  ige r2.x, r1.w, l(5)
  breakc_nz r2.x
  itof r2.x, r1.w
  add r2.x, r2.x, l(0.250000)
  mul r2.x, r2.x, l(0.628319)
  sincos r2.x, r3.x, r2.x
  mov r3.y, r2.x
  mad r2.xy, -r3.xyxx, l(0.002083, 0.003704, 0.000000, 0.000000), v1.xyxx
  sample_l_indexable(texture2d)(float,float,float,float) r2.xyz, r2.xyxx, t0.xyzw, s0, l(0.000000)
  mov r5.xyz, r2.xyzx
  mov r4.xyzw, l(0,0,0,0)
  mov r2.w, l(-3)
  loop 
    ilt r3.z, l(4), r2.w
    breakc_nz r3.z
    itof r3.z, r2.w
    mul r3.zw, r3.zzzz, r3.xxxy
    mad r3.zw, r3.zzzw, l(0.000000, 0.000000, 0.000521, 0.000926), v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyz, r3.zwzz, t0.xyzw, s0, l(0.000000)
    add r4.xyz, r4.xyzx, r6.xyzx
    add r7.xyz, -r5.xyzx, r6.xyzx
    max r3.z, |r7.y|, |r7.x|
    max r3.z, |r7.z|, r3.z
    add r4.w, r3.z, r4.w
    iadd r2.w, r2.w, l(1)
    mov r5.xyz, r6.xyzx
  endloop 
  lt r2.x, r4.w, r0.w
  movc r0.xyzw, r2.xxxx, r4.xyzw, r0.xyzw
  add r1.xyz, r1.xyzx, r4.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mul r0.xyz, r0.xyzx, l(0.125000, 0.125000, 0.125000, 0.000000)
mad r1.xyz, -r1.xyzx, l(0.025000, 0.025000, 0.025000, 0.000000), r0.xyzx
dp3 r0.w, r1.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
mad o0.xyz, r0.wwww, l(0.700000, 0.700000, 0.700000, 0.000000), r0.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 41 instruction slots used
