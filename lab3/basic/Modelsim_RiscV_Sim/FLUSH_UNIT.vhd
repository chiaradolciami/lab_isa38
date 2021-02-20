LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Flush_Unit IS
PORT(
	Branch           	: IN STD_LOGIC;
	EXE_MEM_Flush_pipe	:  OUT STD_LOGIC;
    	ID_EXE_Flush_pipe	:  OUT STD_LOGIC );
END ENTITY Flush_Unit;

ARCHITECTURE Beh OF Flush_Unit IS
BEGIN

Flush_Unit_Proc: PROCESS(Branch)
BEGIN
		IF (Branch ='1') THEN
		EXE_MEM_Flush_pipe <= '1';
		ID_EXE_Flush_pipe <= '1';
		
		ELSE
		EXE_MEM_Flush_pipe <= '0';
		ID_EXE_Flush_pipe <= '0';
		END IF;		

END PROCESS Flush_Unit_Proc;


END Beh;
   
