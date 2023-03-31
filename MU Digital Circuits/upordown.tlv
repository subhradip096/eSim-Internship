\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/ 

//Your Verilog/System Verilog Code Starts Here:
module upordown(
input clk,
input reset,
input up_high,
output reg [3:0] count
);


always@(posedge clk) begin
	if(reset == 1)
		count <= 0;
	else begin
		if(up_high == 1) begin
			if(count == 15)
				count <= 0;
			else
				count <= count + 1;
		end
		else begin
			if (count == 0)
				count <= 4'd15;
			else
				count <= count - 1;
		end
	end
end

endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  up_high;//input
		logic  [3:0] count;//output
//The $random() can be replaced if user wants to assign values
		assign up_high = $random();
		upordown upordown(.clk(clk), .reset(reset), .up_high(up_high), .count(count));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

