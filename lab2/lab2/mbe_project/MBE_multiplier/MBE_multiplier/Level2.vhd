--Level2--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level2 is
  port (
	L2_in:		in Level3_T;
	L2_out: 	out Level2_T);				
END Level2;


ARCHITECTURE behavioural of Level2 is 

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

Ha_1: halfadder Port Map ( A => L2_in(0)(4),  B => L2_in(1)(4), S => L2_out(0)(4), Cout => L2_out(1)(5));

Ha_2: halfadder Port Map ( A => L2_in(0)(5),  B => L2_in(1)(5), S => L2_out(0)(5), Cout => L2_out(1)(6));

Ha_3: halfadder Port Map ( A => L2_in(0)(62), B => L2_in(1)(62), S => L2_out(0)(62), Cout => L2_out(1)(63));



--------------- Full Adder Net --- 56 FA ------------------------------------------------------------------------------------------------------------------------------

Column_6to61_row_0to2: for i in 6 to 61 generate
			begin
				FA_1to55 : fulladder port map (A => L2_in(0)(i), B => L2_in(1)(i), Cin => L2_in(2)(i), S => L2_out(0)(i), Cout => L2_out(1)(i+1));

			end generate;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------- The remaining bits witch don't need compression at this Level ---------


			
			
--- Column 0 to 3
Row_0to2: for i in 0 to 2 generate 
	      begin

		    Column_0to3: for j in 0 to 3 generate 
	      			  begin
					 L2_out(i)(j) <= L2_in(i)(j);
				  end generate;
			
	      end generate;
			
			
Column_4: for i in 1 to 2 generate 
	      begin
		    L2_out(i)(4) <= L2_in(i+1)(4);
	      end generate;
			

	      	
--- coloumn 5

		    L2_out(2)(5) <= L2_in(2)(5);
			 

			
--- Column 6 to 61 
Column_6to61: for i in 6 to 61 generate 
		    
					 L2_out(2)(i) <= L2_in(3)(i);
    end generate;
	 
			

--- coloumn 63
		    L2_out(2)(62) <= L2_in(2)(62);
			 
			 
--- coloumn 63
		    L2_out(0)(63) <= L2_in(0)(63);
			 L2_out(2)(63) <= L2_in(1)(63);

	 
--- Column 62 to 63 
	
--Row_0to1: for i in 0 to 1 generate 
--	      begin
--
--		    Column_62to63: for j in 62 to 63 generate 
--	      			  begin
	--				 L2_out(i)(j) <= L2_in(i)(j);
		--		  end generate;
			
	     -- end generate;




				


END behavioural;