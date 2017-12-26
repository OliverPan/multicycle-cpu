module dm_4k(addr, be, din, DMWr, clk, op, dout);
    input [11:2]addr;
    input [3:0]be;
    input [31:0]din; 
    input DMWr;
    input clk;
    input op;
    output reg[31:0] dout;

    reg [31:0] Memory[1023:0];

    always@(posedge clk)begin
        if(DMWr)begin
            case(be)
                4'b1111: Memory[addr] = din;
                4'b1100: Memory[addr][31:16] = din[15:0];
                4'b0011: Memory[addr][15:0] = din[15:0];
                4'b0001: Memory[addr][7:0] = din[7:0];
                4'b0010: Memory[addr][15:8] = din[7:0];
                4'b0100: Memory[addr][23:16] = din[7:0];
                4'b1000: Memory[addr][31:24] = din[7:0];
            endcase
        end
        if(op==0)begin
            case(be)
                4'b1111: dout = Memory[addr];
                4'b1100: dout = {{16{Memory[addr][31]}}, Memory[addr][31:16]};
                4'b0011: dout = {{16{Memory[addr][15]}}, Memory[addr][15:0]};
                4'b0001: dout = {{24{Memory[addr][7]}}, Memory[addr][7:0]};
                4'b0010: dout = {{24{Memory[addr][15]}}, Memory[addr][15:8]};
                4'b0100: dout = {{24{Memory[addr][23]}}, Memory[addr][23:16]};
                4'b1000: dout = {{24{Memory[addr][31]}}, Memory[addr][31:24]};
            endcase
        end
        else
        begin
            case(be)
                4'b1111: dout = Memory[addr];
                4'b1100: dout = {16'h0, Memory[addr][31:16]};
                4'b0011: dout = {16'h0, Memory[addr][15:0]};
                4'b0001: dout = {24'h0, Memory[addr][7:0]};
                4'b0010: dout = {24'h0, Memory[addr][15:8]};
                4'b0100: dout = {24'h0, Memory[addr][23:16]};
                4'b1000: dout = {24'h0, Memory[addr][31:24]};
            endcase
        end
    end

endmodule
