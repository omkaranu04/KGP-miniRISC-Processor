`timescale 1ns / 1ps

module tb_Master_Interface;

    // Parameters
    reg clk;
    reg rst;
    reg [15:0] instruction;
    
    wire [15:0] display_bits;

    // Instantiate the Unit Under Test (UUT)
    Master_Interface uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .display_bits(display_bits)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Stimulus
    initial begin
        // Release reset
        rst = 1;
        #5 
        rst =  0;

        // Apply test case: Example instruction (opcode = 4'b0001, read_reg1 = 4'b0010, read_reg2 = 4'b0011, write_reg = 4'b0100)
        instruction = 16'b0000001000110111; // Opcode: 0001, read_reg1: 0010, read_reg2: 0011, write_reg: 0100
        
        // Wait for a few clock cycles
        #100;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
//        $monitor("Time: %0t | rst: %b | instruction: %b | clk: %b", $time, rst, instruction, clk);
    end

endmodule