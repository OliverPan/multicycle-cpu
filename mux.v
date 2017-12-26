module twomux32(din0, din1, node, dout);
    input [31:0]din0;
    input [31:0]din1;
    input node;
    output wire[31:0]dout;

    assign dout = node?din1:din0;
endmodule

module twomux5(din0, din1, node, dout);
    input [4:0]din0;
    input [4:0]din1;
    input node;
    output wire[4:0] dout;

    assign dout = node?din1:din0;
endmodule


module fourmux5(din0, din1, din2, din3, node, dout);
    input [4:0]din0;
    input [4:0]din1;
    input [4:0]din2;
    input [4:0]din3;
    input [1:0]node;
    output reg[4:0]dout;

    always@(*)
    begin
        case(node)
            2'b00: dout = din0;
            2'b01: dout = din1;
            2'b10: dout = din2;
            2'b11: dout = din3;
        endcase
    end
endmodule



module fourmux32(din0, din1, din2, din3, node, dout);
    input [31:0]din0;
    input [31:0]din1;
    input [31:0]din2;
    input [31:0]din3;
    input [1:0]node;
    output reg[31:0]dout;

    always@(*)
    begin
        case(node)
            2'b00: dout = din0;
            2'b01: dout = din1;
            2'b10: dout = din2;
            2'b11: dout = din3;
        endcase
    end
endmodule
