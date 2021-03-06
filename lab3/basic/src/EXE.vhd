library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EX_unit is
port (
      		CLK               : in std_logic;
		RST		  : in std_logic;
		flush             : in std_logic;
		
		ALUOp_in 		 : in std_logic_vector(1 downto 0);
		funct3_in	    : in std_logic_vector(2 downto 0);
		opcode_b5_in    : in std_logic;
		ALU_src			 : in std_logic;
		
		
		RS1_in, RS2_in  : in std_logic_vector(31 downto 0);
		imm_in          : in std_logic_vector(31 downto 0);
		addr_in         : in std_logic_vector(31 downto 0);
		rd_addr_in: in std_logic_vector(4 downto 0);
		
		
		  Branch_in       : in std_logic;
		  Jump_in         : in std_logic;
		  MemR_in         : in std_logic;
		  MemW_in         : in std_logic;
		  Mem_to_Reg_in   : in std_logic;
		  Reg_Write_in    : in std_logic;
		
		  ---- forwarding----
		  operand_WB      : in std_logic_vector(31 downto 0);
		  operand_MEM	  : in std_logic_vector(31 downto 0);
		  Forward_A	  : in std_logic_vector (1 downto 0);
		  Forward_B	  : in std_logic_vector (1 downto 0);
		  
		  
		
		  ZeroFlag_out    : out std_logic;
		  AluRes_out        : out std_logic_vector(31 downto 0);       
		  addr_sum_out	 : out std_logic_vector(31 downto 0);
		  RS2_out         : out std_logic_vector(31 downto 0);
		  rd_addr_out: out std_logic_vector(4 downto 0);
	   
		
		  ---control outs 
		  Branch_out      : out std_logic;
		  Jump_out        : out std_logic;
		  MemR_out        : out std_logic;
		  MemW_out        : out std_logic;
		  Mem_to_Reg_out  : out std_logic;
		  Reg_Write_out   : out std_logic);	
		
		
end EX_unit;

architecture beh of EX_unit is 

signal sig_imm, sig_op1, sig_op2, sig_addr_sum, sig_imm_shift, sig_data : std_logic_vector(31 downto 0);
signal sig_addr_sum_sign: signed(31 downto 0);
signal sig_ALUCont: std_logic_vector(3 downto 0);
signal ALUres_sig: std_logic_vector(31 downto 0);
signal sig_ZeroFlag: std_logic;
signal Op_forwarding1: std_logic_vector(31 downto 0);
signal Op_forwarding2: std_logic_vector(31 downto 0);

		  
--- COMPONENTS-----------

component ALUControl is
port(
	ALUOp 		 : in std_logic_vector(1 downto 0);
	funct3	    : in std_logic_vector(2 downto 0);
	opcode_b5    : in std_logic;
	ALUCont	    : out std_logic_vector(3 downto 0)
);
end component;

component ALU is 
port(
RS1: in std_logic_vector(31 downto 0);
RS2: in std_logic_vector(31 downto 0);
AluCont: in std_logic_vector(3 downto 0);
addr_sum: in std_logic_vector(31 downto 0);
AluRes: out std_logic_vector(31 downto 0);
ZeroFlag: out std_logic);
end component;

component pipe_EXMEM is
port (  CLK, resetn, flush        : in std_logic; 
 
        rd_addr_in : in  std_logic_vector(4 downto 0);
        addr_sum_in: in std_logic_vector(31 downto 0);
		  ALURes_in: in std_logic_vector(31 downto 0);
		  ZeroFlag_in: in std_logic;
		  RS2_in: in std_logic_vector(31 downto 0);
		  
		  
		  ---WB/MEM signals
		  Branch_in       : in std_logic;
		  Jump_in         : in std_logic;
		  MemR_in     	  : in std_logic;
		  MemW_in         : in std_logic;
		  Mem_to_Reg_in   : in std_logic;
		  Reg_Write_in    : in std_logic;
		  
	

		  rd_addr_out : out  std_logic_vector(4 downto 0);
        	  addr_sum_out: out std_logic_vector(31 downto 0);
		  ALURes_out: out std_logic_vector(31 downto 0);
		  ZeroFlag_out: out std_logic;
		  RS2_out: out std_logic_vector(31 downto 0);
		  
		  Branch_out      : out std_logic;
		  Jump_out        : out std_logic;
		  MemR_out        : out std_logic;
		  MemW_out        : out std_logic;
		  Mem_to_Reg_out  : out std_logic;
		  Reg_Write_out   : out std_logic);	
		  
	
end component; 

Component multiplexer_3to1 IS
PORT(   I00           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I01           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I10           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        sel           	: IN STD_LOGIC_vector(1 downto 0);
        OUTPUT     		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END Component;

begin

--- port_map

pipe:  pipe_EXMEM
PORT MAP(CLK => CLK,
	 resetn => RST,
         flush =>flush,     
 
       
        	  addr_sum_in => sig_addr_sum,
		  ALURes_in=>sig_data,
		  ZeroFlag_in=>sig_ZeroFlag,
		  
		  RS2_in=>RS2_in,
		  rd_addr_in => rd_addr_in,
	
		  Branch_in=> Branch_in,
		  Jump_in=> Jump_in, 
		  MemR_in => MemR_in,
		  MemW_in  => MemW_in, 
		  Mem_to_Reg_in => Mem_to_Reg_in,
		  Reg_Write_in => Reg_Write_in,
		  
	

		  
        	  addr_sum_out=> addr_sum_out,
		  ALURes_out => AluRes_out,
		  ZeroFlag_out=> ZeroFlag_out,
		  
		  RS2_out=> RS2_out,
		  rd_addr_out => rd_addr_out,
		  
		  Branch_out => Branch_out,
		  Jump_out => Jump_out,    
		  MemR_out => MemR_out,  
		  MemW_out  => MemW_out,    
		  Mem_to_Reg_out  => Mem_to_Reg_out,
		  Reg_Write_out => Reg_Write_out);
    


alu_unit: ALU PORT MAP(
	RS1	 => Op_forwarding1,
	RS2	 => Op_forwarding2,
	AluCont  => sig_ALUCont,
	addr_sum => sig_addr_sum,
	AluRes   => ALUres_sig,
	ZeroFlag => sig_ZeroFlag);


aluCont: ALUControl
port map (ALUOp => ALUOp_in, funct3=> funct3_in, opcode_b5=> opcode_b5_in, ALUCont=> sig_ALUCont);

Mux_forwarding_A : multiplexer_3to1 PORT MAP (
	I00	 	 =>	sig_op1, 
        I01     => 	operand_MEM,
        I10     =>      operand_WB,
        sel     =>	Forward_A,
        OUTPUT  => 	Op_forwarding1 );

Mux_forwarding_B : multiplexer_3to1 PORT MAP (
	I00     =>   	sig_op2,
        I01     =>      operand_MEM,
        I10     =>      operand_WB,
        sel     =>  	Forward_B,
        OUTPUT  =>  	Op_forwarding2 );


--- branch address calculation

sig_addr_sum_sign<=signed(addr_in) + signed(sig_imm_shift);
sig_addr_sum<=std_logic_vector(sig_addr_sum_sign);
---addr_sum_out<=sig_addr_sum;

--- mux inputs of the ALU

process(RS2_in, sig_imm, ALU_src)
begin
case ALU_src is
	when '0' =>
	sig_op2<=RS2_in;
	when '1' =>
	sig_op2<=sig_imm;
	when others =>
	sig_op2<=RS2_in;
end case;
end process;


--- mux data

process(addr_in, ALUres_sig, Jump_in)
begin
case Jump_in is

 when '0' =>
 sig_data<=ALUres_sig;
 when '1' =>
 sig_data<=addr_in;
 when others =>
 sig_data<=ALUres_sig;
 
 end case;
 end process;




sig_imm_shift<= sig_imm(30 downto 0) & '0';

---Variazioni 

sig_op1 <= RS1_in;
sig_imm <= imm_in;


end beh;