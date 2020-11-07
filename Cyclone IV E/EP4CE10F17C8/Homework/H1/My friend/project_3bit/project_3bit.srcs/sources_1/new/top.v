`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 16:28:19
// Design Name: 
// Module Name: top
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


module top(
input [2:0] a,
input [2:0] b,
input       c,
output           chaoqian_c1,
output[2:0]      chaoqian_sum,
output           f_3bits_add_c1,
output[2:0]      f_3bits_add_sum
    );
f_3bits_add  U1(
        .a(a),
        .b(b),
        .c(c),
        .c1(f_3bits_add_c1),
        .sum(f_3bits_add_sum)
    );  
threebit     U2(
        .sum(chaoqian_sum),
        .c_out(chaoqian_c1),
        .a(a),
        .b(b),
        .c_in(c)
        );
endmodule
