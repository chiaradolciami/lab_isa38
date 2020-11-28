library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
Port (  A: 		In std_logic;
        B: 		In std_logic;
        Cin: 	In std_logic;
        S: 		Out std_logic;
        Cout: 	Out std_logic);
end fulladder;

architecture behavior of fulladder is
begin
  S <= A xor B xor Cin ;
  Cout <= (A and B) or (B and Cin) or (A and Cin); 
end behavior;
