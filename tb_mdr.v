`timescale 1 ns/10 ps

module tb_mdr();
	//Signals
	
	reg			clk_tb, rst_tb;
	reg			mdr_en_tb, mdr_alu_n_tb;
	reg	[7:0]	bus_alu_tb, bus_data_in_tb;
	wire	[7:0]	busC_tb, ram_wr_data_tb;
	
	mdr	#( .DATA_WIDTH(8)	) MDR (
		.clk(clk_tb),
		.rst(rst_tb),
		.mdr_en(mdr_en_tb),
		.mdr_alu_n(mdr_alu_n_tb),
		.bus_alu(bus_alu_tb),
		.bus_data_in(bus_data_in_tb),
		.bus_c(busC_tb),
		.bus_data_out(ram_wr_data_tb)
	);
	
	//Clock generation
	initial	clk_tb = 0;
	always	#50	clk_tb = ~clk_tb;
	
	//Test signal generator
	initial
	begin
		
		//Test vector 00
		rst_tb			= 1'b1;
		mdr_en_tb		= 1'b0;
		mdr_alu_n_tb 	= 1'b0;
		bus_alu_tb 		= 8'b00000000;
		bus_data_in_tb	= 8'b00000000;
		# 50;
		
		//Test vector 01
		rst_tb			= 1'b0;
		mdr_en_tb		= 1'b0;
		mdr_alu_n_tb 	= 1'b0;
		bus_alu_tb 		= 8'b00000000;
		bus_data_in_tb	= 8'b11111111;
		# 100;
		
		//Test vector 02
		mdr_en_tb		= 1'b0;
		mdr_alu_n_tb 	= 1'b0;
		bus_alu_tb 		= 8'b00001111;
		bus_data_in_tb	= 8'b11110000;
		# 100;
		
		//Test vector 03
		mdr_en_tb		= 1'b1;
		mdr_alu_n_tb 	= 1'b1;
		bus_alu_tb 		= 8'b11000011;
		bus_data_in_tb	= 8'b00111100;
		# 100;
		
		//Test vector 04
		mdr_en_tb		= 1'b1;
		mdr_alu_n_tb 	= 1'b1;
		bus_alu_tb 		= 8'b01100110;
		bus_data_in_tb	= 8'b10011001;
		# 100;
		
		//Test vector 05
		mdr_en_tb		= 1'b0;
		mdr_alu_n_tb 	= 1'b1;
		bus_alu_tb 		= 8'b10101010;
		bus_data_in_tb	= 8'b00000000;
		# 100;
		
		//Test vector 06
		mdr_en_tb		= 1'b1;
		mdr_alu_n_tb 	= 1'b0;
		bus_alu_tb 		= 8'b10101010;
		bus_data_in_tb	= 8'b01010101;
		# 100;
		
		//Test vector 07
		rst_tb			= 1'b1;
		mdr_en_tb		= 1'b0;
		mdr_alu_n_tb 	= 1'b0;
		bus_alu_tb 		= 8'b00000000;
		bus_data_in_tb	= 8'b00000000;
		# 100;
		
		//Stop simulation
		$stop;
	end
endmodule