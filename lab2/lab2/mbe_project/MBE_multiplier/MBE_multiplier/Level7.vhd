--Level7--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY Level7 is
  port (
	pp_l7:		in Partial_product_T;			--16*33--
	B:		in std_logic_vector (31 downto 0);
	L7_out: 	out Level7_T);				--17*64--
END Level7;

ARCHITECTURE behavioural of Level7 is 


Signal S0,S16: std_logic;

BEGIN

----------First Vector L7_out------------------
--  S0 <= B(1);

--  Gen1: for i in 0 to 31 generate
--  begin
--  	L7_out(0)(i) <=  pp_l7(0)(i);
--  end generate Gen1;
  
--  L7_out(0)(32) <= S0; 
--  L7_out(0)(33) <= S0;
--  L7_out(0)(34) <= not(S0);
--  L7_out(1)(0) <= S0; --first S at the bottom
  
----------------------------------------------


-------Place the partial product in to L7 matrix--------------------------------

  Gen_i: for i in 0 to 15 generate 
  begin
	
	gen_j: for j in 0 to 32 generate
	begin
		L7_out(i)(j+(2*i)) <= pp_l7 (i)(j);
	
	end generate Gen_j;
  
  end generate Gen_i;
--------------------------------------------------------------------------------


---------Complete the matrix L7 with S, not(S), '1'-----------------------------------------

--First vector L7(0)(...)--------------------------

--S0 <= B(1);

  L7_out(0)(33) <= B(1); 
  L7_out(0)(34) <= B(1);
  L7_out(0)(35) <= not(B(1));
  L7_out(1)(0) <= B(1);  --first S at the bottom

---------------------------------------------------
  
  Gen_i2: for i in 1 to 15 generate 
  begin
	
--	Si <= B(1+(i*2));

	L7_out(i)((i*2)+33) <= not(B(1+(i*2)));
	L7_out(i+1)((i*2)) <= B(1+(i*2));  -- S at the bottom
	
  end generate Gen_i2;
  

  place_1: for i in 1 to 14 generate 
  begin
 	L7_out(i)((i*2)+34) <= '1';

  end generate place_1;

  
  Gen_i3: for i in 32 to 63 generate 
  begin
		 l7_out(16)(i) <=  pp_l7 (16)(i-32);
  end generate;
  
--------------------------------------------------------------------------------------------






END behavioural;