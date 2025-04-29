`timescale 1ns / 1ps

module ALU_NOR_tb;

    // Parameters
    parameter SIZE = 32;    // Size of the inputs
    reg [SIZE-1:0] a;      // Input a
    reg [SIZE-1:0] b;      // Input b
    wire [SIZE-1:0] out;   // Output

    // Instantiate the ALU_NOR module
    ALU_NOR #(SIZE) uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // Test procedure
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time: %0dns | Input A: %b | Input B: %b | Output: %b", $time, a, b, out);
        
        // Test case: a = 8'b10101010, b = 8'b01010101
        a = 32'd31; // 10101010
        b = 32'd0; // 01010101
        #10; // Wait for 10 time units

        // Finish simulation
        $finish;
    end

endmodule
