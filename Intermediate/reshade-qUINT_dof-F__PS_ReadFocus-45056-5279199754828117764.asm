//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool bADOF_AutofocusEnable;        // Offset:    0 Size:     4
//   float2 fADOF_AutofocusCenter;      // Offset:    4 Size:     8
//   float fADOF_AutofocusRadius;       // Offset:   12 Size:     4
//   float fADOF_AutofocusSpeed;        // Offset:   16 Size:     4
//   float fADOF_ManualfocusDepth;      // Offset:   20 Size:     4
//   float fADOF_NearBlurCurve;         // Offset:   24 Size:     4 [unused]
//   float fADOF_FarBlurCurve;          // Offset:   28 Size:     4 [unused]
//   float fADOF_HyperFocus;            // Offset:   32 Size:     4 [unused]
//   float fADOF_RenderResolutionMult;  // Offset:   36 Size:     4 [unused]
//   float fADOF_ShapeRadius;           // Offset:   40 Size:     4 [unused]
//   float fADOF_SmootheningAmount;     // Offset:   44 Size:     4 [unused]
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
// __V__qUINT__DepthBufferTex        texture  float4          2d             t2      1 
// __V__ADOF_FocusTexPrev            texture  float4          2d             t6      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xyzw        1     NONE   float       
// TEXCOORD                 1   xyzw        2     NONE   float       
// TEXCOORD                 2   xy          3     NONE   float       
// TEXCOORD                 3   xy          4     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   x           0   TARGET   float   x   
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t6
dcl_output o0.x
dcl_temps 3
ine r0.x, cb0[0].x, l(0)
ieq r0.x, r0.x, l(-1)
if_nz r0.x
  add r0.xy, cb0[0].yzyy, l(-0.500000, -0.500000, 0.000000, 0.000000)
  mov r0.zw, l(0,0,0,0.000001)
  mov r1.x, l(0)
  loop 
    ge r1.z, r1.x, l(10.000000)
    breakc_nz r1.z
    mov r1.zw, r0.zzzw
    mov r1.y, l(0)
    loop 
      ge r2.x, r1.y, l(10.000000)
      breakc_nz r2.x
      add r2.xy, r1.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
      mad r2.xy, r2.xyxx, l(0.200000, 0.200000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
      mad r2.xy, r2.xyxx, cb0[0].wwww, r0.xyxx
      dp2 r2.z, r2.xyxx, r2.xyxx
      mul r2.z, r2.z, l(-4.000000)
      exp r2.z, r2.z
      mul r2.z, r2.z, l(1.200000)
      min r2.z, r2.z, l(1.000000)
      mad r2.xy, r2.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
      sample_l_indexable(texture2d)(float,float,float,float) r2.x, r2.xyxx, t2.xyzw, s0, l(0.000000)
      mad r2.y, -r2.x, l(999.000000), l(1000.000000)
      div_sat r2.x, r2.x, r2.y
      add r2.y, r2.x, l(0.001000)
      rcp r2.y, r2.y
      mul r2.y, r2.y, r2.z
      lt r2.z, l(0.000034), r2.x
      and r2.z, r2.z, l(0x3f800000)
      mul r2.w, r2.z, r2.y
      mad r1.z, r2.x, r2.w, r1.z
      mad r1.w, r2.y, r2.z, r1.w
      add r1.y, r1.y, l(1.000000)
    endloop 
    mov r0.zw, r1.zzzw
    add r1.x, r1.x, l(1.000000)
  endloop 
  div r0.x, r0.z, r0.w
else 
  mul r0.x, cb0[1].y, cb0[1].y
endif 
sample_indexable(texture2d)(float,float,float,float) r0.y, l(0.500000, 0.500000, 0.000000, 0.000000), t6.yxzw, s0
mul r0.z, cb0[1].x, cb0[1].x
lt r0.w, r0.x, r0.y
movc r0.w, r0.w, l(2.000000), l(1.000000)
mul r0.z, r0.w, r0.z
min r0.z, r0.z, l(1.000000)
add r0.x, -r0.y, r0.x
mad o0.x, r0.z, r0.x, r0.y
ret 
// Approximately 52 instruction slots used
