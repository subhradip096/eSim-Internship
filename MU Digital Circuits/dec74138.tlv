\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/ /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/ /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

//Your Verilog/System Verilog Code Starts Here:
module dec74138(
input a,
input b,
input c,
input e1_bar,
input e2_bar,
input e3,
output reg [7:0] out
);


always@(a or b or c) begin

	if ((e1_bar == 0) && (e2_bar == 0) && (e3 == 1)) begin
	    out=8'b11111111;
          case ({a,b,c})
              3'b000: out[0]=1'b0;
              3'b001: out[1]=1'b0;
              3'b010: out[2]=1'b0;
              3'b011: out[3]=1'b0;
              3'b100: out[4]=1'b0;
              3'b101: out[5]=1'b0;
              3'b110: out[6]=1'b0;
              3'b111: out[7]=1'b0;
          endcase
	end
	else
		out = 8'b11111111;
end

endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  a;//input
		logic  b;//input
		logic  c;//input
		logic  e1_bar;//input
		logic  e2_bar;//input
		logic  e3;//input
		logic  [7:0] out;//output
//The $random() can be replaced if user wants to assign values
		assign a = $random();
		assign b = $random();
		assign c = $random();
		assign e1_bar = 0;
		assign e2_bar = 0;
		assign e3 = 1;
		dec74138 dec74138(.a(a), .b(b), .c(c), .e1_bar(e1_bar), .e2_bar(e2_bar), .e3(e3), .out(out));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

