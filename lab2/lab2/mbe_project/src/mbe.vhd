library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

use work.Level_type.all;

entity mbe is
Port (  A:      In std_logic_vector (31 downto 0);
        B:	In std_logic_vector (31 downto 0);
        P:      Out Partial_product_T); --one of the defined matrix
end entity mbe;

architecture behavior of mbe is

component encoder
Port (  I: 	In std_logic_vector (31 downto 0);
        S: 	In std_logic_vector (2 downto 0);
        O:  	Out std_logic_vector (32 downto 0));
end component;

type matrix_encoder_output is array(0 to 16) of std_logic_vector(32 DOWNTO 0);  
SIGNAL out_encoder : matrix_encoder_output ; --16 selections of 3, 16 output lines 

signal selection, selection16 : std_logic_vector(2 downto 0);

begin
    selection <= B(1) & B(0) & '0'; --start selection -> LSB+1, LSB, '0'

    line0: encoder PORT MAP (I=> A, S=>selection, O=>out_encoder(0)); -- in out_encoder(0) first value of 0, A or 2A
    prod0: for c in 0 to 32 generate
    begin
    	P(0)(c) <= out_encoder(0)(c) XOR B(1); --(0, A, 2A) + MSB(selection)
    end generate;

  
    other_lines: for r in 1 to 15 generate
    begin
        line_i: encoder port map(I=> A, S=>B(2*r+1 downto 2*r-1), O=> out_encoder(r));   
        other_prod: for h in 0 to 32 generate
        begin
            P(r)(h) <= out_encoder(r)(h) XOR B(2*r+1); --(0, A, 2A) + MSB(selection)
        end generate other_prod;

    end generate;
	selection16 <= '0' & '0' & B(31);
	line16: encoder PORT MAP (I=> A, S=> selection16, O=>P(16)); -- in out_encoder(0) first value of 0, A or 2A
		

end behavior;
