library ieee;
use ieee.std_logic_1164.all; 


--Package Declaration Levels------------------------------------------------
package Level_type is
type Partial_product_T is array (0 to 15) of std_logic_vector (32 downto 0);
type Level7_T is array (0 to 16) of std_logic_vector (63 downto 0);
type Level6_T is array (0 to 12) of std_logic_vector (63 downto 0);
type Level5_T is array (0 to 8) of std_logic_vector (63 downto 0);
type Level4_T is array (0 to 5) of std_logic_vector (63 downto 0);
type Level3_T is array (0 to 3) of std_logic_vector (63 downto 0);
type Level2_T is array (0 to 2) of std_logic_vector (63 downto 0);
type Level1_T is array (0 to 1) of std_logic_vector (63 downto 0);
end package Level_type;
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all; 
use work.Level_Type.all;


ENTITY DaddaTrees is 
  port(
        pp:		in Partial_product_T;
	     B:		in std_logic_vector (31 downto 0);
	     TotalSum:	out std_logic_vector(63 downto 0));

END DaddaTrees;




ARCHITECTURE Behavioural of DaddaTrees is 

-------------Components--------------------------------------------------

COMPONENT Level7 is
  port (
	pp_l7:		in Partial_product_T;			--16*33--
	B:		in std_logic_vector (31 downto 0);
	L7_out: 	out Level7_T);				--17*64--
END COMPONENT Level7;

COMPONENT Level6 is
  port (
	L6_in:		in Level7_T ;			--17*64--
	L6_out: 	out Level6_T);				--13*64--
END COMPONENT Level7;

COMPONENT Level5 is
  port (
	L5_in:		in Level6_T;			--13*64--
	L5_out: 	out Level5_T);				--9*64--
END COMPONENT Level5;

COMPONENT Level4 is
  port (
	L4_in:		in Level5_T;			--9*33--
	L4_out: 	out Level4_T);				--6*64--
END COMPONENT Level4;


COMPONENT Level3 is
  port (
	L3_in:		in Level4_T;			--6*64--
	L3_out: 	out Level3_T);				--4*64--
END COMPONENT Level3;

COMPONENT Level2 is
  port (
	L2_in:		in Level3_T;			--4*64--
	L2_out: 	out Level2_T);				--3*64--
END COMPONENT Level2;

COMPONENT Level1 is
  port (
	L1_in:		in Level1_T;
	L1_out: 	out Level1_T);				
END COMPONENT Level1;

COMPONENT ripplecarry is 
port(
      A : In     std_logic_vector (63 downto 0);
      B : In     std_logic_vector (63 downto 0);
      S : OUT    std_logic_vector (63 downto 0)
);
END COMPONENT ripplecarry;



-------------------------------------------------------------------------



----------Signals---------

Signal sig_L7_out: Level7_T; 
Signal sig_L6_out: Level6_T; 
Signal sig_L5_out: Level5_T; 
Signal sig_L4_out: Level4_T; 
Signal sig_L3_out: Level3_T; 
Signal sig_L2_out: Level2_T; 
Signal sig_L1_out: Level1_T; 

--------------------------

BEGIN



Level7_map: LEVEL7 PORT MAP (
		    	      pp_l7  => pp, 		
		    	      B      => B, 	
	           	   L7_out => sig_L7_out);
						
Level6_map: LEVEL6 PORT MAP (
		    	      L6_in => sig_L7_out	
	           	   L6_out => sig_L6_out);
						
Level5_map: LEVEL5 PORT MAP (
		    	      L5_in => sig_L6_out	
	           	   L5_out => sig_L5_out);

Level4_map: LEVEL4 PORT MAP (
		    	      L4_in => sig_L5_out	
	           	   L4_out => sig_L4_out);
						
Level3_map: LEVEL3 PORT MAP (
		    	      L3_in => sig_L4_out	
	           	   L3_out => sig_L3_out);
				
Level2_map: LEVEL2 PORT MAP (
		    	      L2_in => sig_L3_out	
	           	   L2_out => sig_L2_out);

Level1_map: LEVEL1 PORT MAP (
		    	      L1_in => sig_L2_out	
	           	   L1_out => sig_L1_out);
						
RCA_map: ripplecarry PORT MAP (
						
						A => sig_L1_out(0);
						B => sig_L1_out(1);
						
						S=> TotalSum);
						
   


END Behavioural;
