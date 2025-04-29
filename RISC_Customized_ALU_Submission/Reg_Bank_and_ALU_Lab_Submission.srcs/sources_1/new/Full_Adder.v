`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:42:19
// Design Name: 
// Module Name: Full_Adder
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

module fulladder(a, b, c0, s, c);
    input a, b, c0;
    output s, c;
    wire t1, t2, t3;
    xor (t1, a, b);
    xor (s, c0, t1);
    and (t2, a, b);
    and (t3, t1, c0);
    or (c, t2, t3);
endmodule
