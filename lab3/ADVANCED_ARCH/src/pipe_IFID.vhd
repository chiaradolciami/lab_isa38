LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all; 
 
ENTITY pipe_IFID IS
PORT (  clock, resetn, flush        : IN STD_LOGIC;   
        instr_in, addr_in           : IN  std_logic_vector(31 DOWNTO 0);
        instr_out, addr_out         : OUT  std_logic_vector(31 DOWNTO 0) );
END pipe_IFID; 
 
ARCHITECTURE behavior OF pipe_IFID IS 

BEGIN 

	PROCESS (clock, resetn)  
	BEGIN   
        IF (resetn='0') THEN
            instr_out <= (OTHERS => '0');
            addr_out <= (OTHERS => '0');
        ELSE IF (clock'EVENT AND clock = '1')then --  AND (flush = '1')  THEN 
	
		instr_out <= instr_in;
            	addr_out <= addr_in;
		
	--ELSE IF (clock'EVENT AND clock = '1')--  AND (flush = '0')  THEN
	--
    --        instr_out <= instr_in;
     --       addr_out <= addr_in;
      --  END IF;
		  
	END IF;
	END IF;
	  
	END PROCESS; 
	
END behavior;












	
