`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 16:57:23
// Design Name: 
// Module Name: top_tb
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


module top_tb;
  
reg [2:0] a;
reg [2:0]b;
reg c;
wire [2:0]chaoqian_sum;
wire chaoqian_c1;
wire [2:0] f_3bits_add_sum;
wire f_3bits_add_c1;
top  X(
        .a(a),
        .b(b),
        .c(c),
        .chaoqian_c1(chaoqian_c1),
        .chaoqian_sum(chaoqian_sum),
        .f_3bits_add_c1(f_3bits_add_c1),
        .f_3bits_add_sum(f_3bits_add_sum)
        );
initial begin
  a=3'b0000;
  b=3'b0000;
  c=0;
end
always #5 c=c+1;
always #10 a=a+1;
always #160 b=b+1;


endmodule
