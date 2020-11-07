`timescale  1ns/1ns                // �������ʱ�䵥λ1ns�ͷ���ʱ�侫��Ϊ1ns

module  advance_full_adder_3bit_tb;               // ����ģ��

    reg [2:0] a,b;
    reg c_in;
    wire [2:0] sum;
    wire c_out;
    advance_full_adder_3bit U0(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
    initial 
    begin
        a=3'b001;b=3'b001;c_in=1'b0;
        #20 a=3'b010;b=3'b010;
        #20 a=3'b111;b=3'b001;
        #20 a=3'b011;b=3'b001;
        #20 a=3'b001;b=3'b000;c_in=1'b1;
    end
    endmodule
    