module register_bank
	#(	parameter	DATA_WIDTH = 4)
	(	input		wire	clk,
		input		wire	wr_en,
		input		wire	[2:0] w_addr, r_addr,
		input		wire	[DATA_WIDTH-1:0] w_data,
		output	wire	[DATA_WIDTH-1:0] busA, busB, PC, DPTR, A, TEMP
	);
	
	reg [DATA_WIDTH-1:0] array_reg [7:0];
	
	initial begin
		array_reg[0] = 8'b00000001;
		array_reg[1] = 8'b00000010;
		array_reg[2] = 8'b00000100;
		array_reg[3] = 8'b11111111;
		array_reg[4] = 8'b00010000;
		array_reg[5] = 8'b00100000;
		array_reg[6] = 8'b01000000;
		array_reg[7] = 8'b00110000;
	end
	
	always @(posedge clk) begin
		if (wr_en) begin 
			array_reg[w_addr] <= w_data;
		end
	end
	
	assign	busB	=	array_reg[r_addr];
	assign	busA	=	array_reg[3'b111];
	assign	PC		=	array_reg[3'b000];
	assign	DPTR	=	array_reg[3'b010];
	assign	A		=	array_reg[3'b011];
	assign	TEMP	=	array_reg[3'b101];
	
endmodule