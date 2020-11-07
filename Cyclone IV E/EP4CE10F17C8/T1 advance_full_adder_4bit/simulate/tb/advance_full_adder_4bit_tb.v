
module advance_full_adder_4bit_tb;
  reg [3:0] a,b;
  reg c_in;
  wire [3:0] sum;
  wire c_out;
  advance_full_adder_4bit U0(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
  initial 
    begin
      a=4'b0001;b=4'b0101;c_in=1'b0;
      #100 a=4'b0001;b=4'b0111;
      #100 a=4'b0111;b=4'b1100;
      #100 b=4'b1111;c_in=1'b1;
      #100 a=4'b1101;b=4'b0100;
      #100 a=4'b0000;b=4'b1001;c_in=1'b0;
      #100 a=4'b1000;b=4'b0110;
  end
endmodule