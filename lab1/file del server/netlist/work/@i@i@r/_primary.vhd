library verilog;
use verilog.vl_types.all;
entity IIR is
    port(
        VIN             : in     vl_logic;
        RSTn            : in     vl_logic;
        CLK             : in     vl_logic;
        DIN             : in     vl_logic_vector(7 downto 0);
        A1              : in     vl_logic_vector(7 downto 0);
        B1              : in     vl_logic_vector(7 downto 0);
        B0              : in     vl_logic_vector(7 downto 0);
        DOUT            : out    vl_logic_vector(7 downto 0);
        VOUT            : out    vl_logic
    );
end IIR;
