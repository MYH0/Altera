module trin (Y, E, F);
	parameter n = 8;
	input Y;
	input E;
	output F;
	wire F/* synthesis keep="1" */;
	assign F = E ? Y : 'bz;
endmodule