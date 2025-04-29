`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 12:54:49 AM
// Design Name: 
// Module Name: ALU_Shift_Right_Logical_TB
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


module ALU_Shift_Right_Logical_TB();
    reg [7:0] a, b;
    
    wire[7:0] out;
    
    ALU_Shift_Right_Logical uut (
        .a(a), 
        .b(b), 
        .out(out)
    );
    
    initial begin
        a = 8'b11111111;
        b = 8'b00010011;
        
        #100;
    end
endmodule
