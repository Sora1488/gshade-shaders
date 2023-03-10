//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float texture_sizeX;               // Offset:    0 Size:     4 [unused]
//   float texture_sizeY;               // Offset:    4 Size:     4 [unused]
//   float video_sizeX;                 // Offset:    8 Size:     4 [unused]
//   float video_sizeY;                 // Offset:   12 Size:     4 [unused]
//   bool compositeConnection;          // Offset:   16 Size:     4
//   bool noScanlines;                  // Offset:   20 Size:     4 [unused]
//   float signalResolution;            // Offset:   24 Size:     4 [unused]
//   float signalResolutionI;           // Offset:   28 Size:     4 [unused]
//   float signalResolutionQ;           // Offset:   32 Size:     4 [unused]
//   float tvVerticalResolution;        // Offset:   36 Size:     4 [unused]
//   float blackLevel;                  // Offset:   40 Size:     4 [unused]
//   float contrast;                    // Offset:   44 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__ReShade__BackBufferTex       texture  float4          2d             t0      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
dp3 r1.x, l(0.299000, 0.587000, 0.114000, 0.000000), r0.xyzx
dp3 r1.y, l(0.595716, -0.274453, -0.321263, 0.000000), r0.xyzx
dp3 r1.z, l(0.211456, -0.522591, 0.311135, 0.000000), r0.xyzx
movc o0.xyz, cb0[1].xxxx, r1.xyzx, r0.xyzx
mov o0.w, r0.w
ret 
// Approximately 7 instruction slots used
