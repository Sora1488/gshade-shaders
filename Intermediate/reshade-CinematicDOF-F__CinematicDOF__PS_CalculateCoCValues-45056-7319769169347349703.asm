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
// TEXCOORD                 1     z         1     NONE   float     z 
// TEXCOORD                 2      w        1     NONE   float      w
// TEXCOORD                 3   x           2     NONE   float       
// TEXCOORD                 4    y          2     NONE   float       
// TEXCOORD                 5     z         2     NONE   float       
// TEXCOORD                 6      w        2     NONE   float       
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
dcl_input_ps linear v1.xy
dcl_input_ps linear v1.z
dcl_input_ps linear v1.w
dcl_output o0.x
dcl_temps 1
mul r0.x, cb0[1].z, cb0[1].z
div r0.x, r0.x, cb0[1].w
mad r0.y, v1.w, l(0.001000), -cb0[1].z
div r0.x, r0.x, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div r0.y, r0.y, r0.z
eq r0.z, r0.y, l(0.000000)
and r0.z, r0.z, l(0x3f800000)
mad r0.z, r0.y, l(1000.000000), r0.z
mad r0.w, r0.y, l(1000.000000), -v1.w
lt r0.y, r0.y, v1.z
div r0.z, |r0.w|, r0.z
mul r0.x, r0.z, r0.x
mul r0.x, |r0.x|, l(0.024000)
min r0.x, r0.x, l(1.000000)
movc o0.x, r0.y, -r0.x, r0.x
ret 
// Approximately 18 instruction slots used
