`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 03:51:02 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(clk, in, pc_in, out);
    input pc_in, clk;
    input [31:0] in;
    output reg [31:0] out;
    
    initial out <= 0;
    always @(posedge clk) begin
        if (pc_in) out <= in;
    end
endmodule

