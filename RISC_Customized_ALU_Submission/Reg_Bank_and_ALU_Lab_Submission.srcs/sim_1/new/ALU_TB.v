`timescale 1ns / 1ps

module ALU_tb;
    // Parameters
    parameter SIZE = 64;
    
    // Inputs
    reg [SIZE-1:0] a, b;
    reg [3:0] opcode;
    
    // Outputs
    wire [SIZE-1:0] out;
    wire sign_bit;
    
    // Instantiate the ALU
    ALU #(SIZE) uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .out(out),
        .sign_bit(sign_bit)
    );
    
    // Test procedure
    initial begin
        // Monitor signals
        $monitor("Time=%0t | a=%d | b=%d | opcode=%b | out=%d | sign_bit=%d", 
                 $time, a, b, opcode, out, sign_bit);
                 
        // Initialize inputs
        a = 64'd32;  // Example pattern
        b = 64'd32;  // Example pattern

        // Test all opcodes to observe outputs
        opcode = 4'b0000; #10; // Add
        opcode = 4'b0001; #10; // Subtract
        opcode = 4'b0010; #10; // SLT
        opcode = 4'b0011; #10; // SGT
        opcode = 4'b0100; #10; // AND
        opcode = 4'b0101; #10; // OR
        opcode = 4'b0110; #10; // XOR
        opcode = 4'b0111; #10; // Complement A
        opcode = 4'b1000; #10; // Load Upper Immediate (LUI)
        opcode = 4'b1001; #10; // NOR
        opcode = 4'b1010; #10; // Shift Left
        opcode = 4'b1011; #10; // Shift Right
        opcode = 4'b1100; #10; // Shift Right Arithmetic
        opcode = 4'b1101; #10; // A + 4
        opcode = 4'b1110; #10; // A - 4
        opcode = 4'b1111; #10; // Hamming Count

        $stop; // Stop simulation
    end
endmodule