LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY multiplexer_3to1 IS
PORT(   I00           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I01           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I10           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        sel           	: IN STD_LOGIC_vector(1 downto 0);
        OUTPUT     		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY multiplexer_3to1;

ARCHITECTURE beh OF multiplexer_3to1 IS

BEGIN

process(sel,I00, I01, I10)
begin
CASE sel IS 
	WHEN "00" =>   OUTPUT  <=   I00; 
	WHEN "01" =>   OUTPUT  <=   I01; 
	WHEN "10" =>   OUTPUT  <=   I10;
	WHEN others => OUTPUT  <=   I00;
	
end case;	
end process;

END beh;