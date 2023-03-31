module sr_ff(
input s,r,clk, 
output q, qbar
);

wire out1; 
wire out2; 

nand (out1,clk,s); 
nand (out2,clk,r); 
nand (q,out1,qbar);
nand (qbar,out2,q);

endmodule