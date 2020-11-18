

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY IIR IS -- complete architecture
PORT(
    VIN, RSTn, CLK: IN STD_LOGIC; -- input enable 
    DIN: IN SIGNED(7 downto 0);
	 A1, B1, B0 : in SIGNED(7 downto 0);
	 DOUT: OUT SIGNED(7 downto 0);
    VOUT: OUT STD_LOGIC); --output enable 
END ENTITY IIR;


ARCHITECTURE arch OF IIR IS

signal x: signed(8 downto 0);--- 1 more
signal a1_s, b0_s, b1_s: signed(6 downto 0);--- fixed
signal w, sw: signed(8 downto 0);

signal ff_temp, fb_temp, y1_temp: signed(15 downto 0);
signal ff, fb, fb_trunc: signed (4 downto 0);

signal y1: signed (7 downto 0);
signal yout: signed(7 downto 0);

signal vout1: std_logic;

begin
--- Vin sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      vout1 <= '0';
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          vout1 <= VIN;
        end if;
  end process;
  
 --- vout delay
		  
process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      VOUT <= '0';
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          VOUT <= vout1;
        end if;
  end process;
  



--- Din sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      x <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      
        if (VIN = '1') then
          x(7 downto 0) <= DIN;
	  x(8)<=DIN(7);
        end if;
      end if;
  end process;
  
  
--- a1 sampling


process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      a1_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          a1_s <= A1(6 downto 0);
        end if;
      end if;
  end process;

  
--- b1 sampling


process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      b1_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          b1_s <= B1(6 downto 0);
        end if;
      end if;
  end process;
  
--- bo sampling


process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      b0_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          b0_s <= B0(6 downto 0);
        end if;
      end if;
  end process;
  

  
  
--- Dout register
  
process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      DOUT <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          DOUT<= yout;
	 
			 
			
        end if;
  end process;
  
--- SW register


process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      sw <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          sw <= w;
        end if;
  end process;	 
  


---- signal fb
fb_temp<= a1_s * sw;
fb_trunc<= fb_temp(15 downto 11);-- 5 bit
fb<= -fb_trunc;



---- signal ff

ff_temp <= b1_s * sw;


ff<= ff_temp(15 downto 11);-- 5bit

--- signal w 

w<= (x + fb);

--- y1 before the right shift
y1_temp<= w * b0_s ;

y1<= y1_temp(15 downto 8);-- 8 bit

yout<= (ff + y1);


end arch;
