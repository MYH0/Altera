module chess(RST,CLK,PP);
	 input RST,CLK;	
	 output [1:640000] PP; reg [1:640000] PP;
	 integer i=1,j,k,ph,pl,gh,gl,x;
    always @(negedge RST or posedge CLK)
		  begin
				if(!RST)
					 PP<=0;
            else
                for(j=1;j<=800;j=j+1)
                    for(k=1;k<=800;k=k+1)
								begin
									 ph=i/800+i%800;
                            pl=i-(i/800)*800;
                            gh=ph/100+ph%100;
                            gl=pl/100+pl%100;
                            
                            if((gh+gl)%2==0)
										  PP[i-1]<=0;
									 else
                                PP[i-1]<=1;
										  
									 i=i+1;
                        end
                                      
				
        end
       
endmodule    