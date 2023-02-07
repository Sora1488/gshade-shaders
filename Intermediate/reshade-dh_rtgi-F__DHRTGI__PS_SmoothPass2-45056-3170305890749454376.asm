//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float frametime;                   // Offset:    0 Size:     4
//   int framecount;                    // Offset:    4 Size:     4 [unused]
//   int random;                        // Offset:    8 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __s2                              sampler      NA          NA             s2      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__DHRTGI__normalTex            texture  float4          2d             t6      1 
// __V__DHRTGI__smoothPassTex        texture  float4          2d            t16      1 
// __V__DHRTGI__smoothAOPassTex      texture  float4          2d            t18      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
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
// SV_TARGET                1   xyzw        1   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t16
dcl_resource_texture2d (float,float,float,float) t18
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.xyzw
dcl_temps 9
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
lt r0.y, l(0.990000), r0.x
if_nz r0.y
  sample_l_indexable(texture2d)(float,float,float,float) o1.xyzw, v1.xyxx, t18.xyzw, s2, l(1.000000)
  mov r1.x, l(1.000000)
else 
  mov r1.x, l(0)
  mov o1.xyzw, l(0,0,0,0)
endif 
if_z r0.y
  sample_l_indexable(texture2d)(float,float,float,float) r0.yzw, v1.xyxx, t6.wxyz, s0, l(0.000000)
  add r0.yzw, r0.yyzw, l(0.000000, -0.500000, -0.500000, -0.500000)
  add r0.yzw, r0.yyzw, r0.yyzw
  mov r1.w, l(0)
  mov r2.xyzw, l(0,0,0,-2)
  mov r3.xyz, l(0,0,0,0)
  loop 
    itof r3.w, r2.w
    lt r3.w, l(2.000000), r3.w
    breakc_nz r3.w
    itof r4.x, r2.w
    mov r5.xyz, r2.xyzx
    mov r3.w, r1.w
    mov r4.z, l(-2)
    mov r4.w, r3.x
    mov r5.w, r3.y
    mov r6.x, r3.z
    loop 
      itof r6.y, r4.z
      lt r6.y, l(2.000000), r6.y
      breakc_nz r6.y
      itof r4.y, r4.z
      mad r6.yz, r4.xxyx, l(0.000000, 0.001042, 0.001852, 0.000000), v1.xxyx
      ge r7.xy, r6.yzyy, l(0.000000, 0.000000, 0.000000, 0.000000)
      ge r7.zw, l(0.000000, 0.000000, 1.000000, 1.000000), r6.yyyz
      and r6.w, r7.z, r7.x
      and r6.w, r7.y, r6.w
      and r6.w, r7.w, r6.w
      if_nz r6.w
        sample_l_indexable(texture2d)(float,float,float,float) r6.w, r6.yzyy, t2.yzwx, s0, l(0.000000)
        mad r7.x, -r6.w, l(999.000000), l(1000.000000)
        div r6.w, r6.w, r7.x
        lt r7.x, l(0.990000), r6.w
        if_nz r7.x
          iadd r7.x, r4.z, l(2)
          mov r4.z, r7.x
          continue 
        endif 
        add r6.w, -r0.x, r6.w
        ge r6.w, l(0.100000), |r6.w|
        if_nz r6.w
          sample_l_indexable(texture2d)(float,float,float,float) r7.xyz, r6.yzyy, t6.xyzw, s0, l(0.000000)
          add r7.xyz, r7.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
          add r8.xyz, r7.xyzx, r7.xyzx
          mad r7.xyz, r7.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), -r0.yzwy
          add r7.xyz, |r7.xyzx|, l(-1.500000, -1.500000, -1.500000, 0.000000)
          max r7.xyz, r7.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
          ne r7.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r7.xyzx
          or r6.w, r7.y, r7.x
          or r6.w, r7.z, r6.w
          if_z r6.w
            dp2 r4.y, r4.xyxx, r4.xyxx
            ge r4.y, l(5.000000), r4.y
            if_nz r4.y
              sample_l_indexable(texture2d)(float,float,float,float) r4.y, r6.yzyy, t18.yxzw, s2, l(1.000000)
              add r5.w, r4.y, r5.w
              iadd r6.x, r6.x, l(1)
            endif 
            sample_l_indexable(texture2d)(float,float,float,float) r6.yzw, r6.yzyy, t16.wxyz, s2, l(1.000000)
            dp3 r4.y, r8.xyzx, r0.yzwy
            mad r5.xyz, r6.yzwy, |r4.yyyy|, r5.xyzx
            add r3.w, r3.w, |r4.y|
            iadd r4.w, r4.w, l(1)
          endif 
        endif 
      endif 
      iadd r4.z, r4.z, l(2)
    endloop 
    mov r2.xyz, r5.xyzx
    mov r1.w, r3.w
    mov r3.x, r4.w
    mov r3.y, r5.w
    mov r3.z, r6.x
    iadd r2.w, r2.w, l(2)
  endloop 
  ige r0.x, l(1), r3.x
  if_nz r0.x
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, v1.xyxx, t16.xyzw, s2, l(1.000000)
    sample_l_indexable(texture2d)(float,float,float,float) o1.xyzw, v1.xyxx, t18.xyzw, s2, l(1.000000)
    mov r4.w, l(1.000000)
  else 
    itof r0.y, r3.z
    div o1.xyz, r3.yyyy, r0.yyyy
    mov r1.y, l(0)
    mov r4.xyzw, r1.yyyx
    mov o1.w, l(1.000000)
  endif 
  lt r0.y, l(0.000000), r1.w
  div_sat r3.xyz, r2.xyzx, r1.wwww
  movc r2.xyz, r0.yyyy, r3.xyzx, r2.xyzx
  div r0.y, l(10.000000), cb0[0].x
  round_ne r0.y, r0.y
  max r0.y, r0.y, l(1.000000)
  div r2.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.y
  movc o0.xyzw, r0.xxxx, r4.xyzw, r2.xyzw
else 
  mov r1.z, l(0)
  mov o0.xyzw, r1.zzzx
endif 
ret 
// Approximately 112 instruction slots used
