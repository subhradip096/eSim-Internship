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
	`define ALU_NC			3'bxxx		// not care
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

module ID_stage
(
	input					clk,
	input					rst,
	input					enable,
	//input					insert_bubble,
	
	
	// to EX_stage
	output	reg	[56:0]		pipeline_ou,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_writ_en, mem_writ_data[15:0]
												//	[4:0],5bits:	wri_back_en, wri_back_dest[2:0], wri_back_result_mux, 
	
	// to IF_stage
	input		[15:0]		instruction,
	output		[5:0]		branch_offst_imm,
	output	reg				branch_taken,
	
	// to register file
	output		[2:0]		rea_addr_1,	// register file read port 1 address
	output		[2:0]		rea_addr_2,	// register file read port 2 address
	input		[15:0]		rea_data_1,	// register file read port 1 data
	input		[15:0]		rea_data_2,	// register file read port 2 data
	
	// to hazard detection unit
	output		[2:0]		decoding_op_src1,		//source_1 register number
	output		[2:0]		decoding_op_src2		//source_2 register number
	
);
    
	/********************** internal wires ***********************************/
	//----------------- Instruction Register signals --------------------//
	reg		[15:0]		instruction_re;
	wire	[3:0]		ir_op_code;		//operation code
	wire	[2:0]		ir_dest;		//destination register number
	wire	[2:0]		ir_src1;		//source_1 register number
	wire	[2:0]		ir_src2;		//source_2 register number
	wire	[5:0]		ir_imm;			//immediate number carried by the instruction
	
	//---------------- data path control signals --------------------------//
	// write back stage signals
	reg					wri_back_en;			// S3
	wire	[2:0]		wri_back_dest;		// dest
	reg					wri_back_result_mux;	// S1
	// mem stage signals
	wire				mem_writ_en;		
	wire	[15:0]		mem_writ_data;
	// ex stage signals
	reg		[2:0]		ex_alu_cmd;				//S2
	wire	[15:0]		ex_alu_src1;
	wire	[15:0]		ex_alu_src2;
	// instruction decode stage signals
	reg					alu_src2_mux;			// S4
	wire				decoding_op_is_branch;	//S5
	wire				decoding_op_is_store;	//S6
	wire	[3:0]		ir_op_code_with_bubble;
	wire	[2:0]		ir_dest_with_bubble;
	//reg					branch_condition_satisfied;
	
	
	/********************** Instruction Register *********************/
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			instruction_re <= 0;
		end
		else begin
			if(enable) begin
				instruction_re <= instruction;
			end
		end
	end
	assign ir_op_code = instruction_re[15:12];
	assign ir_dest = instruction_re[11: 9];
	assign ir_src1 = instruction_re[ 8: 6];
	assign ir_src2 = (decoding_op_is_store)? instruction_re[11: 9] : instruction_re[ 5: 3];
	assign ir_imm  = instruction_re[ 5: 0];
	
	/********************** pipeline bubble insertion *********************/
	// if instrcution decode is frozen, insert bubble operations into the pipeline
	assign ir_op_code_with_bubble = ( enable )?  ir_op_code : 0;
	// if instrcution decode is frozen, force destination reg number to 0, 
	// this operation is to prevent pipeline stall.
	assign ir_dest_with_bubble = ( enable )?  ir_dest : 0;
	
	/********************** Data path control logic *********************/
	always @ (*) begin
		if(rst) begin
			wri_back_en			= 0;	// S3
			wri_back_result_mux	= 0;	// S1
			ex_alu_cmd				= 0;	// S2
			alu_src2_mux			= 0;	// S4
		end
		else begin
			case( ir_op_code_with_bubble )
				`OP_NOP	:
					begin
						wri_back_en			= 0;		// S3
						wri_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				`OP_ADD	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SUB	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SUB;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_AND	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_AND;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_OR	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_OR;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_XOR	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_XOR;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				`OP_SL	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SL;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SR	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SR;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SRU	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SRU;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_ADDI:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_LD	:
					begin
						wri_back_en			= 1;		// S3
						wri_back_result_mux	= 1;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_ST	:
					begin
						wri_back_en			= 0;		// S3
						wri_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_BZ	:
					begin
						wri_back_en			= 0;		// S3
						wri_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1;		// S4
					end
				default	:
					begin
						wri_back_en			= 0;		// S3
						wri_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1'bx;		// S4

					end
			endcase
		end
	end
	
	assign decoding_op_is_branch = ( ir_op_code == `OP_BZ )? 1 : 0;	// S5
	assign decoding_op_is_store	= ( ir_op_code == `OP_ST )? 1 : 0;	// S6
	
	/********************** singals to EX_stage *********************/
	assign mem_writ_data = rea_data_2;
	assign mem_writ_en = decoding_op_is_store;
	assign wri_back_dest = ir_dest_with_bubble;
	assign ex_alu_src1 = rea_data_1;
	assign ex_alu_src2 = (alu_src2_mux)? {{10{ir_imm[5]}},ir_imm} : rea_data_2;
	
	//	pipeline_ou:
	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0],
	//	[21:5],17bits:	mem_writ_en, mem_writ_data[15:0],
	//	[4:0],5bits:	wri_back_en, wri_back_dest[2:0], wri_back_result_mux,
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			pipeline_ou[56:0] <= 0;
		end
		else begin
			pipeline_ou[56:0] <= {
				ex_alu_cmd[2:0],		// pipeline_ou[56:54]	//S2
				ex_alu_src1[15:0],		// pipeline_ou[53:38]
				ex_alu_src2[15:0],		// pipeline_ou[37:22]	
				mem_writ_en, 			// pipeline_ou[21]		//
				mem_writ_data[15:0],	// pipeline_ou[20:5]	//
				wri_back_en, 			// pipeline_ou[4]		//S3
				wri_back_dest[2:0], 	// pipeline_ou[3:1]	//dest
				wri_back_result_mux 	// pipeline_ou[0]		//S1
				};
		end
	end
	
			 
	/********************** interface with register file *********************/
	assign rea_addr_1 = ir_src1;
	assign rea_addr_2 = ir_src2;
	
	/********************** branch signals generate *********************/
	always @ (*) begin
		if(decoding_op_is_branch) begin
			case( ir_dest_with_bubble )
				`BRANCH_Z	:
					begin
						if(rea_data_1 == 0)
							branch_taken = 1;
						else
							branch_taken = 0;
					end
					
				default:
					begin
						branch_taken = 0;
`ifndef CODE_FOR_SYNTHESIS
						//$display("ERROR: Unknown branch condition %b, in branch instruction %b \n", ir_dest_with_bubble, ir_op_code_with_bubble);
						//$stop;
`endif					
					end
			endcase
		end
		else begin
			branch_taken = 0;
		end
	end
	assign branch_offst_imm = ir_imm;
	//assign branch_taken = decoding_op_is_branch & branch_condition_satisfied ;
	
	/********************** to hazard detection unit *********************/
	assign decoding_op_src1 = ir_src1;
	assign decoding_op_src2 = (
					ir_op_code == `OP_NOP 	||
					ir_op_code == `OP_ADDI 	||
					ir_op_code == `OP_LD 	||
					ir_op_code == `OP_BZ 	
					)?
					3'b000 : ir_src2;
	
endmodule 
