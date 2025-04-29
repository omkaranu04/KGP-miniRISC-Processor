`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 03:11:49 PM
// Design Name: 
// Module Name: ALU_Shift_Right_Arithmetic_TB
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
module ALU_Shift_Right_Arithmetic_TB();
    reg [7:0] a, b;
    
    wire[7:0] out;
    
    ALU_Shift_Right_Arithmetic uut (
        .a(a), 
        .b(b), 
        .out(out)
    );
    
    initial begin
        a = 8'b10000000;
        b = 8'b00000100;
        
        #10;
    end
endmodule
