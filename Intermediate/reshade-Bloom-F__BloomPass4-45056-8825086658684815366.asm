//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int iBloomMixmode;                 // Offset:    0 Size:     4 [unused]
//   float fBloomThreshold;             // Offset:    4 Size:     4 [unused]
//   float fBloomAmount;                // Offset:    8 Size:     4 [unused]
//   float fBloomSaturation;            // Offset:   12 Size:     4 [unused]
//   float3 fBloomTint;                 // Offset:   16 Size:    12 [unused]
//   bool bLensdirtEnable;              // Offset:   28 Size:     4 [unused]
//   int iLensdirtMixmode;              // Offset:   32 Size:     4 [unused]
//   float fLensdirtIntensity;          // Offset:   36 Size:     4 [unused]
//   float fLensdirtSaturation;         // Offset:   40 Size:     4 [unused]
//   float3 fLensdirtTint;              // Offset:   48 Size:    12 [unused]
//   bool bAnamFlareEnable;             // Offset:   60 Size:     4 [unused]
//   float fAnamFlareThreshold;         // Offset:   64 Size:     4 [unused]
//   float fAnamFlareWideness;          // Offset:   68 Size:     4
//   float fAnamFlareAmount;            // Offset:   72 Size:     4 [unused]
//   float fAnamFlareCurve;             // Offset:   76 Size:     4 [unused]
//   float3 fAnamFlareColor;            // Offset:   80 Size:    12 [unused]
//   bool bLenzEnable;                  // Offset:   92 Size:     4 [unused]
//   float fLenzIntensity;              // Offset:   96 Size:     4 [unused]
//   float fLenzThreshold;              // Offset:  100 Size:     4 [unused]
//   bool bChapFlareEnable;             // Offset:  104 Size:     4 [unused]
//   float fChapFlareTreshold;          // Offset:  108 Size:     4 [unused]
//   int iChapFlareCount;               // Offset:  112 Size:     4 [unused]
//   float fChapFlareDispersal;         // Offset:  116 Size:     4 [unused]
//   float fChapFlareSize;              // Offset:  120 Size:     4 [unused]
//   float3 fChapFlareCA;               // Offset:  128 Size:    12 [unused]
//   float fChapFlareIntensity;         // Offset:  140 Size:     4 [unused]
//   bool bGodrayEnable;                // Offset:  144 Size:     4 [unused]
//   float fGodrayDecay;                // Offset:  148 Size:     4 [unused]
//   float fGodrayExposure;             // Offset:  152 Size:     4 [unused]
//   float fGodrayWeight;               // Offset:  156 Size:     4 [unused]
//   float fGodrayDensity;              // Offset:  160 Size:     4 [unused]
//   float fGodrayThreshold;            // Offset:  164 Size:     4 [unused]
//   int iGodraySamples;                // Offset:  168 Size:     4 [unused]
//   float fFlareLuminance;             // Offset:  172 Size:     4 [unused]
//   float fFlareBlur;                  // Offset:  176 Size:     4 [unused]
//   float fFlareIntensity;             // Offset:  180 Size:     4 [unused]
//   float3 fFlareTint;                 // Offset:  192 Size:    12 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s0                              sampler      NA          NA             s0      1 
// __V__texBloom4                    texture  float4          2d            t10      1 
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
dcl_immediateConstantBuffer { { 0.082607, 0, 0, 0},
                              { 0.080977, 0, 0, 0},
                              { 0.076276, 0, 0, 0},
                              { 0.069041, 0, 0, 0},
                              { 0.060049, 0, 0, 0},
                              { 0.050187, 0, 0, 0},
                              { 0.040306, 0, 0, 0},
                              { 0.031105, 0, 0, 0},
                              { 0.023066, 0, 0, 0},
                              { 0.016436, 0, 0, 0},
                              { 0.011254, 0, 0, 0} }
dcl_constantbuffer CB0[5], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t10
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 3
mov r0.xw, v1.xxxy
mov r1.xyzw, l(0,0,0,-10)
loop 
  ige r2.x, r1.w, l(11)
  breakc_nz r2.x
  itof r2.x, r1.w
  mad r0.y, r2.x, l(0.014815), v1.y
  sample_indexable(texture2d)(float,float,float,float) r2.xyz, r0.xyxx, t10.xyzw, s0
  imax r0.y, -r1.w, r1.w
  mad r1.xyz, r2.xyzx, icb[r0.y + 0].xxxx, r1.xyzx
  iadd r1.w, r1.w, l(1)
endloop 
mul o0.xyz, r1.xyzx, l(2.500000, 2.500000, 2.500000, 0.000000)
mul r0.x, cb0[4].y, l(0.016667)
mov r0.y, l(0)
mov r1.x, l(-10)
loop 
  ige r1.y, r1.x, l(11)
  breakc_nz r1.y
  itof r1.y, r1.x
  mad r0.z, r0.x, r1.y, v1.x
  sample_indexable(texture2d)(float,float,float,float) r0.z, r0.zwzz, t10.xywz, s0
  imax r1.y, -r1.x, r1.x
  mad r0.y, r0.z, icb[r1.y + 0].x, r0.y
  iadd r1.x, r1.x, l(1)
endloop 
mul o0.w, r0.y, l(2.500000)
ret 
// Approximately 28 instruction slots used
