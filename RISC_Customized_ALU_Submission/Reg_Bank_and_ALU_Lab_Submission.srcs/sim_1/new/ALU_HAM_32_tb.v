`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 16:13:46
// Design Name: 
// Module Name: ALU_HAM_32_tb
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


module ALU_HAM_32_tb;

    // Parameters
    reg [31:0] a;          // Input
    wire [31:0] count;    // Output

    // Instantiate the ALU_HAM_32 module
    ALU_HAM_32 uut (
        .a(a),
        .count(count)
    );

    // Test procedure
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time: %0dns | Input: %b | Hamming Weight: %d", $time, a, count);
        
        // Test case 1: All bits set (should return 32)
        a = 32'd511; // 11111111 11111111 11111111 11111111
        #10;

        // Finish simulation
        $finish;
    end

endmodule
