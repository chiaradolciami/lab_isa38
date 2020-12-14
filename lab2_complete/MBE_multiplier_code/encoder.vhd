library ieee;
use ieee.std_logic_1164.all;

entity encoder is 
Port (  I: 		In std_logic_vector (31 downto 0);
        S: 		In std_logic_vector (2 downto 0);
        O:  	Out std_logic_vector (32 downto 0));
end encoder;

architecture behavior of encoder is
begin

    process(S)
    begin
        case S is												
                when "000" =>  --0		
                    O <= (others=>'0');
                when "111" =>  --0			
                    O <= (others=>'0');
                when "001" =>  -- A				
                    O <= I(31)& I;								
                when "010" =>  -- A				
                    O <= I(31)& I; 
                when "101" =>  -- A				
                    O <= I(31)& I; 
                when "110" =>  -- A				
                    O <= I(31)& I; 
                when "011" => --2A
                    O <= I & '0';
                when "100" => --2A
                    O <= I & '0';
                when others =>
                    O <= (others=>'0');
        end case;
    end Process;
end behavior;
