`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:03:42 PM
// Design Name: 
// Module Name: Adder_3Bit
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



module Adder_3Bit(a, b, sum, cout);
    input [2:0] a, b;
    output [2:0] sum;
    output cout;

    wire c0, c1;

    fulladder fa1(.a(a[0]), .b(b[0]), .c0(0), .s(sum[0]), .c(c0));
    fulladder fa2(.a(a[1]), .b(b[1]), .c0(c0), .s(sum[1]), .c(c1));
    fulladder fa3(.a(a[2]), .b(b[2]), .c0(c1), .s(sum[2]), .c(cout));

endmodule
