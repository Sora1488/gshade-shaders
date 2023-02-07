//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   bool UseAutoFocus;                 // Offset:    0 Size:     4 [unused]
//   bool UseMouseDrivenAutoFocus;      // Offset:    4 Size:     4 [unused]
//   float2 AutoFocusPoint;             // Offset:    8 Size:     8 [unused]
//   float AutoFocusTransitionSpeed;    // Offset:   16 Size:     4 [unused]
//   float ManualFocusPlane;            // Offset:   20 Size:     4 [unused]
//   float FocalLength;                 // Offset:   24 Size:     4 [unused]
//   float FNumber;                     // Offset:   28 Size:     4 [unused]
//   bool ShowOutOfFocusPlaneOnMouseDown;// Offset:   32 Size:     4 [unused]
//   float3 OutOfFocusPlaneColor;       // Offset:   36 Size:    12 [unused]
//   float OutOfFocusPlaneColorTransparency;// Offset:   48 Size:     4 [unused]
//   float3 FocusPlaneColor;            // Offset:   52 Size:    12 [unused]
//   float4 FocusCrosshairColor;        // Offset:   64 Size:    16 [unused]
//   float FarPlaneMaxBlur;             // Offset:   80 Size:     4 [unused]
//   float NearPlaneMaxBlur;            // Offset:   84 Size:     4
//   float BlurQuality;                 // Offset:   88 Size:     4 [unused]
//   float BokehBusyFactor;             // Offset:   92 Size:     4
//   float PostBlurSmoothing;           // Offset:   96 Size:     4 [unused]
//   float HighlightAnamorphicFactor;   // Offset:  100 Size:     4
//   float HighlightAnamorphicSpreadFactor;// Offset:  104 Size:     4
//   float HighlightAnamorphicAlignmentFactor;// Offset:  108 Size:     4
//   float HighlightBoost;              // Offset:  112 Size:     4 [unused]
//   float HighlightGammaFactor;        // Offset:  116 Size:     4 [unused]
//   float HighlightSharpeningFactor;   // Offset:  120 Size:     4 [unused]
//   int HighlightShape;                // Offset:  124 Size:     4 [unused]
//   float HighlightShapeRotationAngle; // Offset:  128 Size:     4 [unused]
//   float HighlightShapeGamma;         // Offset:  132 Size:     4 [unused]
//   bool MitigateUndersampling;        // Offset:  136 Size:     4 [unused]
//   bool ShowCoCValues;                // Offset:  140 Size:     4 [unused]
//   float2 MouseCoords;                // Offset:  144 Size:     8 [unused]
//   bool LeftMouseDown;                // Offset:  152 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __s2                              sampler      NA          NA             s2      1 
// __V__CinematicDOF__texCDCoCBlurred    texture  float4          2d            t18      1 
// __V__CinematicDOF__texCDBuffer2    texture  float4          2d            t22      1 
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
// TEXCOORD                 1     z         1     NONE   float     z 
// TEXCOORD                 2      w        1     NONE   float       
// TEXCOORD                 3   x           2     NONE   float   x   
// TEXCOORD                 4    y          2     NONE   float       
// TEXCOORD                 5     z         2     NONE   float       
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
dcl_constantbuffer CB0[7], immediateIndexed
dcl_sampler s1, mode_default
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t18
dcl_resource_texture2d (float,float,float,float) t22
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.z
dcl_input_ps linear v2.x
dcl_output o0.xyzw
dcl_temps 11
sample_l_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t22.xyzw, s1, l(0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r1.xy, v1.xyxx, t18.xyzw, s2, l(0.000000)
lt r0.w, l(0.000000), r1.x
if_nz r0.w
  max r0.w, v1.z, l(1.000000)
  add r1.z, r0.w, l(1.000000)
  add_sat r1.w, -cb0[5].w, l(1.000000)
  mul r2.xyz, r0.xyzx, r1.xxxx
  mul r2.xyz, r1.wwww, r2.xyzx
  mul r2.w, r1.x, v2.x
  div r0.w, r2.w, r0.w
  mul r3.xy, r0.wwww, l(0.000521, 0.000926, 0.000000, 0.000000)
  add r3.zw, v1.xxxy, l(0.000000, 0.000000, -0.500000, -0.500000)
  add r4.xy, r3.zwzz, r3.zwzz
  dp2 r2.w, r4.xyxx, r4.xyxx
  sqrt r2.w, r2.w
  add r4.x, -r2.w, l(1.000000)
  mad r2.w, cb0[6].z, r4.x, r2.w
  add r4.x, cb0[6].y, l(-1.000000)
  mad r2.w, r2.w, r4.x, l(1.000000)
  add r4.x, -r2.w, l(2.000000)
  dp2 r4.y, r3.zwzz, r3.zwzz
  rsq r4.y, r4.y
  mul r3.zw, r3.zzzw, r4.yyyy
  add r4.y, -cb0[6].w, l(1.000000)
  mul r4.y, r4.y, l(0.500000)
  max r3.w, r3.w, -r4.y
  min r3.w, r4.y, r3.w
  min r4.y, |r3.z|, |r3.w|
  max r4.z, |r3.z|, |r3.w|
  div r4.z, l(1.000000, 1.000000, 1.000000, 1.000000), r4.z
  mul r4.y, r4.z, r4.y
  mul r4.z, r4.y, r4.y
  mad r4.w, r4.z, l(0.020835), l(-0.085133)
  mad r4.w, r4.z, r4.w, l(0.180141)
  mad r4.w, r4.z, r4.w, l(-0.330299)
  mad r4.z, r4.z, r4.w, l(0.999866)
  mul r4.w, r4.z, r4.y
  lt r5.x, |r3.z|, |r3.w|
  mad r4.w, r4.w, l(-2.000000), l(1.570796)
  and r4.w, r5.x, r4.w
  mad r4.y, r4.y, r4.z, r4.w
  lt r4.z, r3.z, -r3.z
  and r4.z, r4.z, l(0xc0490fdb)
  add r4.y, r4.z, r4.y
  min r4.z, r3.z, r3.w
  max r3.z, r3.z, r3.w
  lt r3.w, r4.z, -r4.z
  ge r3.z, r3.z, -r3.z
  and r3.z, r3.z, r3.w
  movc r3.z, r3.z, -r4.y, r4.y
  add r3.z, r3.z, l(-3.141593)
  sincos r5.x, r6.x, r3.z
  mov r7.x, -r5.x
  mad r3.z, r1.w, l(-2.000000), l(3.000000)
  mul r3.w, r1.w, r1.w
  mul r3.z, r3.w, r3.z
  mov r7.y, r6.x
  mov r7.z, r5.x
  mov r4.yzw, r2.xxyz
  mov r5.xy, r3.xyxx
  mov r3.w, r1.w
  mov r5.zw, l(0,0,7.000000,0)
  loop 
    ge r6.x, r5.w, r1.z
    breakc_nz r6.x
    div r6.x, l(6.283185), r5.z
    div r6.y, r5.w, r1.z
    add r6.z, -r6.y, l(1.000000)
    mad r6.y, r3.z, r6.z, r6.y
    mov r8.xyz, r4.yzwy
    mov r6.z, r3.w
    mov r6.w, r6.x
    mov r7.w, l(0)
    loop 
      ge r8.w, r7.w, r5.z
      breakc_nz r8.w
      sincos r9.x, r10.x, r6.w
      mul r10.x, r2.w, r10.x
      mul r10.y, r4.x, r9.x
      dp2 r9.x, r10.yxyy, r7.xyxx
      dp2 r9.y, r10.yxyy, r7.yzyy
      mad r9.xy, r9.xyxx, r5.xyxx, v1.xyxx
      sample_l_indexable(texture2d)(float,float,float,float) r9.xyz, r9.xyxx, t22.xyzw, s1, l(0.000000)
      mad r8.xyz, r9.xyzx, r6.yyyy, r8.xyzx
      add r6.zw, r6.yyyx, r6.zzzw
      add r7.w, r7.w, l(1.000000)
    endloop 
    mov r4.yzw, r8.xxyz
    mov r3.w, r6.z
    mad r5.xy, r0.wwww, l(0.000521, 0.000926, 0.000000, 0.000000), r5.xyxx
    add r5.zw, r5.zzzw, l(0.000000, 0.000000, 7.000000, 1.000000)
  endloop 
  eq r0.w, r3.w, l(0.000000)
  and r0.w, r0.w, l(0x3f800000)
  add r0.w, r0.w, r3.w
  div o0.xyz, r4.yzwy, r0.wwww
  min r0.w, cb0[5].y, l(2.500000)
  add r0.w, r0.w, l(0.400000)
  lt r1.z, l(0.100000), r1.x
  ge r1.w, l(0.000000), r1.y
  movc r1.w, r1.w, l(2.000000), l(1.000000)
  mul r1.w, r1.x, r1.w
  max r1.x, -r1.y, r1.x
  movc r1.x, r1.z, r1.w, r1.x
  mul_sat o0.w, r0.w, r1.x
else 
  mov o0.xyz, r0.xyzx
  mov o0.w, l(0)
endif 
ret 
// Approximately 111 instruction slots used