\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off EOFNEWLINE*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
module connector(
    input ck, 
    output [15:0] vah1 [7:0]
);

	reg rs;
  	reg [15:0] instruct [18:0];
	integer j = 0;
	wire [7:0] pc;
	integer CLPERIOD = 10;
	integer i = 0;
	integer tes;
   integer tes_complete;
   integer loa;
reg [15:0] vah [7:0];
	
	mips_16_core_top uut (
		.clk(ck), 
		.rst(rs), 
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
		tes_complete = 1;
	end
   
   always@(posedge ck) begin
      if (j<19) begin
        uut.IF_stage_inst.imem.rom[j] = instruct[j];
        j= j+ 1;
      end
      else
         loa = 1;
    end
   
  
    always@(posedge ck) begin
    if ((tes_complete == 1) && (loa == 1)) begin
      if (i<=80) begin
        vah[i] = uut.check_inst.re_array[i];
        i = i + 1;
      end
    end
  end

assign vah1 = vah;

endmodule


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  ck;//input
		logic  [15:0] vah1;//output
		logic  [15:0] 7;//output
		logic  [15:0] 0;//output
//The $random() can be replaced if user wants to assign values
		assign ck = $random();
		connector connector(.ck(ck), .vah1(vah1), .7(7), .0(0));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

