LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity REG_v is 
port (
      CLK: in std_logic;
		RST: in std_logic;
		input: in std_logic;
		output:  out std_logic);
end entity REG_v;


architecture arch of REG_V is 

begin

process (CLK, RST)
  begin  -- process
    if RST = '0' then                  -- asynchronous reset (active low)
      output <= '0';
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          output <= input;
       
      end if;
  end process;
  
end arch;