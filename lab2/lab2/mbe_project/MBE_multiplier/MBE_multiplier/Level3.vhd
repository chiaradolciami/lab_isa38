--Level3--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level3 is
  port (
	L3_in:		in Level4_T;
	L3_out: 	out Level3_T);				
END Level3;


ARCHITECTURE behavioural of Level3 is 

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

--------------- Half Adder Net --- 6 HA -------------------------------------------------------------------------------------------------------------

Ha_1: halfadder Port Map ( A => L3_in(0)(6),  B => L3_in(1)(6), S => L3_out(0)(6), Cout => L3_out(1)(7));

Ha_2: halfadder Port Map ( A => L3_in(0)(7),  B => L3_in(1)(7), S => L3_out(0)(7), Cout => L3_out(1)(8));

Ha_3: halfadder Port Map ( A => L3_in(3)(8),  B => L3_in(4)(8), S => L3_out(2)(8), Cout => L3_out(3)(9));
Ha_4: halfadder Port Map ( A => L3_in(3)(9),  B => L3_in(4)(9), S => L3_out(2)(9), Cout => L3_out(3)(10));

Ha_5: halfadder Port Map ( A => L3_in(3)(58),  B => L3_in(4)(58), S => L3_out(2)(58), Cout => L3_out(3)(59));
Ha_6: halfadder Port Map ( A => L3_in(0)(60),  B => L3_in(1)(60), S => L3_out(0)(60), Cout => L3_out(1)(61));


-------------------------------------------------------------------------------------------------------------------------------------------------------




--------------- Full Adder Net --- 56 FA ------------------------------------------------------------------------------------------------------------------------------

Column_8to59_row_0to2: for i in 8 to 59 generate
			begin
				FA_1to50 : fulladder port map (A => L3_in(0)(i), B => L3_in(1)(i), Cin => L3_in(2)(i), S => L3_out(0)(i), Cout => L3_out(1)(i+1));

			end generate;

Column_10to57_row_3to5: for i in 10 to 57 generate
			begin
				FA_51to96 : fulladder port map (A => L3_in(3)(i), B => L3_in(4)(i), Cin => L3_in(5)(i), S => L3_out(2)(i), Cout => L3_out(3)(i+1));

			end generate;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------- The remaining bits witch don't need compression at this Level ---------

--- Column 0 to 5 
Row_0to3: for i in 0 to 3 generate 
	      begin

		    Column_0to5: for j in 0 to 5 generate 
	      			  begin
					 L3_out(i)(j) <= L3_in(i)(j);
				  end generate;
			
	      end generate;
			
--- Column 62 to 63 
Row_0to2: for i in 0 to 2 generate 
	      begin

		    Column_60to63: for j in 62 to 63 generate 
	      			  begin
					 L3_out(i)(j) <= L3_in(i)(j);
				  end generate;
			
	      end generate;

--- Column 6 to 8 
	
			
Column_6: for i in 1 to 3 generate 
	      begin
		    L3_out(i)(6) <= L3_in(i+1)(6);
	      end generate;

Column_7: for i in 2 to 3 generate 
	      begin
		    L3_out(i)(7) <= L3_in(i)(7);
	      end generate;
			
--- coloumn 8
		    L3_out(3)(8) <= L3_in(5)(8);
	      
			

			 
--- coloumn 59

			L3_out(2)(59) <= L3_in(3)(59);
			
Column_60: for i in 2 to 3 generate 
	      begin
		    L3_out(i)(60) <= L3_in(i)(60);
	      end generate;
			
--- coloumn 61
			   L3_out(0)(61) <= L3_in(0)(61);
				L3_out(2)(61) <= L3_in(1)(61);
				L3_out(3)(61) <= L3_in(2)(61);
				



				


END behavioural;