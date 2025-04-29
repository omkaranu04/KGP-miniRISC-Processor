`timescale 1ns / 1ps

module Master_Interface(clk, rst);
    input clk, rst; 
   
    wire [4:0] read_reg1, read_reg2, write_reg;
    
    wire clk_slow;
    wire [31:0] ALU_OP1, ALU_OP2, ALU_OUT, temp;
    wire [31:0] write_data, read_data1, read_data2;
    
    wire [31:0] PC, IR;

    wire [31:0] MEM_out;

    wire [4:0] rs, rt, rd, funct;
    wire [15:0] imm;
    wire [25:0] offset;   
    
    wire read_sel, imm_sel, write_info_sel, mem_read, mem_write, reg_read, reg_write, intr, sign_bit;
    wire inst_read, haltctrl, pc_in, is_cmov; 
    wire [3:0] alu_op;
    wire [1:0] br_op, alu_in2, move_sel, write_reg_sel;
    
    wire [5:0] opcode;

    Instruction_Memory #(10, 32) inst_mem (~clk, PC[9:0], 1'b0, inst_read, 32'b0, IR);  
    
    Instruction_Decoder inst_dec(IR, opcode, rs, rt, rd, funct, imm, offset);
    
//     initial begin
//         $monitor($time, " IR: %b, opcode: %b, rs: %b, rt: %b, rd: %b, funct: %b, imm: %b, offset: %b, pc : %b", IR, opcode, rs, rt, rd, funct, imm, offset, PC);
//     end

    wire [31:0] sign_extended_val_offset, sign_extended_val_imm;
    
    Sign_Extend #(26) sgn_ext_offset (offset, opcode, sign_extended_val_offset);
    Sign_Extend #(16) sgn_ext_imm (imm, opcode, sign_extended_val_imm);
    
    Control_Path_FSM control_unit (clk, rst, opcode, funct, intr, pc_in, inst_read, write_info_sel, reg_read, reg_write, imm_sel, brop, mem_read, mem_write, haltctrl, alu_op, read_sel, move_sel, alu_in2, write_reg_sel, is_cmov);

//    initial begin 
//        $monitor($time, " mem_write: %b", mem_write);
//    end

    wire branch_control;

    Branch_Control branch_ctrl (opcode, sign_bit, ALU_OUT, branch_control);

    // initial begin
    //     $monitor($time, " branch_control: %b", branch_control);
    // end
    
    wire [31:0] add_PC, new_PC, imm_out;

    MUX_2to1 #(32) Imm_Sel_MUX (sign_extended_val_offset, sign_extended_val_imm, imm_sel, imm_out);
    
    // initial begin
    //     $monitor($time, " imm_out: %b", imm_out);
    // end

    wire PC_carry;

    MUX_2to1 #(32) PC_Sel_MUX (32'd1, imm_out, branch_control, add_PC); 
    ALU_Adder #(32) PC_Adder (PC, add_PC, 1'b0, new_PC, PC_carry);

    Program_Counter PC_Module (clk, new_PC, pc_in, PC);

//     initial begin
//         $monitor($time, " PC: %b, new_PC: %b, add_PC: %b, PC_carry: %b", PC, new_PC, add_PC, PC_carry);
//     end

    // clock_divider clk_div(.clk_in(clk), .clk_out(clk_slow));
    
    MUX_2to1 #(5) Read_Sel_MUX (rt, 5'b0, read_sel, read_reg2);

    // initial begin
    //     $monitor($time, " read_sel: %b", read_sel);
    // end

    assign read_reg1 = rs;

    MUX_3to1 #(5) Write_Reg_Sel_MUX (rs, rt, rd, write_reg_sel, write_reg);

    RegisterBank RegisterBank_inst(clk, rst, reg_read, reg_write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg);
    
    initial begin
        $monitor($time, " Write_Reg: %b, Read_Reg1: %b, Read_Reg2: %b, read_data1: %b, read_data2: %b, write: %b, move_sel = %b, ALU_Out: %b", write_reg, read_reg1, read_reg2, read_data1, read_data2, write_data, move_sel, ALU_OUT);
    end
    
    assign ALU_OP1 = (opcode == 6'b011111) ? read_data2 : read_data1;

    MUX_3to1 #(32) ALU_in2_MUX (read_data2, imm_out, 32'b0, alu_in2, ALU_OP2);

    ALU #(32) ALU_inst(ALU_OP1, ALU_OP2, funct, ALU_OUT, sign_bit);

//    initial begin
//        $monitor($time, " ALU_OP1: %b, ALU_OP2: %b, ALU_OUT: %b, alu_in2: %b", ALU_OP1, ALU_OP2, ALU_OUT, alu_in2);
//    end

    wire [31:0] data_for_dm;
    assign data_for_dm = (opcode == 6'b011111) ? read_data1 : read_data2;

    Data_Memory #(10, 32) data_mem_unit (~clk, ALU_OUT[9:0], mem_write, mem_read, data_for_dm, MEM_out);

//     initial begin
//         $monitor($time, " mem_write: %b, read_data2: %b,  MEM_out: %b", mem_write, read_data2, MEM_out);
//     end
     
    wire sel_temp;

    MUX_2to1 #(1) Move_Sel_MUX ( move_sel[0], ALU_OUT[0], is_cmov, sel_temp);

    MUX_4to1 #(32) Write_Data_MUX (ALU_OUT, MEM_out, read_data2, read_data1, move_sel[1], sel_temp, write_data);
    
//     initial begin
//         $monitor($time, " move_sel[1]: %b, sel_temp: %b, write_data: %b", move_sel[1], sel_temp, write_data);
//     end
    
endmodule
