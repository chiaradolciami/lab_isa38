library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Control_unit is 
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

end Control_unit;

architecture beh of Control_unit is

begin

process(opcode)

begin
Branch<='0';
Jump<='0';
MemW<='0';
MemR<='0';
Mem_to_Reg<='0';
Reg_Write<='1';
ALU_src<='1';
ALUop<="00";

case opcode is

	when "0110011" => --ADD,SLT,XOR
	ALUop<="10";
	ALU_src<='0';
	
---	when"0010011" => --ADDI, ANDI, SRAI

	when "0110111" => --LUI
	ALUop<="11";
	
	when "0010111" => --AUIPC
	ALUop<="11";
	
	when "1101111" => --JAL
	Jump<='1';
	
	when "1100011" => --BEQ
	Branch<='1';
	Reg_Write<='0';
	ALUop<="01";
	ALU_src<='0';
	
	when "0000011" => --LW
	MemR<='1';
	Mem_to_Reg<='1';
	Reg_Write<='1';
	
	
	when "0100011" => --SW
	MemW<='1';
	Reg_Write<='0';
	
	when others =>
	Branch<='0';
Jump<='0';
MemW<='0';
MemR<='0';
Mem_to_Reg<='0';
Reg_Write<='1';
ALU_src<='1';
ALUop<="00";

	
	
end case;

end process;
	
end beh;	
	
	
	
	
	
	