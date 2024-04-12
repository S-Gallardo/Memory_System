module flag_register
	# ( parameter MAX_WIDTH = 8 )(
	input		wire							clk,
	input		wire							rst,
	input		wire							enaf,
	input		wire	[MAX_WIDTH-1:0]	dataa,
	input		wire							carry,
	output	reg							C,
	output	reg							N,
	output	reg							Z,
	output	reg							P
);

	initial begin
		C = 1'b0;
		N = 1'b0;
		P = 1'b0;
		Z = 1'b0;
	end
	
	always @(posedge clk, posedge rst, carry, dataa, enaf) begin
		if (rst) begin
			C <= 1'b0;
			N <= 1'b0;
			P <= 1'b0;
			Z <= 1'b0;
		end else if (enaf) begin
			C <= carry;
			N <= dataa[MAX_WIDTH-1];
			P <= ~(dataa[3] ^ dataa[2] ^ dataa[1] ^ dataa[0]);
			Z <= (dataa == 0) ? 1'b1 : 1'b0;
		end
	end

endmodule 