LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all; 
 
ENTITY pipe_IDEXE IS
PORT (  clock, resetn, flush           	: IN STD_LOGIC;   
        address_in, op1_in, op2_in  	: IN  std_logic_vector(31 DOWNTO 0);
        rd_in                       	: IN  std_logic_vector(4 DOWNTO 0);
        imm_inst_in                  	: IN  std_logic_vector(31 DOWNTO 0);
        func3_in          		: IN  std_logic_vector(3 DOWNTO 0);
        address_out, op1_out, op2_out   : OUT  std_logic_vector(31 DOWNTO 0);
        rd_out                          : OUT  std_logic_vector(4 DOWNTO 0);
        imm_inst_out                    : OUT  std_logic_vector(31 DOWNTO 0);
        func3_out              		: OUT  std_logic_vector(3 DOWNTO 0);
		  
		  --CONTROLS
		  
ALUOp_out		 : out std_logic_vector(1 downto 0);
ALU_src_out	: out std_logic;
Branch_out      : out std_logic;
Jump_out        : out std_logic;
MemR_out     : out std_logic;
MemW_out    : out std_logic;
Mem_to_Reg_out : out std_logic;
Reg_Write_out  : out std_logic;

ALUOp_in		 : in std_logic_vector(1 downto 0);
ALU_src_in	: in std_logic;
Branch_in      : in std_logic;
Jump_in        : in std_logic;
MemR_in     : in std_logic;
MemW_in    : in std_logic;
Mem_to_Reg_in : in std_logic;
Reg_Write_in  : in std_logic;

		--Forwarding
Add_reg1_in : in std_logic_vector (4 downto 0);
Add_reg2_in : in std_logic_vector (4 downto 0);
Add_reg1_out : out std_logic_vector (4 downto 0);
Add_reg2_out : out std_logic_vector (4 downto 0)); 



		  
END pipe_IDEXE; 
 
ARCHITECTURE behavior OF pipe_IDEXE IS 

BEGIN 

	PROCESS (clock, resetn, flush)  
	BEGIN   
        IF (resetn='0') THEN
            address_out <= (OTHERS => '0');
            op1_out <= (OTHERS => '0');
            op2_out <= (OTHERS => '0');  
            rd_out <= (OTHERS => '0');                       
            imm_inst_out <= (OTHERS => '0');                  
            func3_out <= (OTHERS => '0');

				--controls
				
		ALUOp_out	    <= (OTHERS => '0');
		ALU_src_out     <= '0';
		Branch_out      <= '0';
		Jump_out        <= '0';
		MemR_out        <= '0';
		MemW_out        <= '0';
		Mem_to_Reg_out  <= '0';
		Reg_Write_out   <= '0';

        ELSE IF (clock'EVENT AND clock = '1' ) THEN 
            
		IF(flush = '1') then 

 		address_out <= (OTHERS => '0');
            op1_out <= (OTHERS => '0');
            op2_out <= (OTHERS => '0');  
            rd_out <= (OTHERS => '0');                       
            imm_inst_out <= (OTHERS => '0');                  
            func3_out <= (OTHERS => '0');

				--controls
				
		ALUOp_out	    <= (OTHERS => '0');
		ALU_src_out     <= '0';
		Branch_out      <= '0';
		Jump_out        <= '0';
		MemR_out        <= '0';
		MemW_out        <= '0';
		Mem_to_Reg_out  <= '0';
		Reg_Write_out   <= '0';



		ELSE
	    address_out <= address_in;
            op1_out <= op1_in;
            op2_out <= op2_in;  
            rd_out <= rd_in;                       
            imm_inst_out <= imm_inst_in;                  
            func3_out <= func3_in;
			
				--controls
				
		ALUOp_out	    <= ALUOp_in;
		ALU_src_out     <= ALU_src_in;
		Branch_out      <= Branch_in;
		Jump_out        <= Jump_in;
		MemR_out        <= MemR_in;
		MemW_out        <= MemW_in;
		Mem_to_Reg_out  <= Mem_to_Reg_in;
		Reg_Write_out   <= Reg_Write_in;
			
			--Forwarding
		Add_reg2_out <= Add_reg2_in;
		Add_reg1_out <= Add_reg1_in;
		
	END IF;	
        END IF;	
        END IF;
	END PROCESS; 
	
END behavior;












	
