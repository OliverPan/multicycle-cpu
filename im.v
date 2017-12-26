module im_4k(addr, dout);
    `timescale 1ns/1ns


    input [11:2]addr;
    output reg[31:0]dout;

    reg [31:0]IMemory[1023:0];
    reg [31:0]temp;

    integer fd, cnt, node;
    initial
    begin
        fd = $fopen("test2.txt", "r");
        node = 0;
        for(node = 0; node < 1024; node = node+1)begin
            cnt = $fscanf(fd, "%x", temp);
            IMemory[node] = temp;
        end
        $fclose(fd);
        $display("finish initial");
    end


    always@(addr)
        dout <= IMemory[addr];

endmodule
