--Level6--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level6 is
  port (
	L6_in:		in Level7_T;
	L6_out: 	out Level6_T);				--17*64--
END Level6;


ARCHITECTURE behavioural of Level6 is 

------------- Components --------------------------------------------------

COMPONENT fulladder is
Port (  A: 		In std_logic;
        B: 		In std_logic;
        Cin: 		In std_logic;
        S: 		Out std_logic;
        Cout: 		Out std_logic);
end COMPONENT;

COMPONENT halfadder is       
Port (  A: 		In std_logic;
        B: 		In std_logic;
        S: 		Out std_logic;
        Cout: 		Out std_logic);
END COMPONENT;

----------------------------------------------------------------------------


BEGIN

--------------- Half Adder Net --- 14 HA -------------------------------------------------------------------------------------------------------------

Ha_1: halfadder Port Map ( A => L6_in(0)(24),  B => L6_in(1)(24), S => L6_out(0)(24), Cout => L6_out(1)(25));
Ha_2: halfadder Port Map ( A => L6_in(0)(25),  B => L6_in(1)(25), S => L6_out(0)(25), Cout => L6_out(1)(26));

Ha_3: halfadder Port Map ( A => L6_in(3)(26),  B => L6_in(4)(26), S => L6_out(2)(26), Cout => L6_out(3)(27));
Ha_4: halfadder Port Map ( A => L6_in(3)(27),  B => L6_in(4)(27), S => L6_out(2)(27), Cout => L6_out(3)(28));

Ha_5: halfadder Port Map ( A => L6_in(6)(28),  B => L6_in(7)(28), S => L6_out(4)(28), Cout => L6_out(5)(29));
Ha_6: halfadder Port Map ( A => L6_in(6)(29),  B => L6_in(7)(29), S => L6_out(4)(29), Cout => L6_out(5)(30));

Column_30to35_row_9to10: for i in 30 to 35 generate
			 begin
			 	Ha_7to12: halfadder port map ( A => L6_in(9)(i),  B => L6_in(10)(i), S => L6_out(6)(i), Cout => L6_out(7)(i+1));
			 end generate Column_30to35_row_9to10; 

Ha_13: halfadder Port Map ( A => L6_in(5)(38),  B => L6_in(6)(38), S => L6_out(2)(38), Cout => L6_out(3)(39));
Ha_14: halfadder Port Map ( A => L6_in(3)(40),  B => L6_in(4)(40), S => L6_out(0)(40), Cout => L6_out(1)(41));

-------------------------------------------------------------------------------------------------------------------------------------------------------




--------------- Full Adder Net --- 31 FA ------------------------------------------------------------------------------------------------------------------------------

Column_26to35_row_0to2: for i in 26 to 35 generate
			begin
				FA_1to10 : fulladder port map (A => L6_in(0)(i), B => L6_in(1)(i), Cin => L6_in(2)(i), S => L6_out(0)(i), Cout => L6_out(1)(i+1));

			end generate;

Column_28to35_row_3to5: for i in 28 to 35 generate
			begin
				FA_11to18 : fulladder port map (A => L6_in(3)(i), B => L6_in(4)(i), Cin => L6_in(5)(i), S => L6_out(2)(i), Cout => L6_out(3)(i+1));

			end generate;

Column_30to35_row_6to8: for i in 30 to 35 generate
			begin
				FA_19to24 : fulladder port map (A => L6_in(6)(i), B => L6_in(7)(i), Cin => L6_in(8)(i), S => L6_out(4)(i), Cout => L6_out(5)(i+1));

			end generate;


FA_25 : fulladder port map (A => L6_in(1)(36), B => L6_in(2)(36), Cin => L6_in(3)(36), S => L6_out(0)(36), Cout => L6_out(1)(37));
FA_26 : fulladder port map (A => L6_in(4)(36), B => L6_in(5)(36), Cin => L6_in(6)(36), S => L6_out(2)(36), Cout => L6_out(3)(37));
FA_27 : fulladder port map (A => L6_in(7)(36), B => L6_in(8)(36), Cin => L6_in(9)(36), S => L6_out(4)(36), Cout => L6_out(5)(37));

Column_37to38_row_6to8: for i in 37 to 38 generate
			begin
				FA_28to29 : fulladder port map (A => L6_in(2)(i), B => L6_in(3)(i), Cin => L6_in(4)(i), S => L6_out(0)(i), Cout => L6_out(1)(i+1));

			end generate;

FA_30 : fulladder port map (A => L6_in(5)(37), B => L6_in(6)(37), Cin => L6_in(7)(37), S => L6_out(2)(37), Cout => L6_out(3)(38));
FA_31 : fulladder port map (A => L6_in(3)(39), B => L6_in(4)(39), Cin => L6_in(5)(39), S => L6_out(0)(39), Cout => L6_out(1)(40));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------- The remaining bits witch don't need compression at this Level ---------

--- Column 0 to 23 
Row_0to12: for i in 0 to 12 generate -- Rows are matched to the output rows
	      begin

		    Column_0to23: for j in 0 to 23 generate 
	      			  begin
					 L6_out(i)(j) <= L6_in(i)(j);
				  end generate;
			
	      end generate;

Column_24: for i in 1 to 12 generate 
	      begin
		    L6_out(i)(24) <= L6_in(i+1)(24);
	      end generate;

Column_25: for i in 2 to 12 generate 
	      begin
		    L6_out(i)(25) <= L6_in(i)(25);
	      end generate;

Column_26: for i in 3 to 12 generate 
	      begin
		    L6_out(i)(26) <= L6_in(i+2)(26);
	      end generate;

Column_27: for i in 4 to 12 generate 
	      begin
		    L6_out(i)(27) <= L6_in(i+1)(27);
	      end generate;

Column_28: for i in 5 to 12 generate 
	      begin
		    L6_out(i)(28) <= L6_in(i+3)(28);
	      end generate;

Column_29: for i in 6 to 12 generate 
	      begin
		    L6_out(i)(29) <= L6_in(i+2)(29);
	      end generate;
Column_30: for i in 7 to 12 generate 
	      begin
		    L6_out(i)(30) <= L6_in(i+4)(30);
	      end generate;

--- Column 31 to 36
Row_8to12: for i in 8 to 12 generate -- Rows are matched to the output rows
	      begin

		    Column_31to36: for j in 31 to 36 generate 
	      			  begin
					 L6_out(i)(j) <= L6_in(i+3)(j);
				  end generate;
			
	      end generate;
L6_out(6)(36) <= L6_in(10)(36); --- bit exception

Column_37: for i in 6 to 12 generate 
	      begin
		    L6_out(i)(37) <= L6_in(i+3)(37);
	      end generate;
L6_out(4)(37) <= L6_in(8)(37); --- bit exception


---Column 38???????????????????????????????????????????????????????------------------------------------

----------------------------------------------------------------------------


END behavioural;