LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY FETCH IS
PORT(
	CLK, RSTn, flush, PCSrc       : IN  STD_LOGIC;
   	mem_address, instruction_in   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	LoadPC			      : IN std_logic;
	PC_for_Im		      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	instruction_out, address_out  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	
END entity FETCH;


ARCHITECTURE arch OF FETCH IS

    signal PC_in, PC_out, next_address    : STD_LOGIC_VECTOR(31 DOWNTO 0);

COMPONENT mux4_1 IS
PORT(   
        I00     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        --I01     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        --I10     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I11     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        sel     : IN STD_LOGIC;--_VECTOR(1 DOWNTO 0);
        OUTPUT  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;

COMPONENT program_counter IS
PORT(   rstn, clk       : IN STD_LOGIC;
	PC_in		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Load		: IN STD_LOGIC;
        PC_out     	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;


COMPONENT pipe_IFID IS
PORT (  clock, resetn, flush        : IN STD_LOGIC;   
        instr_in, addr_in           : IN  std_logic_vector(31 DOWNTO 0);
        instr_out, addr_out         : OUT  std_logic_vector(31 DOWNTO 0)); 
END COMPONENT; 

BEGIN


PC_for_Im <= PC_out;
next_address <= std_logic_vector(unsigned(PC_out) + to_unsigned(4,32));


MUX1: mux4_1 PORT MAP ( I00=>next_address, I11=>mem_address, sel=>PCSrc, OUTPUT=>PC_in );

pc: program_counter PORT MAP ( rstn=>RSTn, clk=>CLK, PC_in=>PC_in, Load=>LoadPC ,PC_out=>PC_out );

stage1: pipe_IFID PORT MAP (clock=>CLK, resetn=>RSTn, flush => flush, instr_in=>instruction_in, addr_in=>PC_out, instr_out=>instruction_out, addr_out=>address_out);

END arch;
