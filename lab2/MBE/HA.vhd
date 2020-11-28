library ieee;
use ieee.std_logic_1164.all;

entity halfadder is       
Port (  A: 		In std_logic;
        B: 		In std_logic;
        S: 		Out std_logic;
        Cout: 	Out std_logic);
end halfadder;

architecture behavior of halfadder is
begin
  S <= A xor B ;
  Co <= (A and B) ; 
end behavior;
