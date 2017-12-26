library verilog;
use verilog.vl_types.all;
entity mdr is
    port(
        MemData         : in     vl_logic_vector(31 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end mdr;
