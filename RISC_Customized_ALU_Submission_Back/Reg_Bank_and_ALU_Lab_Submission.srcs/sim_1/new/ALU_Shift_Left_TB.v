`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 12:02:06 AM
// Design Name: 
// Module Name: ALU_Shift_Left_TB
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


module ALU_Shift_Left_TB();
    reg [7:0] a, b;
    
    wire[7:0] out;
    
    ALU_Shift_Left uut (
        .a(a), 
        .b(b), 
        .out(out)
    );
    
    initial begin
        a = 8'b11111111;
        b = 8'b00000011;
        
        #10;
    end
endmodule
