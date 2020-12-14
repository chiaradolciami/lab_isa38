--Level4--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level4 is
  port (
	L4_in:		in Level5_T;
	L4_out: 	out Level4_T);				
END Level4;


ARCHITECTURE behavioural of Level4 is 

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

--------------- Half Adder Net --- 9 HA -------------------------------------------------------------------------------------------------------------

Ha_1: halfadder Port Map ( A => L4_in(0)(10),  B => L4_in(1)(10), S => L4_out(0)(10), Cout => L4_out(1)(11));

Ha_2: halfadder Port Map ( A => L4_in(0)(11),  B => L4_in(1)(11), S => L4_out(0)(11), Cout => L4_out(1)(12));

Ha_3: halfadder Port Map ( A => L4_in(3)(12),  B => L4_in(4)(12), S => L4_out(2)(12), Cout => L4_out(3)(13));
Ha_4: halfadder Port Map ( A => L4_in(3)(13),  B => L4_in(4)(13), S => L4_out(2)(13), Cout => L4_out(3)(14));

Ha_5: halfadder Port Map ( A => L4_in(6)(14),  B => L4_in(7)(14), S => L4_out(4)(14), Cout => L4_out(5)(15));
Ha_6: halfadder Port Map ( A => L4_in(6)(15),  B => L4_in(7)(15), S => L4_out(4)(15), Cout => L4_out(5)(16));

Ha_7: halfadder Port Map ( A => L4_in(6)(50),  B => L4_in(7)(50), S => L4_out(4)(50), Cout => L4_out(5)(51));
Ha_8: halfadder Port Map ( A => L4_in(3)(52),  B => L4_in(4)(52), S => L4_out(2)(52), Cout => L4_out(3)(53));
Ha_9: halfadder Port Map ( A => L4_in(0)(54),  B => L4_in(1)(54), S => L4_out(0)(54), Cout => L4_out(1)(55));



-------------------------------------------------------------------------------------------------------------------------------------------------------




--------------- Full Adder Net --- 107 FA ------------------------------------------------------------------------------------------------------------------------------

Column_16to49_row_0to2: for i in 12 to 53 generate
			begin
				FA_6to39 : fulladder port map (A => L4_in(0)(i), B => L4_in(1)(i), Cin => L4_in(2)(i), S => L4_out(0)(i), Cout => L4_out(1)(i+1));

			end generate;

Column_16to49_row_3to5: for i in 14 to 51 generate
			begin
				FA_40to73 : fulladder port map (A => L4_in(3)(i), B => L4_in(4)(i), Cin => L4_in(5)(i), S => L4_out(2)(i), Cout => L4_out(3)(i+1));

			end generate;

Column_16to49_row_6to8: for i in 16 to 49 generate
			begin
				FA_74to107 : fulladder port map (A => L4_in(6)(i), B => L4_in(7)(i), Cin => L4_in(8)(i), S => L4_out(4)(i), Cout => L4_out(5)(i+1));

			end generate;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------- The remaining bits witch don't need compression at this Level ---------

--- Column 0 to 9 
Row_0to4: for i in 0 to 4 generate 
	      begin

		    Column_0to9: for j in 0 to 9 generate 
	      			  begin
					 L4_out(i)(j) <= L4_in(i)(j);
				  end generate;
			
	      end generate;

--- Column 10 to 14 
	
			
Column_10: for i in 1 to 5 generate 
	      begin
		    L4_out(i)(10) <= L4_in(i+1)(10);
	      end generate;

Column_11: for i in 2 to 5 generate 
	      begin
		    L4_out(i)(11) <= L4_in(i)(11);
	      end generate;

Column_12: for i in 3 to 5 generate 
	      begin
		    L4_out(i)(12) <= L4_in(i+2)(12);
	      end generate;

Column_13: for i in 4 to 5 generate 
	      begin
		    L4_out(i)(13) <= L4_in(i+1)(13);
	      end generate;
			
--- coloumn 14
		    L4_out(5)(14) <= L4_in(8)(14);
			 
--- coloumn 51

			L4_out(4)(51) <= L4_in(6)(51);
			
Column_52: for i in 4 to 5 generate 
	      begin
		    L4_out(i)(52) <= L4_in(i+1)(52);
	      end generate;
			
--- coloumn 53
			   L4_out(2)(53) <= L4_in(3)(53);
				L4_out(4)(53) <= L4_in(4)(53);
				L4_out(5)(53) <= L4_in(5)(53);
				
Column_54: for i in 2 to 5 generate 
	      begin
		    L4_out(i)(54) <= L4_in(i)(54);
	      end generate;
			
--- coloumn 55

		L4_out(0)(55) <= L4_in(0)(55);
		
Column_55: for i in 2 to 5 generate 
	      begin
		    L4_out(i)(55) <= L4_in(i-1)(55);
	      end generate;
			
--- Column 56 to 63 
Row_0to4_2: for i in 0 to 4 generate 
	      begin

		    Column_56to63: for j in 56 to 63 generate 
	      			  begin
					 L4_out(i)(j) <= L4_in(i)(j);
				  end generate;
			
	      end generate;

				


END behavioural;