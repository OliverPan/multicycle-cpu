#Multicycle CPU
1. datapath <br/>
    datapath中包含的文件有：pc.v, im.v, ir.v, 
    RF.v, RFr.v, alu.v, alur.v, ext.v, 
    beext.v(实现load和store指令中字节使能功能), 
    md.v(数据内存), mdr.v
    
2. define <br/>
    define里面包含一些定义文件：
    1. store_define.v里面包含的是控制be功能的信号量
    2. Itype_define.v里面包含的是ctrl传到aluctrl中控制I指令的opcode
    3. ctrl_define.v里面存的是指令[31:26]对应的指令类型
    4. alu_define.v里面存的是alu_ctrl传到alu器件中的控制信号量

3. ctrl<br/>
    1. ctrl.v是主控制单元，以指令前六位和后六位以及时钟clk作为输入，（以后六位作为输入
    主要是为了实现jalr和jr，非常混乱。。）
    2. alu_ctrl.v是alu控制单元，接受ctrl的op码外还接受
    指令的[5:0]来实现alu运算。
  
4. General<br/>
    General里面只写了一个mux.v，里面包含四个不同的多路选择器模块

5. mips<br/>
    mips里面包含mips.v和mips_tb.v，一个是完整电路，一个是测试文件
