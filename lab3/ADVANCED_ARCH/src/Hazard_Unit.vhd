library ieee;
use ieee.std_logic_1164.all;

entity Hazard_Unit is
		port(
		
		CLK	: IN STD_LOGIC;		
		PC_SRC	: IN STD_LOGIC;

		IF_Rs1 	: in std_logic_vector(4 downto 0);
		IF_Rs2 	: in std_logic_vector(4 downto 0);
		ID_Rd 	: in std_logic_vector(4 downto 0);
		
		ID_MemR : in std_logic;

		STALL	: out std_logic);
		
		
		
end Hazard_Unit;


architecture beh of Hazard_Unit is

begin
Haz_proc : process(IF_Rs1, IF_Rs2, ID_Rd, ID_MemR,PC_SRC)
begin
--	IF(CLK' event and CLK = '0') then
	IF (PC_SRC ='0') THEN
			if((ID_MemR='1')and((ID_Rd=IF_Rs1)or(ID_Rd=IF_Rs2)) ) then

					STALL 		<= '0'; -- non caricare il PC
			ELSE
					STALL 		<= '1'; 
			end if;
	ELSE
		STALL <= '1';
	
	END IF;
--	end if;		
			
end process Haz_proc;

end beh;
