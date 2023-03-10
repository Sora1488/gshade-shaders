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
//   float FarPlaneMaxBlur;             // Offset:   80 Size:     4
//   float NearPlaneMaxBlur;            // Offset:   84 Size:     4
//   float BlurQuality;                 // Offset:   88 Size:     4 [unused]
//   float BokehBusyFactor;             // Offset:   92 Size:     4 [unused]
//   float PostBlurSmoothing;           // Offset:   96 Size:     4 [unused]
//   float HighlightAnamorphicFactor;   // Offset:  100 Size:     4 [unused]
//   float HighlightAnamorphicSpreadFactor;// Offset:  104 Size:     4 [unused]
//   float HighlightAnamorphicAlignmentFactor;// Offset:  108 Size:     4 [unused]
//   float HighlightBoost;              // Offset:  112 Size:     4
//   float HighlightGammaFactor;        // Offset:  116 Size:     4
//   float HighlightSharpeningFactor;   // Offset:  120 Size:     4 [unused]
//   int HighlightShape;                // Offset:  124 Size:     4 [unused]
//   float HighlightShapeRotationAngle; // Offset:  128 Size:     4 [unused]
//   float HighlightShapeGamma;         // Offset:  132 Size:     4 [unused]
//   bool MitigateUndersampling;        // Offset:  136 Size:     4
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
// __s0                              sampler      NA          NA             s0      1 
// __s2                              sampler      NA          NA             s2      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
// __V__CinematicDOF__texCDCoC       texture  float4          2d             t8      1 
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
// TEXCOORD                 2      w        1     NONE   float      w
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
dcl_constantbuffer CB0[9], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s2, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t8
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.z
dcl_input_ps linear v1.w
dcl_input_ps linear v2.x
dcl_output o0.xyzw
dcl_temps 13
sample_l_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0, l(0.000000)
log r1.xyz, |r0.xyzx|
mul r1.xyz, r1.xyzx, cb0[7].yyyy
exp r1.xyz, r1.xyzx
mad r2.xyz, -cb0[7].xxxx, r1.xyzx, l(1.001000, 1.001000, 1.001000, 0.000000)
max r2.xyz, r2.xyzx, l(0.001000, 0.001000, 0.001000, 0.000000)
div r0.xyz, r1.xyzx, r2.xyzx
if_nz cb0[8].z
  max r1.x, v1.z, l(1.000000)
  div r1.x, l(1.000000, 1.000000, 1.000000, 1.000000), r1.x
  add r1.yz, v1.zzzz, l(0.000000, -3.000000, -2.000000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r1.w, v1.xyxx, t8.yzwx, s2, l(0.000000)
  mul r1.w, r1.x, r1.w
  mov r2.w, |r1.w|
  lt r3.x, r1.w, l(0.000000)
  movc r3.y, r3.x, cb0[5].y, cb0[5].x
  max r1.yz, r1.yyzy, l(0.000000, 2.000000, 1.000000, 0.000000)
  eq r3.z, r2.w, l(0.000000)
  mul r2.xyz, r0.xyzx, r2.wwww
  movc r4.xyzw, r3.zzzz, r0.xyzw, r2.xyzw
  movc r2.x, r3.x, v2.x, v1.w
  mul r2.x, r2.w, r2.x
  mul r2.xy, r2.xxxx, l(0.000521, 0.000926, 0.000000, 0.000000)
  add r2.z, r1.z, l(-1.000000)
  eq r3.z, r1.z, l(1.000000)
  and r3.z, r3.z, l(0x3f800000)
  add r2.z, r2.z, r3.z
  rcp r2.z, r2.z
  mul r3.zw, r2.zzzz, r2.xxxy
  mul r1.w, r1.w, r3.y
  div r1.w, r1.w, r1.z
  not r5.x, r3.x
  mov r5.yzw, r4.xxyz
  mov r6.xy, r3.zwzz
  mov r6.z, r4.w
  mov r6.w, r1.y
  mov r7.x, l(0)
  loop 
    ge r7.y, r7.x, r1.z
    breakc_nz r7.y
    div r7.y, l(6.283185), r6.w
    mul r7.z, r1.w, r7.x
    mov r8.xyz, r5.yzwy
    mov r7.w, r6.z
    mov r8.w, r7.y
    mov r9.x, l(0)
    loop 
      ge r9.y, r9.x, r6.w
      breakc_nz r9.y
      sincos r10.x, r11.x, r8.w
      mov r11.y, r10.x
      mad r9.yz, r11.xxyx, r6.xxyx, v1.xxyx
      sample_l_indexable(texture2d)(float,float,float,float) r9.w, r9.yzyy, t8.yzwx, s2, l(0.000000)
      mul r9.w, r1.x, r9.w
      lt r10.x, l(0.000000), r9.w
      and r10.x, r5.x, r10.x
      ge r10.y, l(0.000000), r9.w
      and r10.y, r3.x, r10.y
      or r10.x, r10.y, r10.x
      and r10.x, r10.x, l(0x3f800000)
      mad r10.y, |r9.w|, r3.y, -r7.z
      add_sat r10.y, r10.y, l(0.500000)
      mul r10.x, r10.x, r10.y
      add r9.w, r2.w, -|r9.w|
      lt r9.w, r9.w, l(0.001000)
      and r9.w, r9.w, l(0x3f800000)
      mul r10.y, r9.w, r10.x
      sample_l_indexable(texture2d)(float,float,float,float) r11.xyz, r9.yzyy, t0.xyzw, s0, l(0.000000)
      log r11.xyz, |r11.xyzx|
      mul r11.xyz, r11.xyzx, cb0[7].yyyy
      exp r11.xyz, r11.xyzx
      mad r12.xyz, -cb0[7].xxxx, r11.xyzx, l(1.001000, 1.001000, 1.001000, 0.000000)
      max r12.xyz, r12.xyzx, l(0.001000, 0.001000, 0.001000, 0.000000)
      div r11.xyz, r11.xyzx, r12.xyzx
      mad r8.xyz, r11.xyzx, r10.yyyy, r8.xyzx
      mad r7.w, r10.x, r9.w, r7.w
      add r8.w, r7.y, r8.w
      add r9.x, r9.x, l(1.000000)
    endloop 
    mov r5.yzw, r8.xxyz
    mov r6.z, r7.w
    add r6.w, r1.y, r6.w
    mad r6.xy, r2.xyxx, r2.zzzz, r6.xyxx
    add r7.x, r7.x, l(1.000000)
  endloop 
  eq r1.x, r6.z, l(0.000000)
  and r1.x, r1.x, l(0x3f800000)
  add r1.x, r1.x, r6.z
  div r0.xyz, r5.yzwy, r1.xxxx
endif 
mov o0.xyzw, r0.xyzw
ret 
// Approximately 92 instruction slots used
