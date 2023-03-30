module CPUtop(
        input clk,
        input rst,
        input [17:0] instruction_in,
        input [15:0] data_in,
        output [15:0] data_out,
        output [9:0] instruction_addr,
        output [9:0] data_addr,
        output data_R,
        output data_W,
        output done
    );
    
    wire [5:0] opcode = instruction_in[17:12];
    
    parameter [2:0] STATE_IDLE = 0;
    parameter [2:0] STATE_IF = 1;
    parameter [2:0] STATE_ID = 2;
    parameter [2:0] STATE_EX = 3;
    parameter [2:0] STATE_MEM = 4;
    parameter [2:0] STATE_WB = 5;
    parameter [2:0] STATE_HALT = 6;
    
    reg [2:0] current_state;
    reg [9:0] PC,next_PC;
//    reg [17:0] current_instruction;
//    reg [5:0]  current_opcode;
    reg [9:0] current_data_addr;
    reg rdata_en;
    reg wdata_en;
    reg [15:0] data_out_re;
    
    assign data_out = data_out_re;
    assign data_R = rdata_en;
    assign data_W = wdata_en;
    assign data_addr = current_data_addr;
    
    //data register
    reg [15:0] H[0:3];
    reg [15:0] Oset[0:2];
    reg [15:0] Qset[0:2];
    reg [9:0]  LC;
    reg [9:0] imr;
    
    //control register
    reg CMD_addition;
    reg CMD_multiplication;
    reg CMD_substruction;
    reg CMD_mul_accumulation;
    reg CMD_log_shift_right;
    reg CMD_log_shift_left;
    reg CMD_and;
    reg CMD_or;
    reg CMD_not;
    reg CMD_load;
    reg CMD_store;
    reg CMD_set;
    reg CMD_loopjump;
    reg CMD_setloop;
//    reg CMD_halt;  
    
    //cmd type
    reg Hre1,Hre2,Hre3,Him,Ore1,Ore2,Ore3,Oim,Qre1,Qre2,Qre3,Qim;
    
    //result register
    reg [15:0] result_re_add;
    reg [15:0]result_re_sub;
    reg [15:0] result_re_mul;
    reg [15:0] result_re_mac;
    reg [15:0] result_re_Lshift;
    reg [15:0] result_re_Rshift;
    reg [15:0] result_re_and;
    reg [15:0] result_re_or;
    reg [15:0] result_re_not;
    reg [15:0] result_re_load;
    reg [15:0] result_re_store;
    reg [15:0] result_re_set;
    reg [1:0] R0,R1,R2,R3;
    
    wire [15:0] comp_in_A = Hre1?(H[R0]):((Hre2|Hre3)?(H[R2]):(Ore1?(Oset[R0]):((Ore2|Ore3)?(Oset[R2]):(Qre1?(Qset[R0]):((Qset[R2]))))));
    wire [15:0] comp_in_B = Hre1?(imr):((Hre2|Hre3)?(H[R3]):(Ore1?({imr[7:0],imr[7:0]}):((Ore2|Ore3)?(Oset[R3]):(Qre1?({imr[3:0],imr[3:0],imr[3:0],imr[3:0]}):((Qset[R3]))))));
    
    wire [15:0] Add_out_Cout;
    wire [15:0] Mul_out_Cout;
    wire [15:0] MAC_out_Cout;
    
    wire [15:0] MAC_in_A = Hre3?(H[R1]):(Ore3?(Oset[R1]):(Qset[R1]));
    wire [15:0] MAC_in_B = Mul_out_Cout;
    
    SIMDadd Add(
            .A(CMD_mul_accumulation?MAC_in_A:comp_in_A),
            .B(CMD_mul_accumulation?MAC_in_B:comp_in_B),
            .H(Hre1|Hre2|Hre3),
            .O(Ore1|Ore2|Ore3),
            .Q(Qre1|Qre2|Qre3),
            .sub(CMD_substruction),
            .Cout(Add_out_Cout)
        );
        
    wire [15:0] shiftin = Hre1?(H[R3]):(Ore1?(Oset[R3]):(Qset[R3]));
    wire [15:0] shiftou;
        
    SIMDshifter shift(
                .shiftin(shiftin),
                .H(Hre1),
                .O(Ore1),
                .Q(Qre1),
                .left(CMD_log_shift_left),
                .shiftou(shiftou)
            );
     
    SIMDmultiply Mul(
                .mula(comp_in_A),
                .mulb(comp_in_B),
                .H(Hre1|Hre2|Hre3),
                .O(Ore1|Ore2|Ore3),
                .Q(Qre1|Qre2|Qre3),
                .mulo(Mul_out_Cout)
                );
                
                
    //some signal
    
    assign instruction_addr = PC; 
    assign done = current_state == STATE_HALT;
    
    always @(posedge clk)//state machine
    begin
        if (rst) 
        begin
            current_state <= STATE_IDLE;
            PC <= 0;
        end
        else
        begin
            if (opcode == 63) current_state <= STATE_HALT;
            else
            if (current_state == STATE_IDLE)
            begin
                current_state <= STATE_IF;
            end
            else if (current_state == STATE_IF)
            begin
                $display("======== another instruction ========");
                $display("H00: %b",H[0]);
                $display("H01: %b",H[1]);
                $display("H10: %b",H[2]);
                $display("H11: %b",H[3]);
                $display("Oset00: %b",Oset[0]);
                $display("Oset01: %b",Oset[1]);
                $display("Oset10: %b",Oset[2]);
                $display("Qset00: %b",Qset[0]);
                $display("Qset01: %b",Qset[1]);
                $display("Qset10: %b",Qset[2]);
                $display("           -- execute --             ");
                current_state <= STATE_ID;
            end
            else if (current_state == STATE_ID)
            begin
                current_state <= STATE_EX;
            end
            else if (current_state == STATE_EX)
            begin
                current_state <= STATE_MEM;
            end
            else if (current_state == STATE_MEM)
            begin
                current_state <= STATE_WB;
            end
            else if (current_state == STATE_WB)
            begin
                current_state <= STATE_IF;
                PC <= next_PC;
            end
        end
    end    
    
    always @(posedge clk)//STATE_IF
    begin
        if (rst) 
        begin
                     
        end
        else
        begin
            
        end
    end    
    
    
    always @(posedge clk)//STATE_ID
    begin
        if (rst || current_state == STATE_IDLE || current_state == STATE_IF) 
        begin
            CMD_addition <= 0;
            CMD_multiplication <= 0;
            CMD_substruction <= 0;
            CMD_mul_accumulation <= 0;
            CMD_log_shift_right <= 0;
            CMD_log_shift_left <= 0;
            CMD_and <= 0;
            CMD_or <= 0;
            CMD_not <= 0;
            CMD_load <= 0;
            CMD_store <= 0;
            CMD_set <= 0;
            CMD_loopjump <= 0;
            CMD_setloop <= 0;
  //          CMD_halt <= 0;  
            Hre1<=0;
            Hre2<=0;
            Hre3<=0;
            Him<=0;
            Ore1<=0;
            Ore2<=0;
            Ore3<=0;
            Oim<=0;
            Qre1<=0;
            Qre2<=0;
            Qre3<=0;
            Qim<=0;
            imr <= 10'b0000000000;
            R0 <= 0;
            R1 <= 0;
            R2 <= 0;
            R3 <= 0;
        end
        else
        begin
            if (current_state == STATE_ID)
            begin
        //        current_instruction <= instruction_in;
          //      current_opcode <= opcode;
                
                //cmd
                CMD_addition <= (opcode<=5);
                CMD_substruction <= (opcode>=6)&&(opcode<=11);
                CMD_multiplication <= (opcode>=12)&&(opcode<=17);                
                CMD_mul_accumulation <= (opcode>=18)&&(opcode<=20);
                CMD_log_shift_left <= (opcode>=21)&&(opcode<=23);
                CMD_log_shift_right <= (opcode>=24)&&(opcode<=26);
                CMD_and <= (opcode>=27)&&(opcode<=29);
                CMD_or <= (opcode>=30)&&(opcode<=32);
                CMD_not <= (opcode>=33)&&(opcode<=35);
                CMD_loopjump <= opcode==36;
                CMD_setloop <= opcode==37;
                CMD_load <= (opcode>=38)&&(opcode<=40);
                CMD_store <= (opcode>=41)&&(opcode<=43);
                CMD_set <= (opcode>=44)&&(opcode<=46);     
         //       CMD_halt <= (opcode==63);       
                
                //datatype
                Hre1<=(opcode==3)||(opcode==9)||(opcode==15)||(opcode==21)||(opcode==24)||(opcode==33)||(opcode==38)||(opcode==41)||(opcode==44);
                Hre2<=(opcode==0)||(opcode==6)||(opcode==12)||(opcode==27)||(opcode==30);
                Hre3<=(opcode==18);
                Him<=(opcode==3)||(opcode==9)||(opcode==15)||(opcode==38)||(opcode==41)||(opcode==44);
                
                Ore1<=(opcode==4)||(opcode==10)||(opcode==16)||(opcode==22)||(opcode==25)||(opcode==34)||(opcode==39)||(opcode==42)||(opcode==45);
                Ore2<=(opcode==1)||(opcode==7)||(opcode==13)||(opcode==28)||(opcode==31);
                Ore3<=(opcode==19);
                Oim<=(opcode==4)||(opcode==10)||(opcode==16)||(opcode==39)||(opcode==42)||(opcode==45);
                
                Qre1<=(opcode==5)||(opcode==11)||(opcode==17)||(opcode==23)||(opcode==26)||(opcode==35)||(opcode==40)||(opcode==43)||(opcode==46);
                Qre2<=(opcode==2)||(opcode==8)||(opcode==14)||(opcode==29)||(opcode==32);
                Qre3<=(opcode==20);
                Qim<=(opcode==5)||(opcode==11)||(opcode==17)||(opcode==40)||(opcode==43)||(opcode==46);
                
                imr <= instruction_in[9:0];
                R0 <= instruction_in[11:10];
                R1 <= instruction_in[5:4];
                R2 <= instruction_in[3:2];
                R3 <= instruction_in[1:0];
                $display("PC: %0d : instruction = %b", PC,instruction_in);
            end            
        end
    end    
    
    always @(posedge clk)//STATE_EX
    begin
        if (rst || current_state == STATE_IDLE || current_state == STATE_IF) 
        begin
            result_re_add <= 0;
           result_re_sub <= 0;
            result_re_mul <= 0;
            result_re_mac <= 0;
            result_re_Lshift <= 0;
            result_re_Rshift <= 0;
            result_re_and <= 0;
            result_re_or <= 0;
            result_re_not <= 0;
            result_re_set <= 0;
            current_data_addr <= 0;
            rdata_en <= 0;
            wdata_en <= 0;
            if (rst)
            begin
                next_PC <= 0;
            end
        end
        
        else if (current_state == STATE_EX)
        begin
        
            if (CMD_addition) // do addition
            begin
                result_re_add <= Add_out_Cout;
                if (Hre2) 
                begin
                    $display("add16bit R%d=%b R%d=%b", R2,H[R2],R3,H[R3]);
                end
                else if (Ore2) 
                begin
                    $display("add8bit R%d=%b R%d=%b", R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre2) 
                begin
                    $display("add4bit R%d=%b R%d=%b", R2,Qset[R2],R3,Qset[R3]);
                end 
                else if (Him)
                begin
                    $display("add16bit R%d=%b im=%b", R0,H[R0],imr);
                end
                else if (Oim)
                begin
                    $display("add8bit R%d=%b im=%b", R0,Oset[R0],imr);
                end
                else if (Qim)
                begin
                    $display("add4bit R%d=%b im=%b", R0,Qset[R0],imr);
                end
            end 
            
            else if (CMD_substruction) // do substruction
            begin
               result_re_sub <= Add_out_Cout;
                if (Hre2) 
                begin
                    $display("sub16bit R%d=%b R%d=%b", R2,H[R2],R3,H[R3]);
                end
                else if (Ore2) 
                begin
                    $display("sub8bit R%d=%b R%d=%b", R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre2) 
                begin
                    $display("sub4bit R%d=%b R%d=%b", R2,Qset[R2],R3,Qset[R3]);
                end
                else if (Him)
                begin
                    $display("sub16bit R%d=%b im=%b", R0,H[R0],imr);
                end
                else if (Oim)
                begin
                    $display("sub8bit R%d=%b im=%b", R0,Oset[R0],imr);
                end
                else if (Qim)
                begin
                    $display("sub4bit R%d=%b im=%b", R0,Qset[R0],imr);
                end
            end        
        
            else if (CMD_multiplication) // do multiplication
            begin
                result_re_mul<=Mul_out_Cout;
                if (Hre2) 
                begin
                    $display("mul16bit R%d=%b R%d=%b", R2,H[R2],R3,H[R3]);
                end
                else if (Ore2) 
                begin
                    $display("mul8bit R%d=%b R%d=%b", R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre2) 
                begin
                    $display("mul4bit R%d=%b R%d=%b", R2,Qset[R2],R3,Qset[R3]);
                end
                else if (Him)
                begin
                    $display("mul16bit R%d=%b im=%b", R0,H[R0],imr);
                end
                else if (Oim)
                begin
                    $display("mul8bit R%d=%b im=%b", R0,Oset[R0],imr);
                end
                else if (Qim)
                begin
                    $display("mul4bit R%d=%b im=%b", R0,Qset[R0],imr);
                end
            end
            
            else if (CMD_mul_accumulation) // do mac
            begin
                result_re_mac <= Add_out_Cout;
                if (Hre3) 
                begin
                    $display("MAC16bit R%d=%b R%d=%b R%d=%b", R1,H[R1],R2,H[R2],R3,H[R3]);
                end
                else if (Ore3) 
                begin
                    $display("MAC8bit R%d=%b R%d=%b R%d=%b", R1,Oset[R1],R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre3) 
                begin
                    $display("MAC4bit R%d=%b R%d=%b R%d=%b", R1,Qset[R1],R2,Qset[R2],R3,Qset[R3]);
                end
            end
            
            else if (CMD_log_shift_right) // do shift right
            begin
                result_re_Rshift <= shiftou;
                if (Hre1) 
                begin
                    $display("Rshift16bit R%d=%b", R3,H[R3]);
                end
                else if (Ore1) 
                begin
                    $display("Rshift8bit R%d=%b", R3,Oset[R3]);
                end
                else if (Qre1) 
                begin
                    $display("Rshift4bit R%d=%b", R3,Qset[R3]);
                end
            end
            
            else if (CMD_log_shift_left) // do shift left
            begin
                result_re_Lshift <= shiftou;
                if (Hre1) 
                begin
                    $display("Lshift16bit R%d=%b", R3,H[R3]);
                end
                else if (Ore1) 
                begin
                    $display("Lshift8bit R%d=%b", R3,Oset[R3]);
                end
                else if (Qre1) 
                begin
                    $display("Lshift4bit R%d=%b", R3,Qset[R3]);
                end
            end
            
            else if (CMD_and) // do and
            begin
                if (Hre2) 
                begin
                    result_re_and <= H[R2] & H[R3];
                    $display("and16bit R%d=%b R%d=%b", R2,H[R2],R3,H[R3]);
                end
                else if (Ore2) 
                begin
                    result_re_and <= Oset[R2] & Oset[R3];
                    $display("and8bit R%d=%b R%d=%b", R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre2) 
                begin
                    result_re_and <= Qset[R2] & Qset[R3];
                    $display("and4bit R%d=%b R%d=%b", R2,Qset[R2],R3,Qset[R3]);
                end
            end
            
            else if (CMD_or) // do or
            begin
                if (Hre2) 
                begin
                    result_re_or <= H[R2] | H[R3];
                    $display("or16bit R%d=%b R%d=%b", R2,H[R2],R3,H[R3]);
                end
                else if (Ore2) 
                begin
                    result_re_or <= Oset[R2] | Oset[R3];
                    $display("or8bit R%d=%b R%d=%b", R2,Oset[R2],R3,Oset[R3]);
                end
                else if (Qre2) 
                begin
                    result_re_or <= Qset[R2] | Qset[R3];
                    $display("or4bit R%d=%b R%d=%b", R2,Qset[R2],R3,Qset[R3]);
                end
            end
    
            
            else if (CMD_not) // do not
            begin
                if (Hre1) 
                begin
                    result_re_not <= ~H[R3];
                    $display("not16bit R%d=%b", R3,H[R3]);
                end
                else if (Ore1) 
                begin
                    result_re_not <= ~Oset[R3];
                    $display("not8bit R%d=%b", R3,Oset[R3]);
                end
                else if (Qre1) 
                begin
                    result_re_not <= ~Qset[R3];
                    $display("not4bit R%d=%b", R3,Qset[R3]);
                end
            end
            
            else if (CMD_set) // do set
            begin
                if (Hre1) 
                begin
                    result_re_set <= imr;
                    $display("set16bit R%d im=%b", R0,imr);
                end
                else if (Ore1) 
                begin
                    result_re_set[7:0] <= imr;
                    result_re_set[15:8] <= imr;
                    $display("set8bit R%d im=%b", R0,imr);
                end
                else if (Qre1) 
                begin
                    result_re_set[3:0] <= imr;
                    result_re_set[7:4] <= imr;
                    result_re_set[11:8] <= imr;
                    result_re_set[15:12] <= imr;
                    $display("set4bit R%d im=%b", R0,imr);
                end
            end
            
            else if (CMD_load) // do load
            begin
                rdata_en <= 1;
                current_data_addr <= imr;
                if (Hre1) 
                begin
                    $display("load16bit R%d im=%b", R0,imr);
                end
                else if (Ore1) 
                begin
                    $display("load8bit R%d im=%b", R0,imr);
                end
                else if (Qre1) 
                begin
                    $display("load4bit R%d im=%b", R0,imr);
                end 
                
            end
            
            else if (CMD_store) // do store
            begin
                wdata_en <= 1;
                rdata_en <= 1;
                current_data_addr <= imr;
                
                if (Hre1) 
                begin
                    data_out_re <= H[R0];
                    $display("store16bit R%d=%b im=%b", R0,H[R0],imr);
                end
                else if (Ore1) 
                begin
                    data_out_re <= Oset[R0];
                    $display("store8bit R%d=%b im=%b", R0,Oset[R0],imr);
                end
                else if (Qre1) 
                begin
                    data_out_re <= Qset[R0];
                    $display("store4bit R%d=%b im=%b", R0,Qset[R0],imr);
                end            
            end
                        
            if (CMD_loopjump)
            begin
                $display("loopjump LC=%d im=%d", LC,imr);
                if (LC != 0)
                begin
                    next_PC <= imr;
                    LC <= LC - 1;
                end
                else
                begin                    
                    next_PC <= next_PC + 1;
                end
            end
            else 
                next_PC <= next_PC + 1;
                
            if (CMD_setloop)
            begin
                $display("setloop im=%d", imr);
                LC <= imr;
            end        
        end                    
    end
    
    
    always @(posedge clk)//STATE_MEM
    begin
        if (rst || current_state == STATE_IDLE || current_state == STATE_IF) 
        begin
        end
        else
        begin
            if (current_state == STATE_MEM)
            begin
                
            end            
        end
    end   
    
    always @(posedge clk)//STATE_WB
    begin
        if (rst || current_state == STATE_IDLE || current_state == STATE_IF) 
        begin
        end
        
        else if (current_state == STATE_WB)
        begin
        
            if (CMD_addition) // do addition
            begin
                if (Hre2) 
                begin
                    H[R2] <= result_re_add;
                end
                else if (Ore2) 
                begin
                    Oset[R2] <= result_re_add;
                end
                else if (Qre2) 
                begin
                    Qset[R2] <= result_re_add;
                end 
                else if (Him)
                begin
                    H[R0] <= result_re_add;
                end
                else if (Oim)
                begin
                    Oset[R0] <= result_re_add;
                end
                else if (Qim)
                begin
                    Qset[R0] <= result_re_add;
                end
            end 
            
            else if (CMD_substruction) // do substruction
            begin
                if (Hre2) 
                begin
                    H[R2] <=result_re_sub;
                end
                else if (Ore2) 
                begin
                    Oset[R2] <=result_re_sub;
                end
                else if (Qre2) 
                begin
                    Qset[R2] <=result_re_sub;
                end
                else if (Him)
                begin
                    H[R0] <=result_re_sub;
                end
                else if (Oim)
                begin
                    Oset[R0] <=result_re_sub;
                end
                else if (Qim)
                begin
                    Qset[R0] <=result_re_sub;
                end
            end
        end
        
        else if (CMD_multiplication) // do multiplication
        begin
            if (Hre2) 
            begin
                H[R2] <= result_re_mul;
            end
            else if (Ore2) 
            begin
                Oset[R2] <= result_re_mul;
            end
            else if (Qre2) 
            begin
                Qset[R2] <= result_re_mul;
            end
            else if (Him)
            begin
                H[R0] <= result_re_mul;
            end
            else if (Oim)
            begin
                Oset[R0] <= result_re_mul;
            end
            else if (Qim)
            begin
                Qset[R0] <= result_re_mul;
            end
        end
        
        else if (CMD_mul_accumulation) // do mac
        begin
            if (Hre3) 
            begin
                H[R1] <= result_re_mac;
            end
            else if (Ore3) 
            begin
                Oset[R1] <= result_re_mac;
            end
            else if (Qre3) 
            begin
                Qset[R1] <= result_re_mac;
            end
        end
        
        else if (CMD_log_shift_right) // do shift right
        begin
            if (Hre1) 
            begin
                H[R3] <= result_re_Rshift;
            end
            else if (Ore1) 
            begin
                Oset[R3] <= result_re_Rshift;
            end
            else if (Qre1) 
            begin
                Qset[R3] <= result_re_Rshift;
            end
        end
        
        else if (CMD_log_shift_left) // do shift left
        begin
            if (Hre1) 
            begin
                H[R3] <= result_re_Lshift;
            end
            else if (Ore1) 
            begin
                Oset[R3] <= result_re_Lshift;
            end
            else if (Qre1) 
            begin
                Qset[R3] <= result_re_Lshift;
            end
        end
        
        else if (CMD_and) // do and
        begin
            if (Hre2) 
            begin
                H[R2] <= result_re_and;
            end
            else if (Ore2) 
            begin
                Oset[R2] <= result_re_and;
            end
            else if (Qre2) 
            begin
                Qset[R2] <= result_re_and;
            end
        end
        
        else if (CMD_or) // do or
        begin
            if (Hre2) 
            begin
                H[R2] <= result_re_or;
            end
            else if (Ore2) 
            begin
                Oset[R2] <= result_re_or;
            end
            else if (Qre2) 
            begin
                Qset[R2] <= result_re_or;
            end
        end

        
        else if (CMD_not) // do not
        begin
            if (Hre1) 
            begin
                H[R3] <= result_re_not;
            end
            else if (Ore1) 
            begin
                Oset[R3] <= result_re_not;
            end
            else if (Qre1) 
            begin
                Qset[R3] <= result_re_not;
            end
        end
        
        else if (CMD_set) // do set
        begin
            if (Hre1) 
            begin
                H[R0] <= result_re_set;
            end
            else if (Ore1) 
            begin
                Oset[R0] <= result_re_set;
            end
            else if (Qre1) 
            begin
                Qset[R0] <= result_re_set;
            end
        end
        else if (CMD_load)
        begin
            if (Hre1) 
            begin
                H[R0] <= data_in;
            end
            else if (Ore1) 
            begin
                Oset[R0] <= data_in;
            end
            else if (Qre1) 
            begin
                Qset[R0] <= data_in;
            end 
        end

    end
    
endmodule