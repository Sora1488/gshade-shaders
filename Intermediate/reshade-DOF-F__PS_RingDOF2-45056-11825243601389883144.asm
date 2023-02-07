//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texHDR2                      texture  float4          2d             t2      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t4      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t6      1 
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
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t4.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t6.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div_sat r0.w, r0.w, r1.x
mov r1.xy, l(0,6,0,0)
loop 
  ige r1.z, l(0), r1.y
  breakc_nz r1.z
  itof r1.z, r1.y
  mul r1.z, r1.z, l(1.047197)
  sincos r2.x, r3.x, r1.z
  mov r3.y, r2.x
  mad r1.zw, r3.xxxy, l(0.000000, 0.000000, 0.050000, 0.088889), l(0.000000, 0.000000, 0.500000, 0.500000)
  sample_l_indexable(texture2d)(float,float,float,float) r1.z, r1.zwzz, t6.yzxw, s0, l(0.000000)
  mad r1.w, -r1.z, l(999.000000), l(1000.000000)
  div r1.z, r1.z, r1.w
  add r1.x, r1.z, r1.x
  iadd r1.y, r1.y, l(-1)
endloop 
mul_sat r1.x, r1.x, l(0.166667)
mad r1.y, r1.x, l(-2.000000), l(3.000000)
mul r1.x, r1.x, r1.x
mul r1.x, r1.x, r1.y
mad r1.y, r0.w, l(-2.000000), l(3.000000)
mul r0.w, r0.w, r0.w
mul r1.z, r0.w, r1.y
lt r1.z, r1.z, r1.x
mad r0.w, r1.y, r0.w, -r1.x
div r1.y, r0.w, r1.x
mul r1.x, r1.x, l(15.000000)
div_sat r0.w, r0.w, r1.x
movc r0.w, r1.z, r1.y, r0.w
mad_sat r0.w, r0.w, l(0.500000), l(0.500000)
mad r1.x, r0.w, l(2.000000), l(-1.000000)
lt r1.y, r0.w, l(0.500000)
mul r1.zw, |r1.xxxx|, l(0.000000, 0.000000, 15.000000, 4.687500)
movc r1.y, r1.y, r1.w, r1.z
lt r1.z, r1.y, l(1.200000)
if_nz r1.z
  mov o0.xyz, r0.xyzx
  mov o0.w, r0.w
  ret 
else 
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t2.xyzw, s0
endif 
mul r1.z, r0.w, l(0.990000)
mov r3.xyz, r2.xyzx
mov r1.w, l(1.000000)
mov r2.w, l(1)
loop 
  itof r3.w, r2.w
  lt r4.x, l(4.000000), r3.w
  breakc_nz r4.x
  mul r4.x, r3.w, l(6.000000)
  ftoi r4.y, r4.x
  div r4.x, l(6.283000), r4.x
  mov r5.xyz, r3.xyzx
  mov r4.z, r1.w
  mov r4.w, l(0)
  loop 
    ige r5.w, r4.w, r4.y
    breakc_nz r5.w
    itof r5.w, r4.w
    mul r5.w, r4.x, r5.w
    sincos r6.x, r7.x, r5.w
    mov r7.y, r6.x
    mul r6.xy, r1.yyyy, r7.xyxx
    mul r6.xy, r3.wwww, r6.xyxx
    mad r6.xy, r6.xyxx, l(0.000130, 0.000231, 0.000000, 0.000000), v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyzw, r6.xyxx, t2.xyzw, s0, l(0.000000)
    dp3 r5.w, r6.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
    add r5.w, r5.w, l(-0.700000)
    mul r5.w, r5.w, l(27.000000)
    max r5.w, r5.w, l(0.000000)
    mad r5.w, r5.w, |r1.x|, l(1.000000)
    mul r6.xyz, r5.wwww, r6.xyzx
    ge r5.w, r6.w, r1.z
    mad r6.w, r6.w, l(2.000000), l(-1.000000)
    mul r6.w, |r6.w|, |r6.w|
    mul r6.w, r6.w, r6.w
    movc r5.w, r5.w, l(1.000000), r6.w
    mad r5.xyz, r6.xyzx, r5.wwww, r5.xyzx
    add r4.z, r4.z, r5.w
    iadd r4.w, r4.w, l(1)
  endloop 
  mov r3.xyz, r5.xyzx
  mov r1.w, r4.z
  iadd r2.w, r2.w, l(1)
endloop 
div r1.xzw, r3.xxyz, r1.wwww
add r1.y, r1.y, l(-1.200000)
mul_sat r1.y, r1.y, l(1.250000)
mad r2.x, r1.y, l(-2.000000), l(3.000000)
mul r1.y, r1.y, r1.y
mul r1.y, r1.y, r2.x
add r1.xzw, -r0.xxyz, r1.xxzw
mad o0.xyz, r1.yyyy, r1.xzwx, r0.xyzx
mov o0.w, r0.w
ret 
// Approximately 99 instruction slots used
