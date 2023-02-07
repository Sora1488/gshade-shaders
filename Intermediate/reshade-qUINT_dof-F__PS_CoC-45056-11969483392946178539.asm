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
//   float fADOF_NearBlurCurve;         // Offset:   24 Size:     4
//   float fADOF_FarBlurCurve;          // Offset:   28 Size:     4
//   float fADOF_HyperFocus;            // Offset:   32 Size:     4
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
// __V__qUINT__BackBufferTex         texture  float4          2d             t0      1 
// __V__qUINT__DepthBufferTex        texture  float4          2d             t2      1 
// __V__ADOF_FocusTex                texture  float4          2d             t4      1 
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
dcl_immediateConstantBuffer { { 0.000781, 0.000463, 0, 0},
                              { 0.000260, -0.001389, 0, 0},
                              { -0.000781, -0.000463, 0, 0},
                              { -0.000260, 0.001389, 0, 0} }
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 6
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
sample_l_indexable(texture2d)(float,float,float,float) r0.w, v1.xyxx, t2.yzwx, s0, l(0.000000)
mad r1.x, -r0.w, l(999.000000), l(1000.000000)
div_sat r0.w, r0.w, r1.x
rcp r1.x, r0.w
mov r2.xyzw, l(0,0,0,0)
mov r1.y, l(0)
loop 
  ige r1.z, r1.y, l(4)
  breakc_nz r1.z
  add r3.xyzw, v1.xyxy, icb[r1.y + 0].xyxy
  sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t0.xyzw, s0, l(0.000000)
  add r5.xyzw, r3.zwzw, l(0.000521, 0.000000, -0.000521, -0.000000)
  sample_l_indexable(texture2d)(float,float,float,float) r1.z, r5.xyxx, t2.yzxw, s0, l(0.000000)
  mad r1.w, -r1.z, l(999.000000), l(1000.000000)
  div_sat r1.z, r1.z, r1.w
  sample_l_indexable(texture2d)(float,float,float,float) r1.w, r5.zwzz, t2.yzwx, s0, l(0.000000)
  mad r4.w, -r1.w, l(999.000000), l(1000.000000)
  div_sat r1.w, r1.w, r4.w
  add r3.xyzw, r3.xyzw, l(0.000000, 0.000926, -0.000000, -0.000926)
  sample_l_indexable(texture2d)(float,float,float,float) r3.x, r3.xyxx, t2.xyzw, s0, l(0.000000)
  mad r3.y, -r3.x, l(999.000000), l(1000.000000)
  div_sat r3.x, r3.x, r3.y
  sample_l_indexable(texture2d)(float,float,float,float) r3.y, r3.zwzz, t2.yxzw, s0, l(0.000000)
  mad r3.z, -r3.y, l(999.000000), l(1000.000000)
  div_sat r3.y, r3.y, r3.z
  min r1.z, r1.w, r1.z
  min r1.w, r3.y, r3.x
  min r1.z, r1.w, r1.z
  max r1.w, r4.y, r4.x
  max r1.w, r4.z, r1.w
  add r1.w, r1.w, l(1.000000)
  div r3.xyz, r4.xyzx, r1.wwww
  mad_sat r4.w, r1.z, r1.x, l(0.001000)
  mul r4.xyz, r3.xyzx, r4.wwww
  add r2.xyzw, r4.xyzw, r2.xyzw
  iadd r1.y, r1.y, l(1)
endloop 
div r1.xyz, r2.xyzx, r2.wwww
max r1.w, r1.z, r1.y
max r1.w, r1.w, r1.x
add r1.w, -r1.w, l(1.000000)
div r1.xyz, r1.xyzx, r1.wwww
mul_sat r1.w, r2.w, l(8.000000)
add r1.xyz, -r0.xyzx, r1.xyzx
mad o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
add r1.xyzw, v1.xyxy, l(-0.000521, -0.000000, 0.000521, 0.000000)
sample_l_indexable(texture2d)(float,float,float,float) r0.x, r1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div_sat r0.x, r0.x, r0.y
sample_l_indexable(texture2d)(float,float,float,float) r0.y, r1.zwzz, t2.yxzw, s0, l(0.000000)
mad r0.z, -r0.y, l(999.000000), l(1000.000000)
div_sat r0.y, r0.y, r0.z
add r1.xyzw, v1.xyxy, l(-0.000000, -0.000926, 0.000000, 0.000926)
sample_l_indexable(texture2d)(float,float,float,float) r0.z, r1.xyxx, t2.yzxw, s0, l(0.000000)
mad r1.x, -r0.z, l(999.000000), l(1000.000000)
div_sat r0.z, r0.z, r1.x
sample_l_indexable(texture2d)(float,float,float,float) r1.x, r1.zwzz, t2.xyzw, s0, l(0.000000)
mad r1.y, -r1.x, l(999.000000), l(1000.000000)
div_sat r1.x, r1.x, r1.y
min r0.x, r0.y, r0.x
min r0.y, r0.z, r1.x
min r0.x, r0.y, r0.x
min r0.x, r0.w, r0.x
add r0.y, -r0.x, r0.w
mad r0.x, r0.y, l(0.001000), r0.x
sample_indexable(texture2d)(float,float,float,float) r0.y, v1.xyxx, t4.yxzw, s0
div_sat r0.yz, r0.xxyx, cb0[2].xxxx
lt r0.w, r0.y, r0.z
if_nz r0.w
  div r0.w, r0.y, r0.z
  add r0.w, r0.w, l(-1.000000)
  mul r1.x, cb0[1].z, cb0[1].z
  mul r1.x, r1.x, l(-0.500000)
  exp r1.x, r1.x
  mul r0.w, r0.w, r1.x
else 
  add r0.y, -r0.z, r0.y
  mul r1.x, cb0[1].w, cb0[1].w
  exp r1.x, r1.x
  mad r0.z, r0.z, r1.x, -r0.z
  div_sat r0.w, r0.y, r0.z
endif 
lt r0.x, r0.x, l(0.000034)
mad_sat r0.y, r0.w, l(0.500000), l(0.500000)
movc o0.w, r0.x, l(0.500000), r0.y
ret 
// Approximately 87 instruction slots used