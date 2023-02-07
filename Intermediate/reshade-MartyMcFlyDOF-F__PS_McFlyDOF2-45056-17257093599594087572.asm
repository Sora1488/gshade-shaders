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
//   int iADOF1_ShapeType;              // Offset:   44 Size:     4 [unused]
//   int iADOF2_ShapeType;              // Offset:   48 Size:     4 [unused]
//   int iADOF3_ShapeType;              // Offset:   52 Size:     4 [unused]
//   float iADOF_ShapeQuality;          // Offset:   56 Size:     4 [unused]
//   float fADOF_ShapeRotation;         // Offset:   60 Size:     4 [unused]
//   bool bADOF_RotAnimationEnable;     // Offset:   64 Size:     4 [unused]
//   float fADOF_RotAnimationSpeed;     // Offset:   68 Size:     4 [unused]
//   bool bADOF_ShapeCurvatureEnable;   // Offset:   72 Size:     4 [unused]
//   float fADOF_ShapeCurvatureAmount;  // Offset:   76 Size:     4 [unused]
//   bool bADOF_ShapeApertureEnable;    // Offset:   80 Size:     4 [unused]
//   float fADOF_ShapeApertureAmount;   // Offset:   84 Size:     4 [unused]
//   bool bADOF_ShapeAnamorphEnable;    // Offset:   88 Size:     4 [unused]
//   float fADOF_ShapeAnamorphRatio;    // Offset:   92 Size:     4 [unused]
//   bool bADOF_ShapeDistortEnable;     // Offset:   96 Size:     4 [unused]
//   float fADOF_ShapeDistortAmount;    // Offset:  100 Size:     4 [unused]
//   bool bADOF_ShapeDiffusionEnable;   // Offset:  104 Size:     4 [unused]
//   float fADOF_ShapeDiffusionAmount;  // Offset:  108 Size:     4 [unused]
//   bool bADOF_ShapeWeightEnable;      // Offset:  112 Size:     4 [unused]
//   float fADOF_ShapeWeightCurve;      // Offset:  116 Size:     4 [unused]
//   float fADOF_ShapeWeightAmount;     // Offset:  120 Size:     4 [unused]
//   float fADOF_BokehCurve;            // Offset:  124 Size:     4 [unused]
//   bool bADOF_ShapeChromaEnable;      // Offset:  128 Size:     4 [unused]
//   int iADOF_ShapeChromaMode;         // Offset:  132 Size:     4 [unused]
//   float fADOF_ShapeChromaAmount;     // Offset:  136 Size:     4 [unused]
//   bool bADOF_ImageChromaEnable;      // Offset:  140 Size:     4
//   float iADOF_ImageChromaHues;       // Offset:  144 Size:     4
//   float fADOF_ImageChromaCurve;      // Offset:  148 Size:     4
//   float fADOF_ImageChromaAmount;     // Offset:  152 Size:     4
//   float fADOF_SmootheningAmount;     // Offset:  156 Size:     4 [unused]
//   float2 MouseCoords;                // Offset:  160 Size:     8
//   float Timer;                       // Offset:  168 Size:     4 [unused]
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
dcl_constantbuffer CB0[11], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t6.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
if_nz cb0[0].x
  mul r0.yz, cb0[10].xxyx, l(0.000000, 0.000521, 0.000926, 0.000000)
  movc r0.yz, cb0[0].yyyy, r0.yyzy, cb0[0].zzwz
  ftoi r0.w, cb0[1].x
  div r1.x, l(6.283185), cb0[1].x
  mov r2.x, cb0[1].y
  mov r2.y, l(1.777778)
  mov r1.y, l(0)
  mov r1.z, r0.w
  loop 
    ige r1.w, l(0), r1.z
    breakc_nz r1.w
    itof r1.w, r1.z
    mul r1.w, r1.w, r1.x
    sincos r3.x, r4.x, r1.w
    mul r4.y, r3.x, cb0[1].y
    mad r2.zw, r4.xxxy, r2.xxxy, r0.yyyz
    sample_l_indexable(texture2d)(float,float,float,float) r1.w, r2.zwzz, t6.yzwx, s0, l(0.000000)
    mad r2.z, -r1.w, l(999.000000), l(1000.000000)
    div r1.w, r1.w, r2.z
    add r1.y, r1.w, r1.y
    iadd r1.z, r1.z, l(-1)
  endloop 
  div r0.y, r1.y, cb0[1].x
else 
  mov r0.y, cb0[2].x
endif 
div r0.z, l(1.000000, 1.000000, 1.000000, 1.000000), cb0[2].y
mul_sat r0.xy, r0.zzzz, r0.xyxx
mad r0.w, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.w
mad r0.z, r0.x, l(-2.000000), l(3.000000)
mul r0.x, r0.x, r0.x
mul r0.w, r0.x, r0.z
lt r0.w, r0.w, r0.y
mad r0.x, r0.z, r0.x, -r0.y
div r0.z, r0.x, r0.y
add r1.xy, cb0[1].wzww, cb0[1].wzww
exp r1.x, r1.x
mad r0.y, r0.y, r1.x, -r0.y
div_sat r0.x, r0.x, r0.y
movc r0.x, r0.w, r0.z, r0.x
mad_sat r0.x, r0.x, l(0.500000), l(0.500000)
mad r0.y, r0.x, l(2.000000), l(-1.000000)
mul r0.y, |r0.y|, cb0[2].z
lt r0.z, r0.x, l(0.500000)
max r0.w, r1.y, l(1.000000)
div r0.w, l(1.000000, 1.000000, 1.000000, 1.000000), r0.w
mul r0.w, r0.w, r0.y
movc r0.y, r0.z, r0.w, r0.y
if_nz cb0[8].w
  mad r0.zw, v1.xxxy, l(0.000000, 0.000000, 2.000000, 2.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
  dp2 r1.x, r0.zwzz, r0.zwzz
  sqrt r1.x, r1.x
  log r1.x, r1.x
  mul r1.x, r1.x, cb0[9].y
  exp r1.x, r1.x
  mul r1.x, r1.x, cb0[9].z
  mul r1.x, r0.y, r1.x
  mul r1.x, r1.x, l(0.000521)
  mov r1.yzw, l(0,0,0,0)
  mov r2.xyz, l(0,0,0,0)
  mov r3.x, l(0)
  loop 
    ge r2.w, r3.x, cb0[9].x
    breakc_nz r2.w
    div r2.w, r3.x, cb0[9].x
    mad r4.xyz, r2.wwww, l(6.000000, 6.000000, 6.000000, 0.000000), l(-3.000000, -2.000000, -4.000000, 0.000000)
    mad_sat r4.xyz, |r4.xyzx|, l(1.000000, -1.000000, -1.000000, 0.000000), l(-1.000000, 2.000000, 2.000000, 0.000000)
    add r3.xy, r3.xxxx, l(1.000000, 0.500000, 0.000000, 0.000000)
    div r2.w, r3.y, cb0[9].x
    add r2.w, r2.w, l(-0.500000)
    mad r2.w, r1.x, r2.w, l(1.000000)
    mul r3.yz, r0.zzwz, r2.wwww
    mad r3.yz, r3.yyzy, l(0.000000, 0.500000, 0.500000, 0.000000), l(0.000000, 0.500000, 0.500000, 0.000000)
    mul r3.yz, r3.yyzy, l(0.000000, 0.600000, 0.600000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r3.yzw, r3.yzyy, t2.wxyz, s0, l(0.000000)
    mad r1.yzw, r3.yyzw, r4.xxyz, r1.yyzw
    add r2.xyz, r2.xyzx, r4.xyzx
  endloop 
  dp3 r0.z, r2.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
  div r1.xyz, r1.yzwy, r0.zzzz
else 
  mul r0.zw, v1.xxxy, l(0.000000, 0.000000, 0.600000, 0.600000)
  sample_indexable(texture2d)(float,float,float,float) r1.xyz, r0.zwzz, t2.xyzw, s0
endif 
sample_indexable(texture2d)(float,float,float,float) r2.xyz, v1.xyxx, t4.xyzw, s0
add r0.y, r0.y, l(-2.000000)
mul_sat r0.y, r0.y, l(-1.250000)
mad r0.z, r0.y, l(-2.000000), l(3.000000)
mul r0.y, r0.y, r0.y
mul r0.y, r0.y, r0.z
add r2.xyz, -r1.xyzx, r2.xyzx
mad o0.xyz, r0.yyyy, r2.xyzx, r1.xyzx
mov o0.w, r0.x
ret 
// Approximately 100 instruction slots used
