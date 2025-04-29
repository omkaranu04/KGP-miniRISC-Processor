`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:58:44
// Design Name: 
// Module Name: ALU_Multiply
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


module ALU_Multiply #(parameter SIZE = 8)(a, b, p);
    input [SIZE-1:0] a, b;
    output [SIZE-1:0] p;
    
    assign p = a * b;
endmodule
