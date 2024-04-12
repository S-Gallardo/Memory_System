`timescale 1 ns/10 ps

module tb_ram();
	//Signals
	localparam	M = 8, N = 3;
	
	reg							clk_tb;
	reg							wr_rdn_tb;
	reg	[N-1:0]				ram_addr_tb;
	reg	[M-1:0]				ram_wr_data_tb;
	wire	[M-1:0]				ram_rd_data_tb;
	
	ram	#( .DATA_WIDTH(M)	)	Memory (
		.clk(clk_tb),
		.wr_en(wr_rdn_tb),
		.addr(ram_addr_tb),
		.w_data(ram_wr_data_tb),
		.r_data(ram_rd_data_tb)
	);
	
	//Clock generation
	initial	clk_tb = 0;
	always	#50	clk_tb = ~clk_tb;
	
	//Test signal generator
	initial
	begin
		
		//Test vector 00
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b000;
		ram_wr_data_tb = 8'b00000110;
		# 150;
		
		//Test vector 01
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b001;
		ram_wr_data_tb = 8'b01100000;
		# 100;
		
		//Test vector 02
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b101;
		ram_wr_data_tb = 8'b00011000;
		# 100;
		
		//Test vector 03
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b111;
		ram_wr_data_tb = 8'b10000001;
		# 100;
		
		//Test vector 04
		wr_rdn_tb 		= 1'b1;
		ram_addr_tb 	= 3'b000;
		ram_wr_data_tb = 8'b00111100;
		# 100;
		
		//Test vector 05
		wr_rdn_tb 		= 1'b1;
		ram_addr_tb 	= 3'b110;
		ram_wr_data_tb = 8'b00000110;
		# 100;
		
		//Test vector 06
		wr_rdn_tb 		= 1'b1;
		ram_addr_tb 	= 3'b100;
		ram_wr_data_tb = 8'b00101110;
		# 100;
		
		//Test vector 07
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b000;
		ram_wr_data_tb = 8'b00101110;
		# 100;
		
		//Test vector 08
		wr_rdn_tb 		= 1'b0;
		ram_addr_tb 	= 3'b100;
		ram_wr_data_tb = 8'b00101110;
		# 100;
		
		//Stop simulation
		$stop;
	end
endmodule