//TestBench RISCV



module tb();

   wire CLK;
   wire Reset;

   wire [31:0] Instruction;
   wire [31:0] PC;
    
   wire Flag_MemRead_DM;
   wire Flag_MemWrite_DM;
   wire [31:0]  Add_from_Alu;
   wire [31:0] Data_Read_DM;
   wire [31:0] Data_Write_DM;


clk_gen CG(
           .CLK(CLK),
           .RST_n(Reset));


IM Instrucion_Memory(	
		      .Address_in_Pc(PC),
		      .Instruction_out(Instruction));


DM Data_Memory(
		.Address_in_Alu(Add_from_Alu),
		.Write_Data_IN(Data_Write_DM),
		.Read_Data_OUT(Data_Read_DM),
		
		.RST(Reset),
		.M_read(Flag_MemRead_DM),
		.M_write(Flag_MemWrite_DM));


RiscV UUT (
		.Clock(CLK),
		.Reset(Reset),
		
		.Instruction_IM(Instruction),
		.Read_Data_DM(Data_Read_DM),
		
		//-- Control Sig Data Memory --
		.f_DM_MemRead(Flag_MemRead_DM),
		.f_DM_MemWrite(Flag_MemWrite_DM),
		
		.PC_IM(PC),
		.ALU_Address_DM(Add_from_Alu),
		.Write_Data_DM(Data_Write_DM));


endmodule
