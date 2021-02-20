LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all; 
 
ENTITY pipe_MEMWB IS
PORT (  clock, flush : IN std_logic;
        reg_write_in : IN std_logic;
        read_data_in : IN std_logic_vector(31 downto 0);
        address_in   : IN std_logic_vector(31 downto 0);
        rd_in_wb     : IN std_logic_vector(4 downto 0);
        memtoreg_in  : IN std_logic;

        reg_write_out : OUT std_logic;
        read_data_out : OUT std_logic_vector(31 downto 0);
        address_out   : OUT std_logic_vector(31 downto 0);
        rd_out_wb     : OUT std_logic_vector(4 downto 0);
        memtoreg_out  : OUT std_logic );
END pipe_MEMWB; 
 
ARCHITECTURE behavior OF pipe_MEMWB IS 

BEGIN 

	PROCESS (clock, flush)  
	BEGIN   
        IF flush='0' THEN
            reg_write_out <= '0';
            read_data_out <= (OTHERS => '0');
            address_out <= (OTHERS => '0');  
            rd_out_wb <= (OTHERS => '0');                       
            memtoreg_out <= '0';           

        ELSE IF (clock'EVENT AND clock = '1' ) THEN 
            reg_write_out <= reg_write_in;
            read_data_out <= read_data_in;
            address_out <= address_in;  
            rd_out_wb <= rd_in_wb;                       
            memtoreg_out <= memtoreg_in;   

            END IF;	
        END IF;
	END PROCESS; 
	
END behavior;












	
