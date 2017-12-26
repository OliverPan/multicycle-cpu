`include "./mux.v"
`include "./RFr.v"
`include "./RF.v"
`include "./pc.v"
`include "./mdr.v"
`include "./ir.v"
`include "./im.v"
`include "./ext.v"
`include "./dm.v"
`include "./beext.v"
`include "./alu.v"
`include "./alur.v"
`include "./ctrl.v"
`include "./ALUctrl.v"



module mips(clk, rst);
    input clk;
    input rst;


    //各种线
    wire PCctrl, IRWrite, MemWrite, PCWrite, PCWriteCond, RegWrite,  Zero, extop, dmEXTop;
    wire [1:0]PCSource, ALUSrcB, ALUSrcA, MemtoReg, RegDst, lsop;
    wire [3:0]ALUOp, ALUctrlOp, be;
    wire [4:0]mux1out;
    wire [31:0]PCin, PCout, IMout, IRout, RFout1, RFout2, rfrAout, rfrBout, ALUrlt, ALUrout, DMout, MDrout, mux2out, EXTout, ALUinA, ALUinB;



    assign PCctrl = PCWrite | (PCWriteCond & Zero);


    //实例化模块
    pc PC(clk, PCin, PCctrl, PCout);
    im_4k IM(PCout[11:2], IMout);
    ir IR(clk, IMout, IRWrite, IRout);
    ctrl Control(clk, IRout[31:26], IRout[5:0], IRWrite, MemtoReg, MemWrite, PCWrite, PCWriteCond, PCSource, ALUOp, ALUSrcB, ALUSrcA, RegWrite, RegDst, lsop, extop, dmEXTop);
    aluctrl ALUControl(ALUOp, IRout[5:0], ALUctrlOp);
    fourmux5 IRtoREG(IRout[20:16], IRout[15:11], 5'd31, 5'h0, RegDst, mux1out);
    rf Register(IRout[25:21], IRout[20:16], mux1out, mux2out, RegWrite, RFout1, RFout2);
    rfr rfrA(clk, RFout1, rfrAout);
    rfr rfrB(clk, RFout2, rfrBout);
    ext EXT(IRout[15:0], extop, EXTout);
    fourmux32 AtoALU(PCout, rfrAout, (rfrAout+{27'h0, IRout[10:6]}) , 32'h0, ALUSrcA, ALUinA);
    fourmux32 BtoALU(rfrBout, 32'h4, EXTout, {EXTout[29:0], 2'h0}, ALUSrcB, ALUinB);
    alu ALU(IRout[20:16], ALUinA, ALUinB, ALUctrlOp, ALUrlt, Zero);
    alur ALUr(clk, ALUrlt, ALUrout);
    fourmux32 muxPC(ALUrlt, ALUrout, {PCout[31:28], IRout[25:0], 2'b00}, 32'h0, PCSource, PCin);
    beext beEXT(ALUrout[1:0], lsop, be);
    dm_4k DM(ALUrout[11:2], be, rfrBout, MemWrite, clk, dmEXTop, DMout);
    mdr MDr(DMout, MDrout);
    fourmux32 MDRtoRF(ALUrout, MDrout, PCout, 32'h0, MemtoReg, mux2out);    
endmodule



