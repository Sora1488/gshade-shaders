//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float3 FogColor;                   // Offset:    0 Size:    12 [unused]
//   float MaxFogFactor;                // Offset:   12 Size:     4 [unused]
//   float FogCurve;                    // Offset:   16 Size:     4 [unused]
//   float FogStart;                    // Offset:   20 Size:     4 [unused]
//   float BloomThreshold;              // Offset:   24 Size:     4
//   float BloomPower;                  // Offset:   28 Size:     4
//   float BloomWidth;                  // Offset:   32 Size:     4
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
dcl_constantbuffer CB0[3], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 7
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v1.xyxx, t0.xyzw, s0
mul r1.x, cb0[2].x, l(8.000000)
mul r1.yz, v1.xxyx, cb0[2].xxxx
mul r1.yz, r1.yyzy, l(0.000000, 0.000521, 0.000926, 0.000000)
mov r2.xyz, l(0,0,0,0)
mov r1.w, l(2.500000)
loop 
  ge r2.w, l(-2.000000), r1.w
  breakc_nz r2.w
  mul r3.x, r1.y, r1.w
  mul r2.w, r1.w, r1.w
  mul r2.w, r2.w, cb0[2].x
  mov r4.xyz, r2.xyzx
  mov r3.z, l(-2.500000)
  loop 
    ge r3.w, r3.z, l(2.000000)
    breakc_nz r3.w
    mul r3.w, r3.z, r3.z
    mad r3.w, r3.w, cb0[2].x, r2.w
    mul r3.y, r1.z, r3.z
    add r5.xy, r3.xyxx, v1.xyxx
    sample_indexable(texture2d)(float,float,float,float) r5.xyz, r5.xyxx, t0.xyzw, s0
    div r3.y, r3.w, r1.x
    sqrt r3.y, r3.y
    add r6.xyz, r0.xyzx, -r5.xyzx
    mad r5.xyz, r3.yyyy, r6.xyzx, r5.xyzx
    add r4.xyz, r4.xyzx, r5.xyzx
    add r3.z, r3.z, l(1.000000)
  endloop 
  mov r2.xyz, r4.xyzx
  add r1.w, r1.w, l(-1.000000)
endloop 
mad r1.x, -cb0[1].z, l(5.000000), cb0[1].w
add r1.x, -r1.x, l(25.000000)
div r1.xyz, r2.xyzx, r1.xxxx
dp3 r1.w, r0.xyzx, l(0.299000, 0.587000, 0.114000, 0.000000)
add r2.x, cb0[1].w, l(4.000000)
mad r1.xyz, r1.xyzx, r2.xxxx, -r0.xyzx
mad_sat o0.xyz, r1.wwww, r1.xyzx, r0.xyzx
mov_sat o0.w, r0.w
ret 
// Approximately 41 instruction slots used
