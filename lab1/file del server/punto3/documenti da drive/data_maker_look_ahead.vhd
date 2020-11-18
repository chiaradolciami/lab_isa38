library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_maker_look_ahead is  
  port (
    CLK     : in  std_logic;
    RST_n   : in  std_logic;
    VOUT    : out std_logic;
    DOUT    : out std_logic_vector(7 downto 0);
    A1      : out std_logic_vector(6 downto 0);
    B1      : out std_logic_vector(6 downto 0);
    B0      : out std_logic_vector(6 downto 0);
    B1A1      : out std_logic_vector(4 downto 0);
    B0A1      : out std_logic_vector(4 downto 0);
    A1_2      : out std_logic_vector(2 downto 0);
    B0A1_2      : out std_logic_vector(8 downto 0);
    END_SIM : out std_logic);
end data_maker_look_ahead;

architecture behaviour of data_maker_look_ahead is

  constant t : time := 1 ns;
  constant t_vin_test : time := 12 ns;

--  signal sEndSim : std_logic;
 --signal END_SIM_i : std_logic_vector(0 to 10);--???  
--  signal END_SIM : std_logic;--???  

begin  -- behaviour
---1, -104, -203, 520, 2251, 3260, 2251, 520, -203, -104, -1
  A1 <= conv_std_logic_vector(21,7);
  B1 <= conv_std_logic_vector(53,7);
  B0 <= conv_std_logic_vector(53,7);

------------------------------FOR LOOK_AHEAD AND PIPE -------------------------------
  B1A1 <= conv_std_logic_vector(8,5);
  B0A1 <= conv_std_logic_vector(8,5);
  A1_2 <= conv_std_logic_vector(3,3);
  B0A1_2 <= conv_std_logic_vector(182,9);


  process (CLK, RST_n)
    file fp_in : text open READ_MODE is "samples.txt";
    variable line_in : line;
    variable x : integer;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      DOUT <= (others => '0') after t;      
      VOUT <= '0' after t;
      END_SIM <= '0' after t;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if not endfile(fp_in) then
        readline(fp_in, line_in);
        read(line_in, x);
        DOUT <= conv_std_logic_vector(x, 8) after t; --??valori in ingresso al filtro
        VOUT <= '1' after t_vin_test; --??VOUT del Testbench è il VIN del filtro? //////////////////////////////// test su vin after 12t= t_vim_test
        END_SIM <= '0' after t;
      else
        VOUT <= '0' after t;        
        END_SIM <= '1' after t;
      end if;
    end if;
  end process;

--  process (CLK, RST_n)
--  begin  -- process
--    if RST_n = '0' then                 -- asynchronous reset (active low)
--      --END_SIM_i <= (others => '0') after t;
--       END_SIM <= (others => '0') after t;
--    elsif CLK'event and CLK = '1' then  -- rising clock edge
--        END_SIM <= (others => '0') after t;
--      --END_SIM_i(0) <= sEndSim after t;
--     --END_SIM_i(1 to 10) <= END_SIM_i(0 to 9) after t;
--    end if;
--  end process;

--  END_SIM <= END_SIM_i(10);  

end behaviour;
