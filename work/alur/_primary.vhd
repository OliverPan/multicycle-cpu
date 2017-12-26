library verilog;
use verilog.vl_types.all;
entity alur is
    port(
        clk             : in     vl_logic;
        alurlt          : in     vl_logic_vector(31 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end alur;
