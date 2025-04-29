`timescale 1ns / 1ps

module ALU_LUI_tb;

    // Parameters
    parameter SIZE = 32;    // Size of the inputs
    reg [SIZE-1:0] in;     // Input
    wire [SIZE-1:0] out;   // Output

    // Instantiate the ALU_LUI module
    ALU_LUI #(SIZE) uut (
        .in(in),
        .out(out)
    );

    // Test procedure
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time: %0dns | Input: %b | Output: %b", $time, in, out);
        
        // Test case: in = 8'b10101010
        in = 32'b11111111111111111111111111111111; // Example input
        #10; // Wait for 10 time units

        // Finish simulation
        $finish;
    end

endmodule
