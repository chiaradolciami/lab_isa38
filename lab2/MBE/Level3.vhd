--Level3--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level3 is
  port (
	L3_in:		in Level3_T;
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

Ha_5: halfadder Port Map ( A => L3_in(3)(56),  B => L3_in(4)(56), S => L3_out(2)(56), Cout => L3_out(3)(57));
Ha_6: halfadder Port Map ( A => L3_in(0)(58),  B => L3_in(1)(58), S => L3_out(0)(58), Cout => L3_out(1)(59));


-------------------------------------------------------------------------------------------------------------------------------------------------------




--------------- Full Adder Net --- 56 FA ------------------------------------------------------------------------------------------------------------------------------

Column_8to57_row_0to2: for i in 8 to 57 generate
			begin
				FA_1to50 : fulladder port map (A => L3_in(0)(i), B => L3_in(1)(i), Cin => L3_in(2)(i), S => L3_out(0)(i), Cout => L3_out(1)(i+1));

			end generate;

Column_10to55_row_3to5: for i in 10 to 55 generate
			begin
				FA_51to96 : fulladder port map (A => L3_in(3)(i), B => L3_in(4)(i), Cin => L3_in(5)(i), S => L3_out(2)(i), Cout => L3_out(3)(i+1));

			end generate;

Column_56to57_row_0to2: for i in 56 to 57 generate
			begin
				FA_74to107 : fulladder port map (A => L3_in(0)(i), B => L3_in(1)(i), Cin => L3_in(2)(i), S => L3_out(0)(i), Cout => L3_out(1)(i+1));

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
			
--- Column 60 to 63 
Row_0to2: for i in 0 to 2 generate 
	      begin

		    Column_60to63: for j in 60 to 63 generate 
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
	      
			

			 
--- coloumn 57

			L3_out(2)(57) <= L3_in(3)(57);
			
Column_58: for i in 2 to 3 generate 
	      begin
		    L3_out(i)(58) <= L3_in(i)(58);
	      end generate;
			
--- coloumn 59
			   L3_out(0)(59) <= L3_in(0)(59);
				L3_out(2)(59) <= L3_in(1)(59);
				L3_out(3)(59) <= L3_in(2)(59);
				



				


END behavioural;