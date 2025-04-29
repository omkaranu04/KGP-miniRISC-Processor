`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:38:36
// Design Name: 
// Module Name: ALU_Adder
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

module ALU_Adder #(parameter SIZE = 8)(a, b, cin, s, c);
    input [SIZE-1:0] a, b;
    input cin;
    output [SIZE-1:0] s;
    output c;

    wire [SIZE:0] carry;
	assign carry[0] = cin;

	genvar i;
    generate
        for(i=0; i<SIZE; i=i+1) begin
            fulladder fa(.a(a[i]), .b(b[i]), .c0(carry[i]), .s(s[i]), .c(carry[i+1]));
        end
    endgenerate

	assign c = carry[SIZE];
endmodule

