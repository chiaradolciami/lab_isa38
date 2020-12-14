library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use work.Level_type.all;
----------------------------------
entity MBE_multiplier is
Port ( 
A:  			in std_logic_vector(31 downto 0);
B: 		        in std_logic_vector (31 downto 0);
output: 		out std_logic_vector(63 downto 0));
end MBE_multiplier;


architecture BEHAVIORAL of MBE_multiplier is
-- Components declaration--
component mbe is
Port (  A:  In std_logic_vector (31 downto 0);
        B:	In std_logic_vector (31 downto 0);
        P:  Out Partial_product_T); --one of the defined matrix
end component;

component DaddaTrees is 
  port(
        pp:		in Partial_product_T;
	B:		in std_logic_vector (31 downto 0);
	TotalSum:	out std_logic_vector(63 downto 0));

END component;



signal PP_matrix: Partial_Product_T;

BEGIN

mbe_0: mbe
PORT MAP (         
    A    			=> A,   
    B 				=> B, 
    P => PP_matrix);

DaddaTrees_0: DaddaTrees
PORT MAP(
	pp  => PP_matrix,
	B => B,
	TotalSum => output);

END BEHAVIORAL;
