module check
(
	input				clk,
	input				rst,
	
	// write port
	input				writ_en,
	input		[2:0]	writ_dest,
	input		[15:0]	writ_data,
	
	//read port 1
	input		[2:0]	rea_addr_1,
	output		[15:0]	rea_data_1,
	//read port 2
	input		[2:0]	rea_addr_2,
	output		[15:0]	rea_data_2
);
	reg	[15:0]	re_array [7:0];
	
	// write port
	//reg [2:0] i;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			// for(i=0; i<8; i=i+1)
				// re_array[i] <= 15'b0;
			re_array[0] <= 15'b0;
			re_array[1] <= 15'b0;
			re_array[2] <= 15'b0;
			re_array[3] <= 15'b0;
			re_array[4] <= 15'b0;
			re_array[5] <= 15'b0;
			re_array[6] <= 15'b0;
			re_array[7] <= 15'b0;	
		end
		else begin
			if(writ_en) begin
				re_array[writ_dest] <= writ_data;
			end
		end
		
	end
	
	//read port 1
	// always @ (*) begin
		// if( rea_addr_1 == 0) begin
			// rea_data_1 = 15'b0;
		// end
		// else begin
			// rea_data_1 = re_array[rea_addr_1];
		// end
	// end
	assign rea_data_1 = ( rea_addr_1 == 0)? 15'b0 : re_array[rea_addr_1];
	
	//read port 2
	// always @ (*) begin
		// if( rea_addr_2 == 0) begin
			// rea_data_2 = 15'b0;
		// end
		// else begin
			// rea_data_2 = re_array[rea_addr_2];
		// end
	// end
	assign rea_data_2 = ( rea_addr_2 == 0)? 15'b0 : re_array[rea_addr_2];

endmodule 