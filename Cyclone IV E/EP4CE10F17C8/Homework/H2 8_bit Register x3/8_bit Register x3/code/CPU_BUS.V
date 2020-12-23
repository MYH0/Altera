module  CPU_BUS (
                    RESET,
                    FSMC_ADD, 
                    FSMC_nCS, 
                    FSMC_NOE, 
                    FSMC_NWE, 
                    FSMC_DATAIN, 
                    CLK_IN,
                    R1,
                    R2,
                    R3
                );
    input RESET; wire RESET;
    input [3:0] FSMC_ADD; wire[3:0] FSMC_ADD;
    input FSMC_nCS; wire FSMC_nCS;
    input [1:0] FSMC_NOE; wire[1:0] FSMC_NOE;               
    input FSMC_NWE; wire FSMC_NWE;                 
    input [7:0] FSMC_DATAIN; wire [7:0] FSMC_DATAIN;
    input CLK_IN; wire CLK_IN;
    //**********************************************************************************************************
    wire [7:0] DATA_R1/* synthesis keep="1" */;
    wire [7:0] DATA_R2/* synthesis keep="1" */;
    wire [7:0] DATA_R3/* synthesis keep="1" */;
    wire [7:0] DATAOUT;
    output [7:0] R1; reg[7:0] R1/* synthesis keep="1" */;
    output [7:0] R2; reg[7:0] R2/* synthesis keep="1" */;
    output [7:0] R3; reg[7:0] R3/* synthesis keep="1" */;
    reg [3:0] Num;
    //总线写入数据接口
    RegCPUData Reg_1(RESET,CLK_IN,FSMC_nCS,FSMC_NWE,4'h0,FSMC_ADD, FSMC_DATAIN,DATA_R1);
    RegCPUData Reg_2(RESET,CLK_IN,FSMC_nCS,FSMC_NWE,4'h1,FSMC_ADD, FSMC_DATAIN,DATA_R2);
    RegCPUData Reg_3(RESET,CLK_IN,FSMC_nCS,FSMC_NWE,4'h2,FSMC_ADD, FSMC_DATAIN,DATA_R3);

    always @(posedge CLK_IN or negedge RESET)
        begin 
            if(!RESET) 
                begin 
                    R1<=0;
                    R2<=0;
                    R3<=0;
                    Num<=0;
                end 
            else 
                begin
                //将R3作为中间暂存，把R1和R2数据交换
                    if(FSMC_NOE==2'b01) 
                        begin 
                            if(Num==0)      begin R3<=R2; Num<=1; end 
                            else if(Num==1) begin R2<=R1; Num<=2; end  
                            else            begin R1<=R3; Num<=3; end 
                        end 
                    else 
                        begin 
                        //得到的数据写入三个寄存器
                            R1<=DATA_R1;
                            R2<=DATA_R2;
                            R3<=DATA_R3;
                        end 			
                end 
        end 
endmodule


module RegCPUData(Reset,Clk,CS,WR,SET_ADD,ADD,DATAIN,DATAOUT);
    input Reset; wire Reset;
    input Clk; wire Clk;
    input CS; wire CS;
    input WR; wire WR;
    input [3:0] SET_ADD; wire [3:0] SET_ADD;  
    input [3:0] ADD; wire [3:0] ADD;
    input [7:0] DATAIN; wire [7:0] DATAIN;
    output [7:0] DATAOUT; reg [7:0] DATAOUT;
    
    always @(posedge Clk or negedge Reset)
        begin 
            if(!Reset)   
                DATAOUT<=8'd0; //1 input   0 output 
            else if (!CS && !WR && (SET_ADD == ADD))  
                DATAOUT<=DATAIN;
        end 
endmodule