`timescale 1ns / 1ps

module ALU_SLT_tb;

    // Parameters
    parameter SIZE = 32;    // Size of the inputs
    reg [SIZE-1:0] a;      // Input a
    reg [SIZE-1:0] b;      // Input b
    wire [SIZE-1:0] out;   // Output

    // Instantiate the ALU_SGT module
    ALU_SLT #(SIZE) uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // Test procedure
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time: %0dns | Input A: %b | Input B: %b | Output: %b", $time, a, b, out);
        
        // Test case: a = 8'b00001111 (15), b = 8'b00001000 (8)
        a = 32'd31; // 15 in decimal
        b = 32'd6; // 8 in decimal
        #10; // Wait for 10 time units

        // Finish simulation
        $finish;
    end

endmodule
