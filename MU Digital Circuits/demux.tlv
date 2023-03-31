\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off EOFNEWLINE*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
module Demux(
output reg [3:0] Y0, 
output reg [3:0] Y1, 
output reg [3:0] Y2, 
output reg [3:0] Y3, 
input [1:0] sel, 
input [3:0] din);


always @(sel) begin
    case (sel)
        2'b00 : begin 
		Y0 = din; 
		Y1 = 0; 
		Y2 = 0;
		Y3 = 0; 
	  end
        2'b01 : begin 
		Y0 = 0; 
		Y1 = din; 
		Y2 = 0;
		Y3 = 0;   
        end
        2'b10 : begin 
		Y0 = din; 
		Y1 = 0; 
		Y2 = din;
		Y3 = 0; 
	  end
        2'b11 : begin 
		Y0 = 0; 
		Y1 = 0; 
		Y2 = din;
		Y3 = 0;  
	  end
    endcase   
end


endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [3:0] Y0;//output
		logic  [3:0] Y1;//output
		logic  [3:0] Y2;//output
		logic  [3:0] Y3;//output
		logic  [1:0] sel;//input
		logic  [3:0] din;//input
//The $random() can be replaced if user wants to assign values
		assign sel = $random();
		assign din = $random();
		Demux Demux(.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .sel(sel), .din(din));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

