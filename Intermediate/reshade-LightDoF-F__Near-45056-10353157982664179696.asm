//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float fLightDoF_Width;             // Offset:    0 Size:     4
//   float fLightDoF_Amount;            // Offset:    4 Size:     4
//   bool bLightDoF_UseCA;              // Offset:    8 Size:     4
//   float2 f2LightDoF_CA;              // Offset:   16 Size:     8
//   bool bLightDoF_AutoFocus;          // Offset:   24 Size:     4
//   float fLightDoF_AutoFocusSpeed;    // Offset:   28 Size:     4 [unused]
//   bool bLightDoF_UseMouseFocus;      // Offset:   32 Size:     4 [unused]
//   float2 f2Bokeh_AutoFocusCenter;    // Offset:   36 Size:     8 [unused]
//   float fLightDoF_ManualFocus;       // Offset:   44 Size:     4
//   float2 f2LightDoF_MouseCoord;      // Offset:   48 Size:     8 [unused]
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
// __V__ReShade__DepthBufferTex      texture  float4          2d             t2      1 
// __V__tFocus                       texture  float4          2d             t4      1 
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 7
dcl_indexableTemp x0[12], 4
mov x0[0].xy, l(-0.326000,-0.406000,0,0)
mov x0[1].xy, l(-0.840000,-0.074000,0,0)
mov x0[2].xy, l(-0.696000,0.457000,0,0)
mov x0[3].xy, l(-0.203000,0.621000,0,0)
mov x0[4].xy, l(0.962000,-0.195000,0,0)
mov x0[5].xy, l(0.473000,-0.480000,0,0)
mov x0[6].xy, l(0.519000,0.767000,0,0)
mov x0[7].xy, l(0.185000,-0.893000,0,0)
mov x0[8].xy, l(0.507000,0.064000,0,0)
mov x0[9].xy, l(0.896000,0.412000,0,0)
mov x0[10].xy, l(-0.322000,-0.933000,0,0)
mov x0[11].xy, l(-0.792000,-0.598000,0,0)
dp2 r0.x, v1.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
sincos r0.x, null, r0.x
mul r0.x, r0.x, l(43758.542969)
frc r0.x, r0.x
sincos r1.x, r2.x, r0.x
sincos r0.x, null, -r0.x
add r0.w, cb0[1].y, l(1.000000)
mad r1.y, cb0[1].y, l(0.500000), l(1.000000)
sample_indexable(texture2d)(float,float,float,float) r1.z, l(0.000000, 0.000000, 0.000000, 0.000000), t4.yzxw, s0
mov r0.y, r2.x
mov r0.z, r1.x
mov r1.x, cb0[0].z
mov r1.w, cb0[1].z
mov r2.xyzw, l(0,0,0,0)
loop 
  ige r3.x, r2.w, l(12)
  breakc_nz r3.x
  mov r3.xy, x0[r2.w + 0].xyxx
  dp2 r4.x, r3.yxyy, r0.xyxx
  dp2 r4.y, r3.yxyy, r0.yzyy
  if_nz r1.x
    mul r3.xy, r4.xyxx, cb0[0].xxxx
    mul r3.zw, r3.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926)
    mul r4.zw, r0.wwww, r3.zzzw
    mad r5.xy, r3.zwzz, r0.wwww, v1.xyxx
    mul r5.zw, r1.yyyy, r3.zzzw
    mad r6.xy, r3.zwzz, r1.yyyy, v1.xyxx
    mad r3.xy, r3.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000), v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r5.x, r5.xyxx, t2.xyzw, s0, l(0.000000)
    mad r5.y, -r5.x, l(999.000000), l(1000.000000)
    div r5.x, r5.x, r5.y
    if_nz r1.w
      add r5.y, -r1.z, r5.x
    else 
      add r5.y, r5.x, -cb0[2].w
    endif 
    mul_sat r5.x, -r5.y, cb0[0].y
    mad r4.zw, r5.xxxx, r4.zzzw, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r5.x, r6.xyxx, t2.xyzw, s0, l(0.000000)
    mad r5.y, -r5.x, l(999.000000), l(1000.000000)
    div r5.x, r5.x, r5.y
    if_nz r1.w
      add r5.y, -r1.z, r5.x
    else 
      add r5.y, r5.x, -cb0[2].w
    endif 
    mul_sat r5.x, -r5.y, cb0[0].y
    mad r5.xy, r5.xxxx, r5.zwzz, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r3.x, r3.xyxx, t2.xyzw, s0, l(0.000000)
    mad r3.y, -r3.x, l(999.000000), l(1000.000000)
    div r3.x, r3.x, r3.y
    if_nz r1.w
      add r3.y, -r1.z, r3.x
    else 
      add r3.y, r3.x, -cb0[2].w
    endif 
    mul_sat r3.x, -r3.y, cb0[0].y
    mad r3.xy, r3.xxxx, r3.zwzz, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r6.x, r4.zwzz, t0.xyzw, s0, l(0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r6.y, r5.xyxx, t0.xyzw, s0, l(0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r6.z, r3.xyxx, t0.xyzw, s0, l(0.000000)
    add r2.xyz, r2.xyzx, r6.xyzx
  else 
    mul r3.xy, r4.xyxx, cb0[0].xxxx
    mul r3.zw, r3.xxxy, l(0.000000, 0.000000, 0.000521, 0.000926)
    mad r3.xy, r3.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000), v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r3.x, r3.xyxx, t2.xyzw, s0, l(0.000000)
    mad r3.y, -r3.x, l(999.000000), l(1000.000000)
    div r3.x, r3.x, r3.y
    if_nz r1.w
      add r3.y, -r1.z, r3.x
    else 
      add r3.y, r3.x, -cb0[2].w
    endif 
    mul_sat r3.x, -r3.y, cb0[0].y
    mad r3.xy, r3.xxxx, r3.zwzz, v1.xyxx
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r3.xyxx, t0.xyzw, s0, l(0.000000)
    add r2.xyz, r2.xyzx, r3.xyzx
  endif 
  iadd r2.w, r2.w, l(1)
endloop 
mul o0.xyz, r2.xyzx, l(0.083000, 0.083000, 0.083000, 0.000000)
ret 
// Approximately 95 instruction slots used