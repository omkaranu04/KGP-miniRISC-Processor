`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:29:17
// Design Name: 
// Module Name: ALU_Barrel_Right
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

module ALU_Barrel_Right #(parameter N = 8) (A, B, Y);
    input [N-1:0] A, B;
    output [N-1:0] Y; 

    wire [$clog2(N)-1:0] shift_amount = B[$clog2(N)-1:0];
    wire [N-1:0] exT, nexT;
    
    assign exT = 0;
    
    wire excess_shift = |B[N-1:$clog2(N)];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : shift_gen
            assign nexT[i] = (i + shift_amount < N) ? A[i + shift_amount] : 1'b0;
        end
      
        for (i = 0; i < N; i = i + 1) begin
            assign Y[i] = excess_shift ? exT[i] : nexT[i];
        end
    endgenerate   

endmodule

