`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:49:02
// Design Name: 
// Module Name: ALU_HAM_32
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


module ALU_HAM_32(a, count);
    input [31:0] a;
    output [31:0] count;

    wire [1:0] lvl1_sum[15:0];
    wire [2:0] lvl2_sum[7:0];
    wire [3:0] lvl3_sum[3:0];
    wire [4:0] lvl4_sum[1:0];
    wire [5:0] lvl5_sum;

    // Level 1
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : lvl1
            ALU_Adder #(.SIZE(1)) sum_lvl1(.a(a[2*i]), .b(a[2*i + 1]), .cin(0), .s(lvl1_sum[i][0]), .c(lvl1_sum[i][1]));
        end
    endgenerate
    
    // Level 2
    genvar j;
    generate
        for (j = 0; j < 8; j = j + 1) begin : lvl2
            ALU_Adder #(.SIZE(2)) sum_lvl2(.a(lvl1_sum[2*j]), .b(lvl1_sum[2*j+1]), .cin(0), .s(lvl2_sum[j][1:0]), .c(lvl2_sum[j][2]));
        end
    endgenerate
    
    // Level 3
    genvar k;
    generate
        for (k = 0; k < 4; k = k + 1) begin : lvl3
            ALU_Adder #(.SIZE(3)) sum_lvl3(.a(lvl2_sum[2*k]), .b(lvl2_sum[2*k+1]), .cin(0), .s(lvl3_sum[k][2:0]), .c(lvl3_sum[k][3]));
        end
    endgenerate
    
    // Level 4
    genvar l;
    generate
        for (l = 0; l < 2; l = l + 1) begin : lvl4
            ALU_Adder #(.SIZE(4)) sum_lvl4(.a(lvl3_sum[2*l]), .b(lvl3_sum[2*l+1]), .cin(0), .s(lvl4_sum[l][3:0]), .c(lvl4_sum[l][4]));
        end
    endgenerate

    //Level 5
    ALU_Adder #(.SIZE(5)) sum_lvl5(.a(lvl4_sum[0]), .b(lvl4_sum[1]), .cin(0), .s(lvl5_sum[4:0]), .c(lvl5_sum[5]));

    assign count = {{(26){1'b0}}, lvl5_sum};
endmodule
