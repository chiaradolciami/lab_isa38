library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripplecarry is 
port(
      A : In     std_logic_vector (63 downto 0);
      B : In     std_logic_vector (63 downto 0);
      S : OUT    std_logic_vector (63 downto 0)
);
END ENTITY ripplecarry;

architecture behavior of ripplecarry is

component halfadder is
Port (  A: 		In std_logic;
        B: 		In std_logic;
        S: 		Out std_logic;
        Cout: 	Out std_logic);
end component;

COMPONENT fulladder is
Port (  A: 		In std_logic;
        B: 		In std_logic;
        Cin: 	In std_logic;
        S: 		Out std_logic;
        Cout: 	Out std_logic);
end component;

signal carry_vector : std_logic_vector(63 DOWNTO 0); 

begin
    HA: halfadder port map(A=>A(0), B=>B(0), S=>S(0), Cout=>carry_vector(0));

    Label_for: for i in 1 to 63 generate	
    begin
        FAi: fulladder PORT MAP(A=>A(i), B=>B(i), Cin=>carry_vector(i-1), S=>S(i), Cout=>carry_vector(i));
    end generate;

END behavior;
