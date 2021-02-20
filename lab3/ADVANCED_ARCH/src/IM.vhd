library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity IM is
  port (
    Address_in_Pc : in  std_logic_vector(31 downto 0);
    Instruction_out : out std_logic_vector(31 downto 0)
  );
end IM;


Architecture Behaviour of IM is


 TYPE MEM_IM_TYPE is array (0 to 75) of std_logic_vector(7 downto 0);
 Signal Instruction_Data : MEM_IM_TYPE;

 SIGNAL address : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";


------------ Init Istruction Memory at the program to find the minimun in a vector -----------------

-- 00700813 		put 7 in x16      			0000 0000 0111 0000 0000 1000 0001 0011		1
-- 0fc10217		put in x4 the address of v 		0000 1111 1100 0001 0000 0010 0001 0111		2
-- ffc20213		NON DEL PROGRAMMA 			1111 1111 1100 0010 0000 0010 0001 0011		3
-- 0fc10297		put in x5 the address of m 		0000 1111 1100 0001 0000 0010 1001 0111		4 X
-- 01028293		NON DEL PROGRAMMA 			0000 0001 0000 0010 1000 0010 1001 0011		5
-- 400006b7		init x13 with max pos			0100 0000 0000 0000 0000 0110 1011 0111		6
-- fff68693		----------------------			1111 1111 1111 0110 1000 0110 1001 0011		7
-- 02080863		(beq) check all elements...		0000 0010 0000 1000 0000 0010 01100011		8 --modified
-- 00022403		load new el. in x8			0000 0000 0000 0010 0010 0100 0000 0011		9

-- 00840516             abs value of x8 in x10                  0000 0000 1000 0100 0000 0101 0001 0110         10



-- 00420213		point to next element			0000 0000 0100 0010 0000 0010 0001 0011		11	
-- fff80813		decrease x16 by 1			1111 1111 1111 1000 0000 1000 0001 0011		12
-- 00d525b3		x11 = (x10<x13) ? 1:0			0000 0000 1101 0101 0010 0101 1011 0011		13
-- fe0584e3		(beq) next element			1111 1110 0000 0101 1000 0100 1110 0011  	14 ---modified
-- 000506b3		update minimum				0000 0000 0000 0101 0000 0110 1011 0011		15
-- fe1ff0ef		(jal) next element			1111 1110 0001 1111 1111 0000 1110 1111		16-- modified
-- 00d2a023		store the result			0000 0000 1101 0010 1010 0000 0010 0011		17
-- 000000ef		infinite loop 				0000 0000 0000 0000 0000 0000 1110 1111		18
-- 00000013		add x0,0,0				0000 0000 0000 0000 0000 0000 0001 0011		19


--- TOLTE

-- 41f45493		apply shift to get sign mask in x9	0100 0001 1111 0100 0101 0100 1001 0011		10	
-- 00944533		x10 = sign (x8)^x8			0000 0000 1001 0100 0100 0101 0011 0011		11
-- 0014f493		x9 &= 0xl (carry in)			0000 0000 0001 0100 1111 0100 1001 0011		12
-- 00950533		x10 += x9 (add the carry in)		0000 0000 1001 0101 0000 0101 0011 0011		13

Begin

address <= Address_in_Pc;



Instruction_Data(0) <= "00010011"; --LSB
Instruction_Data(1) <= "00001000";
Instruction_Data(2) <= "01110000";
Instruction_Data(3) <= "00000000"; --MSB

Instruction_Data(4) <= "00010111";
Instruction_Data(5) <= "00000010";
Instruction_Data(6) <= "11000001";
Instruction_Data(7) <= "00001111";

Instruction_Data(8) <= "00010011";
Instruction_Data(9) <= "00000010";
Instruction_Data(10) <= "11000010";
Instruction_Data(11) <= "11111111";

Instruction_Data(12) <= "10010111"; 
Instruction_Data(13) <= "00000010"; --X
Instruction_Data(14) <= "11000001";
Instruction_Data(15) <= "00001111";

Instruction_Data(16) <= "10010011";
Instruction_Data(17) <= "10000010";  --5
Instruction_Data(18) <= "00000010";
Instruction_Data(19) <= "00000001";

Instruction_Data(20) <= "10110111";
Instruction_Data(21) <= "00000110"; --6
Instruction_Data(22) <= "00000000";
Instruction_Data(23) <= "01000000";

Instruction_Data(24) <= "10010011";
Instruction_Data(25) <= "10000110";
Instruction_Data(26) <= "11110110";  --7
Instruction_Data(27) <= "11111111";

Instruction_Data(28) <= "01100011";
Instruction_Data(29) <= "00000010";  ---modified
Instruction_Data(30) <= "00001000";
Instruction_Data(31) <= "00000010";

Instruction_Data(32) <= "00000011";
Instruction_Data(33) <= "00100100";
Instruction_Data(34) <= "00000010";  --9
Instruction_Data(35) <= "00000000";

Instruction_Data(36) <= "00010110";
Instruction_Data(37) <= "00000101";
Instruction_Data(38) <= "10000100"; --10 modified
Instruction_Data(39) <= "00000000";

Instruction_Data(40) <=  "00010011";
Instruction_Data(41) <=  "00000010";
Instruction_Data(42) <=  "01000010";
Instruction_Data(43) <=  "00000000";

Instruction_Data(44) <= "00010011";	
Instruction_Data(45) <= "00001000";
Instruction_Data(46) <= "11111000";
Instruction_Data(47) <= "11111111";


Instruction_Data(48) <= "10110011";
Instruction_Data(49) <= "00100101";
Instruction_Data(50) <= "11010101";
Instruction_Data(51) <= "00000000";

Instruction_Data(52) <= "11100011";  
Instruction_Data(53) <= "10000100";
Instruction_Data(54) <= "00000101";   --modified
Instruction_Data(55) <= "11111110";

Instruction_Data(56) <= "10110011";
Instruction_Data(57) <= "00000110";     ---15
Instruction_Data(58) <= "00000101";  
Instruction_Data(59) <= "00000000";

Instruction_Data(60) <= "11101111";---------------------- 00d525b3	0000 0000 1101 0101 0010 0101 1011 0011		16
Instruction_Data(61) <= "11110000";
Instruction_Data(62) <= "00011111";   ---modified
Instruction_Data(63) <= "11111110";	

Instruction_Data(64) <= "00100011";
Instruction_Data(65) <= "10100000";   ---17
Instruction_Data(66) <= "11010010";  
Instruction_Data(67) <= "00000000";

Instruction_Data(68) <= "11101111";
Instruction_Data(69) <= "00000000";
Instruction_Data(70) <= "00000000";  
Instruction_Data(71) <= "00000000";

Instruction_Data(72) <= "00010011";
Instruction_Data(73) <= "00000000";
Instruction_Data(74) <= "00000000";
Instruction_Data(75) <= "00000000"; 




----------------------------------------------------------------------------------------------------

Proc_Read_Instruction: process (address)

		Variable Address_tmp_read : integer;

begin
		--Address_tmp_read:= natural(to_integer(unsigned(Address_in_Pc)));
		Address_tmp_read := to_integer(unsigned(address));
		
		if (Address_tmp_read > 75) then
	 	Instruction_out <= "00000000000000000000000000000000";
		else
		Instruction_out <= Instruction_Data(Address_tmp_read+3) & Instruction_Data(Address_tmp_read+2) & Instruction_Data(Address_tmp_read+1) & Instruction_Data(Address_tmp_read);
		end if;

end process Proc_Read_Instruction;







End Behaviour;
