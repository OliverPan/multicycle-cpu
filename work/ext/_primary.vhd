library verilog;
use verilog.vl_types.all;
entity ext is
    port(
        din             : in     vl_logic_vector(15 downto 0);
        op              : in     vl_logic;
        dout            : out    vl_logic_vector(31 downto 0)
    );
end ext;
