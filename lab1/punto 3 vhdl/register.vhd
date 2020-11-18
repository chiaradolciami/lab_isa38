LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity REG_n is 
generic( n: integer);

port (
      CLK: in std_logic;
		RST: in std_logic;
		en: std_logic;
		input: in signed(n-1 downto 0);
		output: out signed(n-1 downto 0));
end entity REG_n;


architecture arch of REG_n is 

begin

process (CLK, RST)
  begin  -- process
    if RST = '0' then                  -- asynchronous reset (active low)
      output <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      
        if (en = '1') then
          output <= input;
        end if;
      end if;
  end process;
  
end arch;