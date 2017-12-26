library verilog;
use verilog.vl_types.all;
entity beext is
    port(
        din             : in     vl_logic_vector(1 downto 0);
        op              : in     vl_logic_vector(1 downto 0);
        be              : out    vl_logic_vector(3 downto 0)
    );
end beext;
