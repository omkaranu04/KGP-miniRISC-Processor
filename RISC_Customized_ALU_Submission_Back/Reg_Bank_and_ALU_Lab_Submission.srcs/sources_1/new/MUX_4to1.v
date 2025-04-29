`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 10:45:44 PM
// Design Name: 
// Module Name: MUX_4to1
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


module MUX_4to1(in1, in2, in3, in4, sel2, sel1, out);
    input in1, in2, in3, in4, sel2, sel1;
    output out;
    
    wire m1, m2;
    
    MUX_2to1 mux_1(.in1(in1), .in2(in2), .sel(sel1), .out(m1));
    MUX_2to1 mux_2(.in1(in3), .in2(in4), .sel(sel1), .out(m2));
    MUX_2to1 mux_3(.in1(m1), .in2(m2), .sel(sel2), .out(out));
    
endmodule
