`include "./alu_define.v"
module alu(rt, aluinA, aluinB, aluinst, alurlt, Zero);
    input [4:0]rt;
    input [31:0]aluinA;
    input [31:0]aluinB;
    input [3:0]aluinst;
    output reg [31:0]alurlt;
    output reg Zero;

    always@(*)
    begin
        case(aluinst)
            `ADD: alurlt = aluinA + aluinB;
            `SUB: alurlt = aluinA - aluinB;
            `AND: alurlt = aluinA & aluinB;
            `OR: alurlt = aluinA | aluinB;
            `XOR: alurlt = aluinA ^ aluinB;
            `NOR: alurlt = ~(aluinA | aluinB);
            `SLT: alurlt = {31'b0, (aluinA[31] | aluinB[31]) ^ ((aluinA < aluinB)?1'b1:1'b0)};
            `SLTU: alurlt = {31'b0, (aluinA<aluinB)?1'b1:1'b0};
            `SLL: alurlt = aluinB << aluinA[4:0];
            `SRL: alurlt = aluinB >> aluinA[4:0];
            `SRA: alurlt = aluinB >> aluinA[4:0] | ({32{aluinB[31]}} << (6'd32-{1'b0, aluinA[4:0]}));
            `LU: alurlt = {aluinB[15:0], 16'b0};
            `BNE: alurlt = (aluinA==aluinB)?32'h1:32'h0;
            `BGTZ: alurlt = ((aluinA[31]==0) && (aluinA != 0))?32'h0:32'h1;
            `BLEZ: alurlt = ((aluinA[31]==0) && (aluinA != 0))?32'h1:32'h0;
            `BLTZ: alurlt = (aluinA[31]==0)?{31'h0, ~rt[0]}:{31'h0, rt[0]};//and BGEZ
            default:
                alurlt = 32'b0;
        endcase
        if(alurlt == 0)
            Zero = 1'b1;
        else
            Zero = 1'b0;
    end
endmodule
