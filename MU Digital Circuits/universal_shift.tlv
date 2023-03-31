\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/ /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

//Your Verilog/System Verilog Code Starts Here:
module universal_shift(
input clk,
input reset,
input right_sel,
input din,
output reg [3:0] dout,
output s_left,
output s_right
);

always@(posedge clk) begin
	if (reset == 1)
		dout <= 0;
	else begin
		if (right_sel == 1) 
			dout <= {din,dout[3:1]};
		else
			dout <= {dout[2:0],din};
	end
end

assign s_left = dout[0];
assign s_right = dout[3];

endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  right_sel;//input
		logic  din;//input
		logic  [3:0] dout;//output
		logic  s_left;//output
		logic  s_right;//output
//The $random() can be replaced if user wants to assign values
		assign right_sel = 1; //1 - right shift, 0 - left shift
		assign din = $random();
		universal_shift universal_shift(.clk(clk), .reset(reset), .right_sel(right_sel), .din(din), .dout(dout), .s_left(s_left), .s_right(s_right));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

