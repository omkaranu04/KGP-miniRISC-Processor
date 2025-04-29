`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 05:49:53 PM
// Design Name: 
// Module Name: Instruction_Memory
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

module Instruction_Memory #(parameter BRAM_ADDR_WIDTH = 2, BRAM_DATA_WIDTH = 32) (clk, addr, wr_n, rd_n, bram_data_in, bram_data_out);

    input clk, wr_n, rd_n;
    input [BRAM_ADDR_WIDTH-1:0] addr;
    input [BRAM_DATA_WIDTH-1:0] bram_data_in;
    output reg [BRAM_DATA_WIDTH-1:0] bram_data_out;

    reg [BRAM_DATA_WIDTH-1:0] mem [(1<<BRAM_ADDR_WIDTH)-1:0];
    integer i;
    initial begin
        // $monitor("ins mem[%d] = %d at %d", 0, mem[0], $time);
        $readmemb("Instruction_Memory.mem", mem);
    end

    always @(posedge clk) begin
        // if (wr_n == 1'b0) mem[(addr)] <= bram_data_in;
        if (rd_n == 1'b1) bram_data_out <= mem[addr];
    end

endmodule

