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