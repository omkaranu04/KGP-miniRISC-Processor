`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 17:04:01
// Design Name: 
// Module Name: MUX_2to1
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


module MUX_2to1 #(parameter WIDTH = 1) (in1, in2, sel, out);
    input [WIDTH-1:0] in1, in2;
    input sel;
    output [WIDTH-1:0] out;
    
    assign out = (sel == 1'b0) ? in1 : in2;
    
endmodule
