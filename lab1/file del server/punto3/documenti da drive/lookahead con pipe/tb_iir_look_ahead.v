//`timescale 1ns

module testIIR_look_ahead_pipe();

   wire CLK_i;
   wire RST_n_i;
   wire [0:7] DIN_i;
   wire VIN_i;
   wire [0:6] A1_i;
   wire [0:6] B1_i;
   wire [0:6] B0_i;
//------------------------Add for Look_Haead_Pipe-----------------------

   wire [0:4] B0A1_i;
   wire [0:4] B1A1_i;
   wire [0:2] A1_2_i;
   wire [0:8] B0A1_2_i;


   wire [0:7] DOUT_i;
   wire VOUT_i;
   wire END_SIM_i;

   clk_gen CG(
       .END_SIM(END_SIM_i),
  	    .CLK(CLK_i),
	    .RST_n(RST_n_i));

   data_maker_look_ahead SM(
       .CLK(CLK_i),
	    .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .A1(A1_i),
		 .B1(B1_i),
                 .B0(B0_i),
		 .B1A1(B1A1_i),
  		 .B0A1(B0A1_i),
  		 .A1_2(A1_2_i),
                 .B0A1_2(B0A1_2_i),
		 .END_SIM(END_SIM_i));

   IIRlookahead UUT(.CLK(CLK_i),
	         .RSTn(RST_n_i),
	         .DIN(DIN_i),
                 .VIN(VIN_i),
		     .A1(A1_i),
		     .B1(B1_i),
		     .B0(B0_i),
		     .B0A1(B0A1_i),
	  	     .B1A1(B1A1_i),
		     .A1_2(A1_2_i),
		     .B0A1_2(B0A1_2_i),
                 .DOUT(DOUT_i),
                 .VOUT(VOUT_i));

   data_sink DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
		.DIN(DOUT_i));   

endmodule

		   