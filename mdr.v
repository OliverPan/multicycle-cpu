module mdr(MemData, dout);
    input [31:0]MemData;
    output reg[31:0]dout;


    initial
        dout = 32'b0;

    always@(*)begin
        dout = MemData;
    end

    

endmodule
