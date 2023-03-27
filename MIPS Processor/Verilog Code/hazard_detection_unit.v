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
module hazard_detection_unit
(
	input		[2:0]		decoding_op_src1,		//ID stage source_1 register number
	input		[2:0]		decoding_op_src2,		//ID stage source_2 register number
	
	input		[2:0]		ex_op_dest,				//EX stage destinaton register number
	input		[2:0]		mem_op_dest,			//MEM stage destinaton register number
	input		[2:0]		wb_op_dest,				//WB stage destinaton register number
	
	output	reg				pipeline_stall_n		// Active low
);
	
	always @ (*) begin
		pipeline_stall_n = 1;
		
		if( decoding_op_src1 != 0 &&
			(
				decoding_op_src1 == ex_op_dest	||
				decoding_op_src1 == mem_op_dest	||
				decoding_op_src1 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
			
		if( decoding_op_src2 != 0 &&
			(
				decoding_op_src2 == ex_op_dest	||
				decoding_op_src2 == mem_op_dest	||
				decoding_op_src2 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
		
		
	end
	
	
	
endmodule 
