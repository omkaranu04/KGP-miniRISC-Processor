`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 11:27:19 PM
// Design Name: 
// Module Name: MUX_8to1
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


module MUX_8to1(in, sel1, sel2, sel3, out);
    input [7:0] in;
    input sel1, sel2, sel3;
    output out;
    
    wire m_8to4_1, m_8to4_2;
    
    MUX_4to1 m1(.in1(in[0]), .in2(in[1]), .in3(in[2]), .in4(in[3]), .sel1(sel1), .sel2(sel2), .out(m_8to4_1));
    MUX_4to1 m2(.in1(in[4]), .in2(in[5]), .in3(in[6]), .in4(in[7]), .sel1(sel1), .sel2(sel2), .out(m_8to4_2));
    MUX_2to1 m_lvl2_1(.in1(m_8to4_1), .in2(m_8to4_2), .sel(sel3), .out(out));
    
endmodule
