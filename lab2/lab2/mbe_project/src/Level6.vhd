--Level6--

library ieee;
use ieee.std_logic_1164.all; 
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.Level_Type.all;


ENTITY Level6 is
  port (
	L6_in:		in Level7_T;
	L6_out: 	out Level6_T);				
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

--------------- Half Adder Net --- 12 HA -------------------------------------------------------------------------------------------------------------

Ha_1: halfadder Port Map ( A => L6_in(0)(24),  B => L6_in(1)(24), S => L6_out(0)(24), Cout => L6_out(1)(25));
Ha_2: halfadder Port Map ( A => L6_in(0)(25),  B => L6_in(1)(25), S => L6_out(0)(25), Cout => L6_out(1)(26));

Ha_3: halfadder Port Map ( A => L6_in(3)(26),  B => L6_in(4)(26), S => L6_out(2)(26), Cout => L6_out(3)(27));
Ha_4: halfadder Port Map ( A => L6_in(3)(27),  B => L6_in(4)(27), S => L6_out(2)(27), Cout => L6_out(3)(28));

Ha_5: halfadder Port Map ( A => L6_in(6)(28),  B => L6_in(7)(28), S => L6_out(4)(28), Cout => L6_out(5)(29));
Ha_6: halfadder Port Map ( A => L6_in(6)(29),  B => L6_in(7)(29), S => L6_out(4)(29), Cout => L6_out(5)(30));

--Column_30to35_row_9to10: for i in 30 to 35 generate
--			 begin
--			 	Ha_7to12: halfadder port map ( A => L6_in(9)(i),  B => L6_in(10)(i), S => L6_out(6)(i), Cout => L6_out(7)(i+1));
--			 end generate Column_30to35_row_9to10; 
Ha_7: halfadder Port Map ( A => L6_in(9)(30),  B => L6_in(10)(30), S => L6_out(6)(30), Cout => L6_out(7)(31));
Ha_8: halfadder Port Map ( A => L6_in(9)(31),  B => L6_in(10)(31), S => L6_out(6)(31), Cout => L6_out(7)(32));

--Ha_13: halfadder Port Map ( A => L6_in(5)(38),  B => L6_in(6)(38), S => L6_out(2)(38), Cout => L6_out(3)(39));
--Ha_14: halfadder Port Map ( A => L6_in(3)(40),  B => L6_in(4)(40), S => L6_out(0)(40), Cout => L6_out(1)(41));
Ha_9: halfadder Port Map ( A => L6_in(10)(36),  B => L6_in(11)(36), S => L6_out(6)(36), Cout => L6_out(7)(37));
Ha_10: halfadder Port Map ( A => L6_in(8)(38),  B => L6_in(9)(38), S => L6_out(4)(38), Cout => L6_out(5)(39));
Ha_11: halfadder Port Map ( A => L6_in(6)(40),  B => L6_in(7)(40), S => L6_out(2)(40), Cout => L6_out(3)(41));
Ha_12: halfadder Port Map ( A => L6_in(4)(42),  B => L6_in(5)(42), S => L6_out(0)(42), Cout => L6_out(1)(43));



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


Column_32to35_row_9to11: for i in 32 to 35 generate
			begin
				FA_25to28 : fulladder port map (A => L6_in(9)(i), B => L6_in(10)(i), Cin => L6_in(11)(i), S => L6_out(6)(i), Cout => L6_out(7)(i+1));

			end generate;			
			
			
FA_29 : fulladder port map (A => L6_in(1)(36), B => L6_in(2)(36), Cin => L6_in(3)(36), S => L6_out(0)(36), Cout => L6_out(1)(37));
FA_30 : fulladder port map (A => L6_in(4)(36), B => L6_in(5)(36), Cin => L6_in(6)(36), S => L6_out(2)(36), Cout => L6_out(3)(37));
FA_31 : fulladder port map (A => L6_in(7)(36), B => L6_in(8)(36), Cin => L6_in(9)(36), S => L6_out(4)(36), Cout => L6_out(5)(37));

Column_37to38_row_2to4: for i in 37 to 38 generate
			begin
				FA_32to33 : fulladder port map (A => L6_in(2)(i), B => L6_in(3)(i), Cin => L6_in(4)(i), S => L6_out(0)(i), Cout => L6_out(1)(i+1));

			end generate;

FA_34 : fulladder port map (A => L6_in(5)(37), B => L6_in(6)(37), Cin => L6_in(7)(37), S => L6_out(2)(37), Cout => L6_out(3)(38));
FA_35 : fulladder port map (A => L6_in(8)(37), B => L6_in(9)(37), Cin => L6_in(10)(37), S => L6_out(4)(37), Cout => L6_out(5)(38));

FA_40 : fulladder port map (A => L6_in(5)(38), B => L6_in(6)(38), Cin => L6_in(7)(38), S => L6_out(2)(38), Cout => L6_out(3)(39));

FA_36 : fulladder port map (A => L6_in(3)(39), B => L6_in(4)(39), Cin => L6_in(5)(39), S => L6_out(0)(39), Cout => L6_out(1)(40));
FA_37 : fulladder port map (A => L6_in(6)(39), B => L6_in(7)(39), Cin => L6_in(8)(39), S => L6_out(2)(39), Cout => L6_out(3)(40));

FA_38 : fulladder port map (A => L6_in(3)(40), B => L6_in(4)(40), Cin => L6_in(5)(40), S => L6_out(0)(40), Cout => L6_out(1)(41));
FA_39 : fulladder port map (A => L6_in(4)(41), B => L6_in(5)(41), Cin => L6_in(6)(41), S => L6_out(0)(41), Cout => L6_out(1)(42));

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
			
Column_31: for i in 8 to 12 generate 
	      begin
		    L6_out(i)(31) <= L6_in(i+3)(31);
	      end generate;			
			

--- Column 32 to 36
Row_8to12: for i in 8 to 12 generate -- Rows are matched to the output rows
	      begin

		    Column_32to36: for j in 32 to 36 generate 
	      			  begin
					 L6_out(i)(j) <= L6_in(i+4)(j);
				  end generate;
			
	      end generate;
--L6_out(6)(36) <= L6_in(10)(36); --- bit exception
---


Column_37: for i in 8 to 12 generate 
	      begin
		    L6_out(i)(37) <= L6_in(i+4)(37);
	      end generate;
L6_out(6)(37) <= L6_in(11)(37); --- bit exception

Column_38: for i in 6 to 12 generate 
	      begin
		    L6_out(i)(38) <= L6_in(i+4)(38);
	      end generate;

Column_39: for i in 6 to 12 generate 
	      begin
		    L6_out(i)(39) <= L6_in(i+4)(39);
	      end generate;
L6_out(4)(39) <= L6_in(9)(39); --- bit exception

Column_40: for i in 4 to 12 generate 
	      begin
		    L6_out(i)(40) <= L6_in(i+4)(40);
	      end generate;

Column_41: for i in 4 to 12 generate 
	      begin
		    L6_out(i)(41) <= L6_in(i+4)(41);
	      end generate;
L6_out(2)(41) <= L6_in(7)(41); --- bit exception

Column_42: for i in 2 to 12 generate 
	      begin
		    L6_out(i)(42) <= L6_in(i+4)(42);
	      end generate;

Column_43: for i in 2 to 12 generate 
	      begin
		    L6_out(i)(43) <= L6_in(i+4)(43);
	      end generate;
L6_out(0)(43) <= L6_in(5)(43); --- bit exception

Column_44: for i in 0 to 11 generate 
	      begin
		    L6_out(i)(44) <= L6_in(i+5)(44);
	      end generate;


Column_45_46: for i in 0 to 10 generate 
	      begin
		    L6_out(i)(45) <= L6_in(i+6)(45);
		    L6_out(i)(46) <= L6_in(i+6)(46);
	      end generate;

Column_47_48: for i in 0 to 9 generate 
	      begin
		    L6_out(i)(47) <= L6_in(i+7)(47);
		    L6_out(i)(48) <= L6_in(i+7)(48);
	      end generate;

Column_49_50: for i in 0 to 8 generate 
	      begin
		    L6_out(i)(49) <= L6_in(i+8)(49);
		    L6_out(i)(50) <= L6_in(i+8)(50);
	      end generate;

Column_51_52: for i in 0 to 7 generate 
	      begin
		    L6_out(i)(51) <= L6_in(i+9)(51);
		    L6_out(i)(52) <= L6_in(i+9)(52);
	      end generate;

Column_53_54: for i in 0 to 6 generate 
	      begin
		    L6_out(i)(53) <= L6_in(i+10)(53);
		    L6_out(i)(54) <= L6_in(i+10)(54);
	      end generate;

Column_55_56: for i in 0 to 5 generate 
	      begin
		    L6_out(i)(55) <= L6_in(i+11)(55);
		    L6_out(i)(56) <= L6_in(i+11)(56);
	      end generate;

Column_57_58: for i in 0 to 4 generate 
	      begin
		    L6_out(i)(57) <= L6_in(i+12)(57);
		    L6_out(i)(58) <= L6_in(i+12)(58);
	      end generate;

Column_59_60: for i in 0 to 3 generate 
	      begin
		    L6_out(i)(59) <= L6_in(i+13)(59);
		    L6_out(i)(60) <= L6_in(i+13)(60);
	      end generate;

Column_61_62: for i in 0 to 2 generate 
	      begin
		    L6_out(i)(61) <= L6_in(i+14)(61);
		    L6_out(i)(62) <= L6_in(i+14)(62);
	      end generate;

L6_out(0)(63) <= L6_in(15)(63);
L6_out(1)(63) <= L6_in(16)(63);


----------------------------------------------------------------------------


END behavioural;