`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 03:51:02 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend #(parameter WIDTH = 16) (
    input [WIDTH - 1:0] value,
    input [5:0] opcode,
    output [31:0] out
);

    assign out = (opcode[1:0] == 2'b00) ? {{(6){value[WIDTH-1]}}, value} : (opcode[5] == 1'b1) ? {{(16){value[WIDTH-1]}}, value} : {{(6){value[WIDTH-1]}}, value}; 

endmodule
