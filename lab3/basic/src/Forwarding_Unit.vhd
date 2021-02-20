library ieee;
use ieee.std_logic_1164.all;

entity Forwarding_Unit is
		port(
		ID_Rs1		: in std_logic_vector(4 downto 0);
		ID_Rs2 		: in std_logic_vector(4 downto 0);
		EX_Rd 		: in std_logic_vector(4 downto 0);
		MEM_Rd 		: in std_logic_vector(4 downto 0);		
		EX_Reg_Write 	: in std_logic;
		MEM_Reg_Write 	: in std_logic;
		Mem_W      	: in STD_LOGIC; 
		
		ForwardA 	: out std_logic_vector (1 downto 0);
		ForwardB 	: out std_logic_vector (1 downto 0));
end Forwarding_Unit;


architecture beh of Forwarding_Unit is

begin
ForwardA_proc: process(ID_Rs1, EX_Rd, MEM_Rd, EX_Reg_Write, MEM_Reg_Write)
			
		
begin-- default values

	if((EX_Reg_Write='1')and(EX_Rd/="00000")and(EX_Rd=ID_Rs1) ) then
			ForwardA <= "01";
	elsif((MEM_Reg_Write='1')and(MEM_Rd/="00000")and(MEM_Rd=ID_Rs1) ) then
			ForwardA <= "10";
	else 
			ForwardA <= "00";
	end if;
end process ForwardA_proc;	
	
	
ForwardB_proc:  process( ID_Rs2, EX_Rd, MEM_Rd, EX_Reg_Write, MEM_Reg_Write,Mem_W)
begin
 	if((EX_Reg_Write='1')and(EX_Rd/="00000")and(EX_Rd=ID_Rs2) and (Mem_W ='0') ) then
			ForwardB <= "01";
	elsif((MEM_Reg_Write='1')and(MEM_Rd/="00000")and(MEM_Rd=ID_Rs2) and (Mem_W ='0') ) then
			ForwardB <= "10";
	elsif((MEM_Reg_Write='1')and(MEM_Rd/="00000")and(MEM_Rd=ID_Rs2) and (Mem_W ='1') ) then
			ForwardB <= "11";
	else
			ForwardB <= "00";
	end if;
			
end process ForwardB_proc;

end beh;
