`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 03:51:02 PM
// Design Name: 
// Module Name: Instruction_Decoder
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

module Instruction_Decoder(instruction, opcode, rs, rt, rd, func, imm, offset);
    input [31:0] instruction; 
    output [5:0] opcode;
    output [4:0] rs;
    output [4:0] rt;
    output [4:0] rd;
    output [4:0] func;
    output [15:0] imm;
    output [25:0] offset;

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign func = (instruction[30:28] == 3'b111 | instruction[31] == 1'b1) ? 4'b0000 : ((instruction[26] == 1'b1) ? instruction[30:27] : instruction[4:0]);
    assign imm = instruction[15:0];
    assign offset = instruction[25:0];
 
endmodule