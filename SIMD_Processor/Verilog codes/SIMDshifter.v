module SIMDshifter(
        input [15:0] shiftin,
        input H,
        input O,
        input Q,
        input left,
        output [15:0] shiftou
    );
    
    wire [14:0] left_shift =  shiftin[14:0];
    wire [14:0] right_shift =  shiftin[15:1];
    wire [15:0] shiftm = left?{left_shift,1'b0}:{1'b0,right_shift};
    assign shiftou[3:0]   = {(left|H|O)&shiftm[3],   shiftm[2:0]};
    assign shiftou[7:4]   = {(left|H)&shiftm[7],     shiftm[6:5],    (!left|H|O)&shiftm[4]};
    assign shiftou[11:8]  = {(left|H|O)&shiftm[11],  shiftm[10:9],   (!left|H)&shiftm[8]};
    assign shiftou[15:12] = {(left|H)&shiftm[15],    shiftm[14:13],  (!left|H|O)&shiftm[12]};
      
endmodule