//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool DOF_AUTOFOCUS;                // Offset:    0 Size:     4 [unused]
//   bool DOF_MOUSEDRIVEN_AF;           // Offset:    4 Size:     4 [unused]
//   float2 DOF_FOCUSPOINT;             // Offset:    8 Size:     8 [unused]
//   float DOF_FOCUSSAMPLES;            // Offset:   16 Size:     4 [unused]
//   float DOF_FOCUSRADIUS;             // Offset:   20 Size:     4 [unused]
//   float DOF_NEARBLURCURVE;           // Offset:   24 Size:     4
//   float DOF_FARBLURCURVE;            // Offset:   28 Size:     4 [unused]
//   float DOF_MANUALFOCUSDEPTH;        // Offset:   32 Size:     4 [unused]
//   float DOF_INFINITEFOCUS;           // Offset:   36 Size:     4 [unused]
//   float DOF_BLURRADIUS;              // Offset:   40 Size:     4
//   float iRingDOFSamples;             // Offset:   44 Size:     4 [unused]
//   float iRingDOFRings;               // Offset:   48 Size:     4 [unused]
//   float fRingDOFThreshold;           // Offset:   52 Size:     4 [unused]
//   float fRingDOFGain;                // Offset:   56 Size:     4 [unused]
//   float fRingDOFBias;                // Offset:   60 Size:     4 [unused]
//   float fRingDOFFringe;              // Offset:   64 Size:     4 [unused]
//   float iMagicDOFBlurQuality;        // Offset:   68 Size:     4
//   float fMagicDOFColorCurve;         // Offset:   72 Size:     4 [unused]
//   float iGPDOFQuality;               // Offset:   76 Size:     4 [unused]
//   bool bGPDOFPolygonalBokeh;         // Offset:   80 Size:     4 [unused]
//   float iGPDOFPolygonCount;          // Offset:   84 Size:     4 [unused]
//   float fGPDOFBias;                  // Offset:   88 Size:     4 [unused]
//   float fGPDOFBiasCurve;             // Offset:   92 Size:     4 [unused]
//   float fGPDOFBrightnessThreshold;   // Offset:   96 Size:     4 [unused]
//   float fGPDOFBrightnessMultiplier;  // Offset:  100 Size:     4 [unused]
//   float fGPDOFChromaAmount;          // Offset:  104 Size:     4 [unused]
//   bool bMatsoDOFChromaEnable;        // Offset:  108 Size:     4 [unused]
//   float fMatsoDOFChromaPow;          // Offset:  112 Size:     4 [unused]
//   float fMatsoDOFBokehCurve;         // Offset:  116 Size:     4 [unused]
//   float iMatsoDOFBokehQuality;       // Offset:  120 Size:     4 [unused]
//   float fMatsoDOFBokehAngle;         // Offset:  124 Size:     4 [unused]
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
//   float2 MouseCoords;                // Offset:  240 Size:     8 [unused]
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
// __V__texHDR1                      texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[5], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mad r1.x, r0.w, l(2.000000), l(-1.000000)
mul r1.x, |r1.x|, cb0[2].z
lt r1.y, r0.w, l(0.500000)
add r1.z, cb0[1].z, cb0[1].z
max r1.z, r1.z, l(1.000000)
div r1.z, l(1.000000, 1.000000, 1.000000, 1.000000), r1.z
mul r1.z, r1.z, r1.x
movc r1.x, r1.y, r1.z, r1.x
lt r1.y, r1.x, l(1.200000)
if_z r1.y
  ftoi r1.y, -cb0[4].y
  mul r1.z, r0.w, l(0.990000)
  mov r2.y, l(0)
  mov r3.xyz, l(0,0,0,0)
  mov r1.w, l(0)
  mov r2.z, r1.y
  loop 
    itof r2.w, r2.z
    lt r3.w, cb0[4].y, r2.w
    breakc_nz r3.w
    mul r2.w, r1.x, r2.w
    mul r2.x, r2.w, l(0.000521)
    div r2.xw, r2.xxxy, cb0[4].yyyy
    add r2.xw, r2.xxxw, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r2.xwxx, t0.xyzw, s0, l(0.000000)
    ge r2.x, r4.w, r1.z
    mad r2.w, r4.w, l(2.000000), l(-1.000000)
    mul r2.w, |r2.w|, |r2.w|
    mul r2.w, r2.w, r2.w
    movc r2.x, r2.x, l(1.000000), r2.w
    mad r3.xyz, r4.xyzx, r2.xxxx, r3.xyzx
    add r1.w, r1.w, r2.x
    iadd r2.z, r2.z, l(1)
  endloop 
  div r0.xyz, r3.xyzx, r1.wwww
endif 
mov o0.xyzw, r0.xyzw
ret 
// Approximately 39 instruction slots used
