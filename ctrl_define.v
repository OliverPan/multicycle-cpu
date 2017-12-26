//load data
//include LB LBU LH LHU LW
`define lbOp 6'h20
`define lbuOp 6'h24
`define lhOp 6'h21
`define lhuOp 6'h25
`define lwOp 6'h23
//store data
//include SB SH SW
`define sbOp 6'h28
`define shOp 6'h29
`define swOp 6'h2b
//r-type
//include ADD ADDU SUB SUBU SLL SRL SRA SLLV SRLV SRAV AND OR XOR NOR SLT SLTU JALR JR
`define rtypeOp 6'h0
//i-type
//include ANDI ORI XORI ADDI ADDIU LUI SLTI SLTIU 
`define andiOp 6'hc
`define oriOp 6'hd
`define xoriOp 6'he
`define addiOp 6'h8
`define addiuOp 6'h9
`define luiOp 6'hf
`define sltiOp 6'ha
`define sltiuOp 6'hb
//branch
//include BEQ BNE BLEZ BGTZ BLTZ BGEZ 
`define beqOp 6'h4
`define bneOp 6'h5
`define bgtzOp 6'h7
`define blezOp 6'h6
`define bltzOp 6'h1
`define bgezOp 6'h1
//jump
//include J JAL 
`define jOp 6'h2
`define jalOp 6'h3