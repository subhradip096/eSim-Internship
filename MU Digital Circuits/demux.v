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