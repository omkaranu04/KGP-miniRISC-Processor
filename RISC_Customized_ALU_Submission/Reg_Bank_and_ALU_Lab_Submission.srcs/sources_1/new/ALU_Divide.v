`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:58:09
// Design Name: 
// Module Name: ALU_Divide
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


module ALU_Divide #(parameter SIZE = 8)(a, b, q);
    input [SIZE-1:0] a, b;
    output [SIZE-1:0] q;
    
    assign q = a / b;
endmodule
