`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:06:56 PM
// Design Name: 
// Module Name: ALU_Ham_TB
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


module ALU_Ham_TB();
    reg [7:0] a;

    wire [3:0] count;

    ALU_Ham uut (
        .a(a), 
        .count(count)
    );

    initial begin
        a = 8'b11111111;
        
        #10;
        
        #100;
    end
endmodule
