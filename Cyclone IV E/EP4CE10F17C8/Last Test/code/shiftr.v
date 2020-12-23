module shiftr (Resetn, w, Clock, Q);
	parameter m = 4;
	input Resetn, w, Clock;
	output [1:m] Q;
	reg [1:m] Q/* synthesis keep="1" */;
	integer k/* synthesis keep="1" */;
	always @(negedge Resetn or posedge Clock)
		if (!Resetn)
			Q <= 0;
		else
			begin
				for (k = m; k > 1 ; k = k-1)
				Q[k] <= Q[k-1];
				Q[1] <= w;
			end
endmodule