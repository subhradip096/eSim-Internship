module SIMDmultiply(
        input [15:0] mula,
        input [15:0] mulb,
        input H,
        input O,
        input Q,
        output [15:0] mulo
    );
    
    
    wire [15:0] sel0 = H?16'hFFFF:(O?16'h00FF:16'h000F);
    wire [15:0] sel1 = H?16'hFFFF:(O?16'h00FF:16'h00F0);
    wire [15:0] sel2 = H?16'hFFFF:(O?16'hFF00:16'h0F00);
    wire [15:0] sel3 = H?16'hFFFF:(O?16'hFF00:16'hF000);
    
    wire [15:0] a0 = (mulb[0]?mula:16'h0000)&sel0;
    wire [15:0] a1 = (mulb[1]?mula:16'h0000)&sel0;
    wire [15:0] a2 = (mulb[2]?mula:16'h0000)&sel0;
    wire [15:0] a3 = (mulb[3]?mula:16'h0000)&sel0;
    wire [15:0] a4 = (mulb[4]?mula:16'h0000)&sel1;
    wire [15:0] a5 = (mulb[5]?mula:16'h0000)&sel1;
    wire [15:0] a6 = (mulb[6]?mula:16'h0000)&sel1;
    wire [15:0] a7 = (mulb[7]?mula:16'h0000)&sel1;
    wire [15:0] a8 = (mulb[8]?mula:16'h0000)&sel2;
    wire [15:0] a9 = (mulb[9]?mula:16'h0000)&sel2;
    wire [15:0] a10 = (mulb[10]?mula:16'h0000)&sel2;
    wire [15:0] a11 = (mulb[11]?mula:16'h0000)&sel2;
    wire [15:0] a12 = (mulb[12]?mula:16'h0000)&sel3;
    wire [15:0] a13 = (mulb[13]?mula:16'h0000)&sel3;
    wire [15:0] a14 = (mulb[14]?mula:16'h0000)&sel3;
    wire [15:0] a15 = (mulb[15]?mula:16'h0000)&sel3;
    
    wire [15:0] tm0,tm1,tm2,tm3;
    wire [15:0] tm00,tm11;
    wire [15:0] tm000;
    
    assign tm0  = a0   + (a1<<1)   +  (a2<<2)    +  (a3<<3);
    assign tm1  = a4   + (a5<<1)   +  (a6<<2)    +  (a7<<3);
    assign tm2  = a8   + (a9<<1)   +  (a10<<2)   +  (a11<<3);
    assign tm3  = a12  + (a13<<1)  +  (a14<<2)   +  (a15<<3);
    
    assign tm00 = tm0 + (tm1<<4);
    assign tm11 = tm2 + (tm3<<4);
   
    assign tm000 = tm00 + (tm11<<8); 
    
    wire [3:0] tm1h,tm1o,tm1q;
    wire [3:0] tm2h,tm2o,tm2q;
    wire [3:0] tm3h,tm3o,tm3q;
    
    assign mulo[3:0] = tm0[3:0];
    
    assign tm1h = tm000[7:4];    
    assign tm2h = tm000[11:8];     
    assign tm3h = tm000[15:12];    
    
    assign tm1o = tm00[7:4];    
    assign tm2o = tm11[11:8];    
    assign tm3o = tm11[15:12];
    
    assign tm1q = tm1[7:4];    
    assign tm2q = tm2[11:8];
    assign tm3q = tm3[15:12];
    
    assign mulo[7:4]   = H?tm1h:(O?tm1o:tm1q);
    assign mulo[11:8]  = H?tm2h:(O?tm2o:tm2q);
    assign mulo[15:12] = H?tm3h:(O?tm3o:tm3q);
    
    
endmodule