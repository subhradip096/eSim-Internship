module connector(
    input ck, 
    output reg [15:0] res,
    output reg [3:0] resou
);

	reg rs;
  	reg [15:0] instruct [18:0];
	integer j = 0;
	wire [7:0] pc;
	integer CLPERIOD = 10;
	integer i = 0;
	integer tes;
   integer tes_complete;
   integer loa;
   integer k = 0;
   integer pri = 0;
reg [15:0] vah [7:0];
	
	mips_16_core_top uut (
		.clk(ck), 
		.rst(rs), 
		.pc(pc)
	);
	
   initial begin
      $readmemb("test0.txt",instrut);
   end

	initial begin
		tes_complete = 1;
	end
   
   always@(posedge ck) begin
      if (j<19) begin
        uut.IF_stage_inst.imem.rom[j] = instruct[j];
        j= j+ 1;
      end
      else
         loa = 1;
    end
   
  
    always@(posedge ck) begin
    if ((tes_complete == 1) && (loa == 1)) begin
      if (i<=80) begin
        vah[i] = uut.check_inst.re_array[i];
        i = i + 1;
      end
      else
	pri = 1;
    end
  end

   always@(posedge ck) begin 
      if ((pri == 1) && (k <8)) begin
         res = vah[k];
         resou = k;
         k = k + 1;
      end
   end

endmodule
