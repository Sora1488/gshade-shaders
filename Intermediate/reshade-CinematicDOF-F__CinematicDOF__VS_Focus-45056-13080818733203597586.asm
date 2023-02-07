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
//   float FocalLength;                 // Offset:   24 Size:     4
//   float FNumber;                     // Offset:   28 Size:     4
//   bool ShowOutOfFocusPlaneOnMouseDown;// Offset:   32 Size:     4 [unused]
//   float3 OutOfFocusPlaneColor;       // Offset:   36 Size:    12 [unused]
//   float OutOfFocusPlaneColorTransparency;// Offset:   48 Size:     4 [unused]
//   float3 FocusPlaneColor;            // Offset:   52 Size:    12 [unused]
//   float4 FocusCrosshairColor;        // Offset:   64 Size:    16 [unused]
//   float FarPlaneMaxBlur;             // Offset:   80 Size:     4 [unused]
//   float NearPlaneMaxBlur;            // Offset:   84 Size:     4 [unused]
//   float BlurQuality;                 // Offset:   88 Size:     4 [unused]
//   float BokehBusyFactor;             // Offset:   92 Size:     4 [unused]
//   float PostBlurSmoothing;           // Offset:   96 Size:     4 [unused]
//   float HighlightAnamorphicFactor;   // Offset:  100 Size:     4 [unused]
//   float HighlightAnamorphicSpreadFactor;// Offset:  104 Size:     4 [unused]
//   float HighlightAnamorphicAlignmentFactor;// Offset:  108 Size:     4 [unused]
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
// __s0                              sampler      NA          NA             s0      1 
// __V__CinematicDOF__texCDCurrentFocus    texture  float4          2d             t4      1 
// _Globals                          cbuffer      NA          NA            cb0      1 
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_VERTEXID              0   x           0   VERTID    uint   x   
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 1     z         1     NONE   float     z 
// TEXCOORD                 2      w        1     NONE   float      w
// TEXCOORD                 3   x           2     NONE   float   x   
// TEXCOORD                 4    y          2     NONE   float    y  
// TEXCOORD                 5     z         2     NONE   float     z 
// TEXCOORD                 6      w        2     NONE   float      w
//
vs_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_sgv v0.x, vertex_id
dcl_output_siv o0.xyzw, position
dcl_output o1.xy
dcl_output o1.z
dcl_output o1.w
dcl_output o2.x
dcl_output o2.y
dcl_output o2.z
dcl_output o2.w
dcl_temps 1
ieq r0.xy, v0.xxxx, l(2, 1, 0, 0)
and r0.xy, r0.xyxx, l(0x40000000, 0x40000000, 0, 0)
mad o0.xy, r0.xyxx, l(2.000000, -2.000000, 0.000000, 0.000000), l(-1.000000, 1.000000, 0.000000, 0.000000)
mov o1.xy, r0.xyxx
mov o0.zw, l(0,0,0,1.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, l(0.000000, 0.000000, 0.000000, 0.000000), t4.xyzw, s0, l(0.000000)
mul o1.zw, r0.xxxx, l(0.000000, 0.000000, 1.000000, 1000.000000)
mad r0.y, r0.x, l(1000000.000000), -cb0[1].z
mul r0.x, r0.x, l(1000000.000000)
mul r0.z, cb0[1].z, cb0[1].z
mul r0.w, cb0[1].w, l(0.024000)
div r0.z, r0.z, r0.w
add r0.w, r0.y, r0.z
add r0.y, -r0.y, r0.z
mul r0.z, r0.x, r0.z
mov o2.x, r0.x
div o2.zw, r0.zzzz, r0.wwwy
mov o2.y, l(0.001062)
ret 
// Approximately 19 instruction slots used