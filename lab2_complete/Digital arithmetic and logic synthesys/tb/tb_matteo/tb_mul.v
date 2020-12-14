//`timescale 1ns

module testmul();

   wire CLK_i;
   //wire RST_n_i;
   wire [0:31] DIN_i;
   //wire VIN_i;
   //wire [0:31] A1_i;
   //wire [0:31] B1_i;
   //wire [0:31] B0_i;

   wire [0:31] DOUT_i;
   //wire VOUT_i;
   wire END_SIM_i;

   clk_gen CG(
       .END_SIM(END_SIM_i),
  	    .CLK(CLK_i));
	    //.RST_n(RST_n_i));

   data_maker SM(
       .CLK(CLK_i),
	    //.RST_n(RST_n_i),
		 //.VOUT(VIN_i),
		 .DATA(DIN_i));
		 //.A1(A1_i),
		 //.B1(B1_i),
         //.B0(B0_i),
		 //.END_SIM(END_SIM_i));

   FPmul UUT(.CLK(CLK_i),
	    //.RSTn(RST_n_i),
	    .FP_A(DIN_i),
            //.VIN(VIN_i),
		 //.A1(A1_i),
		// .B1(B1_i),
		 //.B0(B0_i),

       .FP_B(DIN_i));
       //.VOUT(VOUT_i));

   data_sink DS(.CLK(CLK_i),
		//.RST_n(RST_n_i),
		//.VIN(VOUT_i),
		.DIN(DOUT_i));   

endmodule

		   
