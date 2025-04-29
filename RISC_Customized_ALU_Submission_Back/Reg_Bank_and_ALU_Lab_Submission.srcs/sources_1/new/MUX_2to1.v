`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 17:04:01
// Design Name: 
// Module Name: MUX_2to1
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


module MUX_2to1(in1, in2, sel, out);
    input in1, in2, sel;
    output out;
    
    wire sbar;
    wire t1, t2;
    
    not n(sbar, sel);
    and a1(t1, in1, sbar);
    and a2(t2, in2, sel);
    or o1(out, t1, t2);
    
endmodule
