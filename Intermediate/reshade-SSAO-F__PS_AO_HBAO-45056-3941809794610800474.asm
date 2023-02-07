//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float AO_TEXSCALE;                 // Offset:    0 Size:     4
//   float AO_SHARPNESS;                // Offset:    4 Size:     4 [unused]
//   bool AO_SHARPNESS_DETECT;          // Offset:    8 Size:     4
//   int AO_BLUR_STEPS;                 // Offset:   12 Size:     4 [unused]
//   int AO_DEBUG;                      // Offset:   16 Size:     4 [unused]
//   bool AO_LUMINANCE_CONSIDERATION;   // Offset:   20 Size:     4 [unused]
//   float AO_LUMINANCE_LOWER;          // Offset:   24 Size:     4 [unused]
//   float AO_LUMINANCE_UPPER;          // Offset:   28 Size:     4 [unused]
//   float AO_FADE_START;               // Offset:   32 Size:     4 [unused]
//   float AO_FADE_END;                 // Offset:   36 Size:     4
//   int iSSAOSamples;                  // Offset:   40 Size:     4 [unused]
//   bool iSSAOSmartSampling;           // Offset:   44 Size:     4 [unused]
//   float fSSAOSamplingRange;          // Offset:   48 Size:     4 [unused]
//   float fSSAODarkeningAmount;        // Offset:   52 Size:     4 [unused]
//   float fSSAOBrighteningAmount;      // Offset:   56 Size:     4 [unused]
//   int iRayAOSamples;                 // Offset:   60 Size:     4 [unused]
//   float fRayAOSamplingRange;         // Offset:   64 Size:     4 [unused]
//   float fRayAOMaxDepth;              // Offset:   68 Size:     4 [unused]
//   float fRayAOMinDepth;              // Offset:   72 Size:     4 [unused]
//   float fRayAOPower;                 // Offset:   76 Size:     4 [unused]
//   int iHBAOSamples;                  // Offset:   80 Size:     4
//   float fHBAOSamplingRange;          // Offset:   84 Size:     4
//   float fHBAOAmount;                 // Offset:   88 Size:     4
//   float fHBAOClamp;                  // Offset:   92 Size:     4
//   float fHBAOAttenuation;            // Offset:   96 Size:     4
//   int iSSGISamples;                  // Offset:  100 Size:     4 [unused]
//   float fSSGISamplingRange;          // Offset:  104 Size:     4 [unused]
//   float fSSGIIlluminationMult;       // Offset:  108 Size:     4 [unused]
//   float fSSGIOcclusionMult;          // Offset:  112 Size:     4 [unused]
//   float fSSGIModelThickness;         // Offset:  116 Size:     4 [unused]
//   float fSSGISaturation;             // Offset:  120 Size:     4 [unused]
//   float iSAOSamples;                 // Offset:  124 Size:     4 [unused]
//   float fSAOIntensity;               // Offset:  128 Size:     4 [unused]
//   float fSAOClamp;                   // Offset:  132 Size:     4 [unused]
//   float fSAORadius;                  // Offset:  136 Size:     4 [unused]
//   float fSAOBias;                    // Offset:  140 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
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
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { 1.000000, 0, 0, 0},
                              { 0.707100, 0.707100, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { -0.707100, 0.707100, 0, 0},
                              { -1.000000, 0, 0, 0},
                              { -0.707100, -0.707100, 0, 0},
                              { 0, -1.000000, 0, 0},
                              { 0.707100, -0.707100, 0, 0} }
dcl_constantbuffer CB0[7], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
div r0.xy, v1.xyxx, cb0[0].xxxx
lt r0.zw, l(0.000000, 0.000000, 1.000000, 1.000000), r0.xxxy
or r0.z, r0.w, r0.z
discard_nz r0.z
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r0.xyxx, t2.yzxw, s0, l(0.000000)
mad r0.w, -r0.z, l(999.000000), l(1000.000000)
div r1.z, r0.z, r0.w
if_z cb0[0].z
  mov o0.w, r1.z
else 
  add r2.xyzw, r0.xyxy, l(0.000000, 0.001000, 0.001000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r0.z, r2.xyxx, t2.yzxw, s0, l(0.000000)
  mad r0.w, -r0.z, l(999.000000), l(1000.000000)
  div r0.z, r0.z, r0.w
  sample_l_indexable(texture2d)(float,float,float,float) r0.w, r2.zwzz, t2.yzwx, s0, l(0.000000)
  mad r1.w, -r0.w, l(999.000000), l(1000.000000)
  div r0.w, r0.w, r1.w
  add r2.xy, -r1.zzzz, r0.wzww
  mul r2.xy, r2.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
  mov r2.z, l(0.000001)
  dp3 r0.z, r2.xyzx, r2.xyzx
  rsq r0.z, r0.z
  mul r2.xyz, r0.zzzz, r2.xyzx
  dp3 r0.z, r2.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
  mul o0.w, r0.z, l(0.100000)
endif 
min r0.z, cb0[2].y, l(0.999900)
lt r0.z, r0.z, r1.z
if_nz r0.z
  mov o0.xyz, l(1.000000,1.000000,1.000000,0)
else 
  mad r0.zw, r0.xxxy, l(0.000000, 0.000000, 2.000000, -2.000000), l(0.000000, 0.000000, -1.000000, 1.000000)
  mul r0.zw, r1.zzzz, r0.zzzw
  mul r1.xy, r0.zwzz, l(0.431621, 0.767327, 0.000000, 0.000000)
  deriv_rtx_coarse r2.xyz, r1.zxyz
  deriv_rty_coarse r3.xyz, r1.yzxy
  mul r4.xyz, r2.xyzx, r3.xyzx
  mad r2.xyz, r2.zxyz, r3.yzxy, -r4.xyzx
  dp3 r0.z, r2.xyzx, r2.xyzx
  rsq r0.z, r0.z
  mul r2.xyz, r0.zzzz, r2.xyzx
  dp2 r0.z, r0.xyxx, l(25.979601, 156.466003, 0.000000, 0.000000)
  sincos r0.z, null, r0.z
  mul r0.z, r0.z, l(43758.542969)
  frc r3.x, r0.z
  mad r0.z, -r3.x, r3.x, l(1.000000)
  sqrt r3.y, r0.z
  mul r0.zw, r1.zzzz, l(0.000000, 0.000000, 0.431621, 0.767327)
  mul r3.zw, cb0[5].yyyy, l(0.000000, 0.000000, 0.000521, 0.000926)
  div r0.zw, r0.zzzw, r3.zzzw
  itof r1.w, cb0[5].x
  mov r2.w, l(0)
  mov r3.z, l(0)
  loop 
    ige r3.w, r3.z, l(8)
    breakc_nz r3.w
    dp4 r3.w, icb[r3.z + 0].xxyy, r3.xxyy
    mad r4.xy, r3.xyxx, -r3.wwww, icb[r3.z + 0].xyxx
    div r4.xy, r4.xyxx, r0.zwzz
    mul r4.xy, r4.xyxx, l(1.000000, 1.777778, 0.000000, 0.000000)
    div r4.xy, r4.xyxx, r1.wwww
    itof r3.w, r3.z
    mul r3.w, r3.w, l(0.500000)
    frc r3.w, r3.w
    mov r5.x, r2.w
    mov r5.yz, l(0,0,0,0)
    mov r4.z, l(1)
    loop 
      ilt r4.w, cb0[5].x, r4.z
      breakc_nz r4.w
      itof r4.w, r4.z
      add r4.w, -r3.w, r4.w
      mad r6.xy, r4.xyxx, r4.wwww, r0.xyxx
      sample_l_indexable(texture2d)(float,float,float,float) r4.w, r6.xyxx, t2.yzwx, s0, l(0.000000)
      mad r5.w, -r4.w, l(999.000000), l(1000.000000)
      div r7.z, r4.w, r5.w
      mad r6.xy, r6.xyxx, l(2.000000, -2.000000, 0.000000, 0.000000), l(-1.000000, 1.000000, 0.000000, 0.000000)
      mul r6.xy, r7.zzzz, r6.xyxx
      mul r7.xy, r6.xyxx, l(0.431621, 0.767327, 0.000000, 0.000000)
      add r6.xyz, -r1.xyzx, r7.xyzx
      dp3 r4.w, r6.xyzx, r6.xyzx
      rsq r5.w, r4.w
      mul r6.xyz, r5.wwww, r6.xyzx
      dp3 r6.y, r2.xyzx, r6.xyzx
      lt r5.w, r5.y, r6.y
      mad r6.w, -r6.y, r6.y, l(1.000000)
      sqrt r6.w, r6.w
      add r6.z, -r6.w, l(1.000000)
      sqrt r4.w, r4.w
      div r4.w, r4.w, cb0[5].y
      mul r4.w, r4.w, l(5000.000000)
      mul r4.w, r4.w, r4.w
      mad r4.w, cb0[6].x, r4.w, l(1.000000)
      div r4.w, l(1.000000, 1.000000, 1.000000, 1.000000), r4.w
      add r6.w, -r5.z, r6.z
      mad r6.x, r4.w, r6.w, r5.x
      movc r5.xyz, r5.wwww, r6.xyzx, r5.xyzx
      iadd r4.z, r4.z, l(1)
    endloop 
    mov r2.w, r5.x
    iadd r3.z, r3.z, l(1)
  endloop 
  mul r0.x, r2.w, cb0[5].z
  mad r0.x, -r0.x, l(0.125000), l(1.000000)
  max r0.x, r0.x, cb0[5].w
  min o0.xyz, r0.xxxx, l(1.000000, 1.000000, 1.000000, 0.000000)
endif 
ret 
// Approximately 108 instruction slots used