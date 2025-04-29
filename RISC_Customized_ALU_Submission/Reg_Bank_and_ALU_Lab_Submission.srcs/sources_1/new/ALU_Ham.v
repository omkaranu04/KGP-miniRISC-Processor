`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:21
// Design Name: 
// Module Name: ALU_Ham
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

module ALU_Ham(a, count);
    input [7:0] a;
    output [7:0] count;

    wire [1:0] lvl1_sum0, lvl1_sum1, lvl1_sum2, lvl1_sum3;
    wire [2:0] lvl2_sum0, lvl2_sum1;

    // Level 1
    fulladder fa1(.a(a[0]), .b(a[1]), .c0(0), .s(lvl1_sum0[0]), .c(lvl1_sum0[1]));
    fulladder fa2(.a(a[2]), .b(a[3]), .c0(0), .s(lvl1_sum1[0]), .c(lvl1_sum1[1]));
    fulladder fa3(.a(a[4]), .b(a[5]), .c0(0), .s(lvl1_sum2[0]), .c(lvl1_sum2[1]));
    fulladder fa4(.a(a[6]), .b(a[7]), .c0(0), .s(lvl1_sum3[0]), .c(lvl1_sum3[1]));

    // Level 2
    Adder_2Bit adder1(.a(lvl1_sum0), .b(lvl1_sum1), .sum(lvl2_sum0[1:0]), .cout(lvl2_sum0[2]));
    Adder_2Bit adder2(.a(lvl1_sum2), .b(lvl1_sum3), .sum(lvl2_sum1[1:0]), .cout(lvl2_sum1[2]));

    // Level 3
    Adder_3Bit adder3(.a(lvl2_sum0), .b(lvl2_sum1), .sum(count[2:0]), .cout(count[3]));
    assign count[4] = 1'b0;
    assign count[5] = 1'b0;
    assign count[6] = 1'b0;
    assign count[7] = 1'b0;

endmodule
