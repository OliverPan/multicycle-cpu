module ir(clk, din, IRWrite, dout);
    input clk;
    input [31:0]din;
    input IRWrite;
    output wire[31:0] dout;
    
    reg [31:0]InstructionReg;

    initial
        InstructionReg = 32'b0;

    always@(posedge clk)begin
        if(IRWrite)
            InstructionReg = din;
    end

    assign dout = InstructionReg;

endmodule