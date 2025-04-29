`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:25:39 PM
// Design Name: 
// Module Name: ALU_Dec4_TB
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


module ALU_Dec4_TB();
    reg [7:0] in;

    wire [7:0] out;

    ALU_Dec4 uut (
        .in(in), 
        .out(out)
    );

    initial begin
        in = 8'b00000100; 
        #10; 
    end
endmodule
