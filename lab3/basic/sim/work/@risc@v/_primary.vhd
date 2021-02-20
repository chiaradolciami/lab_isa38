library verilog;
use verilog.vl_types.all;
entity RiscV is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        Instruction_IM  : in     vl_logic_vector(31 downto 0);
        Read_Data_DM    : in     vl_logic_vector(31 downto 0);
        f_DM_MemRead    : out    vl_logic;
        f_DM_MemWrite   : out    vl_logic;
        PC_IM           : out    vl_logic_vector(31 downto 0);
        ALU_Address_DM  : out    vl_logic_vector(31 downto 0);
        Write_Data_DM   : out    vl_logic_vector(31 downto 0)
    );
end RiscV;
