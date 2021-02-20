LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY program_counter IS
PORT(   rstn, clk       : IN STD_LOGIC;
	PC_in		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Load		: IN STD_LOGIC;
        PC_out     	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
END ENTITY program_counter;

ARCHITECTURE arch OF program_counter IS

BEGIN

    update_add: PROCESS(rstn, clk, Load)
    BEGIN
        IF(rstn='0') THEN
            PC_out<="00000000000000000000000000000000";
        	ELSE IF (Load = '1') AND (clk='0' AND clk'EVENT) THEN
            	PC_out<=PC_in;
        	END IF;
		  
	END IF;
		  
    END PROCESS;

END arch;
