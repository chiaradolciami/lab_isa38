LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY DECODE IS
PORT(   clock, resetn, flush, regWrite      : IN STD_LOGIC;
        instruction, address_in, data_RF    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        address_RF                          : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	Hazard_stall			    : IN std_logic;
        address_out, op1, op2               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        rd                                  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        func3                               : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        immediate                           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		  
		  --controls
		  
	D_ALUOp_out	 : out std_logic_vector(1 downto 0);
	D_ALU_src_out	 : out std_logic;
	D_Branch_out     : out std_logic;
	D_Jump_out       : out std_logic;
	D_MemR_out       : out std_logic;
	D_MemW_out       : out std_logic;
	D_Mem_to_Reg_out : out std_logic;
	D_Reg_Write_out  : out std_logic;

		--forwarding--

	F_add_reg1 : out std_logic_vector(4 downto 0);
	F_add_reg2 : out std_logic_vector(4 downto 0));
	
		  
END entity DECODE;


ARCHITECTURE arch OF DECODE IS

COMPONENT RF IS
PORT(	reg1, reg2, add_write   : IN std_logic_vector(4 DOWNTO 0);
		data_write              : IN std_logic_vector(31 DOWNTO 0);
		RegWrite, clk, reset           : IN std_logic;
        data1, data2            : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT imm_gen IS
PORT(   instruction_in  : IN std_logic_vector(31 DOWNTO 0);
        immediate_out : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT pipe_IDEXE IS
PORT (  clock, resetn, flush        : IN STD_LOGIC;   
        address_in, op1_in, op2_in  : IN  std_logic_vector(31 DOWNTO 0);
        rd_in                       : IN  std_logic_vector(4 DOWNTO 0);
        imm_inst_in                  : IN  std_logic_vector(31 DOWNTO 0);
        func3_in           : IN  std_logic_vector(3 DOWNTO 0);
        address_out, op1_out, op2_out   : OUT  std_logic_vector(31 DOWNTO 0);
        rd_out                          : OUT  std_logic_vector(4 DOWNTO 0);
        imm_inst_out                     : OUT  std_logic_vector(31 DOWNTO 0);
        func3_out              : OUT  std_logic_vector(3 DOWNTO 0);
		  
		  --CONTROLS
		  
ALUOp_out		 : out std_logic_vector(1 downto 0);
ALU_src_out	: out std_logic;
Branch_out      : out std_logic;
Jump_out        : out std_logic;
MemR_out     : out std_logic;
MemW_out    : out std_logic;
Mem_to_Reg_out : out std_logic;
Reg_Write_out  : out std_logic;

ALUOp_in		 : in std_logic_vector(1 downto 0);
ALU_src_in	: in std_logic;
Branch_in      : in std_logic;
Jump_in        : in std_logic;
MemR_in     : in std_logic;
MemW_in    : in std_logic;
Mem_to_Reg_in : in std_logic;
Reg_Write_in  : in std_logic;

		--Forwarding
Add_reg1_in : in std_logic_vector (4 downto 0);
Add_reg2_in : in std_logic_vector (4 downto 0);
Add_reg1_out : out std_logic_vector (4 downto 0);
Add_reg2_out : out std_logic_vector (4 downto 0)); 

END COMPONENT;

COMPONENT Control_unit is 
port(
opcode: in std_logic_vector(6 downto 0);

ALUOp		 : out std_logic_vector(1 downto 0);
ALU_src	: out std_logic;
Branch      : out std_logic;
Jump        : out std_logic;
MemR     : out std_logic;
MemW    : out std_logic;
Mem_to_Reg : out std_logic;
Reg_Write  : out std_logic);

END COMPONENT;

signal immediate_instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal op1s, op2s, sig_instr : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal func : STD_LOGIC_VECTOR(3 DOWNTO 0);



signal ALUOp_S		   :  std_logic_vector(1 downto 0);
signal ALU_src_S		:  std_logic;
signal Branch_S      :  std_logic;
signal Jump_S        :  std_logic;
signal MemR_S        :  std_logic;
signal MemW_S        :  std_logic;
signal Mem_to_Reg_S  :  std_logic;
signal Reg_Write_S   :  std_logic;

--Hazard_mux_controlUnit

signal ALUOp_Haz_mux	   :  std_logic_vector(1 downto 0);
signal ALU_src_Haz_mux	   :  std_logic;
signal Branch_Haz_mux      :  std_logic;
signal Jump_Haz_mux        :  std_logic;
signal MemR_Haz_mux        :  std_logic;
signal MemW_Haz_mux        :  std_logic;
signal Mem_to_Reg_Haz_mux  :  std_logic;
signal Reg_Write_Haz_mux   :  std_logic;

BEGIN

sig_instr <= instruction;
    
func<=instruction(30)&instruction(14 downto 12);

register_file: RF PORT MAP (reg1=>instruction(19 downto 15), 
                            reg2=>instruction(24 downto 20), 
                            add_write=>address_RF, 
                            data_write => data_RF, 
                            RegWrite => regWrite,
                            clk => clock,
			    reset => resetn,
                            data1 => op1s, 
                            data2 => op2s);

immediate_gen: imm_gen PORT MAP (instruction_in => sig_instr, 
                                 immediate_out => immediate_instruction );

stage2: pipe_IDEXE PORT MAP (   clock=>clock, resetn=>resetn, flush => flush, address_in=>address_in, 
                                op1_in=>op1s, op2_in=>op2s, rd_in=>instruction(11 downto 7),
                                imm_inst_in => immediate_instruction,                 
                                func3_in => func,         
                                address_out=>address_out, op1_out=>op1, op2_out=>op2,   
                                rd_out => rd,                          
                                imm_inst_out => immediate,                    
                                func3_out => func3,
										  
				ALUOp_in	 =>     ALUOp_Haz_mux,
				ALU_src_in	=>  ALU_src_Haz_mux,
				Branch_in =>     Branch_Haz_mux, 
				Jump_in =>       Jump_Haz_mux,      
				MemR_in =>       MemR_Haz_mux,
				MemW_in  =>      MemW_Haz_mux,
				Mem_to_Reg_in => Mem_to_Reg_Haz_mux,
				Reg_Write_in =>  Reg_Write_Haz_mux,
											
				ALUOp_out	 =>   D_ALUOp_out,
				ALU_src_out	=>    D_ALU_src_out,
				Branch_out =>     D_Branch_out, 
				Jump_out =>       D_Jump_out,      
				MemR_out =>       D_MemR_out,
				MemW_out  =>      D_MemW_out,
				Mem_to_Reg_out => D_Mem_to_Reg_out,
				Reg_Write_out =>  D_Reg_Write_out,
				
				----- forwarding --------				
				Add_reg1_in  =>   instruction(19 downto 15),
				Add_reg2_in  =>   instruction(24 downto 20),
				Add_reg1_out =>   F_add_reg1,
				Add_reg2_out =>   F_add_reg2);
										  
										  
										  
										  

Hazard_control_zero_proc : process (Hazard_stall, ALUOp_S, ALU_src_S, Branch_S, Jump_S, MemR_S, MemW_S, Mem_to_Reg_S, Reg_Write_S)

begin

Case Hazard_stall is 
when '0' =>
	
ALUOp_Haz_mux	     <= "00";
ALU_src_Haz_mux	     <= '0';
Branch_Haz_mux       <= '0';
Jump_Haz_mux         <= '0';
MemR_Haz_mux         <= '0';
MemW_Haz_mux         <= '0';
Mem_to_Reg_Haz_mux   <= '0';
Reg_Write_Haz_mux    <= '0';

when '1' =>

ALUOp_Haz_mux	     <= ALUOp_S;
ALU_src_Haz_mux	     <= ALU_src_S;
Branch_Haz_mux       <= Branch_S;
Jump_Haz_mux         <= Jump_S;
MemR_Haz_mux         <= MemR_S;
MemW_Haz_mux         <= MemW_S;
Mem_to_Reg_Haz_mux   <= Mem_to_Reg_S;
Reg_Write_Haz_mux    <= Reg_Write_S;

when others =>

ALUOp_Haz_mux	     <= ALUOp_S;
ALU_src_Haz_mux	     <= ALU_src_S;
Branch_Haz_mux       <= Branch_S;
Jump_Haz_mux         <= Jump_S;
MemR_Haz_mux         <= MemR_S;
MemW_Haz_mux         <= MemW_S;
Mem_to_Reg_Haz_mux   <= Mem_to_Reg_S;
Reg_Write_Haz_mux    <= Reg_Write_S;

end case;
end process;
										  
										  
										  
Control_unit_port: Control_unit PORT MAP (
															opcode => instruction(6 downto 0),
															
															ALUOp	 =>    ALUOp_S,
															ALU_src	=>  ALU_src_S,
															Branch =>    Branch_S, 
															Jump =>      Jump_S,      
															MemR =>      MemR_S,
															MemW  =>     MemW_S,
															Mem_to_Reg => Mem_to_Reg_S,
															Reg_Write =>  Reg_Write_S
															);


END arch;
