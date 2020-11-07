module advance_full_adder_3bit(sum,c_out,a,b,c_in);
    input[2:0] a,b;
    input c_in;
    output[2:0] sum;
    output c_out;
    wire[3:0] g,p,c;
  
    assign c[0]=c_in;
    assign p=a^b;
    assign g=a&b;
    assign c[1]=g[0]|(p[0]&c[0]);
    assign c[2]=g[1]|(p[1]&(g[0]|(p[0]&c[0])));
    assign c[3]=g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))));
    assign sum=p^c[2:0];
    assign c_out=c[3];

    
endmodule