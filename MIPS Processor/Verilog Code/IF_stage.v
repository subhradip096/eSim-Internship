	`define	INSTR_MEM_ADDR_WID	8
	`define DATA_MEM_ADDR_WID		8
 
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

module IF_stage
(
	input							clk,
	input							rst,				//active high
	input							enable1,
	
	input	[5:0]					branch_offse,
	input							branch_taken,
	
	output	reg	[7:0]		pc,
	output	[15:0]					instruction
);

    
	// pc control
	always @ (posedge clk or posedge rst) begin
	    if (rst) begin
	        pc <= 8'b0;
	    end 
		else begin
			if(enable1) begin
				if(branch_taken)
					//don't forget sign bit expansion
					pc <= pc + {{(8-6){branch_offse[5]}}, branch_offse[5:0]};	
				else
					pc <= pc + 8'd1;
			end
		end
	end
	
	// instruction memory, or rom
	instruction_mem imem(
		.clk				(clk),
		.pc					(pc),
		
		.instruction		(instruction)
	);
	
	
endmodule 
