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
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0, l(0.000000)
gather4_indexable(texture2d)(float,float,float,float) r1.xyz, v1.xyxx, t0.xyzw, s0.y
gather4_aoffimmi_indexable(-1,-1,0)(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t0.xzwy, s0.y
max r1.w, r0.y, r1.x
min r2.w, r0.y, r1.x
max r1.w, r1.w, r1.z
min r2.w, r1.z, r2.w
max r3.x, r2.x, r2.y
min r3.y, r2.x, r2.y
max r1.w, r1.w, r3.x
min r2.w, r2.w, r3.y
mul r3.x, r1.w, l(0.793750)
add r1.w, r1.w, -r2.w
max r2.w, r3.x, l(0.004000)
ge r1.w, r1.w, r2.w
if_nz r1.w
  add r3.xyzw, v1.xyxy, l(0.000521, -0.000926, -0.000521, 0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r1.w, r3.xyxx, t0.xzwy, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r2.w, r3.zwzz, t0.xzwy, s0, l(0.000000)
  add r3.xy, r1.xzxx, r2.yxyy
  mad r3.xy, r0.yyyy, l(-2.000000, -2.000000, 0.000000, 0.000000), r3.xyxx
  add r3.z, r1.y, r1.w
  add r1.w, r1.w, r2.z
  mad r3.z, r1.z, l(-2.000000), r3.z
  mad r1.w, r2.y, l(-2.000000), r1.w
  add r2.z, r2.w, r2.z
  add r1.y, r1.y, r2.w
  mad r2.w, |r3.x|, l(2.000000), |r3.z|
  mad r1.w, |r3.y|, l(2.000000), |r1.w|
  mad r2.z, r2.x, l(-2.000000), r2.z
  mad r1.y, r1.x, l(-2.000000), r1.y
  add r2.z, r2.w, |r2.z|
  add r1.y, r1.w, |r1.y|
  ge r1.y, r2.z, r1.y
  movc r1.w, r1.y, r2.y, r2.x
  movc r1.x, r1.y, r1.x, r1.z
  add r1.z, -r0.y, r1.w
  add r2.x, -r0.y, r1.x
  add r1.xw, r0.yyyy, r1.xxxw
  ge r2.y, |r1.z|, |r2.x|
  max r1.z, |r1.z|, |r2.x|
  movc r3.xyzw, r1.yyyy, l(0.000926,-0.000926,0,-0.000521), l(0.000521,-0.000521,0.000926,-0.000000)
  movc r2.x, r2.y, r3.y, r3.x
  and r2.z, r1.y, l(0x3a088889)
  mad r3.xy, r2.xxxx, l(0.500000, 0.500000, 0.000000, 0.000000), v1.xyxx
  movc r2.w, r1.y, v1.x, r3.x
  movc r3.x, r1.y, r3.y, v1.y
  add r4.x, r3.w, r2.w
  movc r3.y, r1.y, l(-0.000000), l(-0.000926)
  add r4.y, r3.y, r3.x
  add r5.x, r2.z, r2.w
  add r5.y, r3.z, r3.x
  sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.xzwy, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r3.x, r5.xyxx, t0.yxzw, s0, l(0.000000)
  movc r1.x, r2.y, r1.w, r1.x
  mul r1.z, r1.z, l(0.250000)
  mad r1.w, -r1.x, l(0.500000), r0.y
  lt r1.w, r1.w, l(0.000000)
  mad r2.y, -r1.x, l(0.500000), r2.w
  mad r2.w, -r1.x, l(0.500000), r3.x
  ge r4.zw, |r2.yyyw|, r1.zzzz
  add r3.x, r3.w, r4.x
  movc r5.z, r4.z, r4.x, r3.x
  add r3.x, r3.y, r4.y
  movc r5.w, r4.z, r4.y, r3.x
  not r4.xy, r4.zwzz
  or r3.x, r4.y, r4.x
  add r4.x, r2.z, r5.x
  movc r4.x, r4.w, r5.x, r4.x
  add r5.x, r3.z, r5.y
  movc r4.y, r4.w, r5.y, r5.x
  if_nz r3.x
    if_z r4.z
      sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
    endif 
    if_z r4.w
      sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
    endif 
    mad r3.x, -r1.x, l(0.500000), r2.y
    movc r2.y, r4.z, r2.y, r3.x
    mad r3.x, -r1.x, l(0.500000), r2.w
    movc r2.w, r4.w, r2.w, r3.x
    ge r4.zw, |r2.yyyw|, r1.zzzz
    add r3.x, r3.w, r5.z
    movc r5.z, r4.z, r5.z, r3.x
    add r3.x, r3.y, r5.w
    movc r5.w, r4.z, r5.w, r3.x
    not r5.xy, r4.zwzz
    or r3.x, r5.y, r5.x
    add r5.x, r2.z, r4.x
    movc r4.x, r4.w, r4.x, r5.x
    add r5.x, r3.z, r4.y
    movc r4.y, r4.w, r4.y, r5.x
    if_nz r3.x
      if_z r4.z
        sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
      endif 
      if_z r4.w
        sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
      endif 
      mad r3.x, -r1.x, l(0.500000), r2.y
      movc r2.y, r4.z, r2.y, r3.x
      mad r3.x, -r1.x, l(0.500000), r2.w
      movc r2.w, r4.w, r2.w, r3.x
      ge r4.zw, |r2.yyyw|, r1.zzzz
      add r3.x, r3.w, r5.z
      movc r5.z, r4.z, r5.z, r3.x
      add r3.x, r3.y, r5.w
      movc r5.w, r4.z, r5.w, r3.x
      not r5.xy, r4.zwzz
      or r3.x, r5.y, r5.x
      add r5.x, r2.z, r4.x
      movc r4.x, r4.w, r4.x, r5.x
      add r5.x, r3.z, r4.y
      movc r4.y, r4.w, r4.y, r5.x
      if_nz r3.x
        if_z r4.z
          sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
        endif 
        if_z r4.w
          sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
        endif 
        mad r3.x, -r1.x, l(0.500000), r2.y
        movc r2.y, r4.z, r2.y, r3.x
        mad r3.x, -r1.x, l(0.500000), r2.w
        movc r2.w, r4.w, r2.w, r3.x
        ge r4.zw, |r2.yyyw|, r1.zzzz
        add r3.x, r3.w, r5.z
        movc r5.z, r4.z, r5.z, r3.x
        add r3.x, r3.y, r5.w
        movc r5.w, r4.z, r5.w, r3.x
        not r3.xy, r4.zwzz
        or r3.x, r3.y, r3.x
        add r3.y, r2.z, r4.x
        movc r4.x, r4.w, r4.x, r3.y
        add r3.y, r3.z, r4.y
        movc r4.y, r4.w, r4.y, r3.y
        if_nz r3.x
          if_z r4.z
            sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
          endif 
          if_z r4.w
            sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
          endif 
          mad r3.x, -r1.x, l(0.500000), r2.y
          movc r2.y, r4.z, r2.y, r3.x
          mad r3.x, -r1.x, l(0.500000), r2.w
          movc r2.w, r4.w, r2.w, r3.x
          ge r3.xy, |r2.ywyy|, r1.zzzz
          and r3.z, r1.y, l(0x3a4cccce)
          movc r6.xyz, r1.yyyy, l(-0.000781,0,-0.000000,0), l(-0.000000,0.001389,-0.001389,0)
          add r4.zw, r5.zzzw, r6.xxxz
          movc r5.zw, r3.xxxx, r5.zzzw, r4.zzzw
          not r4.zw, r3.xxxy
          or r3.w, r4.w, r4.z
          add r3.z, r3.z, r4.x
          movc r4.x, r3.y, r4.x, r3.z
          add r3.z, r4.y, r6.y
          movc r4.y, r3.y, r4.y, r3.z
          if_nz r3.w
            if_z r3.x
              sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
            endif 
            if_z r3.y
              sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
            endif 
            mad r3.z, -r1.x, l(0.500000), r2.y
            movc r2.y, r3.x, r2.y, r3.z
            mad r3.x, -r1.x, l(0.500000), r2.w
            movc r2.w, r3.y, r2.w, r3.x
            ge r3.xy, |r2.ywyy|, r1.zzzz
            mad r3.z, -r2.z, l(2.000000), r5.z
            movc r5.z, r3.x, r5.z, r3.z
            movc r3.zw, r1.yyyy, l(0,0,0,-0.000000), l(0,0,0.001852,-0.001852)
            add r4.z, r3.w, r5.w
            movc r5.w, r3.x, r5.w, r4.z
            not r4.zw, r3.xxxy
            or r4.z, r4.w, r4.z
            mad r4.w, r2.z, l(2.000000), r4.x
            movc r4.x, r3.y, r4.x, r4.w
            add r4.w, r3.z, r4.y
            movc r4.y, r3.y, r4.y, r4.w
            if_nz r4.z
              if_z r3.x
                sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
              endif 
              if_z r3.y
                sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
              endif 
              mad r4.z, -r1.x, l(0.500000), r2.y
              movc r2.y, r3.x, r2.y, r4.z
              mad r3.x, -r1.x, l(0.500000), r2.w
              movc r2.w, r3.y, r2.w, r3.x
              ge r3.xy, |r2.ywyy|, r1.zzzz
              mad r4.z, -r2.z, l(2.000000), r5.z
              movc r5.z, r3.x, r5.z, r4.z
              add r4.z, r3.w, r5.w
              movc r5.w, r3.x, r5.w, r4.z
              not r4.zw, r3.xxxy
              or r4.z, r4.w, r4.z
              mad r4.w, r2.z, l(2.000000), r4.x
              movc r4.x, r3.y, r4.x, r4.w
              add r4.w, r3.z, r4.y
              movc r4.y, r3.y, r4.y, r4.w
              if_nz r4.z
                if_z r3.x
                  sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
                endif 
                if_z r3.y
                  sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
                endif 
                mad r4.z, -r1.x, l(0.500000), r2.y
                movc r2.y, r3.x, r2.y, r4.z
                mad r3.x, -r1.x, l(0.500000), r2.w
                movc r2.w, r3.y, r2.w, r3.x
                ge r3.xy, |r2.ywyy|, r1.zzzz
                mad r4.z, -r2.z, l(2.000000), r5.z
                movc r5.z, r3.x, r5.z, r4.z
                add r4.z, r3.w, r5.w
                movc r5.w, r3.x, r5.w, r4.z
                not r4.zw, r3.xxxy
                or r4.z, r4.w, r4.z
                mad r4.w, r2.z, l(2.000000), r4.x
                movc r4.x, r3.y, r4.x, r4.w
                add r4.w, r3.z, r4.y
                movc r4.y, r3.y, r4.y, r4.w
                if_nz r4.z
                  if_z r3.x
                    sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
                  endif 
                  if_z r3.y
                    sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
                  endif 
                  mad r4.z, -r1.x, l(0.500000), r2.y
                  movc r2.y, r3.x, r2.y, r4.z
                  mad r3.x, -r1.x, l(0.500000), r2.w
                  movc r2.w, r3.y, r2.w, r3.x
                  ge r3.xy, |r2.ywyy|, r1.zzzz
                  mad r4.z, -r2.z, l(2.000000), r5.z
                  movc r5.z, r3.x, r5.z, r4.z
                  add r3.w, r3.w, r5.w
                  movc r5.w, r3.x, r5.w, r3.w
                  not r4.zw, r3.xxxy
                  or r3.w, r4.w, r4.z
                  mad r2.z, r2.z, l(2.000000), r4.x
                  movc r4.x, r3.y, r4.x, r2.z
                  add r2.z, r3.z, r4.y
                  movc r4.y, r3.y, r4.y, r2.z
                  if_nz r3.w
                    if_z r3.x
                      sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
                    endif 
                    if_z r3.y
                      sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
                    endif 
                    mad r2.z, -r1.x, l(0.500000), r2.y
                    movc r2.y, r3.x, r2.y, r2.z
                    mad r2.z, -r1.x, l(0.500000), r2.w
                    movc r2.w, r3.y, r2.w, r2.z
                    ge r3.xy, |r2.ywyy|, r1.zzzz
                    and r2.z, r1.y, l(0x3b088889)
                    movc r6.xyz, r1.yyyy, l(-0.002083,0,-0.000000,0), l(-0.000000,0.003704,-0.003704,0)
                    add r3.zw, r5.zzzw, r6.xxxz
                    movc r5.zw, r3.xxxx, r5.zzzw, r3.zzzw
                    not r3.zw, r3.xxxy
                    or r3.z, r3.w, r3.z
                    add r2.z, r2.z, r4.x
                    movc r4.x, r3.y, r4.x, r2.z
                    add r2.z, r4.y, r6.y
                    movc r4.y, r3.y, r4.y, r2.z
                    if_nz r3.z
                      if_z r3.x
                        sample_l_indexable(texture2d)(float,float,float,float) r2.y, r5.zwzz, t0.zywx, s0, l(0.000000)
                      endif 
                      if_z r3.y
                        sample_l_indexable(texture2d)(float,float,float,float) r2.w, r4.xyxx, t0.zxwy, s0, l(0.000000)
                      endif 
                      mad r2.z, -r1.x, l(0.500000), r2.y
                      movc r2.y, r3.x, r2.y, r2.z
                      mad r1.x, -r1.x, l(0.500000), r2.w
                      movc r2.w, r3.y, r2.w, r1.x
                      ge r1.xz, |r2.yywy|, r1.zzzz
                      and r2.z, r1.y, l(0x3b888889)
                      movc r3.xyz, r1.yyyy, l(-0.004167,0,-0.000000,0), l(-0.000000,0.007407,-0.007407,0)
                      add r3.xz, r3.xxzx, r5.zzwz
                      movc r5.zw, r1.xxxx, r5.zzzw, r3.xxxz
                      add r1.x, r2.z, r4.x
                      movc r4.x, r1.z, r4.x, r1.x
                      add r1.x, r3.y, r4.y
                      movc r4.y, r1.z, r4.y, r1.x
                    endif 
                  endif 
                endif 
              endif 
            endif 
          endif 
        endif 
      endif 
    endif 
  endif 
  add r1.x, -r5.z, v1.x
  add r1.z, r4.x, -v1.x
  add r2.z, -r5.w, v1.y
  movc r1.x, r1.y, r1.x, r2.z
  add r2.z, r4.y, -v1.y
  movc r1.z, r1.y, r1.z, r2.z
  lt r2.yz, r2.yywy, l(0.000000, 0.000000, 0.000000, 0.000000)
  add r2.w, r1.x, r1.z
  ine r2.yz, r1.wwww, r2.yyzy
  div r1.w, l(1.000000, 1.000000, 1.000000, 1.000000), r2.w
  lt r2.w, r1.x, r1.z
  min r1.x, r1.z, r1.x
  movc r1.z, r2.w, r2.y, r2.z
  mad r1.x, r1.x, -r1.w, l(0.500000)
  and r1.x, r1.x, r1.z
  max r1.x, r1.x, l(0.000000)
  mad r1.xz, r1.xxxx, r2.xxxx, v1.xxyx
  movc r2.x, r1.y, v1.x, r1.x
  movc r2.y, r1.y, r1.z, v1.y
  sample_l_indexable(texture2d)(float,float,float,float) r1.xyz, r2.xyxx, t0.xyzw, s0, l(0.000000)
  mov o0.xyz, r1.xyzx
  mov o0.w, r0.y
else 
  mov o0.xyzw, r0.xyzw
endif 
ret 
// Approximately 326 instruction slots used
