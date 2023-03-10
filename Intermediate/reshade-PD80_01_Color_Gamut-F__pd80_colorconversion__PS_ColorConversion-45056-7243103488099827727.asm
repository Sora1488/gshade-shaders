//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   int colorgamut;                    // Offset:    0 Size:     4
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
dcl_constantbuffer CB0[1], immediateIndexed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v1.xy
dcl_output o0.xyzw
dcl_temps 8
sample_indexable(texture2d)(float,float,float,float) r0.xyz, v1.xyxx, t0.xyzw, s0
mul r1.xyz, r0.xyzx, l(0.077399, 0.077399, 0.077399, 0.000000)
add r2.xyz, r0.xyzx, l(0.055000, 0.055000, 0.055000, 0.000000)
mul r2.xyz, r2.xyzx, l(0.947867, 0.947867, 0.947867, 0.000000)
max r2.xyz, r2.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
log r2.xyz, r2.xyzx
mul r2.xyz, r2.xyzx, l(2.400000, 2.400000, 2.400000, 0.000000)
exp r2.xyz, r2.xyzx
ge r0.xyz, l(0.040450, 0.040450, 0.040450, 0.000000), r0.xyzx
movc r0.xyz, r0.xyzx, r1.xyzx, r2.xyzx
dp3 r1.x, l(0.412456, 0.357576, 0.180438, 0.000000), r0.xyzx
dp3 r1.y, l(0.212673, 0.715152, 0.072175, 0.000000), r0.xyzx
dp3 r1.z, l(0.019334, 0.119192, 0.950304, 0.000000), r0.xyzx
switch cb0[0].x
  case l(0)
  mov r0.xyz, l(3.240454,-1.537138,-0.498531,0)
  mov r2.xyz, l(-0.969266,1.876011,0.041556,0)
  mov r3.xyz, l(0.055643,-0.204026,1.057225,0)
  break 
  case l(1)
  mov r0.xyz, l(2.041369,-0.564946,-0.344694,0)
  mov r2.xyz, l(-0.969266,1.876011,0.041556,0)
  mov r3.xyz, l(0.013447,-0.118390,1.015410,0)
  break 
  case l(2)
  mov r0.xyz, l(2.951537,-1.289412,-0.473844,0)
  mov r2.xyz, l(-1.085109,1.990857,0.037203,0)
  mov r3.xyz, l(0.085493,-0.269496,1.091298,0)
  break 
  case l(3)
  mov r0.xyz, l(1.755260,-0.483679,-0.253000,0)
  mov r2.xyz, l(-0.544134,1.506879,0.021553,0)
  mov r3.xyz, l(0.006347,-0.017576,1.225696,0)
  break 
  case l(4)
  mov r0.xyz, l(1.683227,-0.428236,-0.236018,0)
  mov r2.xyz, l(-0.771023,1.706557,0.044690,0)
  mov r3.xyz, l(0.040001,-0.088538,1.272364,0)
  break 
  case l(5)
  mov r0.xyz, l(2.745467,-1.135814,-0.435027,0)
  mov r2.xyz, l(-0.969266,1.876011,0.041556,0)
  mov r3.xyz, l(0.011272,-0.113975,1.013254,0)
  break 
  case l(6)
  mov r0.xyz, l(2.370674,-0.900041,-0.470634,0)
  mov r2.xyz, l(-0.513885,1.425304,0.088581,0)
  mov r3.xyz, l(0.005298,-0.014695,1.009397,0)
  break 
  case l(7)
  mov r0.xyz, l(2.642287,-1.223427,-0.393014,0)
  mov r2.xyz, l(-1.111976,2.059018,0.015961,0)
  mov r3.xyz, l(0.082170,-0.280725,1.455988,0)
  break 
  case l(8)
  mov r0.xyz, l(1.760390,-0.488120,-0.253613,0)
  mov r2.xyz, l(-0.712629,1.652743,0.041671,0)
  mov r3.xyz, l(0.007821,-0.034741,1.244774,0)
  break 
  case l(9)
  mov r0.xyz, l(1.782762,-0.496985,-0.269010,0)
  mov r2.xyz, l(-0.959362,1.947796,-0.027581,0)
  mov r3.xyz, l(0.085932,-0.174467,1.322827,0)
  break 
  case l(10)
  mov r0.xyz, l(2.004382,-0.730484,-0.245005,0)
  mov r2.xyz, l(-0.711029,1.620213,0.079223,0)
  mov r3.xyz, l(0.038126,-0.086878,1.272544,0)
  break 
  case l(11)
  mov r0.xyz, l(1.909996,-0.532454,-0.288209,0)
  mov r2.xyz, l(-0.984666,1.999171,-0.028308,0)
  mov r3.xyz, l(0.058306,-0.118378,0.897554,0)
  break 
  case l(12)
  mov r0.xyz, l(3.062897,-1.393179,-0.475752,0)
  mov r2.xyz, l(-0.969266,1.876011,0.041556,0)
  mov r3.xyz, l(0.067878,-0.228855,1.069349,0)
  break 
  case l(13)
  mov r0.xyz, l(1.345943,-0.255607,-0.051112,0)
  mov r2.xyz, l(-0.544599,1.508167,0.020535,0)
  mov r3.xyz, l(0,0,1.211813,0)
  break 
  case l(14)
  mov r0.xyz, l(3.505396,-1.739489,-0.543964,0)
  mov r2.xyz, l(-1.069072,1.977824,0.035172,0)
  mov r3.xyz, l(0.056320,-0.197023,1.050203,0)
  break 
  case l(15)
  mov r0.xyz, l(1.462807,-0.184062,-0.274361,0)
  mov r2.xyz, l(-0.521793,1.447238,0.067723,0)
  mov r3.xyz, l(0.034934,-0.096893,1.288410,0)
  break 
  default 
  mov r0.xyz, l(0,0,0,0)
  mov r2.xyz, l(0,0,0,0)
  mov r3.xyz, l(0,0,0,0)
  break 
endswitch 
ieq r4.xyzw, cb0[0].xxxx, l(3, 4, 6, 7)
or r0.w, r4.y, r4.x
movc r5.xyz, r0.wwww, l(1.047811,0.022887,-0.050127,0), l(1.000000,0,0,0)
movc r6.xyz, r0.wwww, l(0.029542,0.990484,-0.017049,0), l(0,1.000000,0,0)
movc r7.xyz, r0.wwww, l(-0.009235,0.015044,0.752132,0), l(0,0,1.000000,0)
movc r5.xyz, r4.zzzz, l(1.050262,0.027076,-0.023252,0), r5.xyzx
movc r6.xyz, r4.zzzz, l(0.039065,0.972950,-0.009258,0), r6.xyzx
movc r4.xyz, r4.zzzz, l(-0.002405,0.002645,0.918087,0), r7.xyzx
ieq r7.xyzw, cb0[0].xxxx, l(8, 9, 10, 11)
or r0.w, r4.w, r7.x
or r0.w, r7.y, r0.w
or r0.w, r7.z, r0.w
movc r5.xyz, r0.wwww, l(1.047811,0.022887,-0.050127,0), r5.xyzx
movc r6.xyz, r0.wwww, l(0.029542,0.990484,-0.017049,0), r6.xyzx
movc r4.xyz, r0.wwww, l(-0.009235,0.015044,0.752132,0), r4.xyzx
movc r5.xyz, r7.wwww, l(1.009778,0.007042,0.012797,0), r5.xyzx
movc r6.xyz, r7.wwww, l(0.012311,0.984709,0.003296,0), r6.xyzx
movc r4.xyz, r7.wwww, l(0.003828,-0.007233,1.089164,0), r4.xyzx
ieq r7.xy, cb0[0].xxxx, l(13, 15, 0, 0)
or r0.w, r7.y, r7.x
movc r5.xyz, r0.wwww, l(1.047811,0.022887,-0.050127,0), r5.xyzx
movc r6.xyz, r0.wwww, l(0.029542,0.990484,-0.017049,0), r6.xyzx
movc r4.xyz, r0.wwww, l(-0.009235,0.015044,0.752132,0), r4.xyzx
dp3 r5.x, r5.xyzx, r1.xyzx
dp3 r5.y, r6.xyzx, r1.xyzx
dp3 r5.z, r4.xyzx, r1.xyzx
dp3 r0.x, r0.xyzx, r5.xyzx
dp3 r0.y, r2.xyzx, r5.xyzx
dp3 r0.z, r3.xyzx, r5.xyzx
mul r1.xyz, r0.xyzx, l(12.920000, 12.920000, 12.920000, 0.000000)
mov_sat r2.xyz, r0.xyzx
log r2.xyz, r2.xyzx
mul r2.xyz, r2.xyzx, l(0.416667, 0.416667, 0.416667, 0.000000)
exp r2.xyz, r2.xyzx
mad r2.xyz, r2.xyzx, l(1.055000, 1.055000, 1.055000, 0.000000), l(-0.055000, -0.055000, -0.055000, 0.000000)
lt r0.xyz, r0.xyzx, l(0.003131, 0.003131, 0.003131, 0.000000)
movc o0.xyz, r0.xyzx, r1.xyzx, r2.xyzx
mov o0.w, l(1.000000)
ret 
// Approximately 139 instruction slots used
