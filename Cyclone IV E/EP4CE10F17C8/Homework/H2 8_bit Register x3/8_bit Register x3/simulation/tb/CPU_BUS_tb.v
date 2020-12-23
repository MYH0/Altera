`timescale 1ns / 1ps

module CPU_BUS_tb;
	 //Input
	 reg RESET;
	 reg [3:0] FSMC_ADD;
	 reg FSMC_nCS;
	 reg [1:0] FSMC_NOE;
	 reg FSMC_NWE;
	 reg [7:0] FSMC_DATAIN;
	 reg CLK_IN;

	 //ʵ���������Ե�Ԫ
	 CPU_BUS uut (
		  .RESET(RESET), 
		  .FSMC_ADD(FSMC_ADD), 
		  .FSMC_nCS(FSMC_nCS), 
		  .FSMC_NOE(FSMC_NOE), 
		  .FSMC_NWE(FSMC_NWE), 
		  .FSMC_DATAIN(FSMC_DATAIN), 
		  .CLK_IN(CLK_IN)
	 );

	 initial 
		  begin
				//��ʼ��input
				RESET = 0;
				FSMC_ADD = 0;
				FSMC_nCS = 0;
				FSMC_NOE = 0;
				FSMC_NWE = 0;
				FSMC_DATAIN = 0;
				CLK_IN = 0;

				//�ȴ�100�������ȫ��Reset
				#100;
				RESET = 1;
		  end

		  always 
				begin 
					#10;CLK_IN=0;
					#10;CLK_IN=1;
				end 
		  reg[31:0] Num;
		  reg[31:0] Ctr;
		  always @(posedge CLK_IN or negedge  RESET)
		  begin 
				if(!RESET) 
					 begin 
						  FSMC_ADD <= 0;
						  FSMC_nCS <= 0;
						  FSMC_NOE <= 0;
						  FSMC_NWE <= 0;
						  FSMC_DATAIN <= 0;
						  Num<=0;
						  Ctr<=0;
					 end 
				else 
                begin 
						  case (Num) 
								0:begin 
									 FSMC_ADD <= 0;//������R1�Ĵ���д�������ݴ�СΪAB
									 FSMC_nCS <= 0;
							   	 FSMC_NOE <= 0;
									 FSMC_NWE <= 0;
									 FSMC_DATAIN <= 8'hAB;
									 Num<=1;
									 Ctr<=0;
								  end 
                                  
								1:begin 
									 FSMC_ADD <= 0;
									 FSMC_nCS <= 1;
									 Num<=2;
								  end
                                  
								2:begin 
									 FSMC_ADD <= 1;//������R2�Ĵ���д�������ݴ�СΪAC
									 FSMC_nCS <= 0;
							  	    FSMC_NOE <= 0;
								    FSMC_NWE <= 0;
									 FSMC_DATAIN <= 8'hAC;
									 Num<=3;
								  end 
                                  
								3:begin 
					 				 FSMC_ADD <= 0;
									 FSMC_nCS <= 1;
									 Num<=4;
								  end 
                                  
								4:begin 
									 FSMC_ADD <= 2;//������R3�Ĵ���д�������ݴ�СΪAC
									 FSMC_nCS <= 0;
									 FSMC_NOE <= 0;
									 FSMC_NWE <= 0;
									 FSMC_DATAIN <= 8'hAD;
									 Num<=5;
		   					  end 
                              
								5:begin //��������R1��R2���ݽ���
									 FSMC_ADD <= 0;
									 FSMC_nCS <= 1;
									 Ctr<=Ctr+1;
									 if(Ctr>20) 
										  Num<=6;
								  end 
                                  
								6,7,8,9:begin 
												FSMC_NOE <= 2'b01; 
												Num<=Num+1;
										  end 
                                          
								10:begin 
									    FSMC_NOE <= 2'b01; 
									end 
						  endcase 
			       end 
		  end      
endmodule

