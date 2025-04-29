`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:39:08 PM
// Design Name: 
// Module Name: ControlPath
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
`timescale 1ns / 1ps

module ControlPath (clk, rst, read1, read2, write, opcode);
    input clk, rst;
    output reg read1, read2, write;
    input [3:0] opcode;    

    always @(*) begin
        read1 <= 1;
        write <= 1;
        case(opcode)
            4'b0000: begin
                read2 <= 1;
            end
            4'b0001: begin
                read2 <= 1;
            end
            4'b0010: begin
                read2 <= 1;
            end
            4'b0011: begin
                read2 <= 1;
            end
            4'b0100: begin
                read2 <= 1;
            end
            4'b0101: begin
                read2 <= 1;
            end
            4'b0110: begin
                read2 <= 1;
            end
            4'b1000: begin
                read2 <= 1;
            end
            4'b1001: begin
                read2 <= 1;
            end
            4'b1010: begin
                read2 <= 1;
            end
            4'b1111: begin
                read2 <= 1;
            end  
            4'b0111: begin
                read2 <= 0;
            end  
            4'b1011: begin
                read2 <= 0;
            end  
            4'b1100: begin
                read2 <= 0;
            end  
            4'b1101: begin
                read2 <= 0;
            end   
            4'b1110: begin
                read2 <= 0;
            end    
        endcase
    end
endmodule
