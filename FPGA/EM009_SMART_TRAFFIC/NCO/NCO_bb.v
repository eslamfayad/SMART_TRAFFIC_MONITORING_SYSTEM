
module NCO (
	clk,
	reset_n,
	clken,
	phi_inc_i,
	fsin_o,
	out_valid);	

	input		clk;
	input		reset_n;
	input		clken;
	input	[31:0]	phi_inc_i;
	output	[15:0]	fsin_o;
	output		out_valid;
endmodule
