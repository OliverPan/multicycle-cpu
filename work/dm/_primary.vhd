library verilog;
use verilog.vl_types.all;
entity dm is
    port(
        addr            : in     vl_logic_vector(11 downto 2);
        WD              : in     vl_logic_vector(31 downto 0);
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        dout            : out    vl_logic_vector(31 downto 0)
    );
end dm;
