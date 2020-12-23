module regn (R, Rin, Clock, Q);
	parameter n = 8/* synthesis keep="1" */;
	input R;
	input Rin, Clock;
	output Q;
	reg Q/* synthesis keep="1" */;
	always @(posedge Clock)
		if (Rin)
			Q <= R;
endmodule

module trin (Y, E, F);
	parameter n = 8;
	input Y;
	input E;
	output F;
	wire F/* synthesis keep="1" */;
	assign F = E ? Y : 'bz;
endmodule

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

module swap (Data, Resetn, w, Clock, Extern, RinExt, BusWires);
	input [7:0] Data;
	input Resetn, w, Clock, Extern;
	input [1:3] RinExt;
	output [7:0] BusWires;
	tri [7:0] BusWires/* synthesis keep="1" */;
	wire [1:3] Rin, Rout, Q/* synthesis keep="1" */;
	wire [7:0] R1, R2, R3/* synthesis keep="1" */;
	shiftr control (Resetn, w, Clock, Q);
	defparam control.m = 3/* synthesis keep="1" */;
	assign Rin[1] = RinExt[1] | Q[3];
	assign Rin[2] = RinExt[2] | Q[2];
	assign Rin[3] = RinExt[3] | Q[1];
	assign Rout[1] = Q[2];
	assign Rout[2] = Q[1];
	assign Rout[3] = Q[3];
	regn reg1 (BusWires, Rin[1], Clock, R1);
	regn reg2 (BusWires, Rin[2], Clock, R2);
	regn reg3 (BusWires, Rin[3], Clock, R3);
	trin triext (Data, Extern, BusWires);
	trin tri_1 (R1, Rout[1], BusWires);
	trin tri_2 (R2, Rout[2], BusWires);
	trin tri_3 (R3, Rout[3], BusWires);
endmodule
