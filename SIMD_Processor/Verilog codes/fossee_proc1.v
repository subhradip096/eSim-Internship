module fossee_proc1(
input clk,
input rst,
input [15:0] a,
input [15:0] b,
input [15:0] c,
input [15:0] inst_in,
output  reg done,
output reg [17:0] instruction_in,
output reg [15:0] data_in,
output reg [15:0] data_out,
output reg [9:0] instruction_addr,
output reg [9:0] data_addr,
output reg data_R,
output reg data_W
);

reg [17:0] INST_MEM[1023:0];
reg [15:0] DATA_MEM[1023:0];
//wire done;
//reg [17:0] instruction_in;
//reg [15:0] data_in;
//wire [15:0] data_out;
//wire [9:0] instruction_addr;
//wire [9:0] data_addr;
//wire data_R;
//wire data_W;

CPUtop uut (
  .clk        (clk),          // system clock
  .rst        (rst),          // system reset (active high)
  .instruction_in (instruction_in),
  .data_in(data_in),
  .data_out(data_out),
  .instruction_addr(instruction_addr),
  .data_addr(data_addr),
  .data_R(data_R),
  .data_W(data_W),
  .done(done)
);

initial begin
  INST_MEM[0]  = 18'b100110_00_0000000000;  // load MEM0 into H0          load16bit R0 im=0000000000
  INST_MEM[1]  = 18'b100110_01_0000000001;  // load MEM1 into H1          load16bit R1 im=0000000001
  INST_MEM[2]  = 18'b100110_10_0000000010;  // load MEM2 into H2          load16bit R2 im=0000000010
  //INST_MEM[3]  = 18'b000000_00000000_00_01; // add H1 to H0               add16bit R0=0000000000000101 R1=0000000000001111
  //INST_MEM[4]  = 18'b000000_00000000_10_00; // add H0 to H2               add16bit R2=0000000000000100 R0=0000000000010100
  INST_MEM[4]  = 18'b101001_00_0000000000;  // store H0 back into MEM0    store16bit R0=0000000000010100 im=0000000000
  //INST_MEM[6]  = 18'b101100_01_0100100010;  // set H1 to 0100100010       set16bit R1 im=0100100010
  //INST_MEM[7]  = 18'b000000_00000000_01_10; // add H2 to H1               add16bit R1=0000000100100010 R2=0000000000011000
  INST_MEM[5]  = 18'b101001_01_0000000011;  // store H1 back into MEM3    store16bit R1=0000000100111010 im=0000000011
  INST_MEM[6]  = 18'b101001_10_0000000100;  // store H2 back into MEM4    store16bit R2=0000000000011000 im=0000000100
  INST_MEM[7] = 18'b101001_00_0000000101;  // store H0 back into MEM5    store16bit R0=0000000000010100 im=0000000101
  
end

always @(negedge clk)
begin
     DATA_MEM[0] = a;
   DATA_MEM[1] = b; 
   DATA_MEM[2] = c;  
   INST_MEM[3] = inst_in;
end

always @(negedge clk)
begin
    if (data_R)
    begin
        if (data_W) 
	begin
		DATA_MEM[data_addr] <= data_out;
		$display("write mem %d: %b",data_addr,data_out);
	end
        else
            data_in <= DATA_MEM[data_addr];
    end
end

always @(negedge clk)
begin
   instruction_in <= INST_MEM[instruction_addr];
   $display("inst_addr %d: %b",instruction_addr,INST_MEM[instruction_addr]);
end

endmodule