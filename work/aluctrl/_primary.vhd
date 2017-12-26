library verilog;
use verilog.vl_types.all;
entity aluctrl is
    port(
        aluop           : in     vl_logic_vector(3 downto 0);
        instIn          : in     vl_logic_vector(5 downto 0);
        instOut         : out    vl_logic_vector(4 downto 0)
    );
end aluctrl;
