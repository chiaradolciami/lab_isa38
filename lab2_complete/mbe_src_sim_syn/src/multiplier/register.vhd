LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity REG is 
port (
      CLK: in std_logic;
		--RST: in std_logic;
		--en: std_logic;
		--input: in signed(31 downto 0);
		--output: out signed(31 downto 0));
		input: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0));
end entity REG;


architecture arch of REG is 

begin

process (CLK)--, RST)
  begin  -- process
    --if RST = '0' then                  -- asynchronous reset (active low)
      --output <= (others => '0');
    if CLK'event and CLK = '1' then  -- rising clock edge
      
    --    if (en = '1') then
          output <= input;
      --  end if;
      end if;
  end process;
  
end arch;
