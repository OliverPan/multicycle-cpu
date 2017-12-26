`include "./mips.v"

module mips_tb();
    `timescale 1ns/1ns

    reg clk;
    reg rst;


    integer fd;

    initial
    begin
        clk = 1;

    end

    always
    #20 
    clk = ~clk;
    

    mips MIPS(clk, rst);



endmodule
