`timescale 1ns/1ns

module serial_full_adder_3bit_tb();
	 reg [2:0] A,B;
	 reg Ci;
	 wire [2:0] S;
	 wire Co;
/*参数说明：
输入：
A,B为一位二进制被加数，Ci为来自低位的进位
输出：
S为和，Co为进位
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

