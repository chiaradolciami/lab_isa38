LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux4_1 IS
PORT(   I00           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        --I01           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        --I10           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        I11           	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        sel           	: IN STD_LOGIC; --_VECTOR(1 DOWNTO 0);
        OUTPUT     		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY mux4_1;

ARCHITECTURE arch OF mux4_1 IS

BEGIN

OUTPUT <=   I00 WHEN sel='0' ELSE
            --I01 WHEN sel="01" ELSE
            --I10 WHEN sel="10" ELSE
            I11; --WHEN sel='1';

END arch;
