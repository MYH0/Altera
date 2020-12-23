`timescale 1ns/1ns

module serial_full_adder_3bit_tb();
	 reg [2:0] A,B;
	 reg Ci;
	 wire [2:0] S;
	 wire Co;
/*����˵����
���룺
A,BΪһλ�����Ʊ�������CiΪ���Ե�λ�Ľ�λ
�����
SΪ�ͣ�CoΪ��λ
*/
	 serial_full_adder_3bit U0(A,B,Ci,S,Co);

	 initial
		  $monitor($time,"\tA=%b,B=%b,Ci=%b,S=%b,Co=%b",A,B,Ci,S,Co);
	 initial
		  begin
				A=3'b001;B=3'b001;Ci=0;
				#20;A=3'b111;B=3'b001;
				#20;A=3'b101;B=3'b001;
				#20;A=3'b001;B=3'b000;Ci=1;		  
				#20;$stop;	  
		  end
endmodule

