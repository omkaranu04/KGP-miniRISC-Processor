`timescale 1ns / 1ps

module tb_Master_Interface;

    // Parameters
    reg clk;
    reg rst;
    
    // Instantiate the Unit Under Test (UUT)
    Master_Interface uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock Generation
    initial begin
        forever #3 clk = ~clk; // 100MHz clock
    end

    // Stimulus
    initial begin
        // Release reset
        clk = 0;        
        rst = 1;
        #2
        rst =  0;
        #1500;
        // Finish simulation
        $finish;
    end


endmodule