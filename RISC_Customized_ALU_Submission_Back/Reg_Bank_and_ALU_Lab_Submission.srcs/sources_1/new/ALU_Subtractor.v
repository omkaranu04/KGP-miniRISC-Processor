`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:41:15
// Design Name: 
// Module Name: ALU_Subtractor
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


module  ALU_Subtractor #(parameter SIZE = 8) (a_in, b_in, cin, diff, c);
    input [SIZE-1:0] a_in;
    input [SIZE-1:0] b_in;
    input cin;
    output [SIZE-1:0] diff;
    output c;
    
    wire [SIZE-1:0] carry;
    wire [SIZE-1:0] b;
    wire temp;

//    initial begin
//        $monitor("a_in = %b, b_in = %b, cin = %b, diff = %b, c = %b", a_in, b_in, cin, diff, c);
//    end

    Twos_Complement #(.SIZE(SIZE)) negb(.in(b_in), .out(b));

	ALU_Adder #(.SIZE(SIZE)) sub(.a(a_in), .b(b), .cin(cin), .s(diff), .c(temp));

    assign c = diff[SIZE-1];

endmodule
