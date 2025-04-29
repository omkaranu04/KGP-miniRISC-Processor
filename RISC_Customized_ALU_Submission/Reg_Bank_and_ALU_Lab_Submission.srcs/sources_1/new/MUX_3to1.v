`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 09:31:30 PM
// Design Name: 
// Module Name: MUX_3to1
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


module MUX_3to1 #(parameter WIDTH = 5) (in0, in1, in2, sel, out);
    input [WIDTH-1:0] in0, in1, in2;
    input [1:0] sel;

    output [WIDTH-1:0] out;

//    initial begin
//        $monitor("Sel = %b, Out : %b", sel, out);
//    end

    assign out = (sel == 2'b00) ? in0 : ((sel == 2'b01) ? in1 : in2);
endmodule
