`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:46:54
// Design Name: 
// Module Name: Twos_Complement
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


module Twos_Complement #(parameter SIZE = 8)(in, out);
    input [SIZE-1:0] in;
    output [SIZE-1:0] out;
    
    wire [SIZE-1:0] out_not;

    genvar i;
    generate
        for(i=0; i<SIZE; i=i+1) begin
            not NOT_2C(out_not[i], in[i]);
        end
    endgenerate

    wire x;
    ALU_Adder #(.SIZE(SIZE)) adder_2C(.a(out_not), .b({{(SIZE-1){1'b0}}, 1'b1}), .cin(1'b0), .s(out), .c(x));

//    initial begin
//        $monitor("in=%b, out=%b", in, out);
//    end

endmodule
