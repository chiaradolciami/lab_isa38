LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY WB IS
PORT(   memtoreg_in : in std_logic;
        read_data_in, address_in: in std_logic_vector(31 downto 0);
        write_data_out : out std_logic_vector(31 downto 0) );
END entity WB;


ARCHITECTURE arch OF WB IS

COMPONENT mux4_1 IS
PORT(   I00           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I11           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        sel           	: IN STD_LOGIC; 
        OUTPUT     		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;

BEGIN

mux_wb : mux4_1 PORT MAP ( address_in, read_data_in, memtoreg_in, write_data_out);

END arch;