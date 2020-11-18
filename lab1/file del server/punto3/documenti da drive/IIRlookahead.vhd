LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity IIRlookahead is 
port(
    VIN, RSTn, CLK: in std_logic;
    DIN: in signed(7 downto 0);
	 A1, B1, B0 : in signed(6 downto 0);
	 B1A1, B0A1 : in signed(4 downto 0);
	 A1_2: in signed(2 downto 0);
	 B0A1_2 : in signed(8 downto 0);
	 DOUT: out signed(7 downto 0);
    VOUT: out std_logic); --output enable 
end entity IIRlookahead;


architecture arch of IIRlookahead is

---samples
signal x: signed(7 downto 0);--- fixed
---coefficients
signal a1_s, b0_s, b1_s: signed(6 downto 0);--- fixed
signal b1a1_s, b0a1_s: signed(4 downto 0);--- fixed
signal a1_2_s: signed (2 downto 0);
signal b0a1_2_s: signed(8 downto 0);--- fixed
--- intermediate signals
signal s0, s1, s2, s10, s12, s13, s14, y: signed (7 downto 0);-- 8 bit
signal s3, s4, s6: signed (7 downto 0);-- 8 bit da 9
signal s5: signed (3 downto 0);-- 4 bit da 5
signal s7: signed (2 downto 0);-- 3 bit da 4
signal s8: signed (5 downto 0);-- 6 bit da 5
signal s9: signed (5 downto 0);-- 6 bit da 8
signal s11: signed (5 downto 0);-- 6 bit
--- temporary signals:
signal s1_temp, s10_temp, s12_temp: signed (14 downto 0); --15 bit
signal s5_temp: signed(10 downto 0); --11 bit da 12
signal s7_temp: signed(16 downto 0); -- 17 bit da 18
signal s8_temp: signed(12 downto 0); -- 13 bit da 14
signal s11_temp: signed(12 downto 0); --13 bit
--- output

--- control
signal en, vout1: std_logic;


begin

---CONTROL SIGNALS

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
  
---- EXTERNAL SAMPLING

--- Din sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      x <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      
        if (VIN = '1') then
          x <= DIN;
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
          a1_s <= A1;
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
          b1_s <= B1;
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
          b0_s <= B0;
        end if;
      end if;
  end process;
  
--- b1a1 sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      b1a1_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          b1a1_s <= B1A1;
        end if;
      end if;
  end process;

--- b0a1 sampling


process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      b0a1_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          b0a1_s <= B0A1;
        end if;
      end if;
  end process;
  
--- a1_2 sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      a1_2_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          a1_2_s <= A1_2;
        end if;
      end if;
  end process;

--- b0a1_2 sampling

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      b0a1_2_s <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
        if (VIN = '1') then
          b0a1_2_s <= B0A1_2;
        end if;
      end if;
  end process;

---INTERNAL SAMPLING

--- register R0

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
			s0<= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge

          s0 <= x;
    
      end if;
  end process;

-- register R1

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
			s4<= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      
          s4 <= s3;
       
      end if;
  end process;

--- register R2

process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
			s6<= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
       
          s6 <= s4;

      end if;
  end process;
  
--- COMBINATORIAL PART

--- multiplications

s1_temp<= a1_s * s0;
s1<= s1_temp(14 downto 7);

s5_temp<= s6 * a1_2_s;
s5<= s5_temp(10 downto 7);

s7_temp<= s6 * b0a1_2_s;
s7<= s7_temp(16 downto 14);

s8_temp<= s6 * b1a1_s;
s8<= s8_temp(12 downto 7);

s10_temp<= x * b0_s;
s10<= s10_temp(14 downto 7);

s11_temp<= s0 * b0a1_s;
s11<= s11_temp(12 downto 7);

s12_temp<= s0 * b1_s;
s12<= s12_temp(14 downto 7);

--- additions

s2<= x + s1; 

s3<= s2 + s5;
s9<= s7 + s8;

s13<= s10 + s11;
s14<= s13 + s12;
y<= s14 + s9;

--- OUTPUT

--- Dout register
  
process (CLK, RSTn)
  begin  -- process
    if RSTn = '0' then                  -- asynchronous reset (active low)
      DOUT <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
          DOUT<= y;
			
        end if;
  end process;
  
end arch;