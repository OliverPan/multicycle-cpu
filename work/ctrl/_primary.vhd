library verilog;
use verilog.vl_types.all;
entity ctrl is
    port(
        clk             : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 26);
        funct           : in     vl_logic_vector(5 downto 0);
        IRWrite         : out    vl_logic;
        MemtoReg        : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        PCWrite         : out    vl_logic;
        PCWriteCond     : out    vl_logic;
        PCSource        : out    vl_logic_vector(1 downto 0);
        ALUOp           : out    vl_logic_vector(3 downto 0);
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        ALUSrcA         : out    vl_logic_vector(1 downto 0);
        RegWrite        : out    vl_logic;
        RegDst          : out    vl_logic_vector(1 downto 0);
        lsop            : out    vl_logic_vector(1 downto 0);
        extop           : out    vl_logic;
        dmEXTop         : out    vl_logic
    );
end ctrl;
