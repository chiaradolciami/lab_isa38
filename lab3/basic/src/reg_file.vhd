LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RF IS
PORT(	reg1, reg2, add_write   : IN std_logic_vector(4 DOWNTO 0);
		data_write              : IN std_logic_vector(31 DOWNTO 0);
		RegWrite, clk, reset           : IN std_logic;
        data1, data2            : OUT std_logic_vector(31 DOWNTO 0));	
END RF;

ARCHITECTURE Arch OF RF IS
    
TYPE matrixRF IS ARRAY (0 TO 31) OF std_logic_vector(31 DOWNTO 0);
SIGNAL dataRF : matrixRF;
-- := ((others => (others => "0")));
--signal addr_reg1, addr_reg2 : integer := 0;

 
BEGIN


--process (reset)

--begin 
--if (reset = '0') then 
--dataRF(0) <= "00000000000000000000000000000000" ;
--end if;
--end process;




--   PROCESS(clk)
--   BEGIN
 --    IF (clk'EVENT AND clk='0') AND (reset = '1') THEN -- per non aggiungere uno stato di pipe '0'
			
--          IF((RegWrite = '1') AND (to_integer(unsigned(add_write)) > 0)) THEN
 --              dataRF(to_integer(unsigned(add_write))) <= data_write;
 --          END IF;
--        END IF;
--dataRF(0) <= "00000000000000000000000000000000" ;
--    data1<=dataRF(to_integer(unsigned(reg1)));
--    data2<=dataRF(to_integer(unsigned(reg2)));
 --   END PROCESS;

data1<=dataRF(to_integer(unsigned(reg1)));
data2<=dataRF(to_integer(unsigned(reg2)));

RegFile_proc: process (clk, reset)
begin	
	
	if (reset = '0') then 
	
	dataRF(0) <= "00000000000000000000000000000000" ;
	else if falling_edge(clk) then
		if(RegWrite = '1') then 
			dataRF(to_integer(unsigned(add_write))) <= data_write;
--			else 
--			dataRF <= (others => "00000000000000000000000000000000");
		end if;
	
		
	end if;
	
	
	end if;
end process RegFile_proc;END Arch;