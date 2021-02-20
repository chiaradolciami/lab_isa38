library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
port(

RS1: in std_logic_vector(31 downto 0);
RS2: in std_logic_vector(31 downto 0);
AluCont: in std_logic_vector(3 downto 0);
addr_sum: in std_logic_vector(31 downto 0);
AluRes: out std_logic_vector(31 downto 0);
ZeroFlag: out std_logic);
end ALU;


architecture beh of ALU is

begin

process(AluCont, RS1, RS2, addr_sum)
begin
ZeroFlag<='0';
case AluCont is
	when "0000" =>			-- AND
		AluRes <= RS1 AND RS2; 
	when "0001" =>			-- SRAI
		AluRes <= std_logic_vector(shift_right(signed(RS1), to_integer(signed(RS2)))); ---signed or unsigned?
	when "0010" => 		-- ADDITION	(ADD,ADDI,LW,SW)
		AluRes <= std_logic_vector(signed(RS1) + signed(RS2));
	when "0011" => 		-- XOR
		AluRes <= RS1 XOR RS2;
	when "0110" =>			-- SLT
		if signed(RS1)-signed(RS2) < 0 -- togliere to_integer
		then
			AluRes <= "00000000000000000000000000000001";
		else
			AluRes <= "00000000000000000000000000000000";
		end if;
	when "0111" => 			-- BEQ
		if signed(RS1)-signed(RS2) = 0 -- togliere to_integer
			then	
				ZeroFlag <= '1';
				AluRes <= "00000000000000000000000000000001";
			else
				ZeroFlag <= '0';
				AluRes <= "00000000000000000000000000000000";
			end if ;	
			
	when "1010"  =>			--AUIPC
		AluRes<= addr_sum;
	when "1011"  =>			--LUI 
		AluRes<= RS2; 
	when others => 
			AluRes <= "00000000000000000000000000000000";
			ZeroFlag <= '0';
			
	end case;
	
end process;

end beh;