//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool bADOF_AutofocusEnable;        // Offset:    0 Size:     4 [unused]
//   float2 fADOF_AutofocusCenter;      // Offset:    4 Size:     8 [unused]
//   float fADOF_AutofocusRadius;       // Offset:   12 Size:     4 [unused]
//   float fADOF_AutofocusSpeed;        // Offset:   16 Size:     4 [unused]
//   float fADOF_ManualfocusDepth;      // Offset:   20 Size:     4 [unused]
//   float fADOF_NearBlurCurve;         // Offset:   24 Size:     4 [unused]
//   float fADOF_FarBlurCurve;          // Offset:   28 Size:     4 [unused]
//   float fADOF_HyperFocus;            // Offset:   32 Size:     4 [unused]
//   float fADOF_RenderResolutionMult;  // Offset:   36 Size:     4 [unused]
//   float fADOF_ShapeRadius;           // Offset:   40 Size:     4 [unused]
//   float fADOF_SmootheningAmount;     // Offset:   44 Size:     4
//   float fADOF_BokehIntensity;        // Offset:   48 Size:     4 [unused]
//   int iADOF_BokehMode;               // Offset:   52 Size:     4 [unused]
//   int iADOF_ShapeVertices;           // Offset:   56 Size:     4 [unused]
//   int iADOF_ShapeQuality;            // Offset:   60 Size:     4 [unused]
//   float fADOF_ShapeCurvatureAmount;  // Offset:   64 Size:     4 [unused]
//   float fADOF_ShapeRotation;         // Offset:   68 Size:     4 [unused]
//   float fADOF_ShapeAnamorphRatio;    // Offset:   72 Size:     4 [unused]
//   float fADOF_ShapeChromaAmount;     // Offset:   76 Size:     4 [unused]
//   int iADOF_ShapeChromaMode;         // Offset:   80 Size:     4 [unused]
//   float FRAME_TIME;                  // Offset:   84 Size:     4 [unused]
//   int FRAME_COUNT;                   // Offset:   88 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__CommonTex0                   texture  float4          2d             t8      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float   xy  
// TEXCOORD                 1   xyzw        2     NONE   float       
// TEXCOORD                 2   xy          3     NONE   float       
// TEXCOORD                 3   xy          4     NONE   float       
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t8.xyzw, s0
mad r1.x, r0.w, l(2.000000), l(-1.000000)
mul r1.y, |r1.x|, cb0[2].w
round_ni r1.y, r1.y
mad r1.z, r1.y, r1.y, l(0.001000)
rcp r1.z, r1.z
mul r1.z, r1.z, l(-2.000000)
mov r2.xyz, l(0,0,0,0)
mov r1.w, l(0.001000)
mov r2.w, -r1.y
loop 
  lt r3.x, r1.y, r2.w
  breakc_nz r3.x
  mul r3.x, r2.w, r2.w
  mul r3.x, r1.z, r3.x
  mul r3.x, r3.x, l(1.442695)
  exp r3.x, r3.x
  mad r3.y, r2.w, l(2.000000), l(-0.500000)
  mad r3.yz, r3.yyyy, l(0.000000, 0.000521, 0.000000, 0.000000), v1.xxyx
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.yzyy, t8.xyzw, s0, l(0.000000)
  mad r3.y, r4.w, l(2.000000), l(-1.000000)
  mad_sat r3.y, -|r1.x|, l(0.250000), |r3.y|
  mul r3.z, r3.y, r3.x
  mad r2.xyz, r4.xyzx, r3.zzzz, r2.xyzx
  mad r1.w, r3.x, r3.y, r1.w
  add r2.w, r2.w, l(1.000000)
endloop 
div r1.xyz, r2.xyzx, r1.wwww
mov_sat r1.w, r1.w
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
mov o0.w, r0.w
ret 
// Approximately 33 instruction slots used
