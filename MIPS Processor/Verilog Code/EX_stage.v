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
module EX_stage
(
	input					clk,
	input					rst,
	// from ID_stage
	input		[56:0]		pipeline_re_i,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_writ_en, mem_writ_data[15:0]
												//	[4:0],5bits:	wri_back_en, wri_back_dest[2:0], wri_back_result_mux, 
	
	// to MEM_stage
	output	reg	[37:0]		pipeline_ou,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_writ_en, mem_writ_data[15:0]
												//	[4:0],5bits:	wri_back_en, wri_back_dest[2:0], wri_back_result_mux, 
	
	// to hazard detection unit
	output		[2:0]		ex_op_dest
);
	wire	[2:0]		alu_cmd		= pipeline_re_i[56:54];				//S2
	wire	[15:0]		alu_src1	= pipeline_re_i[53:38];
	wire	[15:0]		alu_src2	= pipeline_re_i[37:22];
	
	wire	[15:0]		ex_alu_result;
	
	/********************** ALU *********************/
	alu alu_inst(
		.a		( alu_src1),
		.b		( alu_src2),
		.cmd	( alu_cmd),
		.r		( ex_alu_result)
	);
	
	
	/********************** singals to MEM_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_ou[37:0] <= 0;
		end
		else begin
			pipeline_ou[37:22] <= ex_alu_result;
			pipeline_ou[21:0] <= pipeline_re_i[21:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign ex_op_dest = pipeline_re_i[3:1];
endmodule 