library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clk             : in     vl_logic;
        pcin            : in     vl_logic_vector(31 downto 0);
        inst            : in     vl_logic;
        pcout           : out    vl_logic_vector(31 downto 0)
    );
end pc;
