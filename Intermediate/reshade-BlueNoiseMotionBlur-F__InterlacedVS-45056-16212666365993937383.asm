//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_VERTEXID              0   x           0   VERTID    uint   x   
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
//
vs_5_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { -1.000000, 1.000000, 0, 0},
                              { -1.000000, -3.000000, 0, 0},
                              { 3.000000, 1.000000, 0, 0} }
dcl_input_sgv v0.x, vertex_id
dcl_output_siv o0.xyzw, position
dcl_temps 1
mov r0.x, v0.x
mov o0.xy, icb[r0.x + 0].xyxx
mov o0.zw, l(0,0,0,1.000000)
ret 
// Approximately 4 instruction slots used
