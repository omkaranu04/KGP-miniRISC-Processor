`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 03:37:41 PM
// Design Name: 
// Module Name: ALU_Divide_TB
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


module ALU_Divide_TB();
    reg [7:0] a, b;
    
    wire [7:0] q;
    
    ALU_Divide uut(
        .a(a),
        .b(b),
        .q(q)
    );
    
    initial begin
        a = 8'b00001000;
        b = 8'b00000010;
        
        #10;
    end
endmodule
