`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 14:59:49
// Design Name: 
// Module Name: ALU_LUI
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


module ALU_LUI #(parameter SIZE = 8) (in, out);
    input [SIZE-1:0] in;
    output [SIZE-1:0] out;
    
    assign out = { in[SIZE-1:(SIZE)/2], {(SIZE/2){1'b0}} }; 
    
endmodule
