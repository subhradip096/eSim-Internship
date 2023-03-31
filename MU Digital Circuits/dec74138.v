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