library verilog;
use verilog.vl_types.all;
entity fourmux is
    port(
        din0            : in     vl_logic_vector(31 downto 0);
        din1            : in     vl_logic_vector(31 downto 0);
        din2            : in     vl_logic_vector(31 downto 0);
        din3            : in     vl_logic_vector(31 downto 0);
        node            : in     vl_logic_vector(1 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end fourmux;
