library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
 
entity pipe_EXMEM is
port (  CLK, resetn, flush        : in std_logic; 
 
        rd_addr_in : in  std_logic_vector(4 downto 0);
        addr_sum_in: in std_logic_vector(31 downto 0);
		  ALURes_in: in std_logic_vector(31 downto 0);
		  ZeroFlag_in: in std_logic;
		  RS2_in: in std_logic_vector(31 downto 0);
		  
		  
		  ---WB/MEM signals
		  Branch_in       : in std_logic;
		  Jump_in         : in std_logic;
		  MemR_in     : in std_logic;
		  MemW_in     : in std_logic;
		  Mem_to_Reg_in   : in std_logic;
		  Reg_Write_in    : in std_logic;
		  
	

		  rd_addr_out : out  std_logic_vector(4 downto 0);
        addr_sum_out: out std_logic_vector(31 downto 0);
		  ALURes_out: out std_logic_vector(31 downto 0);
		  ZeroFlag_out: out std_logic;
		  RS2_out: out std_logic_vector(31 downto 0);
		  
		  Branch_out      : out std_logic;
		  Jump_out        : out std_logic;
		  MemR_out        : out std_logic;
		  MemW_out        : out std_logic;
		  Mem_to_Reg_out  : out std_logic;
		  Reg_Write_out   : out std_logic);
		  
	
		  
	
end pipe_EXMEM; 
 
architecture behavior of pipe_EXMEM is

begin 

	process (CLK, resetn)  
	begin  
        if (resetn='0')then
            
	    ZeroFlag_out<= '0';
            addr_sum_out <= (others => '0');  
            ALURes_out <= (others => '0');                       
            RS2_out <= (others => '0');                  
            rd_addr_out <= (others => '0');   
	    Branch_out <= '0';
	    Jump_out <=   '0';
	    MemR_out <=  '0';
	    MemW_out  <=  '0';
	    Mem_to_Reg_out <='0';
	    Reg_Write_out <= '0';	

				
        else if (CLK'event and CLK = '1' ) then 
            
	    if (flush = '1') then 
	    ZeroFlag_out<= '0';
            addr_sum_out <= (others => '0');  
            ALURes_out <= (others => '0');                       
            RS2_out <= (others => '0');                  
            rd_addr_out <= (others => '0');   
	    Branch_out <= '0';
	    Jump_out <=   '0';
	    MemR_out <=  '0';
	    MemW_out  <=  '0';
	    Mem_to_Reg_out <='0';
	    Reg_Write_out <= '0';
	
	    else

	    ZeroFlag_out<= ZeroFlag_in;
            addr_sum_out <= addr_sum_in;  
            ALURes_out <= ALURes_in;                       
            RS2_out <= RS2_in;                  
            rd_addr_out <= rd_addr_in;  
	    Branch_out <= Branch_in;
	    Jump_out <=    Jump_in;
	    MemR_out <=   MemR_in ; 
            MemW_out  <=  MemW_in ;    
	    Mem_to_Reg_out <= Mem_to_Reg_in;
            Reg_Write_out <= Reg_Write_in;
		end if;
        end if;	
	     end if;
	end process;


	
end behavior;