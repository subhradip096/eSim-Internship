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