//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int Censor_Quantity;               // Offset:    0 Size:     4 [unused]
//   float Censor_Opacity;              // Offset:    4 Size:     4
//   float Censor_Depth;                // Offset:    8 Size:     4
//   int Censor_Cell_Size;              // Offset:   12 Size:     4
//   float Censor_Smoothness_Average;   // Offset:   16 Size:     4
//   float Censor_Scale;                // Offset:   20 Size:     4
//   float Censor_ScaleX;               // Offset:   24 Size:     4
//   float Censor_ScaleY;               // Offset:   28 Size:     4
//   float Censor_PosX;                 // Offset:   32 Size:     4
//   float Censor_PosY;                 // Offset:   36 Size:     4
//   int Censor_SnapRotate;             // Offset:   40 Size:     4
//   float Censor_Rotate;               // Offset:   44 Size:     4
//   bool Censor_InvertDepth;           // Offset:   48 Size:     4
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
dcl_constantbuffer CB0[4], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t2
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 11
sample_l_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t2.xyzw, s0, l(0.000000)
mad r0.y, -r0.x, l(999.000000), l(1000.000000)
div r0.x, r0.x, r0.y
add r0.y, -r0.x, l(1.000000)
movc r0.x, cb0[3].x, r0.x, r0.y
lt r0.x, r0.x, cb0[0].z
if_nz r0.x
  sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
  mul r1.xy, cb0[1].zwzz, cb0[1].yyyy
  mul r1.xy, r1.xyxx, l(-0.777778, 0.437500, 0.000000, 0.000000)
  mul r1.zw, v1.xxxy, l(0.000000, 0.000000, 1920.000000, 1080.000000)
  itof r0.w, cb0[0].w
  div r1.zw, r1.zzzw, r0.wwww
  round_ni r1.zw, r1.zzzw
  mul r2.xy, r0.wwww, r1.zwzz
  mad r3.xy, r1.zwzz, r0.wwww, l(0.500000, 0.500000, 0.000000, 0.000000)
  mul r3.xy, r3.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000)
  sample_indexable(texture2d)(float,float,float,float) r4.xyzw, r3.xyxx, t0.xyzw, s0
  lt r3.z, l(0.100000), cb0[1].x
  if_nz r3.z
    mul r5.xyzw, r0.wwww, l(0.250000, 0.500000, 0.750000, 0.250000)
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.xyxx, t0.xyzw, s0, l(0.000000)
    mad r6.xyzw, r1.wwwz, r0.wwww, r5.xyzw
    mov r2.zw, r6.xxxy
    add r7.xyzw, r2.xzxw, l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r7.xyzw, r7.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r8.xyzw, r7.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r8.xyzw
    sample_l_indexable(texture2d)(float,float,float,float) r7.xyzw, r7.zwzz, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r7.xyzw
    mov r7.x, r2.x
    mov r7.w, r6.z
    add r5.xw, r7.xxxw, l(0.500000, 0.000000, 0.000000, 0.500000)
    mul r5.xw, r5.xxxw, l(0.000521, 0.000000, 0.000000, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r8.xyzw, r5.xwxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r8.xyzw
    mov r8.z, r6.w
    mov r8.w, r2.y
    add r2.xy, r8.zwzz, l(0.500000, 0.500000, 0.000000, 0.000000)
    mul r2.xy, r2.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r9.xyzw, r2.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r9.xyzw
    add r9.xyzw, r6.wxwy, l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r9.xyzw, r9.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r10.xyzw, r9.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r10.xyzw
    sample_l_indexable(texture2d)(float,float,float,float) r9.xyzw, r9.zwzz, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r9.xyzw
    add r2.xy, r6.wzww, l(0.500000, 0.500000, 0.000000, 0.000000)
    mul r2.xy, r2.xyxx, l(0.000521, 0.000926, 0.000000, 0.000000)
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyzw, r2.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r6.xyzw
    mad r8.xy, r1.zzzz, r0.wwww, r5.yzyy
    add r5.xyzw, r8.xwyw, l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r5.xyzw, r5.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyzw, r5.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r6.xyzw
    mov r7.x, r8.x
    mov r7.yz, r2.zzwz
    add r2.xyzw, r7.xyxz, l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r2.xyzw, r2.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r6.xyzw, r2.xyxx, t0.xyzw, s0, l(0.000000)
    add r3.xyzw, r3.xyzw, r6.xyzw
    sample_l_indexable(texture2d)(float,float,float,float) r2.xyzw, r2.zwzz, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r3.xyzw
    add r1.zw, r7.xxxw, l(0.000000, 0.000000, 0.500000, 0.500000)
    mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r1.zwzz, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r3.xyzw
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r5.zwzz, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r3.xyzw
    mov r7.x, r8.y
    add r3.xyzw, r7.xyxz, l(0.500000, 0.500000, 0.500000, 0.500000)
    mul r3.xyzw, r3.xyzw, l(0.000521, 0.000926, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r5.xyzw, r3.xyxx, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r5.xyzw
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r3.zwzz, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r3.xyzw
    add r1.zw, r7.xxxw, l(0.000000, 0.000000, 0.500000, 0.500000)
    mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 0.000521, 0.000926)
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyzw, r1.zwzz, t0.xyzw, s0, l(0.000000)
    add r2.xyzw, r2.xyzw, r3.xyzw
    mul r2.xyzw, r2.xyzw, cb0[1].xxxx
    add r0.w, -cb0[1].x, l(1.000000)
    mul r3.xyzw, r0.wwww, r4.xyzw
    mad r4.xyzw, r2.xyzw, l(0.062500, 0.062500, 0.062500, 0.062500), r3.xyzw
  endif 
  switch cb0[2].z
    case l(1)
    mov r0.w, l(-1.570796)
    break 
    case l(2)
    mov r0.w, l(1.570796)
    break 
    case l(3)
    mov r0.w, l(0)
    break 
    case l(4)
    mov r0.w, l(3.141593)
    break 
    default 
    mul r0.w, cb0[2].w, l(0.017453)
    break 
  endswitch 
  div r1.xy, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyxx
  sincos r2.x, r3.x, r0.w
  mul r2.x, r2.x, l(-0.777778)
  sincos r0.w, null, -r0.w
  mul r2.w, r0.w, l(0.437500)
  mul r2.yz, r3.xxxx, l(0.000000, -0.777778, 0.437500, 0.000000)
  mov r3.xz, v1.xxyx
  mov r3.yw, -cb0[2].xxxy
  dp2 r3.x, r3.xyxx, l(1.000000, 1.000000, 0.000000, 0.000000)
  dp2 r3.y, r3.zwzz, l(1.000000, 1.000000, 0.000000, 0.000000)
  dp2 r0.w, r3.xyxx, r2.ywyy
  dp2 r1.z, r3.xyxx, r2.xzxx
  mul r2.x, r1.x, r0.w
  mul r2.y, r1.y, r1.z
  add r1.xy, r2.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  mov_sat r1.zw, r1.xxxy
  eq r1.xy, r1.zwzz, r1.xyxx
  and r0.w, r1.y, r1.x
  and r0.w, r0.w, l(0x3f800000)
  mul r1.x, r0.w, r4.w
  mul r1.y, r1.x, cb0[0].y
  mad r2.xyz, r4.xyzx, r0.wwww, -r0.xyzx
  mad o0.xyz, r1.yyyy, r2.xyzx, r0.xyzx
  mov o0.w, r1.x
else 
  sample_indexable(texture2d)(float,float,float,float) o0.xyzw, v1.xyxx, t0.xyzw, s0
endif 
ret 
// Approximately 132 instruction slots used
