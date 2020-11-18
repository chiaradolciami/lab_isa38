/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Sat Oct 24 12:27:49 2020
/////////////////////////////////////////////////////////////


module IIR ( VIN, RSTn, CLK, DIN, A1, B1, B0, DOUT, VOUT );
  input [7:0] DIN;
  input [7:0] A1;
  input [7:0] B1;
  input [7:0] B0;
  output [7:0] DOUT;
  input VIN, RSTn, CLK;
  output VOUT;
  wire   vout1, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, y1_temp_9_, y1_temp_8_, y1_temp_15_, y1_temp_14_,
         y1_temp_13_, y1_temp_12_, y1_temp_11_, y1_temp_10_, ff_temp_15_,
         ff_temp_14_, ff_temp_13_, ff_temp_12_, ff_temp_11_, fb_temp_15_,
         fb_temp_14_, fb_temp_13_, fb_temp_12_, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, mult_156_n236, mult_156_n235, mult_156_n234, mult_156_n233,
         mult_156_n232, mult_156_n231, mult_156_n230, mult_156_n229,
         mult_156_n228, mult_156_n227, mult_156_n226, mult_156_n225,
         mult_156_n224, mult_156_n223, mult_156_n222, mult_156_n221,
         mult_156_n220, mult_156_n219, mult_156_n218, mult_156_n217,
         mult_156_n216, mult_156_n215, mult_156_n214, mult_156_n213,
         mult_156_n212, mult_156_n211, mult_156_n210, mult_156_n209,
         mult_156_n208, mult_156_n207, mult_156_n206, mult_156_n205,
         mult_156_n204, mult_156_n203, mult_156_n202, mult_156_n201,
         mult_156_n200, mult_156_n156, mult_156_n155, mult_156_n154,
         mult_156_n153, mult_156_n151, mult_156_n150, mult_156_n148,
         mult_156_n147, mult_156_n146, mult_156_n145, mult_156_n144,
         mult_156_n143, mult_156_n142, mult_156_n141, mult_156_n139,
         mult_156_n138, mult_156_n137, mult_156_n136, mult_156_n135,
         mult_156_n134, mult_156_n133, mult_156_n132, mult_156_n131,
         mult_156_n130, mult_156_n129, mult_156_n128, mult_156_n127,
         mult_156_n126, mult_156_n125, mult_156_n124, mult_156_n123,
         mult_156_n122, mult_156_n121, mult_156_n119, mult_156_n118,
         mult_156_n117, mult_156_n116, mult_156_n115, mult_156_n114,
         mult_156_n113, mult_156_n112, mult_156_n111, mult_156_n110,
         mult_156_n109, mult_156_n108, mult_156_n107, mult_156_n106,
         mult_156_n105, mult_156_n104, mult_156_n103, mult_156_n102,
         mult_156_n101, mult_156_n100, mult_156_n99, mult_156_n98,
         mult_156_n97, mult_156_n96, mult_156_n95, mult_156_n94, mult_156_n93,
         mult_156_n92, mult_156_n91, mult_156_n90, mult_156_n89, mult_156_n88,
         mult_156_n87, mult_156_n86, mult_156_n85, mult_156_n84, mult_156_n83,
         mult_156_n82, mult_156_n81, mult_156_n80, mult_156_n79, mult_156_n78,
         mult_156_n77, mult_156_n76, mult_156_n75, mult_156_n74, mult_156_n73,
         mult_156_n72, mult_156_n71, mult_156_n70, mult_156_n69, mult_156_n68,
         mult_156_n67, mult_156_n66, mult_156_n65, mult_156_n64, mult_156_n63,
         mult_156_n62, mult_156_n61, mult_156_n60, mult_156_n59, mult_156_n58,
         mult_156_n57, mult_156_n56, mult_156_n54, mult_156_n53, mult_156_n52,
         mult_156_n51, mult_156_n50, mult_156_n49, mult_156_n48, mult_156_n47,
         mult_156_n46, mult_156_n45, mult_156_n44, mult_156_n43, mult_156_n42,
         mult_156_n41, mult_156_n40, mult_156_n39, mult_156_n38, mult_156_n37,
         mult_156_n36, mult_156_n35, mult_156_n34, mult_156_n33, mult_156_n32,
         mult_156_n31, mult_156_n30, mult_156_n29, mult_156_n28, mult_156_n27,
         mult_156_n26, mult_156_n25, mult_156_n24, mult_156_n23, mult_156_n22,
         mult_156_n21, mult_156_n20, mult_156_n19, mult_156_n18, mult_156_n17,
         mult_156_n16, mult_156_n15, mult_156_n4, mult_156_n3, mult_156_n2,
         mult_156_n1, mult_166_n232, mult_166_n231, mult_166_n230,
         mult_166_n229, mult_166_n228, mult_166_n227, mult_166_n226,
         mult_166_n225, mult_166_n224, mult_166_n223, mult_166_n222,
         mult_166_n221, mult_166_n220, mult_166_n219, mult_166_n218,
         mult_166_n217, mult_166_n216, mult_166_n215, mult_166_n214,
         mult_166_n213, mult_166_n212, mult_166_n211, mult_166_n210,
         mult_166_n209, mult_166_n208, mult_166_n207, mult_166_n206,
         mult_166_n205, mult_166_n204, mult_166_n203, mult_166_n156,
         mult_166_n155, mult_166_n154, mult_166_n153, mult_166_n151,
         mult_166_n150, mult_166_n148, mult_166_n147, mult_166_n146,
         mult_166_n145, mult_166_n144, mult_166_n143, mult_166_n142,
         mult_166_n141, mult_166_n139, mult_166_n138, mult_166_n137,
         mult_166_n136, mult_166_n135, mult_166_n134, mult_166_n133,
         mult_166_n132, mult_166_n131, mult_166_n130, mult_166_n129,
         mult_166_n128, mult_166_n127, mult_166_n126, mult_166_n125,
         mult_166_n124, mult_166_n123, mult_166_n122, mult_166_n121,
         mult_166_n119, mult_166_n118, mult_166_n117, mult_166_n116,
         mult_166_n115, mult_166_n114, mult_166_n113, mult_166_n112,
         mult_166_n111, mult_166_n110, mult_166_n109, mult_166_n108,
         mult_166_n107, mult_166_n106, mult_166_n105, mult_166_n104,
         mult_166_n103, mult_166_n102, mult_166_n101, mult_166_n100,
         mult_166_n99, mult_166_n98, mult_166_n97, mult_166_n96, mult_166_n95,
         mult_166_n94, mult_166_n93, mult_166_n92, mult_166_n91, mult_166_n90,
         mult_166_n89, mult_166_n88, mult_166_n87, mult_166_n86, mult_166_n85,
         mult_166_n84, mult_166_n83, mult_166_n82, mult_166_n81, mult_166_n80,
         mult_166_n79, mult_166_n78, mult_166_n77, mult_166_n76, mult_166_n75,
         mult_166_n74, mult_166_n73, mult_166_n72, mult_166_n71, mult_166_n70,
         mult_166_n69, mult_166_n68, mult_166_n67, mult_166_n66, mult_166_n65,
         mult_166_n64, mult_166_n63, mult_166_n62, mult_166_n61, mult_166_n60,
         mult_166_n59, mult_166_n58, mult_166_n57, mult_166_n56, mult_166_n54,
         mult_166_n53, mult_166_n52, mult_166_n51, mult_166_n50, mult_166_n49,
         mult_166_n48, mult_166_n47, mult_166_n46, mult_166_n45, mult_166_n44,
         mult_166_n43, mult_166_n42, mult_166_n41, mult_166_n40, mult_166_n39,
         mult_166_n38, mult_166_n37, mult_166_n36, mult_166_n35, mult_166_n34,
         mult_166_n33, mult_166_n32, mult_166_n31, mult_166_n30, mult_166_n29,
         mult_166_n28, mult_166_n27, mult_166_n26, mult_166_n25, mult_166_n24,
         mult_166_n23, mult_166_n22, mult_166_n21, mult_166_n20, mult_166_n19,
         mult_166_n18, mult_166_n17, mult_166_n16, mult_166_n15, mult_166_n8,
         mult_166_n7, mult_166_n6, mult_166_n5, mult_166_n4, mult_166_n3,
         mult_166_n2, mult_166_n1, add_170_n2, mult_148_n236, mult_148_n235,
         mult_148_n234, mult_148_n233, mult_148_n232, mult_148_n231,
         mult_148_n230, mult_148_n229, mult_148_n228, mult_148_n227,
         mult_148_n226, mult_148_n225, mult_148_n224, mult_148_n223,
         mult_148_n222, mult_148_n221, mult_148_n220, mult_148_n219,
         mult_148_n218, mult_148_n217, mult_148_n216, mult_148_n215,
         mult_148_n214, mult_148_n213, mult_148_n212, mult_148_n211,
         mult_148_n210, mult_148_n209, mult_148_n208, mult_148_n207,
         mult_148_n206, mult_148_n205, mult_148_n204, mult_148_n203,
         mult_148_n202, mult_148_n201, mult_148_n200, mult_148_n156,
         mult_148_n155, mult_148_n154, mult_148_n153, mult_148_n151,
         mult_148_n150, mult_148_n148, mult_148_n147, mult_148_n146,
         mult_148_n145, mult_148_n144, mult_148_n143, mult_148_n142,
         mult_148_n141, mult_148_n139, mult_148_n138, mult_148_n137,
         mult_148_n136, mult_148_n135, mult_148_n134, mult_148_n133,
         mult_148_n132, mult_148_n131, mult_148_n130, mult_148_n129,
         mult_148_n128, mult_148_n127, mult_148_n126, mult_148_n125,
         mult_148_n124, mult_148_n123, mult_148_n122, mult_148_n121,
         mult_148_n119, mult_148_n118, mult_148_n117, mult_148_n116,
         mult_148_n115, mult_148_n114, mult_148_n113, mult_148_n112,
         mult_148_n111, mult_148_n110, mult_148_n109, mult_148_n108,
         mult_148_n107, mult_148_n106, mult_148_n105, mult_148_n104,
         mult_148_n103, mult_148_n102, mult_148_n101, mult_148_n100,
         mult_148_n99, mult_148_n98, mult_148_n97, mult_148_n96, mult_148_n95,
         mult_148_n94, mult_148_n93, mult_148_n92, mult_148_n91, mult_148_n90,
         mult_148_n89, mult_148_n88, mult_148_n87, mult_148_n86, mult_148_n85,
         mult_148_n84, mult_148_n83, mult_148_n82, mult_148_n81, mult_148_n80,
         mult_148_n79, mult_148_n78, mult_148_n77, mult_148_n76, mult_148_n75,
         mult_148_n74, mult_148_n73, mult_148_n72, mult_148_n71, mult_148_n70,
         mult_148_n69, mult_148_n68, mult_148_n67, mult_148_n66, mult_148_n65,
         mult_148_n64, mult_148_n63, mult_148_n62, mult_148_n61, mult_148_n60,
         mult_148_n59, mult_148_n58, mult_148_n57, mult_148_n56, mult_148_n54,
         mult_148_n53, mult_148_n52, mult_148_n51, mult_148_n50, mult_148_n49,
         mult_148_n48, mult_148_n47, mult_148_n46, mult_148_n45, mult_148_n44,
         mult_148_n43, mult_148_n42, mult_148_n41, mult_148_n40, mult_148_n39,
         mult_148_n38, mult_148_n37, mult_148_n36, mult_148_n35, mult_148_n34,
         mult_148_n33, mult_148_n32, mult_148_n31, mult_148_n30, mult_148_n29,
         mult_148_n28, mult_148_n27, mult_148_n26, mult_148_n25, mult_148_n24,
         mult_148_n23, mult_148_n22, mult_148_n21, mult_148_n20, mult_148_n19,
         mult_148_n18, mult_148_n17, mult_148_n16, mult_148_n15, mult_148_n4,
         mult_148_n3, mult_148_n2, mult_148_n1;
  wire   [8:0] x;
  wire   [6:0] a1_s;
  wire   [6:0] b1_s;
  wire   [6:0] b0_s;
  wire   [7:0] yout;
  wire   [8:0] sw;
  wire   [8:0] w;
  wire   [4:0] fb;
  wire   [8:1] add_163_carry;
  wire   [3:2] sub_150_carry;
  wire   [7:2] add_170_carry;

  DFFR_X1 vout1_reg ( .D(n76), .CK(CLK), .RN(n72), .Q(vout1) );
  DFFR_X1 VOUT_reg ( .D(vout1), .CK(CLK), .RN(n72), .Q(VOUT) );
  DFFR_X1 x_reg_8_ ( .D(n69), .CK(CLK), .RN(n72), .Q(x[8]), .QN(n31) );
  DFFR_X1 x_reg_7_ ( .D(n68), .CK(CLK), .RN(n72), .Q(x[7]), .QN(n32) );
  DFFR_X1 x_reg_6_ ( .D(n67), .CK(CLK), .RN(n72), .Q(x[6]), .QN(n33) );
  DFFR_X1 x_reg_5_ ( .D(n66), .CK(CLK), .RN(n72), .Q(x[5]), .QN(n34) );
  DFFR_X1 x_reg_4_ ( .D(n65), .CK(CLK), .RN(n72), .Q(x[4]), .QN(n35) );
  DFFR_X1 x_reg_3_ ( .D(n64), .CK(CLK), .RN(n72), .Q(x[3]), .QN(n36) );
  DFFR_X1 x_reg_2_ ( .D(n63), .CK(CLK), .RN(n72), .Q(x[2]), .QN(n37) );
  DFFR_X1 x_reg_1_ ( .D(n62), .CK(CLK), .RN(n72), .Q(x[1]), .QN(n38) );
  DFFR_X1 x_reg_0_ ( .D(n61), .CK(CLK), .RN(n72), .Q(x[0]), .QN(n39) );
  DFFR_X1 a1_s_reg_6_ ( .D(n114), .CK(CLK), .RN(n72), .Q(a1_s[6]) );
  DFFR_X1 a1_s_reg_5_ ( .D(n113), .CK(CLK), .RN(n73), .Q(a1_s[5]) );
  DFFR_X1 a1_s_reg_4_ ( .D(n112), .CK(CLK), .RN(n73), .Q(a1_s[4]) );
  DFFR_X1 a1_s_reg_3_ ( .D(n111), .CK(CLK), .RN(n73), .Q(a1_s[3]) );
  DFFR_X1 a1_s_reg_2_ ( .D(n110), .CK(CLK), .RN(n73), .Q(a1_s[2]) );
  DFFR_X1 a1_s_reg_1_ ( .D(n109), .CK(CLK), .RN(n73), .Q(a1_s[1]) );
  DFFR_X1 a1_s_reg_0_ ( .D(n108), .CK(CLK), .RN(n73), .Q(a1_s[0]) );
  DFFR_X1 b1_s_reg_6_ ( .D(n107), .CK(CLK), .RN(n73), .Q(b1_s[6]) );
  DFFR_X1 b1_s_reg_5_ ( .D(n106), .CK(CLK), .RN(n73), .Q(b1_s[5]) );
  DFFR_X1 b1_s_reg_4_ ( .D(n105), .CK(CLK), .RN(n73), .Q(b1_s[4]) );
  DFFR_X1 b1_s_reg_3_ ( .D(n104), .CK(CLK), .RN(n73), .Q(b1_s[3]) );
  DFFR_X1 b1_s_reg_2_ ( .D(n103), .CK(CLK), .RN(n73), .Q(b1_s[2]) );
  DFFR_X1 b1_s_reg_1_ ( .D(n102), .CK(CLK), .RN(n73), .Q(b1_s[1]) );
  DFFR_X1 b1_s_reg_0_ ( .D(n101), .CK(CLK), .RN(n74), .Q(b1_s[0]) );
  DFFR_X1 b0_s_reg_6_ ( .D(n100), .CK(CLK), .RN(n74), .Q(b0_s[6]) );
  DFFR_X1 b0_s_reg_5_ ( .D(n99), .CK(CLK), .RN(n74), .Q(b0_s[5]) );
  DFFR_X1 b0_s_reg_4_ ( .D(n98), .CK(CLK), .RN(n74), .Q(b0_s[4]) );
  DFFR_X1 b0_s_reg_3_ ( .D(n97), .CK(CLK), .RN(n74), .Q(b0_s[3]) );
  DFFR_X1 b0_s_reg_2_ ( .D(n96), .CK(CLK), .RN(n74), .Q(b0_s[2]) );
  DFFR_X1 b0_s_reg_1_ ( .D(n95), .CK(CLK), .RN(n74), .Q(b0_s[1]) );
  DFFR_X1 b0_s_reg_0_ ( .D(n94), .CK(CLK), .RN(n74), .Q(b0_s[0]) );
  DFFR_X1 DOUT_reg_7_ ( .D(yout[7]), .CK(CLK), .RN(n74), .Q(DOUT[7]) );
  DFFR_X1 DOUT_reg_6_ ( .D(yout[6]), .CK(CLK), .RN(n74), .Q(DOUT[6]) );
  DFFR_X1 DOUT_reg_5_ ( .D(yout[5]), .CK(CLK), .RN(n74), .Q(DOUT[5]) );
  DFFR_X1 DOUT_reg_4_ ( .D(yout[4]), .CK(CLK), .RN(n74), .Q(DOUT[4]) );
  DFFR_X1 DOUT_reg_3_ ( .D(yout[3]), .CK(CLK), .RN(n75), .Q(DOUT[3]) );
  DFFR_X1 DOUT_reg_2_ ( .D(yout[2]), .CK(CLK), .RN(n75), .Q(DOUT[2]) );
  DFFR_X1 DOUT_reg_1_ ( .D(yout[1]), .CK(CLK), .RN(n75), .Q(DOUT[1]) );
  DFFR_X1 DOUT_reg_0_ ( .D(yout[0]), .CK(CLK), .RN(n75), .Q(DOUT[0]) );
  DFFR_X1 sw_reg_8_ ( .D(w[8]), .CK(CLK), .RN(n75), .Q(sw[8]) );
  DFFR_X1 sw_reg_7_ ( .D(w[7]), .CK(CLK), .RN(n75), .Q(sw[7]) );
  DFFR_X1 sw_reg_6_ ( .D(w[6]), .CK(CLK), .RN(n75), .Q(sw[6]) );
  DFFR_X1 sw_reg_5_ ( .D(w[5]), .CK(CLK), .RN(n75), .Q(sw[5]) );
  DFFR_X1 sw_reg_4_ ( .D(w[4]), .CK(CLK), .RN(n75), .Q(sw[4]) );
  DFFR_X1 sw_reg_3_ ( .D(w[3]), .CK(CLK), .RN(n75), .Q(sw[3]) );
  DFFR_X1 sw_reg_2_ ( .D(w[2]), .CK(CLK), .RN(n75), .Q(sw[2]) );
  DFFR_X1 sw_reg_1_ ( .D(w[1]), .CK(CLK), .RN(n75), .Q(sw[1]) );
  DFFR_X1 sw_reg_0_ ( .D(w[0]), .CK(CLK), .RN(RSTn), .Q(sw[0]) );
  FA_X1 add_163_U1_1 ( .A(x[1]), .B(fb[1]), .CI(add_163_carry[1]), .CO(
        add_163_carry[2]), .S(w[1]) );
  FA_X1 add_163_U1_2 ( .A(x[2]), .B(fb[2]), .CI(add_163_carry[2]), .CO(
        add_163_carry[3]), .S(w[2]) );
  FA_X1 add_163_U1_3 ( .A(x[3]), .B(fb[3]), .CI(add_163_carry[3]), .CO(
        add_163_carry[4]), .S(w[3]) );
  FA_X1 add_163_U1_4 ( .A(x[4]), .B(fb[4]), .CI(add_163_carry[4]), .CO(
        add_163_carry[5]), .S(w[4]) );
  FA_X1 add_163_U1_5 ( .A(x[5]), .B(fb[4]), .CI(add_163_carry[5]), .CO(
        add_163_carry[6]), .S(w[5]) );
  FA_X1 add_163_U1_6 ( .A(x[6]), .B(fb[4]), .CI(add_163_carry[6]), .CO(
        add_163_carry[7]), .S(w[6]) );
  FA_X1 add_163_U1_7 ( .A(x[7]), .B(fb[4]), .CI(add_163_carry[7]), .CO(
        add_163_carry[8]), .S(w[7]) );
  FA_X1 add_163_U1_8 ( .A(x[8]), .B(fb[4]), .CI(add_163_carry[8]), .S(w[8]) );
  INV_X1 U64 ( .A(fb_temp_12_), .ZN(n91) );
  INV_X1 U65 ( .A(fb[0]), .ZN(n90) );
  INV_X1 U66 ( .A(fb_temp_13_), .ZN(n92) );
  INV_X1 U67 ( .A(n89), .ZN(n78) );
  INV_X1 U68 ( .A(n89), .ZN(n79) );
  INV_X1 U69 ( .A(n86), .ZN(n80) );
  XOR2_X1 U70 ( .A(fb_temp_15_), .B(n71), .Z(fb[4]) );
  NAND2_X1 U71 ( .A1(sub_150_carry[3]), .A2(n93), .ZN(n71) );
  INV_X1 U72 ( .A(fb_temp_14_), .ZN(n93) );
  INV_X1 U73 ( .A(n3), .ZN(n95) );
  AOI22_X1 U74 ( .A1(B0[1]), .A2(n79), .B1(b0_s[1]), .B2(n87), .ZN(n3) );
  INV_X1 U75 ( .A(n4), .ZN(n96) );
  AOI22_X1 U76 ( .A1(B0[2]), .A2(n79), .B1(b0_s[2]), .B2(n87), .ZN(n4) );
  INV_X1 U77 ( .A(n5), .ZN(n97) );
  AOI22_X1 U78 ( .A1(B0[3]), .A2(n79), .B1(b0_s[3]), .B2(n87), .ZN(n5) );
  INV_X1 U79 ( .A(n6), .ZN(n98) );
  AOI22_X1 U80 ( .A1(B0[4]), .A2(n79), .B1(b0_s[4]), .B2(n88), .ZN(n6) );
  INV_X1 U81 ( .A(n7), .ZN(n99) );
  AOI22_X1 U82 ( .A1(B0[5]), .A2(n79), .B1(b0_s[5]), .B2(n86), .ZN(n7) );
  INV_X1 U83 ( .A(n8), .ZN(n100) );
  AOI22_X1 U84 ( .A1(B0[6]), .A2(n79), .B1(b0_s[6]), .B2(n86), .ZN(n8) );
  INV_X1 U85 ( .A(n9), .ZN(n101) );
  AOI22_X1 U86 ( .A1(B1[0]), .A2(n79), .B1(b1_s[0]), .B2(n85), .ZN(n9) );
  INV_X1 U87 ( .A(n11), .ZN(n103) );
  AOI22_X1 U88 ( .A1(B1[2]), .A2(n79), .B1(b1_s[2]), .B2(n85), .ZN(n11) );
  OAI22_X1 U89 ( .A1(n80), .A2(n32), .B1(n89), .B2(n115), .ZN(n68) );
  OAI22_X1 U90 ( .A1(n80), .A2(n31), .B1(n88), .B2(n115), .ZN(n69) );
  BUF_X1 U91 ( .A(VIN), .Z(n76) );
  OAI21_X1 U92 ( .B1(n80), .B2(n39), .A(n23), .ZN(n61) );
  NAND2_X1 U93 ( .A1(DIN[0]), .A2(n79), .ZN(n23) );
  OAI21_X1 U94 ( .B1(n80), .B2(n38), .A(n24), .ZN(n62) );
  NAND2_X1 U95 ( .A1(DIN[1]), .A2(n79), .ZN(n24) );
  OAI21_X1 U96 ( .B1(n80), .B2(n37), .A(n25), .ZN(n63) );
  NAND2_X1 U97 ( .A1(DIN[2]), .A2(n79), .ZN(n25) );
  OAI21_X1 U98 ( .B1(n80), .B2(n36), .A(n26), .ZN(n64) );
  NAND2_X1 U99 ( .A1(DIN[3]), .A2(n80), .ZN(n26) );
  OAI21_X1 U100 ( .B1(n80), .B2(n35), .A(n27), .ZN(n65) );
  NAND2_X1 U101 ( .A1(DIN[4]), .A2(n80), .ZN(n27) );
  OAI21_X1 U102 ( .B1(n80), .B2(n34), .A(n28), .ZN(n66) );
  NAND2_X1 U103 ( .A1(DIN[5]), .A2(n79), .ZN(n28) );
  OAI21_X1 U104 ( .B1(n80), .B2(n33), .A(n29), .ZN(n67) );
  NAND2_X1 U105 ( .A1(DIN[6]), .A2(n80), .ZN(n29) );
  BUF_X1 U106 ( .A(VIN), .Z(n77) );
  INV_X1 U107 ( .A(DIN[7]), .ZN(n115) );
  INV_X1 U108 ( .A(n15), .ZN(n107) );
  AOI22_X1 U109 ( .A1(B1[6]), .A2(n78), .B1(b1_s[6]), .B2(n82), .ZN(n15) );
  INV_X1 U110 ( .A(n22), .ZN(n114) );
  AOI22_X1 U111 ( .A1(A1[6]), .A2(n78), .B1(a1_s[6]), .B2(n81), .ZN(n22) );
  INV_X1 U112 ( .A(n13), .ZN(n105) );
  AOI22_X1 U113 ( .A1(B1[4]), .A2(n78), .B1(b1_s[4]), .B2(n83), .ZN(n13) );
  INV_X1 U114 ( .A(n14), .ZN(n106) );
  AOI22_X1 U115 ( .A1(B1[5]), .A2(n78), .B1(b1_s[5]), .B2(n83), .ZN(n14) );
  INV_X1 U116 ( .A(n20), .ZN(n112) );
  AOI22_X1 U117 ( .A1(A1[4]), .A2(n78), .B1(a1_s[4]), .B2(n87), .ZN(n20) );
  INV_X1 U118 ( .A(n21), .ZN(n113) );
  AOI22_X1 U119 ( .A1(A1[5]), .A2(n78), .B1(a1_s[5]), .B2(n81), .ZN(n21) );
  INV_X1 U120 ( .A(n1), .ZN(n94) );
  AOI22_X1 U121 ( .A1(n80), .A2(B0[0]), .B1(b0_s[0]), .B2(n88), .ZN(n1) );
  INV_X1 U122 ( .A(n16), .ZN(n108) );
  AOI22_X1 U123 ( .A1(A1[0]), .A2(n78), .B1(a1_s[0]), .B2(n82), .ZN(n16) );
  INV_X1 U124 ( .A(n10), .ZN(n102) );
  AOI22_X1 U125 ( .A1(B1[1]), .A2(n78), .B1(b1_s[1]), .B2(n84), .ZN(n10) );
  INV_X1 U126 ( .A(n12), .ZN(n104) );
  AOI22_X1 U127 ( .A1(B1[3]), .A2(n78), .B1(b1_s[3]), .B2(n84), .ZN(n12) );
  INV_X1 U128 ( .A(n17), .ZN(n109) );
  AOI22_X1 U129 ( .A1(A1[1]), .A2(n78), .B1(a1_s[1]), .B2(n87), .ZN(n17) );
  INV_X1 U130 ( .A(n18), .ZN(n110) );
  AOI22_X1 U131 ( .A1(A1[2]), .A2(n78), .B1(a1_s[2]), .B2(n88), .ZN(n18) );
  INV_X1 U132 ( .A(n19), .ZN(n111) );
  AOI22_X1 U133 ( .A1(A1[3]), .A2(n78), .B1(a1_s[3]), .B2(n88), .ZN(n19) );
  CLKBUF_X1 U134 ( .A(RSTn), .Z(n72) );
  CLKBUF_X1 U135 ( .A(RSTn), .Z(n73) );
  CLKBUF_X1 U136 ( .A(RSTn), .Z(n74) );
  CLKBUF_X1 U137 ( .A(RSTn), .Z(n75) );
  INV_X1 U138 ( .A(n76), .ZN(n81) );
  INV_X1 U139 ( .A(n76), .ZN(n82) );
  INV_X1 U140 ( .A(n76), .ZN(n83) );
  INV_X1 U141 ( .A(n76), .ZN(n84) );
  INV_X1 U142 ( .A(n76), .ZN(n85) );
  INV_X1 U143 ( .A(n77), .ZN(n86) );
  INV_X1 U144 ( .A(n77), .ZN(n87) );
  INV_X1 U145 ( .A(n77), .ZN(n88) );
  INV_X1 U146 ( .A(n77), .ZN(n89) );
  AND2_X1 U147 ( .A1(fb[0]), .A2(x[0]), .ZN(add_163_carry[1]) );
  XOR2_X1 U148 ( .A(fb[0]), .B(x[0]), .Z(w[0]) );
  XOR2_X1 U149 ( .A(n93), .B(sub_150_carry[3]), .Z(fb[3]) );
  AND2_X1 U150 ( .A1(sub_150_carry[2]), .A2(n92), .ZN(sub_150_carry[3]) );
  XOR2_X1 U151 ( .A(n92), .B(sub_150_carry[2]), .Z(fb[2]) );
  AND2_X1 U152 ( .A1(n90), .A2(n91), .ZN(sub_150_carry[2]) );
  XOR2_X1 U153 ( .A(n91), .B(n90), .Z(fb[1]) );
  NAND2_X1 mult_156_U234 ( .A1(sw[5]), .A2(b1_s[6]), .ZN(mult_156_n100) );
  NAND2_X1 mult_156_U233 ( .A1(sw[4]), .A2(b1_s[6]), .ZN(mult_156_n101) );
  NAND2_X1 mult_156_U232 ( .A1(sw[3]), .A2(b1_s[6]), .ZN(mult_156_n102) );
  NAND2_X1 mult_156_U231 ( .A1(sw[2]), .A2(b1_s[6]), .ZN(mult_156_n103) );
  NAND2_X1 mult_156_U230 ( .A1(sw[1]), .A2(b1_s[6]), .ZN(mult_156_n104) );
  NAND2_X1 mult_156_U229 ( .A1(sw[0]), .A2(b1_s[6]), .ZN(mult_156_n105) );
  NAND2_X1 mult_156_U228 ( .A1(b1_s[5]), .A2(sw[8]), .ZN(mult_156_n106) );
  NOR2_X1 mult_156_U227 ( .A1(mult_156_n216), .A2(mult_156_n207), .ZN(
        mult_156_n107) );
  NOR2_X1 mult_156_U226 ( .A1(mult_156_n217), .A2(mult_156_n207), .ZN(
        mult_156_n108) );
  NOR2_X1 mult_156_U225 ( .A1(mult_156_n207), .A2(mult_156_n218), .ZN(
        mult_156_n109) );
  NOR2_X1 mult_156_U224 ( .A1(mult_156_n207), .A2(mult_156_n219), .ZN(
        mult_156_n110) );
  NOR2_X1 mult_156_U223 ( .A1(mult_156_n221), .A2(mult_156_n207), .ZN(
        mult_156_n111) );
  NOR2_X1 mult_156_U222 ( .A1(mult_156_n207), .A2(mult_156_n222), .ZN(
        mult_156_n112) );
  NOR2_X1 mult_156_U221 ( .A1(mult_156_n207), .A2(mult_156_n223), .ZN(
        mult_156_n113) );
  NAND2_X1 mult_156_U220 ( .A1(b1_s[4]), .A2(sw[8]), .ZN(mult_156_n114) );
  NOR2_X1 mult_156_U219 ( .A1(mult_156_n216), .A2(mult_156_n209), .ZN(
        mult_156_n115) );
  NOR2_X1 mult_156_U218 ( .A1(mult_156_n217), .A2(mult_156_n209), .ZN(
        mult_156_n116) );
  NOR2_X1 mult_156_U217 ( .A1(mult_156_n209), .A2(mult_156_n218), .ZN(
        mult_156_n117) );
  NOR2_X1 mult_156_U216 ( .A1(mult_156_n209), .A2(mult_156_n219), .ZN(
        mult_156_n118) );
  NOR2_X1 mult_156_U215 ( .A1(mult_156_n209), .A2(mult_156_n220), .ZN(
        mult_156_n119) );
  NOR2_X1 mult_156_U214 ( .A1(mult_156_n209), .A2(mult_156_n222), .ZN(
        mult_156_n121) );
  NOR2_X1 mult_156_U213 ( .A1(mult_156_n209), .A2(mult_156_n223), .ZN(
        mult_156_n122) );
  NAND2_X1 mult_156_U212 ( .A1(b1_s[3]), .A2(sw[8]), .ZN(mult_156_n123) );
  NOR2_X1 mult_156_U211 ( .A1(mult_156_n216), .A2(mult_156_n211), .ZN(
        mult_156_n124) );
  NOR2_X1 mult_156_U210 ( .A1(mult_156_n217), .A2(mult_156_n211), .ZN(
        mult_156_n125) );
  NOR2_X1 mult_156_U209 ( .A1(mult_156_n218), .A2(mult_156_n211), .ZN(
        mult_156_n126) );
  NOR2_X1 mult_156_U208 ( .A1(mult_156_n219), .A2(mult_156_n211), .ZN(
        mult_156_n127) );
  NOR2_X1 mult_156_U207 ( .A1(mult_156_n220), .A2(mult_156_n211), .ZN(
        mult_156_n128) );
  NOR2_X1 mult_156_U206 ( .A1(mult_156_n221), .A2(mult_156_n211), .ZN(
        mult_156_n129) );
  NOR2_X1 mult_156_U205 ( .A1(mult_156_n222), .A2(mult_156_n211), .ZN(
        mult_156_n130) );
  NOR2_X1 mult_156_U204 ( .A1(mult_156_n223), .A2(mult_156_n211), .ZN(
        mult_156_n131) );
  NAND2_X1 mult_156_U203 ( .A1(b1_s[2]), .A2(sw[8]), .ZN(mult_156_n132) );
  NOR2_X1 mult_156_U202 ( .A1(mult_156_n216), .A2(mult_156_n212), .ZN(
        mult_156_n133) );
  NOR2_X1 mult_156_U201 ( .A1(mult_156_n217), .A2(mult_156_n212), .ZN(
        mult_156_n134) );
  NOR2_X1 mult_156_U200 ( .A1(mult_156_n212), .A2(mult_156_n218), .ZN(
        mult_156_n135) );
  NOR2_X1 mult_156_U199 ( .A1(mult_156_n212), .A2(mult_156_n219), .ZN(
        mult_156_n136) );
  NOR2_X1 mult_156_U198 ( .A1(mult_156_n220), .A2(mult_156_n212), .ZN(
        mult_156_n137) );
  NOR2_X1 mult_156_U197 ( .A1(mult_156_n221), .A2(mult_156_n212), .ZN(
        mult_156_n138) );
  NOR2_X1 mult_156_U196 ( .A1(mult_156_n212), .A2(mult_156_n222), .ZN(
        mult_156_n139) );
  NAND2_X1 mult_156_U195 ( .A1(b1_s[1]), .A2(sw[8]), .ZN(mult_156_n141) );
  NOR2_X1 mult_156_U194 ( .A1(mult_156_n216), .A2(mult_156_n214), .ZN(
        mult_156_n142) );
  NOR2_X1 mult_156_U193 ( .A1(mult_156_n217), .A2(mult_156_n214), .ZN(
        mult_156_n143) );
  NOR2_X1 mult_156_U192 ( .A1(mult_156_n214), .A2(mult_156_n218), .ZN(
        mult_156_n144) );
  NOR2_X1 mult_156_U191 ( .A1(mult_156_n214), .A2(mult_156_n219), .ZN(
        mult_156_n145) );
  NOR2_X1 mult_156_U190 ( .A1(mult_156_n220), .A2(mult_156_n214), .ZN(
        mult_156_n146) );
  NOR2_X1 mult_156_U189 ( .A1(mult_156_n221), .A2(mult_156_n214), .ZN(
        mult_156_n147) );
  NOR2_X1 mult_156_U188 ( .A1(mult_156_n214), .A2(mult_156_n222), .ZN(
        mult_156_n148) );
  NAND2_X1 mult_156_U187 ( .A1(b1_s[0]), .A2(sw[8]), .ZN(mult_156_n150) );
  NOR2_X1 mult_156_U186 ( .A1(mult_156_n216), .A2(mult_156_n215), .ZN(
        mult_156_n151) );
  NOR2_X1 mult_156_U185 ( .A1(mult_156_n215), .A2(mult_156_n218), .ZN(
        mult_156_n153) );
  NOR2_X1 mult_156_U184 ( .A1(mult_156_n215), .A2(mult_156_n219), .ZN(
        mult_156_n154) );
  NOR2_X1 mult_156_U183 ( .A1(mult_156_n215), .A2(mult_156_n220), .ZN(
        mult_156_n155) );
  NOR2_X1 mult_156_U182 ( .A1(mult_156_n215), .A2(mult_156_n221), .ZN(
        mult_156_n156) );
  NOR4_X1 mult_156_U181 ( .A1(mult_156_n222), .A2(mult_156_n214), .A3(
        mult_156_n223), .A4(mult_156_n215), .ZN(mult_156_n235) );
  NOR2_X1 mult_156_U180 ( .A1(mult_156_n223), .A2(mult_156_n212), .ZN(
        mult_156_n236) );
  AOI222_X1 mult_156_U179 ( .A1(mult_156_n96), .A2(mult_156_n235), .B1(
        mult_156_n236), .B2(mult_156_n96), .C1(mult_156_n236), .C2(
        mult_156_n235), .ZN(mult_156_n234) );
  OAI222_X1 mult_156_U178 ( .A1(mult_156_n234), .A2(mult_156_n213), .B1(
        mult_156_n213), .B2(mult_156_n210), .C1(mult_156_n234), .C2(
        mult_156_n210), .ZN(mult_156_n233) );
  AOI222_X1 mult_156_U177 ( .A1(mult_156_n233), .A2(mult_156_n86), .B1(
        mult_156_n233), .B2(mult_156_n88), .C1(mult_156_n88), .C2(mult_156_n86), .ZN(mult_156_n232) );
  OAI222_X1 mult_156_U176 ( .A1(mult_156_n232), .A2(mult_156_n206), .B1(
        mult_156_n232), .B2(mult_156_n208), .C1(mult_156_n208), .C2(
        mult_156_n206), .ZN(mult_156_n231) );
  AOI222_X1 mult_156_U175 ( .A1(mult_156_n231), .A2(mult_156_n68), .B1(
        mult_156_n231), .B2(mult_156_n77), .C1(mult_156_n77), .C2(mult_156_n68), .ZN(mult_156_n230) );
  OAI222_X1 mult_156_U174 ( .A1(mult_156_n230), .A2(mult_156_n203), .B1(
        mult_156_n230), .B2(mult_156_n204), .C1(mult_156_n204), .C2(
        mult_156_n203), .ZN(mult_156_n229) );
  AOI222_X1 mult_156_U173 ( .A1(mult_156_n229), .A2(mult_156_n46), .B1(
        mult_156_n229), .B2(mult_156_n57), .C1(mult_156_n57), .C2(mult_156_n46), .ZN(mult_156_n228) );
  AOI222_X1 mult_156_U172 ( .A1(mult_156_n202), .A2(mult_156_n36), .B1(
        mult_156_n202), .B2(mult_156_n45), .C1(mult_156_n45), .C2(mult_156_n36), .ZN(mult_156_n227) );
  AOI222_X1 mult_156_U171 ( .A1(mult_156_n201), .A2(mult_156_n28), .B1(
        mult_156_n201), .B2(mult_156_n35), .C1(mult_156_n35), .C2(mult_156_n28), .ZN(mult_156_n226) );
  NAND2_X1 mult_156_U170 ( .A1(sw[3]), .A2(b1_s[5]), .ZN(mult_156_n56) );
  NAND2_X1 mult_156_U169 ( .A1(b1_s[0]), .A2(sw[6]), .ZN(mult_156_n224) );
  NAND2_X1 mult_156_U168 ( .A1(sw[2]), .A2(b1_s[4]), .ZN(mult_156_n225) );
  NAND2_X1 mult_156_U167 ( .A1(mult_156_n224), .A2(mult_156_n225), .ZN(
        mult_156_n75) );
  XNOR2_X1 mult_156_U166 ( .A(mult_156_n224), .B(mult_156_n225), .ZN(
        mult_156_n76) );
  AND2_X1 mult_156_U165 ( .A1(b1_s[6]), .A2(sw[8]), .ZN(mult_156_n97) );
  NAND2_X1 mult_156_U164 ( .A1(sw[7]), .A2(b1_s[6]), .ZN(mult_156_n98) );
  NAND2_X1 mult_156_U163 ( .A1(sw[6]), .A2(b1_s[6]), .ZN(mult_156_n99) );
  INV_X1 mult_156_U162 ( .A(sw[0]), .ZN(mult_156_n223) );
  INV_X1 mult_156_U161 ( .A(sw[3]), .ZN(mult_156_n220) );
  INV_X1 mult_156_U160 ( .A(sw[2]), .ZN(mult_156_n221) );
  INV_X1 mult_156_U159 ( .A(sw[6]), .ZN(mult_156_n217) );
  INV_X1 mult_156_U158 ( .A(sw[4]), .ZN(mult_156_n219) );
  INV_X1 mult_156_U157 ( .A(sw[5]), .ZN(mult_156_n218) );
  INV_X1 mult_156_U156 ( .A(sw[1]), .ZN(mult_156_n222) );
  INV_X1 mult_156_U155 ( .A(b1_s[0]), .ZN(mult_156_n215) );
  INV_X1 mult_156_U154 ( .A(sw[7]), .ZN(mult_156_n216) );
  INV_X1 mult_156_U153 ( .A(b1_s[5]), .ZN(mult_156_n207) );
  INV_X1 mult_156_U152 ( .A(b1_s[4]), .ZN(mult_156_n209) );
  INV_X1 mult_156_U151 ( .A(b1_s[3]), .ZN(mult_156_n211) );
  INV_X1 mult_156_U150 ( .A(b1_s[2]), .ZN(mult_156_n212) );
  INV_X1 mult_156_U149 ( .A(b1_s[1]), .ZN(mult_156_n214) );
  INV_X1 mult_156_U148 ( .A(mult_156_n56), .ZN(mult_156_n205) );
  INV_X1 mult_156_U147 ( .A(mult_156_n226), .ZN(mult_156_n200) );
  INV_X1 mult_156_U146 ( .A(mult_156_n1), .ZN(ff_temp_15_) );
  INV_X1 mult_156_U145 ( .A(mult_156_n92), .ZN(mult_156_n213) );
  INV_X1 mult_156_U144 ( .A(mult_156_n94), .ZN(mult_156_n210) );
  INV_X1 mult_156_U143 ( .A(mult_156_n228), .ZN(mult_156_n202) );
  INV_X1 mult_156_U142 ( .A(mult_156_n227), .ZN(mult_156_n201) );
  INV_X1 mult_156_U141 ( .A(mult_156_n58), .ZN(mult_156_n203) );
  INV_X1 mult_156_U140 ( .A(mult_156_n67), .ZN(mult_156_n204) );
  INV_X1 mult_156_U139 ( .A(mult_156_n78), .ZN(mult_156_n206) );
  INV_X1 mult_156_U138 ( .A(mult_156_n85), .ZN(mult_156_n208) );
  HA_X1 mult_156_U57 ( .A(mult_156_n148), .B(mult_156_n156), .CO(mult_156_n95), 
        .S(mult_156_n96) );
  HA_X1 mult_156_U56 ( .A(mult_156_n131), .B(mult_156_n139), .CO(mult_156_n93), 
        .S(mult_156_n94) );
  FA_X1 mult_156_U55 ( .A(mult_156_n147), .B(mult_156_n155), .CI(mult_156_n95), 
        .CO(mult_156_n91), .S(mult_156_n92) );
  HA_X1 mult_156_U54 ( .A(mult_156_n122), .B(mult_156_n130), .CO(mult_156_n89), 
        .S(mult_156_n90) );
  FA_X1 mult_156_U53 ( .A(mult_156_n138), .B(mult_156_n154), .CI(mult_156_n146), .CO(mult_156_n87), .S(mult_156_n88) );
  FA_X1 mult_156_U52 ( .A(mult_156_n90), .B(mult_156_n93), .CI(mult_156_n91), 
        .CO(mult_156_n85), .S(mult_156_n86) );
  HA_X1 mult_156_U51 ( .A(mult_156_n113), .B(mult_156_n121), .CO(mult_156_n83), 
        .S(mult_156_n84) );
  FA_X1 mult_156_U50 ( .A(mult_156_n129), .B(mult_156_n153), .CI(mult_156_n137), .CO(mult_156_n81), .S(mult_156_n82) );
  FA_X1 mult_156_U49 ( .A(mult_156_n89), .B(mult_156_n145), .CI(mult_156_n84), 
        .CO(mult_156_n79), .S(mult_156_n80) );
  FA_X1 mult_156_U48 ( .A(mult_156_n82), .B(mult_156_n87), .CI(mult_156_n80), 
        .CO(mult_156_n77), .S(mult_156_n78) );
  FA_X1 mult_156_U45 ( .A(mult_156_n112), .B(mult_156_n144), .CI(mult_156_n128), .CO(mult_156_n73), .S(mult_156_n74) );
  FA_X1 mult_156_U44 ( .A(mult_156_n105), .B(mult_156_n136), .CI(mult_156_n83), 
        .CO(mult_156_n71), .S(mult_156_n72) );
  FA_X1 mult_156_U43 ( .A(mult_156_n81), .B(mult_156_n76), .CI(mult_156_n74), 
        .CO(mult_156_n69), .S(mult_156_n70) );
  FA_X1 mult_156_U42 ( .A(mult_156_n72), .B(mult_156_n79), .CI(mult_156_n70), 
        .CO(mult_156_n67), .S(mult_156_n68) );
  FA_X1 mult_156_U41 ( .A(mult_156_n111), .B(mult_156_n151), .CI(mult_156_n119), .CO(mult_156_n65), .S(mult_156_n66) );
  FA_X1 mult_156_U40 ( .A(mult_156_n127), .B(mult_156_n143), .CI(mult_156_n135), .CO(mult_156_n63), .S(mult_156_n64) );
  FA_X1 mult_156_U39 ( .A(mult_156_n75), .B(mult_156_n104), .CI(mult_156_n73), 
        .CO(mult_156_n61), .S(mult_156_n62) );
  FA_X1 mult_156_U38 ( .A(mult_156_n64), .B(mult_156_n71), .CI(mult_156_n66), 
        .CO(mult_156_n59), .S(mult_156_n60) );
  FA_X1 mult_156_U37 ( .A(mult_156_n62), .B(mult_156_n69), .CI(mult_156_n60), 
        .CO(mult_156_n57), .S(mult_156_n58) );
  FA_X1 mult_156_U35 ( .A(mult_156_n118), .B(mult_156_n126), .CI(mult_156_n142), .CO(mult_156_n53), .S(mult_156_n54) );
  FA_X1 mult_156_U34 ( .A(mult_156_n150), .B(mult_156_n134), .CI(mult_156_n103), .CO(mult_156_n51), .S(mult_156_n52) );
  FA_X1 mult_156_U33 ( .A(mult_156_n65), .B(mult_156_n56), .CI(mult_156_n63), 
        .CO(mult_156_n49), .S(mult_156_n50) );
  FA_X1 mult_156_U32 ( .A(mult_156_n52), .B(mult_156_n54), .CI(mult_156_n61), 
        .CO(mult_156_n47), .S(mult_156_n48) );
  FA_X1 mult_156_U31 ( .A(mult_156_n59), .B(mult_156_n50), .CI(mult_156_n48), 
        .CO(mult_156_n45), .S(mult_156_n46) );
  FA_X1 mult_156_U30 ( .A(mult_156_n117), .B(mult_156_n205), .CI(mult_156_n110), .CO(mult_156_n43), .S(mult_156_n44) );
  FA_X1 mult_156_U29 ( .A(mult_156_n133), .B(mult_156_n125), .CI(mult_156_n141), .CO(mult_156_n41), .S(mult_156_n42) );
  FA_X1 mult_156_U28 ( .A(mult_156_n53), .B(mult_156_n102), .CI(mult_156_n51), 
        .CO(mult_156_n39), .S(mult_156_n40) );
  FA_X1 mult_156_U27 ( .A(mult_156_n42), .B(mult_156_n44), .CI(mult_156_n49), 
        .CO(mult_156_n37), .S(mult_156_n38) );
  FA_X1 mult_156_U26 ( .A(mult_156_n47), .B(mult_156_n40), .CI(mult_156_n38), 
        .CO(mult_156_n35), .S(mult_156_n36) );
  FA_X1 mult_156_U25 ( .A(mult_156_n109), .B(mult_156_n116), .CI(mult_156_n124), .CO(mult_156_n33), .S(mult_156_n34) );
  FA_X1 mult_156_U24 ( .A(mult_156_n101), .B(mult_156_n132), .CI(mult_156_n43), 
        .CO(mult_156_n31), .S(mult_156_n32) );
  FA_X1 mult_156_U23 ( .A(mult_156_n34), .B(mult_156_n41), .CI(mult_156_n39), 
        .CO(mult_156_n29), .S(mult_156_n30) );
  FA_X1 mult_156_U22 ( .A(mult_156_n37), .B(mult_156_n32), .CI(mult_156_n30), 
        .CO(mult_156_n27), .S(mult_156_n28) );
  FA_X1 mult_156_U21 ( .A(mult_156_n108), .B(mult_156_n115), .CI(mult_156_n123), .CO(mult_156_n25), .S(mult_156_n26) );
  FA_X1 mult_156_U20 ( .A(mult_156_n33), .B(mult_156_n100), .CI(mult_156_n26), 
        .CO(mult_156_n23), .S(mult_156_n24) );
  FA_X1 mult_156_U19 ( .A(mult_156_n29), .B(mult_156_n31), .CI(mult_156_n24), 
        .CO(mult_156_n21), .S(mult_156_n22) );
  FA_X1 mult_156_U18 ( .A(mult_156_n114), .B(mult_156_n107), .CI(mult_156_n99), 
        .CO(mult_156_n19), .S(mult_156_n20) );
  FA_X1 mult_156_U17 ( .A(mult_156_n20), .B(mult_156_n25), .CI(mult_156_n23), 
        .CO(mult_156_n17), .S(mult_156_n18) );
  FA_X1 mult_156_U16 ( .A(mult_156_n98), .B(mult_156_n106), .CI(mult_156_n19), 
        .CO(mult_156_n15), .S(mult_156_n16) );
  FA_X1 mult_156_U5 ( .A(mult_156_n22), .B(mult_156_n27), .CI(mult_156_n200), 
        .CO(mult_156_n4), .S(ff_temp_11_) );
  FA_X1 mult_156_U4 ( .A(mult_156_n21), .B(mult_156_n18), .CI(mult_156_n4), 
        .CO(mult_156_n3), .S(ff_temp_12_) );
  FA_X1 mult_156_U3 ( .A(mult_156_n17), .B(mult_156_n16), .CI(mult_156_n3), 
        .CO(mult_156_n2), .S(ff_temp_13_) );
  FA_X1 mult_156_U2 ( .A(mult_156_n15), .B(mult_156_n97), .CI(mult_156_n2), 
        .CO(mult_156_n1), .S(ff_temp_14_) );
  NAND2_X1 mult_166_U228 ( .A1(w[5]), .A2(b0_s[6]), .ZN(mult_166_n100) );
  NAND2_X1 mult_166_U227 ( .A1(w[4]), .A2(b0_s[6]), .ZN(mult_166_n101) );
  NAND2_X1 mult_166_U226 ( .A1(w[3]), .A2(b0_s[6]), .ZN(mult_166_n102) );
  NAND2_X1 mult_166_U225 ( .A1(w[2]), .A2(b0_s[6]), .ZN(mult_166_n103) );
  NAND2_X1 mult_166_U224 ( .A1(w[1]), .A2(b0_s[6]), .ZN(mult_166_n104) );
  NAND2_X1 mult_166_U223 ( .A1(w[0]), .A2(b0_s[6]), .ZN(mult_166_n105) );
  NAND2_X1 mult_166_U222 ( .A1(b0_s[5]), .A2(w[8]), .ZN(mult_166_n106) );
  NOR2_X1 mult_166_U221 ( .A1(mult_166_n204), .A2(mult_166_n218), .ZN(
        mult_166_n107) );
  NOR2_X1 mult_166_U220 ( .A1(mult_166_n206), .A2(mult_166_n218), .ZN(
        mult_166_n108) );
  NOR2_X1 mult_166_U219 ( .A1(mult_166_n218), .A2(mult_166_n208), .ZN(
        mult_166_n109) );
  NOR2_X1 mult_166_U218 ( .A1(mult_166_n218), .A2(mult_166_n209), .ZN(
        mult_166_n110) );
  NOR2_X1 mult_166_U217 ( .A1(mult_166_n214), .A2(mult_166_n218), .ZN(
        mult_166_n111) );
  NOR2_X1 mult_166_U216 ( .A1(mult_166_n216), .A2(mult_166_n218), .ZN(
        mult_166_n112) );
  NOR2_X1 mult_166_U215 ( .A1(mult_166_n217), .A2(mult_166_n218), .ZN(
        mult_166_n113) );
  NAND2_X1 mult_166_U214 ( .A1(b0_s[4]), .A2(w[8]), .ZN(mult_166_n114) );
  NOR2_X1 mult_166_U213 ( .A1(mult_166_n204), .A2(mult_166_n219), .ZN(
        mult_166_n115) );
  NOR2_X1 mult_166_U212 ( .A1(mult_166_n206), .A2(mult_166_n219), .ZN(
        mult_166_n116) );
  NOR2_X1 mult_166_U211 ( .A1(mult_166_n219), .A2(mult_166_n208), .ZN(
        mult_166_n117) );
  NOR2_X1 mult_166_U210 ( .A1(mult_166_n219), .A2(mult_166_n209), .ZN(
        mult_166_n118) );
  NOR2_X1 mult_166_U209 ( .A1(mult_166_n219), .A2(mult_166_n213), .ZN(
        mult_166_n119) );
  NOR2_X1 mult_166_U208 ( .A1(mult_166_n216), .A2(mult_166_n219), .ZN(
        mult_166_n121) );
  NOR2_X1 mult_166_U207 ( .A1(mult_166_n217), .A2(mult_166_n219), .ZN(
        mult_166_n122) );
  NAND2_X1 mult_166_U206 ( .A1(b0_s[3]), .A2(w[8]), .ZN(mult_166_n123) );
  NOR2_X1 mult_166_U205 ( .A1(mult_166_n204), .A2(mult_166_n220), .ZN(
        mult_166_n124) );
  NOR2_X1 mult_166_U204 ( .A1(mult_166_n206), .A2(mult_166_n220), .ZN(
        mult_166_n125) );
  NOR2_X1 mult_166_U203 ( .A1(mult_166_n208), .A2(mult_166_n220), .ZN(
        mult_166_n126) );
  NOR2_X1 mult_166_U202 ( .A1(mult_166_n209), .A2(mult_166_n220), .ZN(
        mult_166_n127) );
  NOR2_X1 mult_166_U201 ( .A1(mult_166_n213), .A2(mult_166_n220), .ZN(
        mult_166_n128) );
  NOR2_X1 mult_166_U200 ( .A1(mult_166_n214), .A2(mult_166_n220), .ZN(
        mult_166_n129) );
  NOR2_X1 mult_166_U199 ( .A1(mult_166_n216), .A2(mult_166_n220), .ZN(
        mult_166_n130) );
  NOR2_X1 mult_166_U198 ( .A1(mult_166_n217), .A2(mult_166_n220), .ZN(
        mult_166_n131) );
  NAND2_X1 mult_166_U197 ( .A1(b0_s[2]), .A2(w[8]), .ZN(mult_166_n132) );
  NOR2_X1 mult_166_U196 ( .A1(mult_166_n204), .A2(mult_166_n221), .ZN(
        mult_166_n133) );
  NOR2_X1 mult_166_U195 ( .A1(mult_166_n206), .A2(mult_166_n221), .ZN(
        mult_166_n134) );
  NOR2_X1 mult_166_U194 ( .A1(mult_166_n221), .A2(mult_166_n208), .ZN(
        mult_166_n135) );
  NOR2_X1 mult_166_U193 ( .A1(mult_166_n221), .A2(mult_166_n209), .ZN(
        mult_166_n136) );
  NOR2_X1 mult_166_U192 ( .A1(mult_166_n221), .A2(mult_166_n213), .ZN(
        mult_166_n137) );
  NOR2_X1 mult_166_U191 ( .A1(mult_166_n221), .A2(mult_166_n214), .ZN(
        mult_166_n138) );
  NOR2_X1 mult_166_U190 ( .A1(mult_166_n221), .A2(mult_166_n216), .ZN(
        mult_166_n139) );
  NAND2_X1 mult_166_U189 ( .A1(b0_s[1]), .A2(w[8]), .ZN(mult_166_n141) );
  NOR2_X1 mult_166_U188 ( .A1(mult_166_n204), .A2(mult_166_n222), .ZN(
        mult_166_n142) );
  NOR2_X1 mult_166_U187 ( .A1(mult_166_n206), .A2(mult_166_n222), .ZN(
        mult_166_n143) );
  NOR2_X1 mult_166_U186 ( .A1(mult_166_n222), .A2(mult_166_n208), .ZN(
        mult_166_n144) );
  NOR2_X1 mult_166_U185 ( .A1(mult_166_n222), .A2(mult_166_n209), .ZN(
        mult_166_n145) );
  NOR2_X1 mult_166_U184 ( .A1(mult_166_n222), .A2(mult_166_n213), .ZN(
        mult_166_n146) );
  NOR2_X1 mult_166_U183 ( .A1(mult_166_n222), .A2(mult_166_n214), .ZN(
        mult_166_n147) );
  NOR2_X1 mult_166_U182 ( .A1(mult_166_n216), .A2(mult_166_n222), .ZN(
        mult_166_n148) );
  NAND2_X1 mult_166_U181 ( .A1(b0_s[0]), .A2(w[8]), .ZN(mult_166_n150) );
  NOR2_X1 mult_166_U180 ( .A1(mult_166_n204), .A2(mult_166_n223), .ZN(
        mult_166_n151) );
  NOR2_X1 mult_166_U179 ( .A1(mult_166_n223), .A2(mult_166_n208), .ZN(
        mult_166_n153) );
  NOR2_X1 mult_166_U178 ( .A1(mult_166_n223), .A2(mult_166_n209), .ZN(
        mult_166_n154) );
  NOR2_X1 mult_166_U177 ( .A1(mult_166_n223), .A2(mult_166_n213), .ZN(
        mult_166_n155) );
  NOR2_X1 mult_166_U176 ( .A1(mult_166_n223), .A2(mult_166_n214), .ZN(
        mult_166_n156) );
  NAND2_X1 mult_166_U175 ( .A1(b0_s[5]), .A2(w[3]), .ZN(mult_166_n56) );
  NAND2_X1 mult_166_U174 ( .A1(b0_s[0]), .A2(w[6]), .ZN(mult_166_n232) );
  NAND2_X1 mult_166_U173 ( .A1(b0_s[4]), .A2(w[2]), .ZN(mult_166_n231) );
  NAND2_X1 mult_166_U172 ( .A1(mult_166_n232), .A2(mult_166_n231), .ZN(
        mult_166_n75) );
  XNOR2_X1 mult_166_U171 ( .A(mult_166_n231), .B(mult_166_n232), .ZN(
        mult_166_n76) );
  NOR4_X1 mult_166_U170 ( .A1(mult_166_n222), .A2(mult_166_n223), .A3(
        mult_166_n216), .A4(mult_166_n217), .ZN(mult_166_n229) );
  NOR2_X1 mult_166_U169 ( .A1(mult_166_n221), .A2(mult_166_n217), .ZN(
        mult_166_n230) );
  AOI222_X1 mult_166_U168 ( .A1(mult_166_n96), .A2(mult_166_n229), .B1(
        mult_166_n230), .B2(mult_166_n96), .C1(mult_166_n230), .C2(
        mult_166_n229), .ZN(mult_166_n228) );
  OAI222_X1 mult_166_U167 ( .A1(mult_166_n228), .A2(mult_166_n212), .B1(
        mult_166_n212), .B2(mult_166_n215), .C1(mult_166_n228), .C2(
        mult_166_n215), .ZN(mult_166_n227) );
  AOI222_X1 mult_166_U166 ( .A1(mult_166_n227), .A2(mult_166_n86), .B1(
        mult_166_n227), .B2(mult_166_n88), .C1(mult_166_n88), .C2(mult_166_n86), .ZN(mult_166_n226) );
  OAI222_X1 mult_166_U165 ( .A1(mult_166_n226), .A2(mult_166_n207), .B1(
        mult_166_n226), .B2(mult_166_n211), .C1(mult_166_n211), .C2(
        mult_166_n207), .ZN(mult_166_n225) );
  AOI222_X1 mult_166_U164 ( .A1(mult_166_n225), .A2(mult_166_n68), .B1(
        mult_166_n225), .B2(mult_166_n77), .C1(mult_166_n77), .C2(mult_166_n68), .ZN(mult_166_n224) );
  OAI222_X1 mult_166_U163 ( .A1(mult_166_n224), .A2(mult_166_n203), .B1(
        mult_166_n224), .B2(mult_166_n205), .C1(mult_166_n205), .C2(
        mult_166_n203), .ZN(mult_166_n8) );
  AND2_X1 mult_166_U162 ( .A1(b0_s[6]), .A2(w[8]), .ZN(mult_166_n97) );
  NAND2_X1 mult_166_U161 ( .A1(w[7]), .A2(b0_s[6]), .ZN(mult_166_n98) );
  NAND2_X1 mult_166_U160 ( .A1(b0_s[6]), .A2(w[6]), .ZN(mult_166_n99) );
  INV_X1 mult_166_U159 ( .A(b0_s[0]), .ZN(mult_166_n223) );
  INV_X1 mult_166_U158 ( .A(b0_s[5]), .ZN(mult_166_n218) );
  INV_X1 mult_166_U157 ( .A(b0_s[4]), .ZN(mult_166_n219) );
  INV_X1 mult_166_U156 ( .A(b0_s[3]), .ZN(mult_166_n220) );
  INV_X1 mult_166_U155 ( .A(b0_s[1]), .ZN(mult_166_n222) );
  INV_X1 mult_166_U154 ( .A(b0_s[2]), .ZN(mult_166_n221) );
  INV_X1 mult_166_U153 ( .A(mult_166_n1), .ZN(y1_temp_15_) );
  INV_X1 mult_166_U152 ( .A(w[0]), .ZN(mult_166_n217) );
  INV_X1 mult_166_U151 ( .A(w[3]), .ZN(mult_166_n213) );
  INV_X1 mult_166_U150 ( .A(w[2]), .ZN(mult_166_n214) );
  INV_X1 mult_166_U149 ( .A(w[6]), .ZN(mult_166_n206) );
  INV_X1 mult_166_U148 ( .A(mult_166_n56), .ZN(mult_166_n210) );
  INV_X1 mult_166_U147 ( .A(w[5]), .ZN(mult_166_n208) );
  INV_X1 mult_166_U146 ( .A(w[4]), .ZN(mult_166_n209) );
  INV_X1 mult_166_U145 ( .A(w[1]), .ZN(mult_166_n216) );
  INV_X1 mult_166_U144 ( .A(w[7]), .ZN(mult_166_n204) );
  INV_X1 mult_166_U143 ( .A(mult_166_n58), .ZN(mult_166_n203) );
  INV_X1 mult_166_U142 ( .A(mult_166_n67), .ZN(mult_166_n205) );
  INV_X1 mult_166_U141 ( .A(mult_166_n78), .ZN(mult_166_n207) );
  INV_X1 mult_166_U140 ( .A(mult_166_n85), .ZN(mult_166_n211) );
  INV_X1 mult_166_U139 ( .A(mult_166_n92), .ZN(mult_166_n212) );
  INV_X1 mult_166_U138 ( .A(mult_166_n94), .ZN(mult_166_n215) );
  HA_X1 mult_166_U57 ( .A(mult_166_n148), .B(mult_166_n156), .CO(mult_166_n95), 
        .S(mult_166_n96) );
  HA_X1 mult_166_U56 ( .A(mult_166_n131), .B(mult_166_n139), .CO(mult_166_n93), 
        .S(mult_166_n94) );
  FA_X1 mult_166_U55 ( .A(mult_166_n147), .B(mult_166_n155), .CI(mult_166_n95), 
        .CO(mult_166_n91), .S(mult_166_n92) );
  HA_X1 mult_166_U54 ( .A(mult_166_n122), .B(mult_166_n130), .CO(mult_166_n89), 
        .S(mult_166_n90) );
  FA_X1 mult_166_U53 ( .A(mult_166_n138), .B(mult_166_n154), .CI(mult_166_n146), .CO(mult_166_n87), .S(mult_166_n88) );
  FA_X1 mult_166_U52 ( .A(mult_166_n90), .B(mult_166_n93), .CI(mult_166_n91), 
        .CO(mult_166_n85), .S(mult_166_n86) );
  HA_X1 mult_166_U51 ( .A(mult_166_n113), .B(mult_166_n121), .CO(mult_166_n83), 
        .S(mult_166_n84) );
  FA_X1 mult_166_U50 ( .A(mult_166_n129), .B(mult_166_n153), .CI(mult_166_n137), .CO(mult_166_n81), .S(mult_166_n82) );
  FA_X1 mult_166_U49 ( .A(mult_166_n89), .B(mult_166_n145), .CI(mult_166_n84), 
        .CO(mult_166_n79), .S(mult_166_n80) );
  FA_X1 mult_166_U48 ( .A(mult_166_n82), .B(mult_166_n87), .CI(mult_166_n80), 
        .CO(mult_166_n77), .S(mult_166_n78) );
  FA_X1 mult_166_U45 ( .A(mult_166_n112), .B(mult_166_n144), .CI(mult_166_n128), .CO(mult_166_n73), .S(mult_166_n74) );
  FA_X1 mult_166_U44 ( .A(mult_166_n105), .B(mult_166_n136), .CI(mult_166_n83), 
        .CO(mult_166_n71), .S(mult_166_n72) );
  FA_X1 mult_166_U43 ( .A(mult_166_n81), .B(mult_166_n76), .CI(mult_166_n74), 
        .CO(mult_166_n69), .S(mult_166_n70) );
  FA_X1 mult_166_U42 ( .A(mult_166_n72), .B(mult_166_n79), .CI(mult_166_n70), 
        .CO(mult_166_n67), .S(mult_166_n68) );
  FA_X1 mult_166_U41 ( .A(mult_166_n111), .B(mult_166_n151), .CI(mult_166_n119), .CO(mult_166_n65), .S(mult_166_n66) );
  FA_X1 mult_166_U40 ( .A(mult_166_n127), .B(mult_166_n143), .CI(mult_166_n135), .CO(mult_166_n63), .S(mult_166_n64) );
  FA_X1 mult_166_U39 ( .A(mult_166_n75), .B(mult_166_n104), .CI(mult_166_n73), 
        .CO(mult_166_n61), .S(mult_166_n62) );
  FA_X1 mult_166_U38 ( .A(mult_166_n64), .B(mult_166_n71), .CI(mult_166_n66), 
        .CO(mult_166_n59), .S(mult_166_n60) );
  FA_X1 mult_166_U37 ( .A(mult_166_n62), .B(mult_166_n69), .CI(mult_166_n60), 
        .CO(mult_166_n57), .S(mult_166_n58) );
  FA_X1 mult_166_U35 ( .A(mult_166_n118), .B(mult_166_n126), .CI(mult_166_n142), .CO(mult_166_n53), .S(mult_166_n54) );
  FA_X1 mult_166_U34 ( .A(mult_166_n150), .B(mult_166_n134), .CI(mult_166_n103), .CO(mult_166_n51), .S(mult_166_n52) );
  FA_X1 mult_166_U33 ( .A(mult_166_n65), .B(mult_166_n56), .CI(mult_166_n63), 
        .CO(mult_166_n49), .S(mult_166_n50) );
  FA_X1 mult_166_U32 ( .A(mult_166_n52), .B(mult_166_n54), .CI(mult_166_n61), 
        .CO(mult_166_n47), .S(mult_166_n48) );
  FA_X1 mult_166_U31 ( .A(mult_166_n59), .B(mult_166_n50), .CI(mult_166_n48), 
        .CO(mult_166_n45), .S(mult_166_n46) );
  FA_X1 mult_166_U30 ( .A(mult_166_n117), .B(mult_166_n210), .CI(mult_166_n110), .CO(mult_166_n43), .S(mult_166_n44) );
  FA_X1 mult_166_U29 ( .A(mult_166_n133), .B(mult_166_n125), .CI(mult_166_n141), .CO(mult_166_n41), .S(mult_166_n42) );
  FA_X1 mult_166_U28 ( .A(mult_166_n53), .B(mult_166_n102), .CI(mult_166_n51), 
        .CO(mult_166_n39), .S(mult_166_n40) );
  FA_X1 mult_166_U27 ( .A(mult_166_n42), .B(mult_166_n44), .CI(mult_166_n49), 
        .CO(mult_166_n37), .S(mult_166_n38) );
  FA_X1 mult_166_U26 ( .A(mult_166_n47), .B(mult_166_n40), .CI(mult_166_n38), 
        .CO(mult_166_n35), .S(mult_166_n36) );
  FA_X1 mult_166_U25 ( .A(mult_166_n109), .B(mult_166_n116), .CI(mult_166_n124), .CO(mult_166_n33), .S(mult_166_n34) );
  FA_X1 mult_166_U24 ( .A(mult_166_n101), .B(mult_166_n132), .CI(mult_166_n43), 
        .CO(mult_166_n31), .S(mult_166_n32) );
  FA_X1 mult_166_U23 ( .A(mult_166_n34), .B(mult_166_n41), .CI(mult_166_n39), 
        .CO(mult_166_n29), .S(mult_166_n30) );
  FA_X1 mult_166_U22 ( .A(mult_166_n37), .B(mult_166_n32), .CI(mult_166_n30), 
        .CO(mult_166_n27), .S(mult_166_n28) );
  FA_X1 mult_166_U21 ( .A(mult_166_n108), .B(mult_166_n115), .CI(mult_166_n123), .CO(mult_166_n25), .S(mult_166_n26) );
  FA_X1 mult_166_U20 ( .A(mult_166_n33), .B(mult_166_n100), .CI(mult_166_n26), 
        .CO(mult_166_n23), .S(mult_166_n24) );
  FA_X1 mult_166_U19 ( .A(mult_166_n29), .B(mult_166_n31), .CI(mult_166_n24), 
        .CO(mult_166_n21), .S(mult_166_n22) );
  FA_X1 mult_166_U18 ( .A(mult_166_n114), .B(mult_166_n107), .CI(mult_166_n99), 
        .CO(mult_166_n19), .S(mult_166_n20) );
  FA_X1 mult_166_U17 ( .A(mult_166_n20), .B(mult_166_n25), .CI(mult_166_n23), 
        .CO(mult_166_n17), .S(mult_166_n18) );
  FA_X1 mult_166_U16 ( .A(mult_166_n98), .B(mult_166_n106), .CI(mult_166_n19), 
        .CO(mult_166_n15), .S(mult_166_n16) );
  FA_X1 mult_166_U8 ( .A(mult_166_n46), .B(mult_166_n57), .CI(mult_166_n8), 
        .CO(mult_166_n7), .S(y1_temp_8_) );
  FA_X1 mult_166_U7 ( .A(mult_166_n36), .B(mult_166_n45), .CI(mult_166_n7), 
        .CO(mult_166_n6), .S(y1_temp_9_) );
  FA_X1 mult_166_U6 ( .A(mult_166_n28), .B(mult_166_n35), .CI(mult_166_n6), 
        .CO(mult_166_n5), .S(y1_temp_10_) );
  FA_X1 mult_166_U5 ( .A(mult_166_n22), .B(mult_166_n27), .CI(mult_166_n5), 
        .CO(mult_166_n4), .S(y1_temp_11_) );
  FA_X1 mult_166_U4 ( .A(mult_166_n21), .B(mult_166_n18), .CI(mult_166_n4), 
        .CO(mult_166_n3), .S(y1_temp_12_) );
  FA_X1 mult_166_U3 ( .A(mult_166_n17), .B(mult_166_n16), .CI(mult_166_n3), 
        .CO(mult_166_n2), .S(y1_temp_13_) );
  FA_X1 mult_166_U2 ( .A(mult_166_n15), .B(mult_166_n97), .CI(mult_166_n2), 
        .CO(mult_166_n1), .S(y1_temp_14_) );
  AND2_X1 add_170_U2 ( .A1(y1_temp_8_), .A2(ff_temp_11_), .ZN(add_170_n2) );
  XOR2_X1 add_170_U1 ( .A(y1_temp_8_), .B(ff_temp_11_), .Z(yout[0]) );
  FA_X1 add_170_U1_1 ( .A(ff_temp_12_), .B(y1_temp_9_), .CI(add_170_n2), .CO(
        add_170_carry[2]), .S(yout[1]) );
  FA_X1 add_170_U1_2 ( .A(ff_temp_13_), .B(y1_temp_10_), .CI(add_170_carry[2]), 
        .CO(add_170_carry[3]), .S(yout[2]) );
  FA_X1 add_170_U1_3 ( .A(ff_temp_14_), .B(y1_temp_11_), .CI(add_170_carry[3]), 
        .CO(add_170_carry[4]), .S(yout[3]) );
  FA_X1 add_170_U1_4 ( .A(ff_temp_15_), .B(y1_temp_12_), .CI(add_170_carry[4]), 
        .CO(add_170_carry[5]), .S(yout[4]) );
  FA_X1 add_170_U1_5 ( .A(ff_temp_15_), .B(y1_temp_13_), .CI(add_170_carry[5]), 
        .CO(add_170_carry[6]), .S(yout[5]) );
  FA_X1 add_170_U1_6 ( .A(ff_temp_15_), .B(y1_temp_14_), .CI(add_170_carry[6]), 
        .CO(add_170_carry[7]), .S(yout[6]) );
  FA_X1 add_170_U1_7 ( .A(ff_temp_15_), .B(y1_temp_15_), .CI(add_170_carry[7]), 
        .S(yout[7]) );
  NAND2_X1 mult_148_U234 ( .A1(sw[5]), .A2(a1_s[6]), .ZN(mult_148_n100) );
  NAND2_X1 mult_148_U233 ( .A1(sw[4]), .A2(a1_s[6]), .ZN(mult_148_n101) );
  NAND2_X1 mult_148_U232 ( .A1(sw[3]), .A2(a1_s[6]), .ZN(mult_148_n102) );
  NAND2_X1 mult_148_U231 ( .A1(sw[2]), .A2(a1_s[6]), .ZN(mult_148_n103) );
  NAND2_X1 mult_148_U230 ( .A1(sw[1]), .A2(a1_s[6]), .ZN(mult_148_n104) );
  NAND2_X1 mult_148_U229 ( .A1(sw[0]), .A2(a1_s[6]), .ZN(mult_148_n105) );
  NAND2_X1 mult_148_U228 ( .A1(a1_s[5]), .A2(sw[8]), .ZN(mult_148_n106) );
  NOR2_X1 mult_148_U227 ( .A1(mult_148_n216), .A2(mult_148_n207), .ZN(
        mult_148_n107) );
  NOR2_X1 mult_148_U226 ( .A1(mult_148_n217), .A2(mult_148_n207), .ZN(
        mult_148_n108) );
  NOR2_X1 mult_148_U225 ( .A1(mult_148_n207), .A2(mult_148_n218), .ZN(
        mult_148_n109) );
  NOR2_X1 mult_148_U224 ( .A1(mult_148_n207), .A2(mult_148_n219), .ZN(
        mult_148_n110) );
  NOR2_X1 mult_148_U223 ( .A1(mult_148_n221), .A2(mult_148_n207), .ZN(
        mult_148_n111) );
  NOR2_X1 mult_148_U222 ( .A1(mult_148_n207), .A2(mult_148_n222), .ZN(
        mult_148_n112) );
  NOR2_X1 mult_148_U221 ( .A1(mult_148_n207), .A2(mult_148_n223), .ZN(
        mult_148_n113) );
  NAND2_X1 mult_148_U220 ( .A1(a1_s[4]), .A2(sw[8]), .ZN(mult_148_n114) );
  NOR2_X1 mult_148_U219 ( .A1(mult_148_n216), .A2(mult_148_n209), .ZN(
        mult_148_n115) );
  NOR2_X1 mult_148_U218 ( .A1(mult_148_n217), .A2(mult_148_n209), .ZN(
        mult_148_n116) );
  NOR2_X1 mult_148_U217 ( .A1(mult_148_n209), .A2(mult_148_n218), .ZN(
        mult_148_n117) );
  NOR2_X1 mult_148_U216 ( .A1(mult_148_n209), .A2(mult_148_n219), .ZN(
        mult_148_n118) );
  NOR2_X1 mult_148_U215 ( .A1(mult_148_n209), .A2(mult_148_n220), .ZN(
        mult_148_n119) );
  NOR2_X1 mult_148_U214 ( .A1(mult_148_n209), .A2(mult_148_n222), .ZN(
        mult_148_n121) );
  NOR2_X1 mult_148_U213 ( .A1(mult_148_n209), .A2(mult_148_n223), .ZN(
        mult_148_n122) );
  NAND2_X1 mult_148_U212 ( .A1(a1_s[3]), .A2(sw[8]), .ZN(mult_148_n123) );
  NOR2_X1 mult_148_U211 ( .A1(mult_148_n216), .A2(mult_148_n211), .ZN(
        mult_148_n124) );
  NOR2_X1 mult_148_U210 ( .A1(mult_148_n217), .A2(mult_148_n211), .ZN(
        mult_148_n125) );
  NOR2_X1 mult_148_U209 ( .A1(mult_148_n218), .A2(mult_148_n211), .ZN(
        mult_148_n126) );
  NOR2_X1 mult_148_U208 ( .A1(mult_148_n219), .A2(mult_148_n211), .ZN(
        mult_148_n127) );
  NOR2_X1 mult_148_U207 ( .A1(mult_148_n220), .A2(mult_148_n211), .ZN(
        mult_148_n128) );
  NOR2_X1 mult_148_U206 ( .A1(mult_148_n221), .A2(mult_148_n211), .ZN(
        mult_148_n129) );
  NOR2_X1 mult_148_U205 ( .A1(mult_148_n222), .A2(mult_148_n211), .ZN(
        mult_148_n130) );
  NOR2_X1 mult_148_U204 ( .A1(mult_148_n223), .A2(mult_148_n211), .ZN(
        mult_148_n131) );
  NAND2_X1 mult_148_U203 ( .A1(a1_s[2]), .A2(sw[8]), .ZN(mult_148_n132) );
  NOR2_X1 mult_148_U202 ( .A1(mult_148_n216), .A2(mult_148_n212), .ZN(
        mult_148_n133) );
  NOR2_X1 mult_148_U201 ( .A1(mult_148_n217), .A2(mult_148_n212), .ZN(
        mult_148_n134) );
  NOR2_X1 mult_148_U200 ( .A1(mult_148_n212), .A2(mult_148_n218), .ZN(
        mult_148_n135) );
  NOR2_X1 mult_148_U199 ( .A1(mult_148_n212), .A2(mult_148_n219), .ZN(
        mult_148_n136) );
  NOR2_X1 mult_148_U198 ( .A1(mult_148_n220), .A2(mult_148_n212), .ZN(
        mult_148_n137) );
  NOR2_X1 mult_148_U197 ( .A1(mult_148_n221), .A2(mult_148_n212), .ZN(
        mult_148_n138) );
  NOR2_X1 mult_148_U196 ( .A1(mult_148_n212), .A2(mult_148_n222), .ZN(
        mult_148_n139) );
  NAND2_X1 mult_148_U195 ( .A1(a1_s[1]), .A2(sw[8]), .ZN(mult_148_n141) );
  NOR2_X1 mult_148_U194 ( .A1(mult_148_n216), .A2(mult_148_n214), .ZN(
        mult_148_n142) );
  NOR2_X1 mult_148_U193 ( .A1(mult_148_n217), .A2(mult_148_n214), .ZN(
        mult_148_n143) );
  NOR2_X1 mult_148_U192 ( .A1(mult_148_n214), .A2(mult_148_n218), .ZN(
        mult_148_n144) );
  NOR2_X1 mult_148_U191 ( .A1(mult_148_n214), .A2(mult_148_n219), .ZN(
        mult_148_n145) );
  NOR2_X1 mult_148_U190 ( .A1(mult_148_n220), .A2(mult_148_n214), .ZN(
        mult_148_n146) );
  NOR2_X1 mult_148_U189 ( .A1(mult_148_n221), .A2(mult_148_n214), .ZN(
        mult_148_n147) );
  NOR2_X1 mult_148_U188 ( .A1(mult_148_n214), .A2(mult_148_n222), .ZN(
        mult_148_n148) );
  NAND2_X1 mult_148_U187 ( .A1(a1_s[0]), .A2(sw[8]), .ZN(mult_148_n150) );
  NOR2_X1 mult_148_U186 ( .A1(mult_148_n216), .A2(mult_148_n215), .ZN(
        mult_148_n151) );
  NOR2_X1 mult_148_U185 ( .A1(mult_148_n215), .A2(mult_148_n218), .ZN(
        mult_148_n153) );
  NOR2_X1 mult_148_U184 ( .A1(mult_148_n215), .A2(mult_148_n219), .ZN(
        mult_148_n154) );
  NOR2_X1 mult_148_U183 ( .A1(mult_148_n215), .A2(mult_148_n220), .ZN(
        mult_148_n155) );
  NOR2_X1 mult_148_U182 ( .A1(mult_148_n215), .A2(mult_148_n221), .ZN(
        mult_148_n156) );
  NOR4_X1 mult_148_U181 ( .A1(mult_148_n222), .A2(mult_148_n214), .A3(
        mult_148_n223), .A4(mult_148_n215), .ZN(mult_148_n235) );
  NOR2_X1 mult_148_U180 ( .A1(mult_148_n223), .A2(mult_148_n212), .ZN(
        mult_148_n236) );
  AOI222_X1 mult_148_U179 ( .A1(mult_148_n96), .A2(mult_148_n235), .B1(
        mult_148_n236), .B2(mult_148_n96), .C1(mult_148_n236), .C2(
        mult_148_n235), .ZN(mult_148_n234) );
  OAI222_X1 mult_148_U178 ( .A1(mult_148_n234), .A2(mult_148_n213), .B1(
        mult_148_n213), .B2(mult_148_n210), .C1(mult_148_n234), .C2(
        mult_148_n210), .ZN(mult_148_n233) );
  AOI222_X1 mult_148_U177 ( .A1(mult_148_n233), .A2(mult_148_n86), .B1(
        mult_148_n233), .B2(mult_148_n88), .C1(mult_148_n88), .C2(mult_148_n86), .ZN(mult_148_n232) );
  OAI222_X1 mult_148_U176 ( .A1(mult_148_n232), .A2(mult_148_n206), .B1(
        mult_148_n232), .B2(mult_148_n208), .C1(mult_148_n208), .C2(
        mult_148_n206), .ZN(mult_148_n231) );
  AOI222_X1 mult_148_U175 ( .A1(mult_148_n231), .A2(mult_148_n68), .B1(
        mult_148_n231), .B2(mult_148_n77), .C1(mult_148_n77), .C2(mult_148_n68), .ZN(mult_148_n230) );
  OAI222_X1 mult_148_U174 ( .A1(mult_148_n230), .A2(mult_148_n203), .B1(
        mult_148_n230), .B2(mult_148_n204), .C1(mult_148_n204), .C2(
        mult_148_n203), .ZN(mult_148_n229) );
  AOI222_X1 mult_148_U173 ( .A1(mult_148_n229), .A2(mult_148_n46), .B1(
        mult_148_n229), .B2(mult_148_n57), .C1(mult_148_n57), .C2(mult_148_n46), .ZN(mult_148_n228) );
  AOI222_X1 mult_148_U172 ( .A1(mult_148_n202), .A2(mult_148_n36), .B1(
        mult_148_n202), .B2(mult_148_n45), .C1(mult_148_n45), .C2(mult_148_n36), .ZN(mult_148_n227) );
  AOI222_X1 mult_148_U171 ( .A1(mult_148_n201), .A2(mult_148_n28), .B1(
        mult_148_n201), .B2(mult_148_n35), .C1(mult_148_n35), .C2(mult_148_n28), .ZN(mult_148_n226) );
  NAND2_X1 mult_148_U170 ( .A1(sw[3]), .A2(a1_s[5]), .ZN(mult_148_n56) );
  NAND2_X1 mult_148_U169 ( .A1(a1_s[0]), .A2(sw[6]), .ZN(mult_148_n224) );
  NAND2_X1 mult_148_U168 ( .A1(sw[2]), .A2(a1_s[4]), .ZN(mult_148_n225) );
  NAND2_X1 mult_148_U167 ( .A1(mult_148_n224), .A2(mult_148_n225), .ZN(
        mult_148_n75) );
  XNOR2_X1 mult_148_U166 ( .A(mult_148_n224), .B(mult_148_n225), .ZN(
        mult_148_n76) );
  AND2_X1 mult_148_U165 ( .A1(a1_s[6]), .A2(sw[8]), .ZN(mult_148_n97) );
  NAND2_X1 mult_148_U164 ( .A1(sw[7]), .A2(a1_s[6]), .ZN(mult_148_n98) );
  NAND2_X1 mult_148_U163 ( .A1(sw[6]), .A2(a1_s[6]), .ZN(mult_148_n99) );
  INV_X1 mult_148_U162 ( .A(sw[0]), .ZN(mult_148_n223) );
  INV_X1 mult_148_U161 ( .A(sw[3]), .ZN(mult_148_n220) );
  INV_X1 mult_148_U160 ( .A(sw[2]), .ZN(mult_148_n221) );
  INV_X1 mult_148_U159 ( .A(sw[6]), .ZN(mult_148_n217) );
  INV_X1 mult_148_U158 ( .A(sw[4]), .ZN(mult_148_n219) );
  INV_X1 mult_148_U157 ( .A(sw[5]), .ZN(mult_148_n218) );
  INV_X1 mult_148_U156 ( .A(sw[1]), .ZN(mult_148_n222) );
  INV_X1 mult_148_U155 ( .A(a1_s[0]), .ZN(mult_148_n215) );
  INV_X1 mult_148_U154 ( .A(sw[7]), .ZN(mult_148_n216) );
  INV_X1 mult_148_U153 ( .A(a1_s[5]), .ZN(mult_148_n207) );
  INV_X1 mult_148_U152 ( .A(a1_s[4]), .ZN(mult_148_n209) );
  INV_X1 mult_148_U151 ( .A(a1_s[3]), .ZN(mult_148_n211) );
  INV_X1 mult_148_U150 ( .A(a1_s[2]), .ZN(mult_148_n212) );
  INV_X1 mult_148_U149 ( .A(a1_s[1]), .ZN(mult_148_n214) );
  INV_X1 mult_148_U148 ( .A(mult_148_n226), .ZN(mult_148_n200) );
  INV_X1 mult_148_U147 ( .A(mult_148_n56), .ZN(mult_148_n205) );
  INV_X1 mult_148_U146 ( .A(mult_148_n92), .ZN(mult_148_n213) );
  INV_X1 mult_148_U145 ( .A(mult_148_n94), .ZN(mult_148_n210) );
  INV_X1 mult_148_U144 ( .A(mult_148_n228), .ZN(mult_148_n202) );
  INV_X1 mult_148_U143 ( .A(mult_148_n227), .ZN(mult_148_n201) );
  INV_X1 mult_148_U142 ( .A(mult_148_n78), .ZN(mult_148_n206) );
  INV_X1 mult_148_U141 ( .A(mult_148_n85), .ZN(mult_148_n208) );
  INV_X1 mult_148_U140 ( .A(mult_148_n58), .ZN(mult_148_n203) );
  INV_X1 mult_148_U139 ( .A(mult_148_n67), .ZN(mult_148_n204) );
  INV_X1 mult_148_U138 ( .A(mult_148_n1), .ZN(fb_temp_15_) );
  HA_X1 mult_148_U57 ( .A(mult_148_n148), .B(mult_148_n156), .CO(mult_148_n95), 
        .S(mult_148_n96) );
  HA_X1 mult_148_U56 ( .A(mult_148_n131), .B(mult_148_n139), .CO(mult_148_n93), 
        .S(mult_148_n94) );
  FA_X1 mult_148_U55 ( .A(mult_148_n147), .B(mult_148_n155), .CI(mult_148_n95), 
        .CO(mult_148_n91), .S(mult_148_n92) );
  HA_X1 mult_148_U54 ( .A(mult_148_n122), .B(mult_148_n130), .CO(mult_148_n89), 
        .S(mult_148_n90) );
  FA_X1 mult_148_U53 ( .A(mult_148_n138), .B(mult_148_n154), .CI(mult_148_n146), .CO(mult_148_n87), .S(mult_148_n88) );
  FA_X1 mult_148_U52 ( .A(mult_148_n90), .B(mult_148_n93), .CI(mult_148_n91), 
        .CO(mult_148_n85), .S(mult_148_n86) );
  HA_X1 mult_148_U51 ( .A(mult_148_n113), .B(mult_148_n121), .CO(mult_148_n83), 
        .S(mult_148_n84) );
  FA_X1 mult_148_U50 ( .A(mult_148_n129), .B(mult_148_n153), .CI(mult_148_n137), .CO(mult_148_n81), .S(mult_148_n82) );
  FA_X1 mult_148_U49 ( .A(mult_148_n89), .B(mult_148_n145), .CI(mult_148_n84), 
        .CO(mult_148_n79), .S(mult_148_n80) );
  FA_X1 mult_148_U48 ( .A(mult_148_n82), .B(mult_148_n87), .CI(mult_148_n80), 
        .CO(mult_148_n77), .S(mult_148_n78) );
  FA_X1 mult_148_U45 ( .A(mult_148_n112), .B(mult_148_n144), .CI(mult_148_n128), .CO(mult_148_n73), .S(mult_148_n74) );
  FA_X1 mult_148_U44 ( .A(mult_148_n105), .B(mult_148_n136), .CI(mult_148_n83), 
        .CO(mult_148_n71), .S(mult_148_n72) );
  FA_X1 mult_148_U43 ( .A(mult_148_n81), .B(mult_148_n76), .CI(mult_148_n74), 
        .CO(mult_148_n69), .S(mult_148_n70) );
  FA_X1 mult_148_U42 ( .A(mult_148_n72), .B(mult_148_n79), .CI(mult_148_n70), 
        .CO(mult_148_n67), .S(mult_148_n68) );
  FA_X1 mult_148_U41 ( .A(mult_148_n111), .B(mult_148_n151), .CI(mult_148_n119), .CO(mult_148_n65), .S(mult_148_n66) );
  FA_X1 mult_148_U40 ( .A(mult_148_n127), .B(mult_148_n143), .CI(mult_148_n135), .CO(mult_148_n63), .S(mult_148_n64) );
  FA_X1 mult_148_U39 ( .A(mult_148_n75), .B(mult_148_n104), .CI(mult_148_n73), 
        .CO(mult_148_n61), .S(mult_148_n62) );
  FA_X1 mult_148_U38 ( .A(mult_148_n64), .B(mult_148_n71), .CI(mult_148_n66), 
        .CO(mult_148_n59), .S(mult_148_n60) );
  FA_X1 mult_148_U37 ( .A(mult_148_n62), .B(mult_148_n69), .CI(mult_148_n60), 
        .CO(mult_148_n57), .S(mult_148_n58) );
  FA_X1 mult_148_U35 ( .A(mult_148_n118), .B(mult_148_n126), .CI(mult_148_n142), .CO(mult_148_n53), .S(mult_148_n54) );
  FA_X1 mult_148_U34 ( .A(mult_148_n150), .B(mult_148_n134), .CI(mult_148_n103), .CO(mult_148_n51), .S(mult_148_n52) );
  FA_X1 mult_148_U33 ( .A(mult_148_n65), .B(mult_148_n56), .CI(mult_148_n63), 
        .CO(mult_148_n49), .S(mult_148_n50) );
  FA_X1 mult_148_U32 ( .A(mult_148_n52), .B(mult_148_n54), .CI(mult_148_n61), 
        .CO(mult_148_n47), .S(mult_148_n48) );
  FA_X1 mult_148_U31 ( .A(mult_148_n59), .B(mult_148_n50), .CI(mult_148_n48), 
        .CO(mult_148_n45), .S(mult_148_n46) );
  FA_X1 mult_148_U30 ( .A(mult_148_n117), .B(mult_148_n205), .CI(mult_148_n110), .CO(mult_148_n43), .S(mult_148_n44) );
  FA_X1 mult_148_U29 ( .A(mult_148_n133), .B(mult_148_n125), .CI(mult_148_n141), .CO(mult_148_n41), .S(mult_148_n42) );
  FA_X1 mult_148_U28 ( .A(mult_148_n53), .B(mult_148_n102), .CI(mult_148_n51), 
        .CO(mult_148_n39), .S(mult_148_n40) );
  FA_X1 mult_148_U27 ( .A(mult_148_n42), .B(mult_148_n44), .CI(mult_148_n49), 
        .CO(mult_148_n37), .S(mult_148_n38) );
  FA_X1 mult_148_U26 ( .A(mult_148_n47), .B(mult_148_n40), .CI(mult_148_n38), 
        .CO(mult_148_n35), .S(mult_148_n36) );
  FA_X1 mult_148_U25 ( .A(mult_148_n109), .B(mult_148_n116), .CI(mult_148_n124), .CO(mult_148_n33), .S(mult_148_n34) );
  FA_X1 mult_148_U24 ( .A(mult_148_n101), .B(mult_148_n132), .CI(mult_148_n43), 
        .CO(mult_148_n31), .S(mult_148_n32) );
  FA_X1 mult_148_U23 ( .A(mult_148_n34), .B(mult_148_n41), .CI(mult_148_n39), 
        .CO(mult_148_n29), .S(mult_148_n30) );
  FA_X1 mult_148_U22 ( .A(mult_148_n37), .B(mult_148_n32), .CI(mult_148_n30), 
        .CO(mult_148_n27), .S(mult_148_n28) );
  FA_X1 mult_148_U21 ( .A(mult_148_n108), .B(mult_148_n115), .CI(mult_148_n123), .CO(mult_148_n25), .S(mult_148_n26) );
  FA_X1 mult_148_U20 ( .A(mult_148_n33), .B(mult_148_n100), .CI(mult_148_n26), 
        .CO(mult_148_n23), .S(mult_148_n24) );
  FA_X1 mult_148_U19 ( .A(mult_148_n29), .B(mult_148_n31), .CI(mult_148_n24), 
        .CO(mult_148_n21), .S(mult_148_n22) );
  FA_X1 mult_148_U18 ( .A(mult_148_n114), .B(mult_148_n107), .CI(mult_148_n99), 
        .CO(mult_148_n19), .S(mult_148_n20) );
  FA_X1 mult_148_U17 ( .A(mult_148_n20), .B(mult_148_n25), .CI(mult_148_n23), 
        .CO(mult_148_n17), .S(mult_148_n18) );
  FA_X1 mult_148_U16 ( .A(mult_148_n98), .B(mult_148_n106), .CI(mult_148_n19), 
        .CO(mult_148_n15), .S(mult_148_n16) );
  FA_X1 mult_148_U5 ( .A(mult_148_n22), .B(mult_148_n27), .CI(mult_148_n200), 
        .CO(mult_148_n4), .S(fb[0]) );
  FA_X1 mult_148_U4 ( .A(mult_148_n21), .B(mult_148_n18), .CI(mult_148_n4), 
        .CO(mult_148_n3), .S(fb_temp_12_) );
  FA_X1 mult_148_U3 ( .A(mult_148_n17), .B(mult_148_n16), .CI(mult_148_n3), 
        .CO(mult_148_n2), .S(fb_temp_13_) );
  FA_X1 mult_148_U2 ( .A(mult_148_n15), .B(mult_148_n97), .CI(mult_148_n2), 
        .CO(mult_148_n1), .S(fb_temp_14_) );
endmodule

