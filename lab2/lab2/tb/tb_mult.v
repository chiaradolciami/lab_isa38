//`timescale 1ns

module test_fpmult();

   wire CLK_i;
   wire RST_n_i;
   wire [0:31] DIN_i;
   wire [0:31] DOUT_i;



	clk_gen CG(
		.CLK(CLK_i),
	    	.RST_n(RST_n_i));

	data_maker SM(
		.CLK(CLK_i),
		.DATA(DIN_i));

	FPmul UUT(
		.FP_A (DIN_i),
		.FP_B (DIN_i),
		.clk (CLK_i),
		.FP_Z (DOUT_i));

	data_sink DS(
		.CLK(CLK_i),
		.RST_n(RST_n_i),
		.DIN(DOUT_i));   

endmodule