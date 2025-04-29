`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:22:43 PM
// Design Name: 
// Module Name: ALU_Inc4_TB
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


module ALU_Inc4_TB();
    reg [7:0] in;

    wire [7:0] out;

    ALU_Inc4 uut (
        .in(in), 
        .out(out)
    );

    initial begin
        in = 8'b00000011; 
        #10; 
    end
endmodule
