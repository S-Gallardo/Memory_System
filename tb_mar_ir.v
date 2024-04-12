`timescale 1 ns/10 ps

module tb_mar_ir();
	//Signals
	localparam	M = 8;
	
	reg							clk_tb;
	reg 							rst_tb;
	reg							sclr_tb;
	reg							mar_en_tb;
	reg							ir_en_tb;
	reg	[M-1:0]				busC_tb;
	wire	[M-4:0]				instruction_tb;
	wire	[M-1:0]				ram_addr_tb;
	
	ir	#( .DATA_WIDTH(M)	) IR (
		.clk(clk_tb),
		.rst(rst_tb),
		.sclr(sclr_tb),
		.ena(ir_en_tb),
		.d(busC_tb),
		.q(instruction_tb)
	);
	
	mar	#( .DATA_WIDTH(M)	) MAR (
		.clk(clk_tb),
		.rst(rst_tb),
		.sclr(sclr_tb),
		.ena(mar_en_tb),
		.d(busC_tb),
		.q(ram_addr_tb)
	);
	
	//Clock generation
	initial	clk_tb = 0;
	always	#50	clk_tb = ~clk_tb;
	
	//Test signal generator
	initial
	begin
		
		//Test vector 00
		rst_tb 		= 1'b1;
		sclr_tb		= 1'b1;
		mar_en_tb 	= 1'b0;
		ir_en_tb 	= 1'b0;
		busC_tb 		= 8'b00000000;
		# 50;
		
		//Test vector 01
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b0;
		mar_en_tb 	= 1'b0;
		ir_en_tb 	= 1'b0;
		busC_tb 		= 8'b01100000;
		# 100;
		
		//Test vector 02
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b0;
		mar_en_tb 	= 1'b1;
		ir_en_tb 	= 1'b0;
		busC_tb 		= 8'b00001100;
		# 100;
		
		//Test vector 03
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b0;
		mar_en_tb 	= 1'b0;
		ir_en_tb 	= 1'b1;
		busC_tb 		= 8'b11110000;
		# 100;
		
		//Test vector 04
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b1;
		mar_en_tb 	= 1'b1;
		ir_en_tb 	= 1'b1;
		busC_tb 		= 8'b11111111;
		# 100;
		
		//Test vector 05
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b0;
		mar_en_tb 	= 1'b1;
		ir_en_tb 	= 1'b0;
		busC_tb 		= 8'b01110000;
		# 100;
		
		//Test vector 06
		rst_tb 		= 1'b0;
		sclr_tb		= 1'b0;
		mar_en_tb 	= 1'b0;
		ir_en_tb 	= 1'b1;
		busC_tb 		= 8'b00111100;
		# 100;
		
		//Stop simulation
		$stop;
	end
endmodule
