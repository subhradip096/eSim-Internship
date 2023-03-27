`define WIDTH				8
	`define	INSTR_MEM_ADDR_WIDTH	8
	`define DATA_MEM_ADDR_WIDTH		8
 
	/************** Operation Code in instructions ****************/
	`define OP_NOP			4'b0000
	`define OP_ADD			4'b0001
	`define OP_SUB			4'b0010
	`define OP_AND			4'b0011
	`define OP_OR			4'b0100
	`define OP_XOR			4'b0101
	`define OP_SL			4'b0110
	`define OP_SR			4'b0111
	`define OP_SRU			4'b1000
	`define OP_ADDI			4'b1001
	`define OP_LD			4'b1010
	`define OP_ST			4'b1011
	`define OP_BZ			4'b1100
	
	/************** ALU operation command ****************/
	//`define ALU_NC			3'bxxx		// not care
	`define ALU_ADD			3'b000
	`define ALU_SUB			3'b001
	`define ALU_AND			3'b010
	`define ALU_OR			3'b011
	`define ALU_XOR			3'b100
	`define ALU_SL			3'b101
	`define ALU_SR			3'b110
	`define ALU_SRU			3'b111
	
	/************** Branch condition code ****************/
	`define BRANCH_Z		3'b000
	//`define BRANCH_GT		3'b001
	//`define BRANCH_LE		3'b010
module WB_stage
(
	//input					clk,
	
	// from EX stage
	input		[36:0]		pipeline_re_i,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_rea_data[15:0]
												//	[4:0],5bits:	wri_back_en, wri_back_dest[2:0], wri_back_result_mux, 
	
	// to register file
	output					writ_en,
	output		[2:0]		writ_dest,
	output		[15:0]		writ_data,
	
	output		[2:0]		wb_op_dest
);
	
	wire [15:0]	ex_alu_result = pipeline_re_i[36:21];
	wire [15:0]	mem_rea_data = pipeline_re_i[20:5];
	wire		wri_back_en = pipeline_re_i[4];
	wire [2:0]	wri_back_dest = pipeline_re_i[3:1];
	wire		wri_back_result_mux = pipeline_re_i[0];
	
	/********************** to register file *********************/
	assign writ_en = wri_back_en;
	assign writ_dest = wri_back_dest;
	assign writ_data = (wri_back_result_mux)? mem_rea_data : ex_alu_result;
	
	/********************** to hazard detection unit *********************/
	assign wb_op_dest = pipeline_re_i[3:1];
	
	
endmodule 
