module full_adder
	 (
		  input A,B,Ci,
		  output reg S,Co
	 );
	 /*参数说明：
	 输入：
	 A,B为一位二进制被加数，Ci为来自低位的进位
	 输出：
	 S为和，Co为进位
	 */
	 always@(*)
		  begin
				case({A,B,Ci})
					3'b000:begin S=0;Co=0; end
					3'b001:begin S=1;Co=0; end
					3'b010:begin S=1;Co=0; end
					3'b011:begin S=0;Co=1; end
					3'b100:begin S=1;Co=0; end
					3'b101:begin S=0;Co=1; end
					3'b110:begin S=0;Co=1; end
					3'b111:begin S=1;Co=1; end
				endcase
		  end
endmodule

module serial_full_adder_3bit(
	 input [2:0] A,B,
	 input Ci,
	 output [2:0] S,
	 output Co);
	 /*参数说明：
	 输入：
	 A,B为3位二进制被加数，Ci为来自低位的进位
	 输出：
	 S为和，Co为进位
	 */

	 wire C0,C1,C2;
	 full_adder U0(A[0],B[0],Ci,S[0],C0);
	 full_adder U1(A[1],B[1],C0,S[1],C1);
	 full_adder U2(A[2],B[2],C1,S[2],Co);

endmodule