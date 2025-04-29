`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 04:13:21 PM
// Design Name: 
// Module Name: Branch_Control
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


module Branch_Control(opcode, sign_bit, alu_op, branch_control);
    input [5:0] opcode;
    input sign_bit;
    input [31:0] alu_op;
    
    output branch_control;
    
    assign branch_control = ((opcode == 6'b100110) | (opcode == 6'b100001 & sign_bit == 1'b1) | (opcode == 6'b100011 & sign_bit == 1'b0) | (opcode == 6'b100101 & alu_op == 32'd0));
endmodule
