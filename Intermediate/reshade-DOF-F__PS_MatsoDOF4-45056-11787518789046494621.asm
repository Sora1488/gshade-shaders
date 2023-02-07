//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool DOF_AUTOFOCUS;                // Offset:    0 Size:     4
//   bool DOF_MOUSEDRIVEN_AF;           // Offset:    4 Size:     4
//   float2 DOF_FOCUSPOINT;             // Offset:    8 Size:     8
//   float DOF_FOCUSSAMPLES;            // Offset:   16 Size:     4
//   float DOF_FOCUSRADIUS;             // Offset:   20 Size:     4
//   float DOF_NEARBLURCURVE;           // Offset:   24 Size:     4
//   float DOF_FARBLURCURVE;            // Offset:   28 Size:     4
//   float DOF_MANUALFOCUSDEPTH;        // Offset:   32 Size:     4
//   float DOF_INFINITEFOCUS;           // Offset:   36 Size:     4
//   float DOF_BLURRADIUS;              // Offset:   40 Size:     4
//   float iRingDOFSamples;             // Offset:   44 Size:     4 [unused]
//   float iRingDOFRings;               // Offset:   48 Size:     4 [unused]
//   float fRingDOFThreshold;           // Offset:   52 Size:     4 [unused]
//   float fRingDOFGain;                // Offset:   56 Size:     4 [unused]
//   float fRingDOFBias;                // Offset:   60 Size:     4 [unused]
//   float fRingDOFFringe;              // Offset:   64 Size:     4 [unused]
//   float iMagicDOFBlurQuality;        // Offset:   68 Size:     4 [unused]
//   float fMagicDOFColorCurve;         // Offset:   72 Size:     4 [unused]
//   float iGPDOFQuality;               // Offset:   76 Size:     4 [unused]
//   bool bGPDOFPolygonalBokeh;         // Offset:   80 Size:     4 [unused]
//   float iGPDOFPolygonCount;          // Offset:   84 Size:     4 [unused]
//   float fGPDOFBias;                  // Offset:   88 Size:     4 [unused]
//   float fGPDOFBiasCurve;             // Offset:   92 Size:     4 [unused]
//   float fGPDOFBrightnessThreshold;   // Offset:   96 Size:     4 [unused]
//   float fGPDOFBrightnessMultiplier;  // Offset:  100 Size:     4 [unused]
//   float fGPDOFChromaAmount;          // Offset:  104 Size:     4 [unused]
//   bool bMatsoDOFChromaEnable;        // Offset:  108 Size:     4
//   float fMatsoDOFChromaPow;          // Offset:  112 Size:     4
//   float fMatsoDOFBokehCurve;         // Offset:  116 Size:     4
//   float iMatsoDOFBokehQuality;       // Offset:  120 Size:     4
//   float fMatsoDOFBokehAngle;         // Offset:  124 Size:     4
//   int iADOF_ShapeType;               // Offset:  128 Size:     4 [unused]
//   float iADOF_ShapeQuality;          // Offset:  132 Size:     4 [unused]
//   float fADOF_ShapeRotation;         // Offset:  136 Size:     4 [unused]
//   bool bADOF_RotAnimationEnable;     // Offset:  140 Size:     4 [unused]
//   float fADOF_RotAnimationSpeed;     // Offset:  144 Size:     4 [unused]
//   bool bADOF_ShapeCurvatureEnable;   // Offset:  148 Size:     4 [unused]
//   float fADOF_ShapeCurvatureAmount;  // Offset:  152 Size:     4 [unused]
//   bool bADOF_ShapeApertureEnable;    // Offset:  156 Size:     4 [unused]
//   float fADOF_ShapeApertureAmount;   // Offset:  160 Size:     4 [unused]
//   bool bADOF_ShapeAnamorphEnable;    // Offset:  164 Size:     4 [unused]
//   float fADOF_ShapeAnamorphRatio;    // Offset:  168 Size:     4 [unused]
//   bool bADOF_ShapeDistortEnable;     // Offset:  172 Size:     4 [unused]
//   float fADOF_ShapeDistortAmount;    // Offset:  176 Size:     4 [unused]
//   bool bADOF_ShapeDiffusionEnable;   // Offset:  180 Size:     4 [unused]
//   float fADOF_ShapeDiffusionAmount;  // Offset:  184 Size:     4 [unused]
//   bool bADOF_ShapeWeightEnable;      // Offset:  188 Size:     4 [unused]
//   float fADOF_ShapeWeightCurve;      // Offset:  192 Size:     4 [unused]
//   float fADOF_ShapeWeightAmount;     // Offset:  196 Size:     4 [unused]
//   float fADOF_BokehCurve;            // Offset:  200 Size:     4 [unused]
//   bool bADOF_ShapeChromaEnable;      // Offset:  204 Size:     4 [unused]
//   int iADOF_ShapeChromaMode;         // Offset:  208 Size:     4 [unused]
//   float fADOF_ShapeChromaAmount;     // Offset:  212 Size:     4 [unused]
//   bool bADOF_ImageChromaEnable;      // Offset:  216 Size:     4 [unused]
//   float iADOF_ImageChromaHues;       // Offset:  220 Size:     4 [unused]
//   float fADOF_ImageChromaCurve;      // Offset:  224 Size:     4 [unused]
//   float fADOF_ImageChromaAmount;     // Offset:  228 Size:     4 [unused]
//   float fADOF_SmootheningAmount;     // Offset:  232 Size:     4 [unused]
//   float2 MouseCoords;                // Offset:  240 Size:     8
//   float Timer;                       // Offset:  248 Size:     4 [unused]
//
// }
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
dcl_constantbuffer CB0[16], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.wxyz, s0
mad r0.y, r0.x, l(2.000000), l(-1.000000)
mul r0.y, |r0.y|, cb0[2].z
lt r0.z, r0.x, l(0.500000)
add r1.xy, cb0[1].zwzz, cb0[1].zwzz
max r0.w, r1.x, l(1.000000)
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
mul r1.x, r0.w, r0.y
movc r0.y, r0.z, r1.x, r0.y
ftoi r0.z, -cb0[7].z
mul r1.x, cb0[7].w, l(0.017500)
sincos r1.x, r2.x, r1.x
mul r1.zw, r2.xxxx, l(0.000000, 0.000000, 0.306000, 0.739000)
mad r2.x, -r1.x, l(0.739000), r1.z
mad r2.y, r1.x, r2.x, r1.w
mul r1.x, r0.y, l(0.000260)
div r1.x, r1.x, cb0[7].z
mul r1.z, r1.x, cb0[7].x
mul r3.xyzw, r1.zzzz, l(-1.000000, -1.000000, 0.584962, 0.584962)
exp r3.xyzw, r3.xyzw
add r1.x, -r1.x, l(1.000000)
mov r4.xyz, l(0,0,0,0)
mov r1.z, cb0[6].w
mov r1.w, l(0)
mov r2.z, r0.z
loop 
  itof r2.w, r2.z
  ge r4.w, r2.w, cb0[7].z
  breakc_nz r4.w
  mul r5.xy, r2.xyxx, r2.wwww
  mul r5.xy, r0.yyyy, r5.xyxx
  mul r5.xy, r5.xyxx, l(0.000260, 0.000463, 0.000000, 0.000000)
  div r5.xy, r5.xyxx, cb0[7].zzzz
  add r5.xy, r5.xyxx, v1.xyxx
  if_nz r1.z
    mad r5.zw, r5.xxxy, l(0.000000, 0.000000, 2.000000, 2.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
    mul r6.xyzw, r3.xyzw, r5.zwzw
    mad r6.xyzw, r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), l(0.500000, 0.500000, 0.500000, 0.500000)
    sample_l_indexable(texture2d)(float,float,float,float) r7.x, r6.xyxx, t2.xyzw, s0, l(0.000000)
    mad r5.zw, r5.zzzw, l(0.000000, 0.000000, 0.500000, 0.500000), l(0.000000, 0.000000, 0.500000, 0.500000)
    sample_l_indexable(texture2d)(float,float,float,float) r7.y, r5.zwzz, t2.xyzw, s0, l(0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r7.z, r6.zwzz, t2.xyzw, s0, l(0.000000)
    mul r6.xyz, r1.xxxx, r7.xyzx
  else 
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyz, r5.xyxx, t2.xyzw, s0, l(0.000000)
  endif 
  dp3 r4.w, r6.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
  dp3 r5.x, r6.xyzx, r6.xyzx
  sqrt r5.x, r5.x
  add r4.w, r4.w, r5.x
  add r4.w, r4.w, l(0.100000)
  log r4.w, |r4.w|
  mul r4.w, r4.w, cb0[7].y
  exp r4.w, r4.w
  add r2.w, |r2.w|, r4.w
  mad r4.xyz, r6.xyzx, r2.wwww, r4.xyzx
  add r1.w, r1.w, r2.w
  iadd r2.z, r2.z, l(1)
endloop 
div r1.xzw, r4.xxyz, r1.wwww
sample_l_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t6.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
if_nz cb0[0].x
  mul r2.xy, cb0[15].xyxx, l(0.000521, 0.000926, 0.000000, 0.000000)
  movc r2.xy, cb0[0].yyyy, r2.xyxx, cb0[0].zwzz
  ftoi r0.z, cb0[1].x
  div r2.z, l(6.283185), cb0[1].x
  mov r3.x, cb0[1].y
  mov r3.y, l(1.777778)
  mov r2.w, l(0)
  mov r3.z, r0.z
  loop 
    ige r3.w, l(0), r3.z
    breakc_nz r3.w
    itof r3.w, r3.z
    mul r3.w, r2.z, r3.w
    sincos r4.x, r5.x, r3.w
    mul r5.y, r4.x, cb0[1].y
    mad r4.xy, r5.xyxx, r3.xyxx, r2.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r3.w, r4.xyxx, t6.yzwx, s0, l(0.000000)
    mad r4.x, -r3.w, l(999.000000), l(1000.000000)
    div r3.w, r3.w, r4.x
    add r2.w, r2.w, r3.w
    iadd r3.z, r3.z, l(-1)
  endloop 
  div r0.z, r2.w, cb0[1].x
else 
  mov r0.z, cb0[2].x
endif 
div r2.x, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[2].y
mul_sat r0.yz, r0.yyzy, r2.xxxx
mad r2.y, r0.z, l(-2.000000), l(3.000000)
mul r0.z, r0.z, r0.z
mul r0.z, r0.z, r2.y
mad r2.x, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r2.y, r0.y, r2.x
lt r2.y, r2.y, r0.z
mad r0.y, r2.x, r0.y, -r0.z
div r2.x, r0.y, r0.z
exp r1.y, r1.y
mad r0.z, r0.z, r1.y, -r0.z
div_sat r0.y, r0.y, r0.z
movc r0.y, r2.y, r2.x, r0.y
mad_sat r0.y, r0.y, l(0.500000), l(0.500000)
mad r0.z, r0.y, l(2.000000), l(-1.000000)
mul r0.z, |r0.z|, cb0[2].z
lt r0.y, r0.y, l(0.500000)
mul r0.w, r0.w, r0.z
movc r0.y, r0.y, r0.w, r0.z
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t4.xyzw, s0
add r0.y, r0.y, l(-0.200000)
mul_sat r0.y, r0.y, l(0.555556)
mad r0.z, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.z
add r1.xyz, r1.xzwx, -r2.xyzx
mad o0.xyz, r0.yyyy, r1.xyzx, r2.xyzx
mov o0.w, r0.x
ret 
// Approximately 121 instruction slots used
