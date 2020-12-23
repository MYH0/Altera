`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 15:20:07
// Design Name: 
// Module Name: 3bit2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module f_3bits_add(
	input  [2:0]       a,
	input  [2:0]       b,
	input	        c,
	output              c1,
	output [2:0]       sum
);

wire [1:0]  middle;
f_1bit_add  U1(
	.a(a[0]),
	.b(b[0]),
	.c(c),
	.c1(middle[0]),
	.sum(sum[0])
);

f_1bit_add  U2(
	.a(a[1]),
	.b(b[1]),
	.c(middle[0]),
	.c1(middle[1]),
	.sum(sum[1])
);
f_1bit_add  U3(
	.a(a[2]),
	.b(b[2]),
	.c(middle[1]),
	.c1(c1),
	.sum(sum[2])
);





endmodule
module f_1bit_add(
	input 	a,
	input 	b,
	input	c,
	output     c1,
	output     sum
);
assign {c1,sum}=a+b+c;

endmodule
