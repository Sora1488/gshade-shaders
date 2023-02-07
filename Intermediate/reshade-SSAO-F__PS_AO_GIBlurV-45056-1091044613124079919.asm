//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float AO_TEXSCALE;                 // Offset:    0 Size:     4
//   float AO_SHARPNESS;                // Offset:    4 Size:     4
//   bool AO_SHARPNESS_DETECT;          // Offset:    8 Size:     4
//   int AO_BLUR_STEPS;                 // Offset:   12 Size:     4
//   int AO_DEBUG;                      // Offset:   16 Size:     4 [unused]
//   bool AO_LUMINANCE_CONSIDERATION;   // Offset:   20 Size:     4 [unused]
//   float AO_LUMINANCE_LOWER;          // Offset:   24 Size:     4 [unused]
//   float AO_LUMINANCE_UPPER;          // Offset:   28 Size:     4 [unused]
//   float AO_FADE_START;               // Offset:   32 Size:     4 [unused]
//   float AO_FADE_END;                 // Offset:   36 Size:     4 [unused]
//   int iSSAOSamples;                  // Offset:   40 Size:     4 [unused]
//   bool iSSAOSmartSampling;           // Offset:   44 Size:     4 [unused]
//   float fSSAOSamplingRange;          // Offset:   48 Size:     4 [unused]
//   float fSSAODarkeningAmount;        // Offset:   52 Size:     4 [unused]
//   float fSSAOBrighteningAmount;      // Offset:   56 Size:     4 [unused]
//   int iRayAOSamples;                 // Offset:   60 Size:     4 [unused]
//   float fRayAOSamplingRange;         // Offset:   64 Size:     4 [unused]
//   float fRayAOMaxDepth;              // Offset:   68 Size:     4 [unused]
//   float fRayAOMinDepth;              // Offset:   72 Size:     4 [unused]
//   float fRayAOPower;                 // Offset:   76 Size:     4 [unused]
//   int iHBAOSamples;                  // Offset:   80 Size:     4 [unused]
//   float fHBAOSamplingRange;          // Offset:   84 Size:     4 [unused]
//   float fHBAOAmount;                 // Offset:   88 Size:     4 [unused]
//   float fHBAOClamp;                  // Offset:   92 Size:     4 [unused]
//   float fHBAOAttenuation;            // Offset:   96 Size:     4 [unused]
//   int iSSGISamples;                  // Offset:  100 Size:     4 [unused]
//   float fSSGISamplingRange;          // Offset:  104 Size:     4 [unused]
//   float fSSGIIlluminationMult;       // Offset:  108 Size:     4 [unused]
//   float fSSGIOcclusionMult;          // Offset:  112 Size:     4 [unused]
//   float fSSGIModelThickness;         // Offset:  116 Size:     4 [unused]
//   float fSSGISaturation;             // Offset:  120 Size:     4 [unused]
//   float iSAOSamples;                 // Offset:  124 Size:     4 [unused]
//   float fSAOIntensity;               // Offset:  128 Size:     4 [unused]
//   float fSAOClamp;                   // Offset:  132 Size:     4 [unused]
//   float fSAORadius;                  // Offset:  136 Size:     4 [unused]
//   float fSAOBias;                    // Offset:  140 Size:     4 [unused]
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
// __V__texOcclusion1                texture  float4          2d             t6      1 
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t6
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
mul r0.xyzw, v1.xyxy, cb0[0].xxxx
sample_l_indexable(texture2d)(float,float,float,float) r1.x, r0.zwzz, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div r1.x, r1.x, r1.y
if_nz cb0[0].z
  mad r2.xyzw, v1.xyxy, cb0[0].xxxx, l(0.000000, 0.001000, 0.001000, 0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r1.y, r2.xyxx, t2.yxzw, s0, l(0.000000)
  mad r1.z, -r1.y, l(999.000000), l(1000.000000)
  div r1.y, r1.y, r1.z
  sample_l_indexable(texture2d)(float,float,float,float) r1.z, r2.zwzz, t2.yzxw, s0, l(0.000000)
  mad r1.w, -r1.z, l(999.000000), l(1000.000000)
  div r1.z, r1.z, r1.w
  add r2.xy, -r1.xxxx, r1.zyzz
  mul r2.xy, r2.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
  mov r2.z, l(0.000001)
  dp3 r1.y, r2.xyzx, r2.xyzx
  rsq r1.y, r1.y
  mul r1.yzw, r1.yyyy, r2.xxyz
  dp3 r1.y, r1.yzwy, l(0.333000, 0.333000, 0.333000, 0.000000)
  mul r1.x, r1.y, l(0.100000)
endif 
ineg r1.y, cb0[0].w
mul r1.z, cb0[0].y, l(1000.000000)
mov r2.z, l(0.000001)
mov r3.xyzw, l(0,0,0,0)
mov r1.w, l(0)
mov r2.w, r1.y
loop 
  ilt r4.x, cb0[0].w, r2.w
  breakc_nz r4.x
  itof r4.x, r2.w
  mad r4.xyzw, r4.xxxx, l(0.000000, 0.000926, 0.000000, 0.000926), r0.xyzw
  sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r4.zwzz, t6.xyzw, s0, l(0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r6.x, r4.zwzz, t2.xyzw, s0, l(0.000000)
  mad r6.y, -r6.x, l(999.000000), l(1000.000000)
  div r6.x, r6.x, r6.y
  if_nz cb0[0].z
    add r4.xyzw, r4.xyzw, l(0.000000, 0.001000, 0.001000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r4.x, r4.xyxx, t2.xyzw, s0, l(0.000000)
    mad r4.y, -r4.x, l(999.000000), l(1000.000000)
    div r4.x, r4.x, r4.y
    sample_l_indexable(texture2d)(float,float,float,float) r4.y, r4.zwzz, t2.yxzw, s0, l(0.000000)
    mad r4.z, -r4.y, l(999.000000), l(1000.000000)
    div r4.y, r4.y, r4.z
    add r7.xy, -r6.xxxx, r4.yxyy
    mul r2.xy, r7.xyxx, l(0.001000, 0.001000, 0.000000, 0.000000)
    dp3 r4.x, r2.xyzx, r2.xyzx
    rsq r4.x, r4.x
    mul r4.xyz, r2.xyzx, r4.xxxx
    dp3 r2.x, r4.xyzx, l(0.333000, 0.333000, 0.333000, 0.000000)
    mul r6.x, r2.x, l(0.100000)
  endif 
  imax r2.x, -r2.w, r2.w
  iadd r2.x, -r2.x, cb0[0].w
  itof r2.x, r2.x
  add r2.y, -r1.x, r6.x
  mad_sat r2.y, -r1.z, |r2.y|, l(1.000000)
  mul r4.x, r2.y, r2.x
  mad r3.xyzw, r5.xyzw, r4.xxxx, r3.xyzw
  mad r1.w, r2.x, r2.y, r1.w
  iadd r2.w, r2.w, l(1)
endloop 
add r0.x, r1.w, l(0.000100)
div o0.xyzw, r3.xyzw, r0.xxxx
ret 
// Approximately 65 instruction slots used
