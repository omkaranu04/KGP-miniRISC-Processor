`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 03:43:41 PM
// Design Name: 
// Module Name: Master_Interface
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


module Master_Interface(clk, rst, instruction, display_bits);
    input clk, rst;
    input [15:0] instruction;
    output reg [15:0] display_bits; 
   
    wire [3:0] read_reg1, read_reg2, write_reg;
    wire [3:0] opcode;
    
    wire clk_slow;
    wire [15:0] temp;
    wire read1, read2, write;
    wire [31:0] write_data, read_data1, read_data2;
    
    assign opcode = instruction[15:12];
    assign read_reg1 = instruction[11:8];
    assign read_reg2 = instruction[7:4];
    assign write_reg = instruction[3:0];
    
    always @ (posedge clk) begin
        $monitor("inst: = %b, op1 = %b, op2 = %b, Write = %b, Opcode = %b", instruction, read_data1, read_data2, write_data, opcode);
        $monitor("temp = %b", temp);
    end
    
    clock_divider clk_div(.clk_in(clk), .clk_out(clk_slow));
    
    RegisterBank RegisterBank_inst(clk, rst, read1, read2, write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg);
    ControlPath ControlPath_inst(clk, rst, read1, read2, write, opcode);
    ALU #(32) ALU_inst(read_data1, read_data2, opcode, write_data);
    
    fsm display_bits_fsm(.clk(clk), .reset(rst), .write_data(write_data), .display_data(temp));
    
    always @(*) begin
        display_bits = temp;
    end
    
endmodule
