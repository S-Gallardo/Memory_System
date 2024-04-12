`timescale 1 ns/10 ps

module tb_rb();
	//Signals
	
	reg			clk_tb;
	reg			bank_wr_en_tb;
	reg	[2:0]	busC_addr_tb;
	reg	[2:0]	busB_addr_tb;
	reg	[7:0]	busC_tb;
	wire	[7:0]	busA_tb, busB_tb;
	
	register_bank	#( .DATA_WIDTH(8)	) RB (
		.clk(clk_tb),
		.wr_en(bank_wr_en_tb),
		.w_addr(busC_addr_tb),
		.r_addr(busB_addr_tb),
		.w_data(busC_tb),
		.busA(busA_tb),
		.busB(busB_tb)
	);
	
	//Clock generation
	initial	clk_tb = 0;
	always	#50	clk_tb = ~clk_tb;
	
	//Test signal generator
	initial
	begin
		
		//Test vector 00
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b000;
		busB_addr_tb 	= 3'b000;
		busC_tb 			= 8'b11001100;
		# 150;
		
		//Test vector 01
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b001;
		busB_addr_tb 	= 3'b001;
		busC_tb 			= 8'b00110011;
		# 100;
		
		//Test vector 02
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b010;
		busB_addr_tb 	= 3'b010;
		busC_tb 			= 8'b10101010;
		# 100;
		
		//Test vector 03
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b011;
		busB_addr_tb 	= 3'b011;
		busC_tb 			= 8'b01010101;
		# 100;
		
		//Test vector 04
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b100;
		busB_addr_tb 	= 3'b100;
		busC_tb 			= 8'b00001111;
		# 100;
		
		//Test vector 05
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b101;
		busB_addr_tb 	= 3'b101;
		busC_tb 			= 8'b11110000;
		# 100;
		
		//Test vector 06
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b110;
		busB_addr_tb 	= 3'b110;
		busC_tb 			= 8'b10011001;
		# 100;
		
		//Test vector 07
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b111;
		busB_addr_tb 	= 3'b111;
		busC_tb 			= 8'b01100110;
		# 100;
		
		//Test vector 08
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b000;
		busB_addr_tb 	= 3'b000;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 09
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b001;
		busB_addr_tb 	= 3'b001;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 10
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b010;
		busB_addr_tb 	= 3'b010;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 11
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b011;
		busB_addr_tb 	= 3'b011;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 12
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b100;
		busB_addr_tb 	= 3'b100;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 13
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b101;
		busB_addr_tb 	= 3'b101;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 14
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b110;
		busB_addr_tb 	= 3'b110;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 15
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b111;
		busB_addr_tb 	= 3'b111;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 16
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b101;
		busB_addr_tb 	= 3'b101;
		busC_tb 			= 8'b01111110;
		# 100;
		
		//Test vector 17
		bank_wr_en_tb	= 1'b1;
		busC_addr_tb 	= 3'b011;
		busB_addr_tb 	= 3'b011;
		busC_tb 			= 8'b1110111;
		# 100;
		
		//Test vector 18
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b101;
		busB_addr_tb 	= 3'b101;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Test vector 19
		bank_wr_en_tb	= 1'b0;
		busC_addr_tb 	= 3'b011;
		busB_addr_tb 	= 3'b011;
		busC_tb 			= 8'b0000000;
		# 100;
		
		//Stop simulation
		$stop;
	end
endmodule