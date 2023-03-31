\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

//Your Verilog/System Verilog Code Starts Here:
module mux (
 input [3:0] a,                 
 input [3:0] b,                  
 input [3:0] c,                 
 input [3:0] d,                 
 input [1:0] sel,               
 output reg [3:0] out
);        
  
   always @ (a or b or c or d or sel) begin  
      case (sel)  
         2'b00 : out <= a;  
         2'b01 : out <= b;  
         2'b10 : out <= c;  
         2'b11 : out <= d;  
      endcase  
   end  

endmodule  

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [3:0] a;//input
		logic  [3:0] b;//input
		logic  [3:0] c;//input
		logic  [3:0] d;//input
		logic  [1:0] sel;//input
		logic  [3:0] out;//output
//The $random() can be replaced if user wants to assign values
		assign a = 1;
		assign b = 2;
		assign c = 3;
		assign d = 4;
		assign sel = 2;
		mux mux(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

