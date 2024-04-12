`timescale 1 ns/10 ps

module tb_mov_acc_a();
	//Signals
	
	reg			clk_tb, rst_tb, ir_sclr_tb, mar_sclr_tb;
	reg	[1:0]	shamt_tb;
	reg	[2:0]	selop_tb, busB_addr_tb, busC_addr_tb;
	reg			enaf_tb, bank_wr_en_tb, ir_en_tb, mar_en_tb, wr_rdn_tb, mdr_alu_n_tb, mdr_en_tb;
	
	wire			C_tb, N_tb, P_tb, Z_tb;
	wire	[4:0]	instruction_tb;
	wire	[7:0]	busC_m_tb, bus_alu_m_tb, PC_m_tb, DPTR_m_tb, A_m_tb, TEMP_m_tb, ACC_m_tb;
	
	memory_system	#( .DATA_WIDTH(8)	) MEMSYS (
		.clk(clk_tb),
		.rst(rst_tb),
		.ir_sclr(ir_sclr_tb),
		.mar_sclr(mar_sclr_tb),
		.enaf(enaf_tb),
		.selop(selop_tb),
		.shamt(shamt_tb),
		.bank_wr_en(bank_wr_en_tb),
		.busB_addr(busB_addr_tb),
		.busC_addr(busC_addr_tb),
		.ir_en(ir_en_tb),
		.mar_en(mar_en_tb),
		.wr_rdn(wr_rdn_tb),
		.mdr_alu_n(mdr_alu_n_tb),
		.mdr_en(mdr_en_tb),
		.busC_m(busC_m_tb),
		.bus_alu_m(bus_alu_m_tb),
		.PC_m(PC_m_tb),
		.DPTR_m(DPTR_m_tb),
		.A_m(A_m_tb),
		.TEMP_m(TEMP_m_tb),
		.ACC_m(ACC_m_tb),
		.instruction(instruction_tb),
		.C(C_tb),
		.N(N_tb),
		.P(P_tb),
		.Z(Z_tb)
	);
	
	//Clock generation
	initial	clk_tb = 0;
	always	#50	clk_tb = ~clk_tb;
	
	//Test signal generator
	initial
	begin
		
		//Test vector 00
		rst_tb			= 1'b1;
		ir_sclr_tb		= 1'b0;
		mar_sclr_tb		= 1'b0;
		enaf_tb			= 1'b0;
		selop_tb			= 3'b000;
		shamt_tb			= 2'b00;
		bank_wr_en_tb	= 1'b0;
		busB_addr_tb	= 3'b000;
		busC_addr_tb	= 3'b000;
		ir_en_tb			= 1'b0;
		mar_en_tb		= 1'b0;
		wr_rdn_tb		= 1'b0;
		mdr_alu_n_tb	= 1'b0;
		mdr_en_tb		= 1'b0;
		# 20;
		
		rst_tb			= 1'b0;
		# 10;
		
		//Test vector 01
		rst_tb			= 1'b0;
		enaf_tb			= 1'b1;
		selop_tb			= 3'b00;
		shamt_tb			= 2'b00;
		bank_wr_en_tb	= 1'b1;
		busB_addr_tb	= 3'b011;
		busC_addr_tb	= 3'b111;
		ir_en_tb			= 1'b0;
		mar_en_tb		= 1'b0;
		wr_rdn_tb		= 1'b0;
		mdr_alu_n_tb	= 1'b0;
		mdr_en_tb		= 1'b0;
		# 50;
		
		//Stop simulation
		$stop;
	end
endmodule