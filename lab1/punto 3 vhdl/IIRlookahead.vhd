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

--- signals for pipe registers

signal s2_pipe, s13_pipe, s12_pipe, s14_pipe: signed (7 downto 0);
signal s9_pipe: signed (5 downto 0);

--- output

--- control
--signal en, vout1, vout2, vout3: std_logic;
signal en, vout1, vout2: std_logic;

--- component reg
component REG_n is 
generic( n: integer);
port (
      CLK: in std_logic;
		RST: in std_logic;
		en: std_logic;
		input: in signed(n-1 downto 0);
		output: out signed(n-1 downto 0));
end component;

---component reg_v

component REG_v is 
port (
      CLK: in std_logic;
		RST: in std_logic;
		input: in std_logic;
		output: out std_logic);
end component;


begin

---CONTROL SIGNALS

--- Vin delay

reg_v1 : REG_v

      port map (CLK => CLK, RST=> RSTn, input=> VIN, output => vout1);

reg_v2 : REG_v

      port map (CLK => CLK, RST=> RSTn, input=> vout1, output => vout2);
		
reg_v3 : REG_v

      port map (CLK => CLK, RST=> RSTn, input=> vout2, output => VOUT);
		
--reg_v4 : REG_v

     -- port map (CLK => CLK, RST=> RSTn, input=> vout3, output => VOUT);

  
---- EXTERNAL SAMPLING

--- Din sampling

  
regDIN : REG_n
      generic map (n => 8)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> DIN, output => x);
  
--- a1 sampling


regA1 : REG_n
      generic map (n => 7)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> A1, output => a1_s);
		
--- b1 sampling


regB1 : REG_n
      generic map (n => 7)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> B1, output => b1_S);
  
--- bo sampling


regB0 : REG_n
      generic map (n => 7)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> B0, output => b0_s);
  
--- b1a1 sampling

regB1A1 : REG_n
      generic map (n => 5)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> B1A1, output => b1a1_s);

--- b0a1 sampling

regB0A1 : REG_n
      generic map (n => 5)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> B0A1, output => b0a1_s);
  
--- a1_2 sampling

regA1_2 : REG_n
      generic map (n => 3)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> A1_2, output => a1_2_s);

--- b0a1_2 sampling

regB0A1_2 : REG_n
      generic map (n => 9)
      port map (CLK => CLK, RST=> RSTn, en => VIN, input=> B0A1_2, output => b0a1_2_s);

---INTERNAL SAMPLING

--- register R0

regR0 : REG_n
      generic map (n => 8)
      port map (CLK => CLK, RST=> RSTn, en => '1', input=> x, output => s0);

-- register R1

regR1 : REG_n
      generic map (n => 8)
      port map (CLK => CLK, RST=> RSTn, en => '1', input=> s3, output => s4);

--- register R2

regR2 : REG_n
      generic map (n => 8)
      port map (CLK => CLK, RST=> RSTn, en => '1', input=> s4, output => s6);
		
		
--- PIPE REGISTERS

---STAGE1

reg1_PIPEstage1: REG_n
    generic map (n => 8)
	 port map (CLK => CLK, RST=> RSTn, en => '1', input=> s2, output => s2_pipe);
	 
reg2_PIPEstage1: REG_n
    generic map (n => 8)
	 port map (CLK => CLK, RST=> RSTn, en => '1', input=> s13, output => s13_pipe);
	 
reg3_PIPEstage1: REG_n
    generic map (n => 8)
	 port map (CLK => CLK, RST=> RSTn, en => '1', input=> s12, output => s12_pipe);
	 
--- STAGE 2

reg1_PIPEstage2: REG_n
    generic map (n => 6)
	 port map (CLK => CLK, RST=> RSTn, en => '1', input=> s9, output => s9_pipe);
	 
reg2_PIPEstage2: REG_n
    generic map (n => 8)
	 port map (CLK => CLK, RST=> RSTn, en => '1', input=> s14, output => s14_pipe);
  
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

s3<= s2_pipe + s5;
s9<= s7 + s8;

s13<= s10 + s11;
s14<= s13_pipe + s12_pipe;
y<= s14_pipe + s9_pipe;

--- OUTPUT

--- Dout register
  
regDOUT : REG_n
      generic map (n => 8)
      port map (CLK => CLK, RST=> RSTn, en => '1', input=> y, output => DOUT);
  
end arch;