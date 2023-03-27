module mips_16_core_top
(
	input						clk,
	input						rst,

	output	[7:0]		pc
);
	wire 						pipeline_stall_n ;
	wire	[5:0]				branch_offst_imm;
	wire						branch_taken;
	wire	[15:0]				instruction;
	wire	[56:0]				ID_pipeline_re_ou;
	wire	[37:0]				EX_pipeline_re_ou;
	wire	[36:0]				MEM_pipeline_re_ou;
	
	wire	[2:0]				rea_addr_1;	// register file read port 1 address
	wire	[2:0]				rea_addr_2;	// register file read port 2 address
	wire	[15:0]				rea_data_1;	// register file read port 1 data
	wire	[15:0]				rea_data_2;	// register file read port 2 data
	wire	[2:0]				decoding_op_src1;		//source_1 register number
	wire	[2:0]				decoding_op_src2;		//source_2 register number
	wire	[2:0]				ex_op_dest;				//EX stage destinaton register number
	wire	[2:0]				mem_op_dest;			//MEM stage destinaton register number
	wire	[2:0]				wb_op_dest;				//WB stage destinaton register number
	wire						writ_en;
	wire	[2:0]				writ_dest;
	wire	[15:0]				writ_data;
	
	IF_stage IF_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.enable1	(pipeline_stall_n),
		.branch_offse		(branch_offst_imm), 
		.branch_taken			(branch_taken), 
		.pc						(pc),
		.instruction			(instruction)
	);
	
	ID_stage ID_stage_inst (
		.clk					(clk),
		.rst					(rst),
		.enable	(pipeline_stall_n),
		.pipeline_ou		(ID_pipeline_re_ou),
		.instruction			(instruction),
		.branch_offst_imm		(branch_offst_imm),
		.branch_taken			(branch_taken),
		.rea_addr_1		(rea_addr_1),	//
		.rea_addr_2		(rea_addr_2),	//
		.rea_data_1		(rea_data_1),	//
		.rea_data_2		(rea_data_2),	//
		.decoding_op_src1		(decoding_op_src1),		
		.decoding_op_src2		(decoding_op_src2)
	);
	
	EX_stage EX_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_re_i	(ID_pipeline_re_ou), 
		.pipeline_ou		(EX_pipeline_re_ou), 
		.ex_op_dest				(ex_op_dest)
	);
	
	MEM_stage MEM_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_re_i	(EX_pipeline_re_ou), 
		.pipeline_ou		(MEM_pipeline_re_ou), 
		.mem_op_dest			(mem_op_dest)
	);
	
	WB_stage WB_stage_inst (
		.pipeline_re_i	(MEM_pipeline_re_ou), 
		.writ_en			(writ_en), 
		.writ_dest			(writ_dest), 
		.writ_data			(writ_data), 
		.wb_op_dest				(wb_op_dest)
	);
	
	check check_inst (
		.clk					(clk), 
		.rst					(rst), 
		.writ_en			(writ_en), 
		.writ_dest			(writ_dest), 
		.writ_data			(writ_data), 
		.rea_addr_1		(rea_addr_1), 
		.rea_data_1		(rea_data_1), 
		.rea_addr_2		(rea_addr_2), 
		.rea_data_2		(rea_data_2)
	);
	
	hazard_detection_unit hazard_detection_unit_inst (
		.decoding_op_src1		(decoding_op_src1), 
		.decoding_op_src2		(decoding_op_src2), 
		.ex_op_dest				(ex_op_dest), 
		.mem_op_dest			(mem_op_dest), 
		.wb_op_dest				(wb_op_dest), 
		.pipeline_stall_n		(pipeline_stall_n)
	);
	
endmodule 