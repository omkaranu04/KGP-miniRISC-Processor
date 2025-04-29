`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 03:51:02 PM
// Design Name: 
// Module Name: Control_Path_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Control_Path_FSM (
    input clk,
    input rst,
    input [5:0] opcode,
    input [4:0] func,
    input INTR,

    output PCin, InstRead, WriteInfoSel, RegRead, RegWrite, ImmSel, BrOp, MemRead, MemWrite, HaltCtrl,
    output [3:0] AluOp,
    output ReadSel,
    output [1:0] move_sel, ALUin2, WriteRegSel,
    output isCMOV
);

    reg [2:0] state;
    reg [2:0] next_state;

    wire isHalt = (opcode == 6'b000110);

    wire isALU_Inst = (opcode == 6'b000000);
    wire isLoad_Inst = (opcode == 6'b011101);
    wire isStore_Inst = (opcode == 6'b011111);
    wire isMove_Inst = (opcode == 6'b000100);
    wire isCMOV_Inst = (opcode == 6'b001000);
    
    assign isCMOV = (isCMOV_Inst);

    assign move_sel = {isMove_Inst | isCMOV_Inst, isMove_Inst | isLoad_Inst};

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= 3'b000;
        end 
        else begin
            state <= next_state;
        end
    end

    wire read_sel, imm_sel, write_info_sel;
    wire [3:0] alu_op;
    wire [1:0] br_op, alu_in2, write_reg_sel;

    assign read_sel = (isALU_Inst | isLoad_Inst | isStore_Inst | isMove_Inst | isCMOV_Inst) ? 1'b0 : 1'b1;
    assign write_reg_sel = (opcode[1:0] == 2'b00) ? 2'b10 : ((isLoad_Inst | isStore_Inst) ? 2'b01 : 2'b00);
    assign write_info_sel = (isLoad_Inst) ? 1'b1 : 1'b0;
    assign imm_sel = (opcode[0] == 1'b1) ? 1'b1 : 1'b0;
    assign alu_op = (isALU_Inst) ? func[3:0] : ((isLoad_Inst | isStore_Inst) ? 4'b0000 : (opcode == 6'b100001) ? 4'b1100 : (opcode == 6'b100011) ? 4'b1101 : (opcode == 6'b100101) ? 4'b0011 : opcode[4:1]);
    assign alu_in2 = (opcode[5] == 1'b1) ? 2'b10 : ((opcode[0] == 1'b1) ? 2'b01 : 2'b00);
    assign br_op = (opcode[5] == 1'b1) ? opcode[2:1] : 2'b00; 

//    initial begin
//        $monitor($time,"*alu_in2: %b, opcode: %b", alu_in2, opcode);
//    end

    always @(state) begin
        case (state)
            3'b001: begin
                // InstRead <= 1'b1;
                next_state <= isHalt ? 3'b111 : 3'b010;
            end
            3'b010: begin
                next_state <= isHalt ? 3'b111 : 3'b011;
            end
            3'b011: begin
                // InstRead <= 1'b0;
                // RegRead <= 1'b1;
                next_state <= isHalt ? 3'b111 : 3'b100;
            end
            3'b100: begin
                // MemRead <= (isLoad_Inst) ? 1'b1 : 1'b0;
                // MemWrite <= (isStore_Inst) ? 1'b1 : 1'b0;
                next_state <= isHalt ? 3'b111 : 3'b101;
            end
            3'b101: begin
                next_state <= isHalt ? 3'b111 : 3'b110;
            end
            3'b110: begin
                // PCin <= 1'b1;
                // RegWrite <= 1'b1;
                next_state <= isHalt ? 3'b111 : 3'b001;
            end
            3'b111: begin
                next_state <= (INTR) ? 3'b001 : 3'b111;
            end
            3'b000: begin
                next_state <= 3'b001;
            end
            default: next_state <= 3'b001;
        endcase
    end

    assign ReadSel = read_sel;
    assign WriteRegSel = write_reg_sel;
    assign ImmSel = imm_sel;
    assign AluOp = alu_op;
    assign ALUin2 = alu_in2;
    assign WriteInfoSel = write_info_sel;
    assign HaltCtrl = isHalt;
    assign BrOp =  br_op;

    assign InstRead = (state == 3'b001 | state == 3'b010);
    assign RegRead = (state == 3'b011);
    assign MemRead = (opcode == 6'b001010) ? 1'b0 : (isLoad_Inst & (state == 3'b100 | state == 3'b101));
    assign MemWrite = (opcode == 6'b001010) ? 1'b0 : (isStore_Inst & (state == 3'b100 | state == 3'b101));
    assign RegWrite = (state == 3'b110 & (opcode[1:0] != 2'b10) & (opcode[5]!=1'b1) & (opcode != 6'b011111));
    assign PCin = (state == 3'b110);

endmodule