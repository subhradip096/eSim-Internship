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
	


module connector(
    input clk, 
    output reg [15:0] value [7:0]
);

//reg clk;
	reg rst;
  
  	reg [15:0] instruct [18:0];
	integer j = 0;

	// Outputs
	wire [7:0] pc;
	
	parameter CLPERIOD = 10;
	//always #(CLPERIOD /2) 
		//clk =~clk;
	integer i = 0;
	integer test;
   
   integer test_complete;
   integer loa;
	
	// Instantiate the Unit Under Test (UUT)
	mips_16_core_top uut (
		.clk(clk), 
		.rst(rst), 
		.pc(pc)
	);
  	
  	initial begin
      instruct[0] = 16'b1001001000001000;
      instruct[1] = 16'b1001010001001000;
      instruct[2] = 16'b1001011010001000;
      instruct[3] = 16'b0001100010011000;
      instruct[4] = 16'b1011100001000010;
      instruct[5] = 16'b1010101001000010;
      instruct[6] = 16'b0010110100101000;
      instruct[7] = 16'b1100000110111000;
      instruct[8] = 16'b1001111111000001;
      instruct[9] = 0;
      instruct[10] = 0;
      instruct[11] = 0;
      instruct[12] = 0;
      instruct[13] = 0;
      instruct[14] = 0;
      instruct[15] = 0;
      instruct[16] = 0;
      instruct[17] = 0;
      instruct[18] = 0;
    end
  
	
	initial begin
		// Initialize Inputs
		//clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#(CLPERIOD/2)
		#1
		//display_debug_message;
		test1;
		//test2;
	end
   
   always@(posedge clk) begin
      if (j<19) begin
        uut.IF_stage_inst.imem.rom[j] = instruct[j];
         //$display("instruction",j,"  ",instruct[j]);
         //$display("rom",j,"  ",uut.IF_stage_inst.imem.rom[j]);
        j= j+ 1;
      end
      else
         loa = 1;
    end
   
  
    always@(posedge clk) begin
    if ((test_complete == 1) && (loa == 1)) begin
      		//display("display_all_regs:");
    		//display("display_all_regs:");
			//$display("------------------------------");
			//$display("R0\tR1\tR2\tR3\tR4\tR5\tR6\tR7");
      if (i<=80) begin
        value[i] = uut.check_inst.re_array[i];
        //$display("The output R",i," :",value[i]);
        i = i + 1;
      end
    end
  end
      
	//task display_debug_message;
		//begin
			//$display("\n***************************");
			//$display("mips_16 core test");
			//$display("***************************\n");
		//end
	//endtask
	
	task sys_rest;
		begin
			rst = 0;
			#(CLPERIOD*1) rst = 1;
			#(CLPERIOD*1) rst = 0;
		end
	endtask
	
	
	
	task test1;
		begin
            //$display("rom loa successfully\n");
            //$display("running test1\n");
            sys_rest;
            #1

            //#(CLPERIOD) test = 1;

            //$monitor("current pc: %d ,instruction: %x", pc, uut.instruction);

            #(CLPERIOD*100)
            //$monitoroff;
               test_complete = 1;
            $display("ram[10] = %d", uut.MEM_stage_inst.dmem.ram[10]);
            //#(CLPERIOD*100) test = 0;
          	
			end
	endtask

endmodule
