`timescale 10ns/1ns
module serial_full_adder_4bit_tb();
reg [3:0] A,B;
reg Ci;
wire [3:0] S;
wire Co;
/*����˵����
���룺
A,BΪһλ�����Ʊ�������CiΪ���Ե�λ�Ľ�λ
�����
SΪ�ͣ�CoΪ��λ
*/

serial_full_adder_4bit U0(A,B,Ci,S,Co);

initial
	$monitor($time,"\tA=%b,B=%b,Ci=%b,S=%b,Co=%b",A,B,Ci,S,Co);
initial
begin
	A=4'b0000;B=4'b0000;Ci=0;
	#5;
	A=4'b0000;B=4'b0000;Ci=1;
	#5;
	A=4'b1111;B=4'b1111;Ci=0;
	#5;
	A=4'b1111;B=4'b1111;Ci=1;
	#5;
	$stop;
end
endmodule
