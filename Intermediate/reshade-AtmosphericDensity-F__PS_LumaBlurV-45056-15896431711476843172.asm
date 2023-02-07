//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
// Buffer Definitions: 
//
// cbuffer _Globals
// {
//
//   float Timer;                       // Offset:    0 Size:     4 [unused]
//   bool HasDepth;                     // Offset:    4 Size:     4 [unused]
//   int DISTANCE;                      // Offset:    8 Size:     4 [unused]
//   int HIGHLIGHT_DIST;                // Offset:   12 Size:     4 [unused]
//   float3 FOG_TINT;                   // Offset:   16 Size:    12 [unused]
//   int AUTO_COLOR;                    // Offset:   28 Size:     4
//   int WIDTH;                         // Offset:   32 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim      HLSL Bind  Count
// ------------------------------ ---------- ------- ----------- -------------- ------
// __s1                              sampler      NA          NA             s1      1 
// __V__TexBlur2                     texture  float4          2d            t12      1 
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
dcl_constantbuffer CB0[2], immediateIndexed
dcl_sampler s1, mode_default
dcl_resource_texture2d (float,float,float,float) t12
dcl_input_ps linear v1.xy
dcl_output o0.xyz
dcl_temps 3
dcl_indexableTemp x0[18], 4
dcl_indexableTemp x1[18], 4
sample_indexable(texture2d)(float,float,float,float) r0.x, v1.xyxx, t12.xyzw, s1
ilt r0.y, l(1), cb0[1].w
if_nz r0.y
  mov x0[0].x, l(0)
  mov x0[1].x, l(1.495371)
  mov x0[2].x, l(3.489199)
  mov x0[3].x, l(5.483031)
  mov x0[4].x, l(7.476869)
  mov x0[5].x, l(9.470713)
  mov x0[6].x, l(11.464565)
  mov x0[7].x, l(13.458429)
  mov x0[8].x, l(15.452306)
  mov x0[9].x, l(17.446196)
  mov x0[10].x, l(19.466198)
  mov x0[11].x, l(21.462744)
  mov x0[12].x, l(23.459291)
  mov x0[13].x, l(25.455845)
  mov x0[14].x, l(27.452402)
  mov x0[15].x, l(29.448961)
  mov x0[16].x, l(31.445528)
  mov x0[17].x, l(33.442101)
  mov x1[0].x, l(0.033245)
  mov x1[1].x, l(0.065916)
  mov x1[2].x, l(0.063671)
  mov x1[3].x, l(0.059819)
  mov x1[4].x, l(0.054664)
  mov x1[5].x, l(0.048587)
  mov x1[6].x, l(0.042005)
  mov x1[7].x, l(0.035321)
  mov x1[8].x, l(0.028888)
  mov x1[9].x, l(0.022981)
  mov x1[10].x, l(0.017782)
  mov x1[11].x, l(0.013382)
  mov x1[12].x, l(0.009796)
  mov x1[13].x, l(0.006975)
  mov x1[14].x, l(0.004830)
  mov x1[15].x, l(0.003253)
  mov x1[16].x, l(0.002132)
  mov x1[17].x, l(0.001358)
  mul r0.y, r0.x, l(0.033245)
  lt r0.zw, l(0.000000, 0.000000, 0.575000, 0.575000), v1.xxxy
  lt r1.xy, v1.xyxx, l(0.425000, 0.425000, 0.000000, 0.000000)
  or r0.z, r0.z, r1.x
  or r0.z, r0.w, r0.z
  or r0.z, r1.y, r0.z
  if_nz r0.z
    mov r0.w, r0.y
  endif 
  if_z r0.z
    mov r1.x, l(0)
    mov r0.w, r0.y
    mov r0.z, l(1)
    loop 
      ige r1.z, r0.z, l(18)
      breakc_nz r1.z
      itof r1.z, r0.z
      mad r1.w, r1.z, l(0.000926), v1.y
      lt r1.w, l(0.575000), r1.w
      mad r1.z, -r1.z, l(0.000926), v1.y
      lt r1.z, r1.z, l(0.425000)
      or r1.z, r1.z, r1.w
      if_nz r1.z
        iadd r1.z, r0.z, l(1)
        mov r0.z, r1.z
        continue 
      endif 
      mov r1.z, x0[r0.z + 0].x
      mul r1.y, r1.z, l(0.000926)
      add r2.xy, r1.xyxx, v1.xyxx
      sample_l_indexable(texture2d)(float,float,float,float) r1.w, r2.xyxx, t12.yzwx, s1, l(0.000000)
      mov r2.x, x1[r0.z + 0].x
      mad r1.w, r1.w, r2.x, r0.w
      add r1.yz, -r1.xxyx, v1.xxyx
      sample_l_indexable(texture2d)(float,float,float,float) r1.y, r1.yzyy, t12.yxzw, s1, l(0.000000)
      mad r0.w, r1.y, r2.x, r1.w
      iadd r0.z, r0.z, l(1)
    endloop 
  endif 
  mov o0.xyz, r0.wwww
else 
  mov o0.xyz, r0.xxxx
endif 
ret 
// Approximately 83 instruction slots used