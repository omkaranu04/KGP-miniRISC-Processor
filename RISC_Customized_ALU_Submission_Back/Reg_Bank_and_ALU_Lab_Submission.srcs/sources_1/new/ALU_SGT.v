`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 14:59:49
// Design Name: 
// Module Name: ALU_SGT
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


module ALU_SGT #(parameter SIZE = 8) (a, b, out);
    input [SIZE - 1:0] a,b;
    output [SIZE - 1:0] out;
    
    wire [SIZE - 1:0] diff_a_b;
    wire borrow_check_sgt;
    wire bit_out;
    
    ALU_Subtractor #(.SIZES(SIZE)) sgt_subtractor(.a_in(a), .b_in(b), .cin(1'b0), .diff(diff_a_b), .c(borrow_check_sgt));
       
    MUX_2to1 sgt_mux(.in1(1'b1), .in2(1'b0), .sel(borrow_check_sgt), .out(bit_out));
    
    assign out = {{(SIZE-1){1'b0}}, bit_out};
    
endmodule
