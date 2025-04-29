`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:45:44 PM
// Design Name: 
// Module Name: MUX_16to1
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


module MUX_16to1(in, sel1, sel2, sel3, sel4, out);
    input [15:0] in;
    input sel1, sel2, sel3, sel4;
    output out;
    
    wire m_16to8_1, m_16to8_2;
        
    MUX_8to1 m811(.in(in[7:0]), .sel1(sel1), .sel2(sel2), .sel3(sel3), .out(m_16to8_1));
    MUX_8to1 m812(.in(in[15:8]), .sel1(sel1), .sel2(sel2), .sel3(sel3), .out(m_16to8_2));
    MUX_2to1 m_lvl2_1(.in1(m_16to8_1), .in2(m_16to8_2), .sel(sel4), .out(out));
    
endmodule
