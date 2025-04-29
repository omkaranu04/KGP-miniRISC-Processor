`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 08:30:03 PM
// Design Name: 
// Module Name: ALU_Barrel_Shift_TB
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


module ALU_Barrel_Shift_TB();
    parameter N = 8; 

    reg [N-1:0] A, B;
    reg left_right;
    reg arith;

    // Output
    wire [N-1:0] Y;

    // Instantiate the ALU_Barrel_Shift module
    ALU_Barrel_Shift #(.N(N)) uut (
        .A(A),
        .B(B),
        .left_right(left_right),
        .arith(arith),
        .Y(Y)
    );
    
    initial begin
        $monitor("%b %b %b", A, B, Y);
        A = 8'b00001111;
        B = 8'b00000010;
        left_right = 1'b1; 
        arith = 1'b0;
        #10;
        
    end
endmodule
