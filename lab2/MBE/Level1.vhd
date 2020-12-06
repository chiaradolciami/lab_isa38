--Level2--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level1 is
  port (
	L1_in:		in Level1_T;
	L1_out: 	out Level1_T);				
END Level1;


ARCHITECTURE behavioural of Level1 is 

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

--------------- Half Adder Net --- 3 HA -------------------------------------------------------------------------------------------------------------

Ha_1: halfadder Port Map ( A => L1_in(0)(2),  B => L1_in(1)(2), S => L1_out(0)(2), Cout => L1_out(1)(3));

Ha_2: halfadder Port Map ( A => L1_in(0)(3),  B => L1_in(1)(3), S => L1_out(0)(3), Cout => L1_out(1)(4));

Ha_3: halfadder Port Map ( A => L1_in(0)(62), B => L1_in(1)(62), S => L1_out(0)(62), Cout => L1_out(1)(63));



--------------- Full Adder Net --- 58 FA ------------------------------------------------------------------------------------------------------------------------------

Column_4to61_row_0to2: for i in 4 to 61 generate
			begin
				FA_1to57 : fulladder port map (A => L1_in(0)(i), B => L1_in(1)(i), Cin => L1_in(2)(i), S => L1_out(0)(i), Cout => L1_out(1)(i+1));

			end generate;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------- The remaining bits witch don't need compression at this Level ---------


			
			
--- Column 0 to 1
Row_0to1: for i in 0 to  generate 
	      begin

		    Column_0to1: for j in 0 to 1 generate 
	      			  begin
					 L1_out(i)(j) <= L1_in(i)(j);
				  end generate;
			
	      end generate;


	      	
--- coloumn 2

		    L1_out(1)(2) <= L1_in(2)(2);
			 
--- coloumn 63

			 L1_out(0)(63) <= L1_in(0)(63);
			 
			 
				


END behavioural;