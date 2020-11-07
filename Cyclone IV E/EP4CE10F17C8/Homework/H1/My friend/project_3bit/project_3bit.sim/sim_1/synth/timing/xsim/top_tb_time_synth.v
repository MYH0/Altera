// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Nov  1 17:25:46 2020
// Host        : LAPTOP-3512AU7E running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/lenovo/Desktop/fpga/fpga/project_3bit/project_3bit.sim/sim_1/synth/timing/xsim/top_tb_time_synth.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module top
   (a,
    b,
    c,
    chaoqian_c1,
    chaoqian_sum,
    f_3bits_add_c1,
    f_3bits_add_sum);
  input [2:0]a;
  input [2:0]b;
  input c;
  output chaoqian_c1;
  output [2:0]chaoqian_sum;
  output f_3bits_add_c1;
  output [2:0]f_3bits_add_sum;

  wire [2:0]a;
  wire [2:0]a_IBUF;
  wire [2:0]b;
  wire [2:0]b_IBUF;
  wire c;
  wire c_IBUF;
  wire chaoqian_c1;
  wire chaoqian_c1_OBUF_inst_i_2_n_0;
  wire [2:0]chaoqian_sum;
  wire f_3bits_add_c1;
  wire f_3bits_add_c1_OBUF;
  wire [2:0]f_3bits_add_sum;
  wire [2:0]f_3bits_add_sum_OBUF;

initial begin
 $sdf_annotate("top_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  IBUF \b_IBUF[2]_inst 
       (.I(b[2]),
        .O(b_IBUF[2]));
  IBUF c_IBUF_inst
       (.I(c),
        .O(c_IBUF));
  OBUF chaoqian_c1_OBUF_inst
       (.I(f_3bits_add_c1_OBUF),
        .O(chaoqian_c1));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    chaoqian_c1_OBUF_inst_i_1
       (.I0(b_IBUF[2]),
        .I1(a_IBUF[2]),
        .I2(chaoqian_c1_OBUF_inst_i_2_n_0),
        .O(f_3bits_add_c1_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    chaoqian_c1_OBUF_inst_i_2
       (.I0(c_IBUF),
        .I1(a_IBUF[0]),
        .I2(b_IBUF[0]),
        .I3(b_IBUF[1]),
        .I4(a_IBUF[1]),
        .O(chaoqian_c1_OBUF_inst_i_2_n_0));
  OBUF \chaoqian_sum_OBUF[0]_inst 
       (.I(f_3bits_add_sum_OBUF[0]),
        .O(chaoqian_sum[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \chaoqian_sum_OBUF[0]_inst_i_1 
       (.I0(a_IBUF[0]),
        .I1(c_IBUF),
        .I2(b_IBUF[0]),
        .O(f_3bits_add_sum_OBUF[0]));
  OBUF \chaoqian_sum_OBUF[1]_inst 
       (.I(f_3bits_add_sum_OBUF[1]),
        .O(chaoqian_sum[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \chaoqian_sum_OBUF[1]_inst_i_1 
       (.I0(b_IBUF[0]),
        .I1(a_IBUF[0]),
        .I2(c_IBUF),
        .I3(b_IBUF[1]),
        .I4(a_IBUF[1]),
        .O(f_3bits_add_sum_OBUF[1]));
  OBUF \chaoqian_sum_OBUF[2]_inst 
       (.I(f_3bits_add_sum_OBUF[2]),
        .O(chaoqian_sum[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \chaoqian_sum_OBUF[2]_inst_i_1 
       (.I0(chaoqian_c1_OBUF_inst_i_2_n_0),
        .I1(a_IBUF[2]),
        .I2(b_IBUF[2]),
        .O(f_3bits_add_sum_OBUF[2]));
  OBUF f_3bits_add_c1_OBUF_inst
       (.I(f_3bits_add_c1_OBUF),
        .O(f_3bits_add_c1));
  OBUF \f_3bits_add_sum_OBUF[0]_inst 
       (.I(f_3bits_add_sum_OBUF[0]),
        .O(f_3bits_add_sum[0]));
  OBUF \f_3bits_add_sum_OBUF[1]_inst 
       (.I(f_3bits_add_sum_OBUF[1]),
        .O(f_3bits_add_sum[1]));
  OBUF \f_3bits_add_sum_OBUF[2]_inst 
       (.I(f_3bits_add_sum_OBUF[2]),
        .O(f_3bits_add_sum[2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
