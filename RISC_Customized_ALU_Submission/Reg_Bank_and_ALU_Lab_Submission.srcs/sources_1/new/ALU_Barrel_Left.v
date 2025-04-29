`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:06:48
// Design Name: 
// Module Name: ALU_Barrel_Left
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

module ALU_Barrel_Left #(parameter N = 8) (A, B, Y);
    input [N-1:0] A, B;
    output [N-1:0] Y; 

    wire [$clog2(N)-1:0] shift_amount = B[$clog2(N)-1:0]; // Extract the shift amount
    wire [N-1:0] exT, nexT;
    
    assign exT = 0;
    
    wire excess_shift = |B[N-1:$clog2(N)];

//    initial begin
//        $monitor("%b, %b, %b, %b, %b", excess_shift, exT, nexT, A, excess_shift);
//    end
    
    genvar i, j, k;
    generate
//        for (k = 1; k < N-$clog2(N); k = k + 1) begin
//            or excess_shift_check(excess_shift[k], B[k+$clog2(N)], excess_shift[k-1]);
//        end
        
        for (i = 0; i < N; i = i + 1) begin : shift_gen
            assign nexT[i] = (i >= shift_amount) ? A[i - shift_amount] : 1'b0;
        end
      
        for (j = 0; j < N; j = j + 1) begin
            assign Y[j] = excess_shift ? exT[j] : nexT[j]; 
        end
    endgenerate   
endmodule

