`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 10:23:50 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clk_in, clk_out);
    input clk_in; // input clock on FPGA
    output reg clk_out; // output clock after dividing the input clock by divisor
    
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd100000000;

    always @(posedge clk_in)
    begin
        counter <= counter + 28'd1;
     
        if(counter>=(DIVISOR-1))
            counter <= 28'd0;
      
        clk_out <= ( counter < DIVISOR/2 )? 1'b1 : 1'b0;
    end
endmodule
