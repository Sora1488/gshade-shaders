//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int GaussianBlurRadius;            // Offset:    0 Size:     4
//   float GaussianBlurOffset;          // Offset:    4 Size:     4
//   float GaussianBlurStrength;        // Offset:    8 Size:     4 [unused]
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
// SV_TARGET                0   xyz         0   TARGET   float   xyz 
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { 0, 0.398940, 0, 0.132980},
                              { 1.182425, 0.295960, 1.458430, 0.232276},
                              { 3.029312, 0.004566, 3.403985, 0.135326},
                              { 5.004070, 0.000001, 5.351806, 0.051156},
                              { 0, 0.066490, 7.302941, 0.012539},
                              { 1.489585, 0.128470, 9.258160, 0.001991},
                              { 3.475714, 0.111918, 0, 0.044327},
                              { 5.461880, 0.087313, 1.495371, 0.087299},
                              { 7.448104, 0.061001, 3.489199, 0.082089},
                              { 9.434408, 0.038166, 5.483031, 0.073482},
                              { 11.420812, 0.021384, 7.476869, 0.062617},
                              { 13.407333, 0.010729, 9.470713, 0.050796},
                              { 15.393993, 0.004821, 11.464565, 0.039226},
                              { 17.380812, 0.001940, 13.458429, 0.028837},
                              { 19.367800, 0.000699, 15.452306, 0.020181},
                              { 0, 0.033245, 17.446196, 0.013445},
                              { 1.495371, 0.065916, 19.440104, 0.008527},
                              { 3.489199, 0.063671, 21.434029, 0.005148},
                              { 5.483031, 0.059819, 23.427973, 0.002959},
                              { 7.476869, 0.054664, 25.421940, 0.001619},
                              { 9.470713, 0.048587, 27.415928, 0.000843},
                              { 11.464565, 0.042005, 0, 0},
                              { 13.458429, 0.035321, 0, 0},
                              { 15.452306, 0.028888, 0, 0},
                              { 17.446196, 0.022981, 0, 0},
                              { 19.466198, 0.017782, 0, 0},
                              { 21.462744, 0.013382, 0, 0},
                              { 23.459291, 0.009796, 0, 0},
                              { 25.455845, 0.006975, 0, 0},
                              { 27.452402, 0.004830, 0, 0},
                              { 29.448961, 0.003253, 0, 0},
                              { 31.445528, 0.002132, 0, 0},
                              { 33.442101, 0.001358, 0, 0} }
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 5
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
ieq r1.xyz, cb0[0].xxxx, l(1, 2, 3, 0)
if_z cb0[0].x
  mul r2.xyz, r0.xyzx, l(0.398940, 0.398940, 0.398940, 0.000000)
  mov r3.y, l(0)
  mov r0.xyz, r2.xyzx
  mov r0.w, l(1)
  loop 
    ige r1.w, r0.w, l(4)
    breakc_nz r1.w
    mul r1.w, cb0[0].y, icb[r0.w + 0].x
    mul r3.x, r1.w, l(0.000521)
    add r3.zw, r3.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r3.zwzz, t0.xyzw, s0, l(0.000000)
    mad r4.xyz, r4.xyzx, icb[r0.w + 0].yyyy, r0.xyzx
    add r3.xz, -r3.xxyx, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r3.xzw, r3.xzxx, t0.xwyz, s0, l(0.000000)
    mad r0.xyz, r3.xzwx, icb[r0.w + 0].yyyy, r4.xyzx
    iadd r0.w, r0.w, l(1)
  endloop 
endif 
if_nz r1.x
  mul r2.xyz, r0.xyzx, l(0.132980, 0.132980, 0.132980, 0.000000)
  mov r3.y, l(0)
  mov r0.xyz, r2.xyzx
  mov r0.w, l(1)
  loop 
    ige r1.x, r0.w, l(6)
    breakc_nz r1.x
    mul r1.x, cb0[0].y, icb[r0.w + 0].z
    mul r3.x, r1.x, l(0.000521)
    add r1.xw, r3.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r4.xyz, r1.xwxx, t0.xyzw, s0, l(0.000000)
    mad r4.xyz, r4.xyzx, icb[r0.w + 0].wwww, r0.xyzx
    add r1.xw, -r3.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r3.xzw, r1.xwxx, t0.xwyz, s0, l(0.000000)
    mad r0.xyz, r3.xzwx, icb[r0.w + 0].wwww, r4.xyzx
    iadd r0.w, r0.w, l(1)
  endloop 
endif 
if_nz r1.y
  mul r1.xyw, r0.xyxz, l(0.066490, 0.066490, 0.000000, 0.066490)
  mov r2.y, l(0)
  mov r0.xyz, r1.xywx
  mov r0.w, l(1)
  loop 
    ige r2.z, r0.w, l(11)
    breakc_nz r2.z
    mul r2.z, cb0[0].y, icb[r0.w + 4].x
    mul r2.x, r2.z, l(0.000521)
    add r2.zw, r2.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.zwzz, t0.xyzw, s0, l(0.000000)
    mad r3.xyz, r3.xyzx, icb[r0.w + 4].yyyy, r0.xyzx
    add r2.xz, -r2.xxyx, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r2.xzw, r2.xzxx, t0.xwyz, s0, l(0.000000)
    mad r0.xyz, r2.xzwx, icb[r0.w + 4].yyyy, r3.xyzx
    iadd r0.w, r0.w, l(1)
  endloop 
endif 
if_nz r1.z
  mul r1.xyz, r0.xyzx, l(0.044327, 0.044327, 0.044327, 0.000000)
  mov r2.y, l(0)
  mov r0.xyz, r1.xyzx
  mov r0.w, l(1)
  loop 
    ige r1.w, r0.w, l(15)
    breakc_nz r1.w
    mul r1.w, cb0[0].y, icb[r0.w + 6].z
    mul r2.x, r1.w, l(0.000521)
    add r2.zw, r2.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.zwzz, t0.xyzw, s0, l(0.000000)
    mad r3.xyz, r3.xyzx, icb[r0.w + 6].wwww, r0.xyzx
    add r2.xz, -r2.xxyx, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r2.xzw, r2.xzxx, t0.xwyz, s0, l(0.000000)
    mad r0.xyz, r2.xzwx, icb[r0.w + 6].wwww, r3.xyzx
    iadd r0.w, r0.w, l(1)
  endloop 
endif 
ieq r0.w, cb0[0].x, l(4)
if_nz r0.w
  mul r1.xyz, r0.xyzx, l(0.033245, 0.033245, 0.033245, 0.000000)
  mov r2.y, l(0)
  mov r0.xyz, r1.xyzx
  mov r0.w, l(1)
  loop 
    ige r1.w, r0.w, l(18)
    breakc_nz r1.w
    mul r1.w, cb0[0].y, icb[r0.w + 15].x
    mul r2.x, r1.w, l(0.000521)
    add r2.zw, r2.xxxy, v1.xxxy
    sample_l_indexable(texture2d)(float,float,float,float) r3.xyz, r2.zwzz, t0.xyzw, s0, l(0.000000)
    mad r3.xyz, r3.xyzx, icb[r0.w + 15].yyyy, r0.xyzx
    add r2.xz, -r2.xxyx, v1.xxyx
    sample_l_indexable(texture2d)(float,float,float,float) r2.xzw, r2.xzxx, t0.xwyz, s0, l(0.000000)
    mad r0.xyz, r2.xzwx, icb[r0.w + 15].yyyy, r3.xyzx
    iadd r0.w, r0.w, l(1)
  endloop 
endif 
mov_sat o0.xyz, r0.xyzx
ret 
// Approximately 100 instruction slots used
