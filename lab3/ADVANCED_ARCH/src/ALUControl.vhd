library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUControl is
port(
	ALUOp 		 : in std_logic_vector(1 downto 0);
	funct3	    : in std_logic_vector(2 downto 0);
	opcode_b5    : in std_logic;
	ALUCont	    : out std_logic_vector(3 downto 0));
end ALUControl;



architecture beh of ALUControl is

signal ALUcont_inputs: std_logic_vector(4 downto 0);

begin

ALUcont_inputs(4 downto 3) <= ALUOp;
ALUcont_inputs(2 downto 0) <= funct3;


process(ALUcont_inputs, opcode_b5) 

begin

case ALUcont_inputs is
     when "10000" | "00000" | "00010" =>--ADD, ADDI, LW, SW
	  ALUcont <= "0010";

	  when "10100"  =>--XOR
	  ALUCont <= "0011";
	
	  when "10010"	 =>--SLT
	  ALUCont <= "0110";
	
	  when	"01000"	=>--BEQ
	  ALUCont <= "0111";
	  
	  when  "00101"	=>-- SRAI
	  ALUCont <= "0001";
	  
	  when  "00111"	=>--ANDI
	  ALUCont <= "0000";
	  
	  
		ALUCont <= "0100";
	  when others =>
		if (opcode_b5 = '1') then --LUI
		ALUCont <= "1011";
		else
		ALUCont <= "1010"; --AUIPC
		end if;

end case;
end process;

end beh;