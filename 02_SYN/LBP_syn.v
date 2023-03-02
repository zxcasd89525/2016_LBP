/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Mar  3 00:10:32 2023
/////////////////////////////////////////////////////////////


module LBP_DW01_add_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3XL U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, N40, N41, N42, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N160, N164, N165, N166, N167, N168,
         N169, N171, N172, N173, N174, N175, N176, N180, N181, N182, N183,
         N184, N185, N186, N187, N188, N189, N190, N191, N193, N194, N195,
         N196, N197, N198, N199, N200, N201, N202, N203, N204, N205, N262,
         N263, N264, N265, N266, N267, N268, N269, N270, N271, N272, N273,
         N274, N275, N276, N277, N278, N279, N280, N281, N282, N283, N284,
         N285, N286, n31, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n64, n65, n66, n67, n68, n69, n70, n71, n73, n74,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n123, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n146, n149, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, \sll_102_S2/SH[0] , \add_76/carry[2] , \add_76/carry[3] ,
         \add_76/carry[4] , \add_76/carry[5] , \add_76/carry[6] ,
         \add_76/carry[7] , \add_76/carry[8] , \add_76/carry[9] ,
         \add_76/carry[10] , \add_76/carry[11] , \add_76/carry[12] ,
         \add_76/carry[13] , \r405/carry[2] , \r405/carry[3] , \r405/carry[4] ,
         \r405/carry[5] , \r405/carry[6] , \r405/carry[7] , \r405/carry[8] ,
         \r405/carry[9] , \r405/carry[10] , \r405/carry[11] , \r405/carry[12] ,
         n245, n246, n247, n248, n249, n250, n251, n252, n254, n271, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n308, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351;
  wire   [7:0] center_pixel;
  wire   [14:0] \sub_75_S2/carry ;
  wire   [14:0] \sub_74_S2/carry ;
  wire   [13:1] \add_69_S2/carry ;
  wire   [13:1] \r407/carry ;

  LBP_DW01_add_1 add_102_S2 ( .A({n374, N286, N285, N284, N283, N282, N281, 
        N280}), .B({N271, N270, N269, N268, N267, N266, N265, N264}), .CI(1'b0), .SUM({N279, N278, N277, N276, N275, N274, N273, N272}) );
  LBP_DW01_inc_0_DW01_inc_1 r406 ( .A({n352, gray_addr[12:0]}), .SUM({N87, N86, 
        N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74}) );
  DFFRX1 \gray_addr_reg[12]  ( .D(n227), .CK(clk), .RN(n320), .Q(n353), .QN(
        n165) );
  DFFRX1 \gray_addr_reg[11]  ( .D(n228), .CK(clk), .RN(n321), .Q(n354), .QN(
        n164) );
  DFFRX1 \cnt_reg[1]  ( .D(N41), .CK(clk), .RN(n322), .Q(n245) );
  DFFRX1 \gray_addr_reg[10]  ( .D(n229), .CK(clk), .RN(n320), .Q(n355), .QN(
        n163) );
  DFFRX1 \gray_addr_reg[9]  ( .D(n230), .CK(clk), .RN(n320), .Q(n356), .QN(
        n162) );
  DFFRX1 \center_pixel_reg[6]  ( .D(n210), .CK(clk), .RN(n320), .Q(
        center_pixel[6]), .QN(n252) );
  DFFRX1 \center_pixel_reg[7]  ( .D(n211), .CK(clk), .RN(n320), .Q(
        center_pixel[7]) );
  DFFRX1 \gray_addr_reg[8]  ( .D(n231), .CK(clk), .RN(n320), .Q(n357), .QN(
        n161) );
  DFFRX1 \gray_addr_reg[6]  ( .D(n233), .CK(clk), .RN(n320), .Q(N169), .QN(
        n159) );
  DFFSX1 \gray_addr_reg[7]  ( .D(n232), .CK(clk), .SN(n321), .Q(n358), .QN(
        n160) );
  DFFRX1 \center_pixel_reg[0]  ( .D(n204), .CK(clk), .RN(n321), .Q(
        center_pixel[0]), .QN(n251) );
  DFFRX1 \center_pixel_reg[4]  ( .D(n208), .CK(clk), .RN(n320), .Q(
        center_pixel[4]) );
  DFFRX1 \center_pixel_reg[2]  ( .D(n206), .CK(clk), .RN(n321), .Q(
        center_pixel[2]) );
  DFFRX1 \center_pixel_reg[1]  ( .D(n205), .CK(clk), .RN(n321), .Q(
        center_pixel[1]) );
  DFFRX1 \center_pixel_reg[3]  ( .D(n207), .CK(clk), .RN(n320), .Q(
        center_pixel[3]) );
  DFFRX1 \center_pixel_reg[5]  ( .D(n209), .CK(clk), .RN(n320), .Q(
        center_pixel[5]) );
  DFFRX1 \gray_addr_reg[5]  ( .D(n234), .CK(clk), .RN(n320), .Q(N168), .QN(
        n158) );
  DFFRX1 \gray_addr_reg[4]  ( .D(n235), .CK(clk), .RN(n320), .Q(N167), .QN(
        n157) );
  DFFRX1 \gray_addr_reg[1]  ( .D(n238), .CK(clk), .RN(n321), .Q(N164), .QN(
        n154) );
  DFFRX1 \gray_addr_reg[3]  ( .D(n236), .CK(clk), .RN(n320), .Q(N166), .QN(
        n156) );
  DFFRX1 \gray_addr_reg[2]  ( .D(n237), .CK(clk), .RN(n320), .Q(N165), .QN(
        n155) );
  DFFSX1 \gray_addr_reg[0]  ( .D(n243), .CK(clk), .SN(n320), .Q(N88), .QN(n152) );
  DFFRX1 \c_state_reg[0]  ( .D(n240), .CK(clk), .RN(n322), .Q(n249), .QN(n223)
         );
  DFFRX1 \c_state_reg[2]  ( .D(n241), .CK(clk), .RN(n321), .QN(n213) );
  DFFRX1 \cnt_reg[2]  ( .D(N42), .CK(clk), .RN(n320), .Q(n248), .QN(n224) );
  DFFRX1 \c_state_reg[1]  ( .D(n239), .CK(clk), .RN(n321), .Q(n250), .QN(n222)
         );
  DFFRX1 \gray_addr_reg[13]  ( .D(n242), .CK(clk), .RN(n322), .Q(n352), .QN(
        n153) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n214), .CK(clk), .RN(n322), .Q(N280), .QN(n166) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n218), .CK(clk), .RN(n322), .Q(N284), .QN(n170) );
  DFFRX1 \lbp_data_reg[6]  ( .D(n220), .CK(clk), .RN(n322), .Q(N286), .QN(n172) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n219), .CK(clk), .RN(n342), .Q(N285), .QN(n171) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n216), .CK(clk), .RN(n322), .Q(N282), .QN(n168) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n217), .CK(clk), .RN(n322), .Q(N283), .QN(n169) );
  DFFRX1 \lbp_data_reg[7]  ( .D(n221), .CK(clk), .RN(n322), .Q(n374), .QN(n173) );
  DFFRX1 gray_req_reg ( .D(n226), .CK(clk), .RN(n320), .Q(n359), .QN(n271) );
  DFFRX1 \lbp_addr_reg[0]  ( .D(n190), .CK(clk), .RN(n322), .Q(n373), .QN(n175) );
  DFFRX1 \lbp_addr_reg[1]  ( .D(n191), .CK(clk), .RN(n322), .Q(n372), .QN(n176) );
  DFFRX1 \lbp_addr_reg[2]  ( .D(n192), .CK(clk), .RN(n322), .Q(n371), .QN(n177) );
  DFFRX1 \lbp_addr_reg[3]  ( .D(n193), .CK(clk), .RN(n322), .Q(n370), .QN(n178) );
  DFFRX1 \lbp_addr_reg[4]  ( .D(n194), .CK(clk), .RN(n322), .Q(n369), .QN(n179) );
  DFFRX1 \lbp_addr_reg[5]  ( .D(n195), .CK(clk), .RN(n322), .Q(n368), .QN(n180) );
  DFFRX1 \lbp_addr_reg[6]  ( .D(n196), .CK(clk), .RN(n321), .Q(n367), .QN(n181) );
  DFFRX1 \lbp_addr_reg[7]  ( .D(n197), .CK(clk), .RN(n321), .Q(n366), .QN(n182) );
  DFFRX1 \lbp_addr_reg[8]  ( .D(n198), .CK(clk), .RN(n321), .Q(n365), .QN(n183) );
  DFFRX1 \lbp_addr_reg[9]  ( .D(n199), .CK(clk), .RN(n321), .Q(n364), .QN(n184) );
  DFFRX1 \lbp_addr_reg[10]  ( .D(n200), .CK(clk), .RN(n321), .Q(n363), .QN(
        n185) );
  DFFRX1 \lbp_addr_reg[11]  ( .D(n201), .CK(clk), .RN(n321), .Q(n362), .QN(
        n186) );
  DFFRX1 \lbp_addr_reg[12]  ( .D(n202), .CK(clk), .RN(n321), .Q(n361), .QN(
        n187) );
  DFFRX1 \lbp_addr_reg[13]  ( .D(n203), .CK(clk), .RN(n321), .Q(n360), .QN(
        n188) );
  DFFRX1 finish_reg ( .D(n189), .CK(clk), .RN(n342), .Q(n375), .QN(n174) );
  DFFRX1 lbp_valid_reg ( .D(n298), .CK(clk), .RN(n321), .QN(n254) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n215), .CK(clk), .RN(n322), .Q(N281), .QN(n167) );
  DFFRX2 \cnt_reg[0]  ( .D(N40), .CK(clk), .RN(n342), .Q(n350), .QN(
        \sll_102_S2/SH[0] ) );
  BUFX4 U191 ( .A(n49), .Y(n305) );
  AOI2BB2X1 U192 ( .B0(n330), .B1(n329), .A0N(n332), .A1N(n339), .Y(n331) );
  OAI211X1 U193 ( .A0(n224), .A1(\sll_102_S2/SH[0] ), .B0(n128), .C0(n348), 
        .Y(N263) );
  CLKBUFX3 U194 ( .A(n52), .Y(n281) );
  NOR3BXL U195 ( .AN(n305), .B(n60), .C(n61), .Y(n52) );
  NOR3BX2 U196 ( .AN(n305), .B(n61), .C(n348), .Y(n51) );
  CLKAND2X3 U197 ( .A(N160), .B(n298), .Y(n246) );
  OA21XL U198 ( .A0(center_pixel[7]), .A1(n341), .B0(n337), .Y(n247) );
  BUFX12 U199 ( .A(N281), .Y(lbp_data[1]) );
  INVX12 U200 ( .A(n254), .Y(lbp_valid) );
  BUFX12 U201 ( .A(n375), .Y(finish) );
  BUFX12 U202 ( .A(n360), .Y(lbp_addr[13]) );
  BUFX12 U203 ( .A(n361), .Y(lbp_addr[12]) );
  BUFX12 U204 ( .A(n362), .Y(lbp_addr[11]) );
  BUFX12 U205 ( .A(n363), .Y(lbp_addr[10]) );
  BUFX12 U206 ( .A(n364), .Y(lbp_addr[9]) );
  BUFX12 U207 ( .A(n365), .Y(lbp_addr[8]) );
  BUFX12 U208 ( .A(n366), .Y(lbp_addr[7]) );
  BUFX12 U209 ( .A(n367), .Y(lbp_addr[6]) );
  BUFX12 U210 ( .A(n368), .Y(lbp_addr[5]) );
  BUFX12 U211 ( .A(n369), .Y(lbp_addr[4]) );
  BUFX12 U212 ( .A(n370), .Y(lbp_addr[3]) );
  BUFX12 U213 ( .A(n371), .Y(lbp_addr[2]) );
  BUFX12 U214 ( .A(n372), .Y(lbp_addr[1]) );
  BUFX12 U215 ( .A(n373), .Y(lbp_addr[0]) );
  INVX12 U216 ( .A(n271), .Y(gray_req) );
  INVX12 U217 ( .A(n173), .Y(lbp_data[7]) );
  BUFX12 U218 ( .A(N283), .Y(lbp_data[3]) );
  BUFX12 U219 ( .A(N282), .Y(lbp_data[2]) );
  BUFX12 U220 ( .A(N285), .Y(lbp_data[5]) );
  BUFX12 U221 ( .A(N286), .Y(lbp_data[6]) );
  BUFX12 U222 ( .A(N284), .Y(lbp_data[4]) );
  BUFX12 U223 ( .A(N280), .Y(lbp_data[0]) );
  BUFX12 U224 ( .A(n352), .Y(gray_addr[13]) );
  XOR2XL U225 ( .A(n352), .B(\r407/carry [13]), .Y(N101) );
  OAI2BB2X1 U226 ( .B0(gray_data[0]), .B1(n251), .A0N(n338), .A1N(
        center_pixel[1]), .Y(n327) );
  NAND3X2 U227 ( .A(n282), .B(n283), .C(n331), .Y(n333) );
  OAI222X1 U228 ( .A0(center_pixel[5]), .A1(n340), .B0(center_pixel[5]), .B1(
        n324), .C0(n340), .C1(n324), .Y(n325) );
  INVX1 U229 ( .A(gray_data[5]), .Y(n340) );
  OAI21XL U230 ( .A0(n247), .A1(n61), .B0(n48), .Y(n49) );
  XOR2XL U231 ( .A(gray_addr[13]), .B(\add_76/carry[13] ), .Y(N205) );
  XNOR2XL U232 ( .A(n352), .B(\sub_75_S2/carry [13]), .Y(N191) );
  XOR2XL U233 ( .A(n352), .B(\add_69_S2/carry [13]), .Y(N115) );
  XNOR2XL U234 ( .A(n352), .B(\sub_74_S2/carry [13]), .Y(N176) );
  NOR3X1 U235 ( .A(n350), .B(n245), .C(n248), .Y(n60) );
  NOR2BXL U236 ( .AN(center_pixel[4]), .B(gray_data[4]), .Y(n326) );
  AOI22XL U237 ( .A0(n173), .A1(n51), .B0(N279), .B1(n281), .Y(n59) );
  INVX1 U238 ( .A(gray_data[3]), .Y(n339) );
  OAI211X1 U239 ( .A0(gray_data[6]), .A1(n252), .B0(n334), .C0(n333), .Y(n335)
         );
  NAND3X2 U240 ( .A(n222), .B(n249), .C(n213), .Y(n48) );
  NAND2X1 U241 ( .A(n213), .B(n250), .Y(n61) );
  AO22XL U242 ( .A0(gray_data[5]), .A1(n343), .B0(n48), .B1(center_pixel[5]), 
        .Y(n209) );
  AO22XL U243 ( .A0(gray_data[3]), .A1(n343), .B0(n48), .B1(center_pixel[3]), 
        .Y(n207) );
  AO22XL U244 ( .A0(gray_data[1]), .A1(n343), .B0(n48), .B1(center_pixel[1]), 
        .Y(n205) );
  AO22XL U245 ( .A0(gray_data[0]), .A1(n343), .B0(n48), .B1(center_pixel[0]), 
        .Y(n204) );
  AO22XL U246 ( .A0(gray_data[2]), .A1(n343), .B0(n48), .B1(center_pixel[2]), 
        .Y(n206) );
  AO22XL U247 ( .A0(gray_data[4]), .A1(n343), .B0(n48), .B1(center_pixel[4]), 
        .Y(n208) );
  NOR4X1 U248 ( .A(n158), .B(n157), .C(n159), .D(n141), .Y(n129) );
  CLKINVX1 U249 ( .A(reset), .Y(n342) );
  OR2X1 U250 ( .A(center_pixel[3]), .B(n332), .Y(n282) );
  OR2X1 U251 ( .A(center_pixel[3]), .B(n339), .Y(n283) );
  NAND2BXL U252 ( .AN(center_pixel[2]), .B(gray_data[2]), .Y(n332) );
  CLKINVX1 U253 ( .A(n60), .Y(n348) );
  CLKINVX1 U254 ( .A(N262), .Y(n349) );
  NOR2X1 U255 ( .A(N262), .B(n344), .Y(N41) );
  CLKINVX1 U256 ( .A(n143), .Y(n344) );
  CLKBUFX3 U257 ( .A(n346), .Y(n308) );
  CLKINVX1 U258 ( .A(n244), .Y(n346) );
  CLKBUFX3 U259 ( .A(n71), .Y(n301) );
  NAND2X1 U260 ( .A(n60), .B(n143), .Y(n71) );
  XOR2X1 U261 ( .A(\r405/carry[11] ), .B(gray_addr[11]), .Y(n284) );
  XOR2X1 U262 ( .A(\r405/carry[12] ), .B(gray_addr[12]), .Y(n285) );
  OAI2BB2XL U263 ( .B0(n284), .B1(n301), .A0N(N99), .A1N(n345), .Y(n80) );
  OAI2BB2XL U264 ( .B0(n285), .B1(n301), .A0N(N100), .A1N(n345), .Y(n70) );
  XOR2X1 U265 ( .A(\r405/carry[9] ), .B(gray_addr[9]), .Y(n286) );
  XOR2X1 U266 ( .A(\r405/carry[10] ), .B(gray_addr[10]), .Y(n287) );
  OAI2BB2XL U267 ( .B0(n286), .B1(n301), .A0N(N97), .A1N(n345), .Y(n88) );
  OAI2BB2XL U268 ( .B0(n287), .B1(n301), .A0N(N98), .A1N(n345), .Y(n84) );
  XNOR2X1 U269 ( .A(n121), .B(n250), .Y(n239) );
  NAND2BX1 U270 ( .AN(n123), .B(n249), .Y(n121) );
  XNOR2X2 U271 ( .A(n245), .B(n350), .Y(N262) );
  CLKINVX1 U272 ( .A(N263), .Y(n347) );
  XNOR2X1 U273 ( .A(gray_addr[7]), .B(\r405/carry[7] ), .Y(n288) );
  XOR2X1 U274 ( .A(\r405/carry[6] ), .B(gray_addr[6]), .Y(n289) );
  XOR2X1 U275 ( .A(\r405/carry[8] ), .B(gray_addr[8]), .Y(n290) );
  OAI2BB2XL U276 ( .B0(n288), .B1(n301), .A0N(N95), .A1N(n345), .Y(n96) );
  OAI2BB2XL U277 ( .B0(n289), .B1(n301), .A0N(N94), .A1N(n345), .Y(n100) );
  OAI2BB2XL U278 ( .B0(n290), .B1(n301), .A0N(N96), .A1N(n345), .Y(n92) );
  NOR2X1 U279 ( .A(n351), .B(n347), .Y(N271) );
  NAND2X1 U280 ( .A(n245), .B(n248), .Y(n128) );
  XOR2X1 U281 ( .A(\r405/carry[4] ), .B(gray_addr[4]), .Y(n291) );
  XOR2X1 U282 ( .A(\r405/carry[5] ), .B(gray_addr[5]), .Y(n292) );
  OAI2BB2XL U283 ( .B0(n291), .B1(n301), .A0N(N92), .A1N(n345), .Y(n108) );
  OAI2BB2XL U284 ( .B0(n292), .B1(n301), .A0N(N93), .A1N(n345), .Y(n104) );
  CLKBUFX3 U285 ( .A(n76), .Y(n302) );
  NAND4BX1 U286 ( .AN(n299), .B(n140), .C(n142), .D(n301), .Y(n76) );
  NOR2X1 U287 ( .A(n298), .B(n300), .Y(n142) );
  OAI21X1 U288 ( .A0(n249), .A1(n61), .B0(n48), .Y(n143) );
  NOR2X1 U289 ( .A(n350), .B(n344), .Y(N40) );
  OAI2BB2XL U290 ( .B0(gray_addr[0]), .B1(n301), .A0N(gray_addr[0]), .A1N(n345), .Y(n139) );
  XOR2X1 U291 ( .A(gray_addr[0]), .B(gray_addr[1]), .Y(n293) );
  XOR2X1 U292 ( .A(\r405/carry[2] ), .B(gray_addr[2]), .Y(n294) );
  XOR2X1 U293 ( .A(\r405/carry[3] ), .B(gray_addr[3]), .Y(n295) );
  OAI2BB2XL U294 ( .B0(n293), .B1(n301), .A0N(n154), .A1N(n345), .Y(n120) );
  OAI2BB2XL U295 ( .B0(n294), .B1(n301), .A0N(N90), .A1N(n345), .Y(n116) );
  OAI2BB2XL U296 ( .B0(n295), .B1(n301), .A0N(N91), .A1N(n345), .Y(n112) );
  INVX3 U297 ( .A(n140), .Y(n345) );
  CLKBUFX3 U298 ( .A(n73), .Y(n303) );
  NOR3X1 U299 ( .A(n129), .B(N160), .C(n308), .Y(n73) );
  CLKBUFX3 U300 ( .A(n74), .Y(n304) );
  NOR3BXL U301 ( .AN(n129), .B(n308), .C(N160), .Y(n74) );
  CLKBUFX3 U302 ( .A(n69), .Y(n300) );
  AND2X2 U303 ( .A(N40), .B(n144), .Y(n69) );
  INVX3 U304 ( .A(n48), .Y(n343) );
  CLKBUFX3 U305 ( .A(n244), .Y(n298) );
  CLKBUFX3 U306 ( .A(n342), .Y(n322) );
  CLKBUFX3 U307 ( .A(n342), .Y(n321) );
  CLKBUFX3 U308 ( .A(n342), .Y(n320) );
  OAI21XL U309 ( .A0(n166), .A1(n305), .B0(n50), .Y(n214) );
  AOI22XL U310 ( .A0(N280), .A1(n51), .B0(N272), .B1(n281), .Y(n50) );
  OAI21XL U311 ( .A0(n172), .A1(n305), .B0(n58), .Y(n220) );
  AOI22XL U312 ( .A0(N286), .A1(n51), .B0(N278), .B1(n281), .Y(n58) );
  OAI21XL U313 ( .A0(n171), .A1(n305), .B0(n57), .Y(n219) );
  AOI22XL U314 ( .A0(N285), .A1(n51), .B0(N277), .B1(n281), .Y(n57) );
  OAI21XL U315 ( .A0(n170), .A1(n305), .B0(n56), .Y(n218) );
  AOI22XL U316 ( .A0(N284), .A1(n51), .B0(N276), .B1(n281), .Y(n56) );
  OAI21XL U317 ( .A0(n169), .A1(n305), .B0(n55), .Y(n217) );
  AOI22XL U318 ( .A0(N283), .A1(n51), .B0(N275), .B1(n281), .Y(n55) );
  OAI21XL U319 ( .A0(n168), .A1(n305), .B0(n54), .Y(n216) );
  AOI22XL U320 ( .A0(N282), .A1(n51), .B0(N274), .B1(n281), .Y(n54) );
  OAI21XL U321 ( .A0(n167), .A1(n305), .B0(n53), .Y(n215) );
  AOI22XL U322 ( .A0(N281), .A1(n51), .B0(N273), .B1(n281), .Y(n53) );
  OAI21XL U323 ( .A0(n173), .A1(n305), .B0(n59), .Y(n221) );
  CLKINVX1 U324 ( .A(gray_data[1]), .Y(n338) );
  CLKINVX1 U325 ( .A(gray_data[7]), .Y(n341) );
  BUFX16 U326 ( .A(N164), .Y(gray_addr[1]) );
  BUFX16 U327 ( .A(N88), .Y(gray_addr[0]) );
  BUFX16 U328 ( .A(N166), .Y(gray_addr[3]) );
  BUFX16 U329 ( .A(N165), .Y(gray_addr[2]) );
  XOR2X1 U330 ( .A(n153), .B(n297), .Y(n296) );
  NOR2X1 U331 ( .A(gray_addr[12]), .B(\r405/carry[12] ), .Y(n297) );
  OAI22XL U332 ( .A0(n308), .A1(n285), .B0(n187), .B1(n298), .Y(n202) );
  OAI22XL U333 ( .A0(n308), .A1(n296), .B0(n188), .B1(n298), .Y(n203) );
  OAI2BB2XL U334 ( .B0(n296), .B1(n301), .A0N(N101), .A1N(n345), .Y(n135) );
  NAND3X1 U335 ( .A(n132), .B(n133), .C(n134), .Y(n242) );
  AOI2BB2X1 U336 ( .B0(N176), .B1(n246), .A0N(n153), .A1N(n302), .Y(n132) );
  AOI22X1 U337 ( .A0(N205), .A1(n303), .B0(N191), .B1(n304), .Y(n133) );
  AOI221XL U338 ( .A0(N87), .A1(n299), .B0(N115), .B1(n300), .C0(n135), .Y(
        n134) );
  NAND3X1 U339 ( .A(n77), .B(n78), .C(n79), .Y(n228) );
  AOI2BB2X1 U340 ( .B0(N174), .B1(n246), .A0N(n164), .A1N(n302), .Y(n77) );
  AOI22X1 U341 ( .A0(N203), .A1(n303), .B0(N189), .B1(n304), .Y(n78) );
  AOI221XL U342 ( .A0(N85), .A1(n299), .B0(N113), .B1(n300), .C0(n80), .Y(n79)
         );
  NAND3X1 U343 ( .A(n65), .B(n66), .C(n67), .Y(n227) );
  AOI2BB2X1 U344 ( .B0(N175), .B1(n246), .A0N(n165), .A1N(n302), .Y(n65) );
  AOI22X1 U345 ( .A0(N204), .A1(n303), .B0(N190), .B1(n304), .Y(n66) );
  AOI221XL U346 ( .A0(N86), .A1(n299), .B0(N114), .B1(n300), .C0(n70), .Y(n67)
         );
  BUFX16 U347 ( .A(N167), .Y(gray_addr[4]) );
  BUFX16 U348 ( .A(N168), .Y(gray_addr[5]) );
  OAI32X1 U349 ( .A0(n123), .A1(n125), .A2(n249), .B0(n223), .B1(n126), .Y(
        n240) );
  OA21XL U350 ( .A0(n128), .A1(\sll_102_S2/SH[0] ), .B0(n250), .Y(n125) );
  AOI21X1 U351 ( .A0(n127), .A1(n250), .B0(n123), .Y(n126) );
  OAI21X1 U352 ( .A0(gray_ready), .A1(n31), .B0(n213), .Y(n123) );
  OAI22XL U353 ( .A0(n308), .A1(n286), .B0(n184), .B1(n298), .Y(n199) );
  OAI22XL U354 ( .A0(n308), .A1(n287), .B0(n185), .B1(n298), .Y(n200) );
  OAI22XL U355 ( .A0(n308), .A1(n284), .B0(n186), .B1(n298), .Y(n201) );
  NAND2BX1 U356 ( .AN(gray_ready), .B(n64), .Y(n226) );
  OAI21XL U357 ( .A0(n213), .A1(n31), .B0(n359), .Y(n64) );
  NAND3X1 U358 ( .A(n85), .B(n86), .C(n87), .Y(n230) );
  AOI2BB2X1 U359 ( .B0(N172), .B1(n246), .A0N(n162), .A1N(n302), .Y(n85) );
  AOI22X1 U360 ( .A0(N201), .A1(n303), .B0(N187), .B1(n304), .Y(n86) );
  AOI221XL U361 ( .A0(N83), .A1(n299), .B0(N111), .B1(n300), .C0(n88), .Y(n87)
         );
  NAND3X1 U362 ( .A(n81), .B(n82), .C(n83), .Y(n229) );
  AOI2BB2X1 U363 ( .B0(N173), .B1(n246), .A0N(n163), .A1N(n302), .Y(n81) );
  AOI22X1 U364 ( .A0(N202), .A1(n303), .B0(N188), .B1(n304), .Y(n82) );
  AOI221XL U365 ( .A0(N84), .A1(n299), .B0(N112), .B1(n300), .C0(n84), .Y(n83)
         );
  AO22X1 U366 ( .A0(gray_data[6]), .A1(n343), .B0(n48), .B1(center_pixel[6]), 
        .Y(n210) );
  AO22X1 U367 ( .A0(gray_data[7]), .A1(n343), .B0(n48), .B1(center_pixel[7]), 
        .Y(n211) );
  BUFX16 U368 ( .A(n358), .Y(gray_addr[7]) );
  BUFX16 U369 ( .A(N169), .Y(gray_addr[6]) );
  BUFX16 U370 ( .A(n357), .Y(gray_addr[8]) );
  NOR3X1 U371 ( .A(n350), .B(N263), .C(N262), .Y(N265) );
  NAND3X1 U372 ( .A(n93), .B(n94), .C(n95), .Y(n232) );
  AOI2BB2X1 U373 ( .B0(n160), .B1(n246), .A0N(n160), .A1N(n302), .Y(n93) );
  AOI22X1 U374 ( .A0(N199), .A1(n303), .B0(N185), .B1(n304), .Y(n94) );
  AOI221XL U375 ( .A0(N81), .A1(n299), .B0(N109), .B1(n300), .C0(n96), .Y(n95)
         );
  NOR3X1 U376 ( .A(\sll_102_S2/SH[0] ), .B(N263), .C(N262), .Y(N264) );
  OAI22XL U377 ( .A0(n308), .A1(n288), .B0(n182), .B1(n298), .Y(n197) );
  OAI22XL U378 ( .A0(n308), .A1(n290), .B0(n183), .B1(n298), .Y(n198) );
  NAND3X1 U379 ( .A(n97), .B(n98), .C(n99), .Y(n233) );
  AOI2BB2X1 U380 ( .B0(gray_addr[6]), .B1(n246), .A0N(n159), .A1N(n302), .Y(
        n97) );
  AOI22X1 U381 ( .A0(N198), .A1(n303), .B0(N184), .B1(n304), .Y(n98) );
  AOI221XL U382 ( .A0(N80), .A1(n299), .B0(N108), .B1(n300), .C0(n100), .Y(n99) );
  NAND3X1 U383 ( .A(n89), .B(n90), .C(n91), .Y(n231) );
  AOI2BB2X1 U384 ( .B0(N171), .B1(n246), .A0N(n161), .A1N(n302), .Y(n89) );
  AOI22X1 U385 ( .A0(N200), .A1(n303), .B0(N186), .B1(n304), .Y(n90) );
  AOI221XL U386 ( .A0(N82), .A1(n299), .B0(N110), .B1(n300), .C0(n92), .Y(n91)
         );
  NOR3X1 U387 ( .A(n349), .B(N263), .C(\sll_102_S2/SH[0] ), .Y(N266) );
  NOR2X1 U388 ( .A(N263), .B(n351), .Y(N267) );
  NOR3X1 U389 ( .A(n347), .B(N262), .C(\sll_102_S2/SH[0] ), .Y(N268) );
  NOR3X1 U390 ( .A(n347), .B(N262), .C(n350), .Y(N269) );
  NOR3X1 U391 ( .A(n347), .B(\sll_102_S2/SH[0] ), .C(n349), .Y(N270) );
  BUFX16 U392 ( .A(n356), .Y(gray_addr[9]) );
  BUFX16 U393 ( .A(n355), .Y(gray_addr[10]) );
  NAND2X1 U394 ( .A(N262), .B(\sll_102_S2/SH[0] ), .Y(n351) );
  OAI22XL U395 ( .A0(n308), .A1(n291), .B0(n179), .B1(n298), .Y(n194) );
  OAI22XL U396 ( .A0(n308), .A1(n292), .B0(n180), .B1(n298), .Y(n195) );
  OAI22XL U397 ( .A0(n308), .A1(n289), .B0(n181), .B1(n298), .Y(n196) );
  CLKBUFX3 U398 ( .A(n68), .Y(n299) );
  OAI2BB2XL U399 ( .B0(n344), .B1(n128), .A0N(n224), .A1N(N41), .Y(n68) );
  NAND3X1 U400 ( .A(n136), .B(n137), .C(n138), .Y(n243) );
  AOI221XL U401 ( .A0(N74), .A1(n299), .B0(gray_addr[0]), .B1(n300), .C0(n139), 
        .Y(n138) );
  AOI22X1 U402 ( .A0(n152), .A1(n303), .B0(gray_addr[0]), .B1(n304), .Y(n137)
         );
  AOI2BB2X1 U403 ( .B0(gray_addr[0]), .B1(n246), .A0N(n152), .A1N(n302), .Y(
        n136) );
  NAND3X1 U404 ( .A(n113), .B(n114), .C(n115), .Y(n237) );
  AOI221XL U405 ( .A0(N76), .A1(n299), .B0(N104), .B1(n300), .C0(n116), .Y(
        n115) );
  AOI22X1 U406 ( .A0(N194), .A1(n303), .B0(N180), .B1(n304), .Y(n114) );
  AOI2BB2X1 U407 ( .B0(gray_addr[2]), .B1(n246), .A0N(n155), .A1N(n302), .Y(
        n113) );
  NAND3X1 U408 ( .A(n109), .B(n110), .C(n111), .Y(n236) );
  AOI22X1 U409 ( .A0(N195), .A1(n303), .B0(N181), .B1(n304), .Y(n110) );
  AOI221XL U410 ( .A0(N77), .A1(n299), .B0(N105), .B1(n300), .C0(n112), .Y(
        n111) );
  AOI2BB2X1 U411 ( .B0(gray_addr[3]), .B1(n246), .A0N(n156), .A1N(n302), .Y(
        n109) );
  NAND3X1 U412 ( .A(n105), .B(n106), .C(n107), .Y(n235) );
  AOI22X1 U413 ( .A0(N196), .A1(n303), .B0(N182), .B1(n304), .Y(n106) );
  AOI2BB2X1 U414 ( .B0(gray_addr[4]), .B1(n246), .A0N(n157), .A1N(n302), .Y(
        n105) );
  AOI221XL U415 ( .A0(N78), .A1(n299), .B0(N106), .B1(n300), .C0(n108), .Y(
        n107) );
  NAND3X1 U416 ( .A(n101), .B(n102), .C(n103), .Y(n234) );
  AOI2BB2X1 U417 ( .B0(gray_addr[5]), .B1(n246), .A0N(n158), .A1N(n302), .Y(
        n101) );
  AOI22X1 U418 ( .A0(N197), .A1(n303), .B0(N183), .B1(n304), .Y(n102) );
  AOI221XL U419 ( .A0(N79), .A1(n299), .B0(N107), .B1(n300), .C0(n104), .Y(
        n103) );
  NAND3X1 U420 ( .A(n117), .B(n118), .C(n119), .Y(n238) );
  AOI221XL U421 ( .A0(N75), .A1(n299), .B0(n154), .B1(n300), .C0(n120), .Y(
        n119) );
  AOI22X1 U422 ( .A0(N193), .A1(n303), .B0(n154), .B1(n304), .Y(n118) );
  AOI2BB2X1 U423 ( .B0(gray_addr[1]), .B1(n246), .A0N(n154), .A1N(n302), .Y(
        n117) );
  BUFX16 U424 ( .A(n354), .Y(gray_addr[11]) );
  BUFX16 U425 ( .A(n353), .Y(gray_addr[12]) );
  NAND3X1 U426 ( .A(n143), .B(n350), .C(n146), .Y(n140) );
  AO21X1 U427 ( .A0(n245), .A1(n224), .B0(n144), .Y(n146) );
  NOR2X1 U428 ( .A(n61), .B(n223), .Y(n244) );
  OAI22XL U429 ( .A0(n308), .A1(n294), .B0(n177), .B1(n298), .Y(n192) );
  OAI22XL U430 ( .A0(n308), .A1(n295), .B0(n178), .B1(n298), .Y(n193) );
  OAI2BB2XL U431 ( .B0(n344), .B1(n149), .A0N(n248), .A1N(N40), .Y(N42) );
  AOI31X1 U432 ( .A0(n245), .A1(n350), .A2(n224), .B0(n144), .Y(n149) );
  OR4X1 U433 ( .A(n152), .B(n154), .C(n155), .D(n156), .Y(n141) );
  OAI31XL U434 ( .A0(n127), .A1(n222), .A2(n223), .B0(n213), .Y(n241) );
  NAND2X1 U435 ( .A(n222), .B(n223), .Y(n31) );
  NAND4BX1 U436 ( .AN(n165), .B(n129), .C(n130), .D(n131), .Y(n127) );
  NOR2X1 U437 ( .A(n163), .B(n164), .Y(n130) );
  NOR4X1 U438 ( .A(n153), .B(n160), .C(n161), .D(n162), .Y(n131) );
  OAI22XL U439 ( .A0(n308), .A1(gray_addr[0]), .B0(n175), .B1(n298), .Y(n190)
         );
  NOR2X1 U440 ( .A(n245), .B(n224), .Y(n144) );
  OAI22XL U441 ( .A0(n308), .A1(n293), .B0(n176), .B1(n244), .Y(n191) );
  OAI21XL U442 ( .A0(n213), .A1(n31), .B0(n174), .Y(n189) );
  AND2X1 U443 ( .A(\r407/carry [12]), .B(gray_addr[12]), .Y(\r407/carry [13])
         );
  XOR2X1 U444 ( .A(gray_addr[12]), .B(\r407/carry [12]), .Y(N100) );
  AND2X1 U445 ( .A(\r407/carry [11]), .B(gray_addr[11]), .Y(\r407/carry [12])
         );
  XOR2X1 U446 ( .A(gray_addr[11]), .B(\r407/carry [11]), .Y(N99) );
  AND2X1 U447 ( .A(\r407/carry [10]), .B(gray_addr[10]), .Y(\r407/carry [11])
         );
  XOR2X1 U448 ( .A(gray_addr[10]), .B(\r407/carry [10]), .Y(N98) );
  AND2X1 U449 ( .A(\r407/carry [9]), .B(gray_addr[9]), .Y(\r407/carry [10]) );
  XOR2X1 U450 ( .A(gray_addr[9]), .B(\r407/carry [9]), .Y(N97) );
  AND2X1 U451 ( .A(\r407/carry [8]), .B(gray_addr[8]), .Y(\r407/carry [9]) );
  XOR2X1 U452 ( .A(gray_addr[8]), .B(\r407/carry [8]), .Y(N96) );
  AND2X1 U453 ( .A(\r407/carry [7]), .B(gray_addr[7]), .Y(\r407/carry [8]) );
  XOR2X1 U454 ( .A(gray_addr[7]), .B(\r407/carry [7]), .Y(N95) );
  OR2X1 U455 ( .A(gray_addr[6]), .B(\r407/carry [6]), .Y(\r407/carry [7]) );
  XNOR2X1 U456 ( .A(\r407/carry [6]), .B(gray_addr[6]), .Y(N94) );
  OR2X1 U457 ( .A(gray_addr[5]), .B(\r407/carry [5]), .Y(\r407/carry [6]) );
  XNOR2X1 U458 ( .A(\r407/carry [5]), .B(gray_addr[5]), .Y(N93) );
  OR2X1 U459 ( .A(gray_addr[4]), .B(\r407/carry [4]), .Y(\r407/carry [5]) );
  XNOR2X1 U460 ( .A(\r407/carry [4]), .B(gray_addr[4]), .Y(N92) );
  OR2X1 U461 ( .A(gray_addr[3]), .B(\r407/carry [3]), .Y(\r407/carry [4]) );
  XNOR2X1 U462 ( .A(\r407/carry [3]), .B(gray_addr[3]), .Y(N91) );
  OR2X1 U463 ( .A(gray_addr[2]), .B(gray_addr[1]), .Y(\r407/carry [3]) );
  XNOR2X1 U464 ( .A(gray_addr[1]), .B(gray_addr[2]), .Y(N90) );
  OR2X1 U465 ( .A(gray_addr[11]), .B(\r405/carry[11] ), .Y(\r405/carry[12] )
         );
  OR2X1 U466 ( .A(gray_addr[10]), .B(\r405/carry[10] ), .Y(\r405/carry[11] )
         );
  OR2X1 U467 ( .A(gray_addr[9]), .B(\r405/carry[9] ), .Y(\r405/carry[10] ) );
  OR2X1 U468 ( .A(gray_addr[8]), .B(\r405/carry[8] ), .Y(\r405/carry[9] ) );
  AND2X1 U469 ( .A(\r405/carry[7] ), .B(gray_addr[7]), .Y(\r405/carry[8] ) );
  OR2X1 U470 ( .A(gray_addr[6]), .B(\r405/carry[6] ), .Y(\r405/carry[7] ) );
  OR2X1 U471 ( .A(gray_addr[5]), .B(\r405/carry[5] ), .Y(\r405/carry[6] ) );
  OR2X1 U472 ( .A(gray_addr[4]), .B(\r405/carry[4] ), .Y(\r405/carry[5] ) );
  OR2X1 U473 ( .A(gray_addr[3]), .B(\r405/carry[3] ), .Y(\r405/carry[4] ) );
  OR2X1 U474 ( .A(gray_addr[2]), .B(\r405/carry[2] ), .Y(\r405/carry[3] ) );
  OR2X1 U475 ( .A(gray_addr[1]), .B(gray_addr[0]), .Y(\r405/carry[2] ) );
  AND2X1 U476 ( .A(\add_69_S2/carry [12]), .B(gray_addr[12]), .Y(
        \add_69_S2/carry [13]) );
  XOR2X1 U477 ( .A(gray_addr[12]), .B(\add_69_S2/carry [12]), .Y(N114) );
  AND2X1 U478 ( .A(\add_69_S2/carry [11]), .B(gray_addr[11]), .Y(
        \add_69_S2/carry [12]) );
  XOR2X1 U479 ( .A(gray_addr[11]), .B(\add_69_S2/carry [11]), .Y(N113) );
  AND2X1 U480 ( .A(\add_69_S2/carry [10]), .B(gray_addr[10]), .Y(
        \add_69_S2/carry [11]) );
  XOR2X1 U481 ( .A(gray_addr[10]), .B(\add_69_S2/carry [10]), .Y(N112) );
  AND2X1 U482 ( .A(\add_69_S2/carry [9]), .B(gray_addr[9]), .Y(
        \add_69_S2/carry [10]) );
  XOR2X1 U483 ( .A(gray_addr[9]), .B(\add_69_S2/carry [9]), .Y(N111) );
  AND2X1 U484 ( .A(\add_69_S2/carry [8]), .B(gray_addr[8]), .Y(
        \add_69_S2/carry [9]) );
  XOR2X1 U485 ( .A(gray_addr[8]), .B(\add_69_S2/carry [8]), .Y(N110) );
  AND2X1 U486 ( .A(\add_69_S2/carry [7]), .B(gray_addr[7]), .Y(
        \add_69_S2/carry [8]) );
  XOR2X1 U487 ( .A(gray_addr[7]), .B(\add_69_S2/carry [7]), .Y(N109) );
  AND2X1 U488 ( .A(\add_69_S2/carry [6]), .B(gray_addr[6]), .Y(
        \add_69_S2/carry [7]) );
  XOR2X1 U489 ( .A(gray_addr[6]), .B(\add_69_S2/carry [6]), .Y(N108) );
  AND2X1 U490 ( .A(\add_69_S2/carry [5]), .B(gray_addr[5]), .Y(
        \add_69_S2/carry [6]) );
  XOR2X1 U491 ( .A(gray_addr[5]), .B(\add_69_S2/carry [5]), .Y(N107) );
  AND2X1 U492 ( .A(\add_69_S2/carry [4]), .B(gray_addr[4]), .Y(
        \add_69_S2/carry [5]) );
  XOR2X1 U493 ( .A(gray_addr[4]), .B(\add_69_S2/carry [4]), .Y(N106) );
  AND2X1 U494 ( .A(\add_69_S2/carry [3]), .B(gray_addr[3]), .Y(
        \add_69_S2/carry [4]) );
  XOR2X1 U495 ( .A(gray_addr[3]), .B(\add_69_S2/carry [3]), .Y(N105) );
  AND2X1 U496 ( .A(gray_addr[1]), .B(gray_addr[2]), .Y(\add_69_S2/carry [3])
         );
  XOR2X1 U497 ( .A(gray_addr[2]), .B(gray_addr[1]), .Y(N104) );
  OR2X1 U498 ( .A(gray_addr[12]), .B(\sub_75_S2/carry [12]), .Y(
        \sub_75_S2/carry [13]) );
  XNOR2X1 U499 ( .A(\sub_75_S2/carry [12]), .B(gray_addr[12]), .Y(N190) );
  OR2X1 U500 ( .A(gray_addr[11]), .B(\sub_75_S2/carry [11]), .Y(
        \sub_75_S2/carry [12]) );
  XNOR2X1 U501 ( .A(\sub_75_S2/carry [11]), .B(gray_addr[11]), .Y(N189) );
  OR2X1 U502 ( .A(gray_addr[10]), .B(\sub_75_S2/carry [10]), .Y(
        \sub_75_S2/carry [11]) );
  XNOR2X1 U503 ( .A(\sub_75_S2/carry [10]), .B(gray_addr[10]), .Y(N188) );
  OR2X1 U504 ( .A(gray_addr[9]), .B(\sub_75_S2/carry [9]), .Y(
        \sub_75_S2/carry [10]) );
  XNOR2X1 U505 ( .A(\sub_75_S2/carry [9]), .B(gray_addr[9]), .Y(N187) );
  OR2X1 U506 ( .A(gray_addr[8]), .B(\sub_75_S2/carry [8]), .Y(
        \sub_75_S2/carry [9]) );
  XNOR2X1 U507 ( .A(\sub_75_S2/carry [8]), .B(gray_addr[8]), .Y(N186) );
  OR2X1 U508 ( .A(gray_addr[7]), .B(\sub_75_S2/carry [7]), .Y(
        \sub_75_S2/carry [8]) );
  XNOR2X1 U509 ( .A(\sub_75_S2/carry [7]), .B(gray_addr[7]), .Y(N185) );
  AND2X1 U510 ( .A(\sub_75_S2/carry [6]), .B(gray_addr[6]), .Y(
        \sub_75_S2/carry [7]) );
  XOR2X1 U511 ( .A(gray_addr[6]), .B(\sub_75_S2/carry [6]), .Y(N184) );
  AND2X1 U512 ( .A(\sub_75_S2/carry [5]), .B(gray_addr[5]), .Y(
        \sub_75_S2/carry [6]) );
  XOR2X1 U513 ( .A(gray_addr[5]), .B(\sub_75_S2/carry [5]), .Y(N183) );
  AND2X1 U514 ( .A(\sub_75_S2/carry [4]), .B(gray_addr[4]), .Y(
        \sub_75_S2/carry [5]) );
  XOR2X1 U515 ( .A(gray_addr[4]), .B(\sub_75_S2/carry [4]), .Y(N182) );
  AND2X1 U516 ( .A(\sub_75_S2/carry [3]), .B(gray_addr[3]), .Y(
        \sub_75_S2/carry [4]) );
  XOR2X1 U517 ( .A(gray_addr[3]), .B(\sub_75_S2/carry [3]), .Y(N181) );
  AND2X1 U518 ( .A(gray_addr[1]), .B(gray_addr[2]), .Y(\sub_75_S2/carry [3])
         );
  XOR2X1 U519 ( .A(gray_addr[2]), .B(gray_addr[1]), .Y(N180) );
  AND2X1 U520 ( .A(\add_76/carry[12] ), .B(gray_addr[12]), .Y(
        \add_76/carry[13] ) );
  XOR2X1 U521 ( .A(gray_addr[12]), .B(\add_76/carry[12] ), .Y(N204) );
  AND2X1 U522 ( .A(\add_76/carry[11] ), .B(gray_addr[11]), .Y(
        \add_76/carry[12] ) );
  XOR2X1 U523 ( .A(gray_addr[11]), .B(\add_76/carry[11] ), .Y(N203) );
  AND2X1 U524 ( .A(\add_76/carry[10] ), .B(gray_addr[10]), .Y(
        \add_76/carry[11] ) );
  XOR2X1 U525 ( .A(gray_addr[10]), .B(\add_76/carry[10] ), .Y(N202) );
  AND2X1 U526 ( .A(\add_76/carry[9] ), .B(gray_addr[9]), .Y(\add_76/carry[10] ) );
  XOR2X1 U527 ( .A(gray_addr[9]), .B(\add_76/carry[9] ), .Y(N201) );
  AND2X1 U528 ( .A(\add_76/carry[8] ), .B(gray_addr[8]), .Y(\add_76/carry[9] )
         );
  XOR2X1 U529 ( .A(gray_addr[8]), .B(\add_76/carry[8] ), .Y(N200) );
  AND2X1 U530 ( .A(\add_76/carry[7] ), .B(gray_addr[7]), .Y(\add_76/carry[8] )
         );
  XOR2X1 U531 ( .A(gray_addr[7]), .B(\add_76/carry[7] ), .Y(N199) );
  AND2X1 U532 ( .A(\add_76/carry[6] ), .B(gray_addr[6]), .Y(\add_76/carry[7] )
         );
  XOR2X1 U533 ( .A(gray_addr[6]), .B(\add_76/carry[6] ), .Y(N198) );
  AND2X1 U534 ( .A(\add_76/carry[5] ), .B(gray_addr[5]), .Y(\add_76/carry[6] )
         );
  XOR2X1 U535 ( .A(gray_addr[5]), .B(\add_76/carry[5] ), .Y(N197) );
  AND2X1 U536 ( .A(\add_76/carry[4] ), .B(gray_addr[4]), .Y(\add_76/carry[5] )
         );
  XOR2X1 U537 ( .A(gray_addr[4]), .B(\add_76/carry[4] ), .Y(N196) );
  AND2X1 U538 ( .A(\add_76/carry[3] ), .B(gray_addr[3]), .Y(\add_76/carry[4] )
         );
  XOR2X1 U539 ( .A(gray_addr[3]), .B(\add_76/carry[3] ), .Y(N195) );
  AND2X1 U540 ( .A(\add_76/carry[2] ), .B(gray_addr[2]), .Y(\add_76/carry[3] )
         );
  XOR2X1 U541 ( .A(gray_addr[2]), .B(\add_76/carry[2] ), .Y(N194) );
  OR2X1 U542 ( .A(gray_addr[1]), .B(gray_addr[0]), .Y(\add_76/carry[2] ) );
  XNOR2X1 U543 ( .A(gray_addr[0]), .B(gray_addr[1]), .Y(N193) );
  OR2X1 U544 ( .A(gray_addr[12]), .B(\sub_74_S2/carry [12]), .Y(
        \sub_74_S2/carry [13]) );
  XNOR2X1 U545 ( .A(\sub_74_S2/carry [12]), .B(gray_addr[12]), .Y(N175) );
  OR2X1 U546 ( .A(gray_addr[11]), .B(\sub_74_S2/carry [11]), .Y(
        \sub_74_S2/carry [12]) );
  XNOR2X1 U547 ( .A(\sub_74_S2/carry [11]), .B(gray_addr[11]), .Y(N174) );
  OR2X1 U548 ( .A(gray_addr[10]), .B(\sub_74_S2/carry [10]), .Y(
        \sub_74_S2/carry [11]) );
  XNOR2X1 U549 ( .A(\sub_74_S2/carry [10]), .B(gray_addr[10]), .Y(N173) );
  OR2X1 U550 ( .A(gray_addr[9]), .B(\sub_74_S2/carry [9]), .Y(
        \sub_74_S2/carry [10]) );
  XNOR2X1 U551 ( .A(\sub_74_S2/carry [9]), .B(gray_addr[9]), .Y(N172) );
  OR2X1 U552 ( .A(gray_addr[8]), .B(gray_addr[7]), .Y(\sub_74_S2/carry [9]) );
  XNOR2X1 U553 ( .A(gray_addr[7]), .B(gray_addr[8]), .Y(N171) );
  NAND4X1 U554 ( .A(gray_addr[3]), .B(gray_addr[2]), .C(gray_addr[1]), .D(
        gray_addr[0]), .Y(n323) );
  NAND4BX1 U555 ( .AN(n323), .B(gray_addr[4]), .C(gray_addr[6]), .D(
        gray_addr[5]), .Y(N160) );
  NAND2BX1 U556 ( .AN(center_pixel[4]), .B(gray_data[4]), .Y(n324) );
  OAI222XL U557 ( .A0(gray_data[6]), .A1(n325), .B0(n252), .B1(n325), .C0(
        gray_data[6]), .C1(n252), .Y(n336) );
  OAI22XL U558 ( .A0(n326), .A1(n340), .B0(center_pixel[5]), .B1(n326), .Y(
        n334) );
  OAI21XL U559 ( .A0(center_pixel[1]), .A1(n338), .B0(n327), .Y(n330) );
  NOR2BX1 U560 ( .AN(center_pixel[2]), .B(gray_data[2]), .Y(n328) );
  OAI22XL U561 ( .A0(n328), .A1(n339), .B0(center_pixel[3]), .B1(n328), .Y(
        n329) );
  AO22X1 U562 ( .A0(n341), .A1(center_pixel[7]), .B0(n336), .B1(n335), .Y(n337) );
endmodule

