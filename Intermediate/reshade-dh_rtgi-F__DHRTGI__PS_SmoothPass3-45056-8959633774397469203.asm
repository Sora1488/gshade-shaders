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
//   bool bDebug;                       // Offset:   12 Size:     4 [unused]
//   float fPeviousDepth;               // Offset:   16 Size:     4 [unused]
//   bool bBrightnessOpacity;           // Offset:   20 Size:     4 [unused]
//   float fDepthMultiplier;            // Offset:   24 Size:     4 [unused]
//   bool bFrameAccuAuto;               // Offset:   28 Size:     4
//   int iFrameAccu;                    // Offset:   32 Size:     4
//   float fSkyDepth;                   // Offset:   36 Size:     4
//   float fWeaponDepth;                // Offset:   40 Size:     4 [unused]
//   int iRayPreciseHit;                // Offset:   44 Size:     4 [unused]
//   int iRayPreciseHitSteps;           // Offset:   48 Size:     4 [unused]
//   float fRayStepPrecision;           // Offset:   52 Size:     4 [unused]
//   float fRayStepMultiply;            // Offset:   56 Size:     4 [unused]
//   float fRayHitDepthThreshold;       // Offset:   60 Size:     4 [unused]
//   float fRayBounce;                  // Offset:   64 Size:     4 [unused]
//   float fFadePower;                  // Offset:   68 Size:     4 [unused]
//   float fSaturateColor;              // Offset:   72 Size:     4 [unused]
//   float fSaturateColorPower;         // Offset:   76 Size:     4 [unused]
//   float fAOMultiplier;               // Offset:   80 Size:     4 [unused]
//   int iAODistance;                   // Offset:   84 Size:     4 [unused]
//   bool bNormalWeight;                // Offset:   88 Size:     4
//   int iSmoothRadius;                 // Offset:   92 Size:     4
//   int iSmoothLod;                    // Offset:   96 Size:     4
//   float fSmoothPass;                 // Offset:  100 Size:     4
//   float fSmoothDepthThreshold;       // Offset:  104 Size:     4
//   float fSmoothNormalThreshold;      // Offset:  108 Size:     4
//   float fSourceColor;                // Offset:  112 Size:     4 [unused]
//   float fSourceDesat;                // Offset:  116 Size:     4 [unused]
//   float fLightMult;                  // Offset:  120 Size:     4 [unused]
//   float fLightOffset;                // Offset:  124 Size:     4 [unused]
//   float fMaxLight;                   // Offset:  128 Size:     4 [unused]
//   float fLightNormalize;             // Offset:  132 Size:     4 [unused]
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
// __V__DHRTGI__lightPassTex         texture  float4          2d            t10      1 
// __V__DHRTGI__lightPassAOTex       texture  float4          2d            t14      1 
// __V__DHRTGI__smoothPass2Tex       texture  float4          2d            t20      1 
// __V__DHRTGI__smoothAOPass2Tex     texture  float4          2d            t22      1 
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
dcl_constantbuffer CB0[7], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t10
dcl_resource_texture2d (float,float,float,float) t14
dcl_resource_texture2d (float,float,float,float) t20
dcl_resource_texture2d (float,float,float,float) t22
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_output o1.xyzw
dcl_temps 13
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
lt r0.y, cb0[2].y, r0.x
if_nz r0.y
  itof r0.z, cb0[6].x
  sample_l_indexable(texture2d)(float,float,float,float) r1.xyzw, v1.xyxx, t22.xyzw, s2, r0.z
  mov r2.x, l(1.000000)
else 
  mov r2.x, l(0)
  mov r1.xyzw, l(0,0,0,0)
endif 
if_z r0.y
  ieq r0.y, cb0[5].w, l(0)
  if_z cb0[5].w
    itof r0.z, cb0[6].x
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, v1.xyxx, t10.xyzw, s2, r0.z
    sample_l_indexable(texture2d)(float,float,float,float) r0.z, v1.xyxx, t14.yzxw, s2, r0.z
    mov o1.xyz, r0.zzzz
    mov o1.w, l(1.000000)
  else 
    mov r2.y, l(0)
    mov r3.xyzw, r2.yyyx
    mov o1.xyzw, r1.xyzw
  endif 
  if_z r0.y
    add r0.y, cb0[6].y, cb0[6].y
    ftoi r0.y, r0.y
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, v1.xyxx, t6.xyzw, s0, l(0.000000)
    add r4.xyz, r4.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
    add r4.xyz, r4.xyzx, r4.xyzx
    imul null, r0.z, r0.y, cb0[5].w
    itof r0.z, r0.z
    mad r0.w, r0.z, r0.z, l(1.000000)
    ftoi r2.y, -r0.z
    itof r2.w, cb0[6].x
    mov r4.w, cb0[5].z
    mov r5.xyzw, l(0,0,0,0)
    mov r6.x, r2.y
    mov r6.yzw, l(0,0,0,0)
    loop 
      itof r7.x, r6.x
      lt r7.x, r0.z, r7.x
      breakc_nz r7.x
      itof r7.x, r6.x
      mov r8.xyz, r5.xyzx
      mov r7.z, r4.w
      mov r7.w, r5.w
      mov r8.w, r2.y
      mov r9.xyz, r6.yzwy
      loop 
        itof r9.w, r8.w
        lt r9.w, r0.z, r9.w
        breakc_nz r9.w
        itof r7.y, r8.w
        mad r10.xy, r7.xyxx, l(0.001042, 0.001852, 0.000000, 0.000000), v1.xyxx
        ge r10.zw, r10.xxxy, l(0.000000, 0.000000, 0.000000, 0.000000)
        ge r11.xy, l(1.000000, 1.000000, 0.000000, 0.000000), r10.xyxx
        and r9.w, r10.z, r11.x
        and r9.w, r10.w, r9.w
        and r9.w, r11.y, r9.w
        if_nz r9.w
          sample_l_indexable(texture2d)(float,float,float,float) r9.w, r10.xyxx, t2.yzwx, s0, l(0.000000)
          mad r10.z, -r9.w, l(999.000000), l(1000.000000)
          div r9.w, r9.w, r10.z
          lt r10.z, cb0[2].y, r9.w
          if_nz r10.z
            iadd r10.z, r0.y, r8.w
            mov r8.w, r10.z
            continue 
          endif 
          add r9.w, -r0.x, r9.w
          ge r9.w, cb0[6].z, |r9.w|
          if_nz r9.w
            sample_l_indexable(texture2d)(float,float,float,float) r11.xyz, r10.xyxx, t6.xyzw, s0, l(0.000000)
            add r11.xyz, r11.xyzx, l(-0.500000, -0.500000, -0.500000, 0.000000)
            add r12.xyz, r11.xyzx, r11.xyzx
            mad r11.xyz, r11.xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), -r4.xyzx
            add r11.xyz, |r11.xyzx|, -cb0[6].wwww
            max r11.xyz, r11.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
            ne r11.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r11.xyzx
            or r9.w, r11.y, r11.x
            or r9.w, r11.z, r9.w
            if_z r9.w
              dp2 r7.y, r7.xyxx, r7.xyxx
              ge r7.y, r0.w, r7.y
              if_nz r7.y
                sample_l_indexable(texture2d)(float,float,float,float) r7.y, r10.xyxx, t22.yxzw, s2, r2.w
                add r9.y, r7.y, r9.y
                iadd r9.z, r9.z, l(1)
              endif 
              sample_l_indexable(texture2d)(float,float,float,float) r10.xyz, r10.xyxx, t20.xyzw, s2, r2.w
              dp3 r7.y, r12.xyzx, r4.xyzx
              movc r7.y, r7.z, |r7.y|, l(1.000000)
              mad r8.xyz, r10.xyzx, r7.yyyy, r8.xyzx
              add r7.w, r7.y, r7.w
              iadd r9.x, r9.x, l(1)
            endif 
          endif 
        endif 
        iadd r8.w, r0.y, r8.w
      endloop 
      mov r5.xyz, r8.xyzx
      mov r5.w, r7.w
      mov r6.yzw, r9.xxyz
      iadd r6.x, r0.y, r6.x
    endloop 
    ige r0.x, l(1), r6.y
    if_nz r0.x
      sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, v1.xyxx, t20.xyzw, s2, r2.w
      sample_l_indexable(texture2d)(float,float,float,float) o1.xyzw, v1.xyxx, t22.xyzw, s2, r2.w
      mov r3.w, l(1.000000)
    else 
      itof r0.y, r6.w
      div o1.xyz, r6.zzzz, r0.yyyy
      mov o1.w, l(1.000000)
    endif 
    lt r0.y, l(0.000000), r5.w
    div_sat r4.xyz, r5.xyzx, r5.wwww
    movc r4.xyz, r0.yyyy, r4.xyzx, r5.xyzx
    div r0.y, l(10.000000), cb0[0].x
    round_ne r0.y, r0.y
    max r0.y, r0.y, l(1.000000)
    itof r0.z, cb0[2].x
    movc r0.y, cb0[1].w, r0.y, r0.z
    div r4.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.y
    movc o0.xyzw, r0.xxxx, r3.xyzw, r4.xyzw
  else 
    mov o0.xyzw, r3.xyzw
  endif 
else 
  mov r2.z, l(0)
  mov o0.xyzw, r2.zzzx
  mov o1.xyzw, r1.xyzw
endif 
ret 
// Approximately 136 instruction slots used
