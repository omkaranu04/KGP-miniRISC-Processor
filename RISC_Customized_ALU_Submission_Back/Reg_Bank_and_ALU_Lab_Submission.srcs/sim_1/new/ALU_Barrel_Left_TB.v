`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:07:50
// Design Name: 
// Module Name: ALU_Barrel_Left_TB
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


`timescale 1ns / 1ps

`timescale 1ns / 1ps

module tb_ALU_Barrel_Left;

    // Parameters
    parameter N = 8;

    // Testbench signals
    reg [N-1:0] A;
    reg [N-1:0] B;
    wire [N-1:0] Y;

    // Instantiate the ALU_Barrel_Left module
    ALU_Barrel_Arithmetic_Right #(
        .N(N)
    ) uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Testbench procedure
    initial begin        
        // Single test case: Shift input data left by 3 positions
        A = 8'b10011110; // Example input data
        B = 8'b00000111; // Shift by 3 positions (lower 3 bits represent shift amount)
        // Finish simulation
        #100 $finish;
    end

endmodule
