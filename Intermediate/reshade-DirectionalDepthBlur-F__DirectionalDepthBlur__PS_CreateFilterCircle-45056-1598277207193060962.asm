//
// Generated by Microsoft (R) HLSL Shader Compiler 10.1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// TEXCOORD                 0   xy          1     NONE   float       
// TEXCOORD                 1     zw        1     NONE   float       
// TEXCOORD                 2   x           2     NONE   float       
// TEXCOORD                 3    y          2     NONE   float       
// TEXCOORD                 4     z         2     NONE   float       
// TEXCOORD                 5   xyzw        3     NONE   float       
// TEXCOORD                 6   xy          4     NONE   float       
// TEXCOORD                 8     zw        4     NONE   float       
// TEXCOORD                 7   xy          5     NONE   float       
// TEXCOORD                 9     z         5     NONE   float       
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
dcl_output o0.xyzw
mov o0.xyzw, l(0,0,0,0)
ret 
// Approximately 2 instruction slots used
