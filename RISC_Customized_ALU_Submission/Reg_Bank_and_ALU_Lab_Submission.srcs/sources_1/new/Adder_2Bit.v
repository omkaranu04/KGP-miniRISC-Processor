`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 09:30:35 PM
// Design Name: 
// Module Name: Adder_2Bit
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


module Adder_2Bit(a, b, sum, cout);
    input [1:0] a, b;
    output [1:0] sum;
    output cout;

    wire c1;

    fulladder fa1(.a(a[0]), .b(a[0]), .c0(0), .s(sum[0]), .c(c1));
    fulladder fa2(.a(a[1]), .b(b[1]), .c0(c1), .s(sum[1]), .c(cout));
    
endmodule