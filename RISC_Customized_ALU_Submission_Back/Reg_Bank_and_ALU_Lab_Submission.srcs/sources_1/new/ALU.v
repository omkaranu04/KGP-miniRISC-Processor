`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 03:25:49 PM
// Design Name: 
// Module Name: ALU
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

module ALU #(parameter SIZE = 8) (a, b, opcode, out);   
    
    input [SIZE-1:0] a, b;
    input [3:0] opcode;
    output [SIZE-1:0] out;

    /*
    0000: A+B
    0001: A-B
    0010: A*B
    0011: A/B
    0100: A AND B
    0101: A OR B
    0110: A XOR B
    0111: A BAR
    1000: A
    1001: B
    1010: A<<B
    1011: A>>B (logical)
    1100: A>>B (arithmetic)
    1101: A+4
    1110: A-4
    1111: HAM(A)
    */

    wire [SIZE-1:0] sum, diff, rem_hi, andAB, orAB, xorAB, complementA, a_shift_left_b, a_shift_right_b, a_shift_right_arith_b, a_plus_4, a_minus_4, ham, lui, norAB, sgt, slt;
    wire cout_add, cout_sub, cout_add4, cout_sub4;

    ALU_Adder                           #(.SIZE(SIZE)) adder(.a(a), .b(b), .cin(1'b0), .s(sum), .c(cout_add));
    ALU_Subtractor                      #(.SIZE(SIZE)) subtractor(.a_in(a), .b_in(b), .cin(1'b0), .diff(diff), .c(cout_sub));
    ALU_SLT                             #(.SIZE(SIZE)) alu_slt(.a(a), .b(b), .out(slt));
    ALU_SGT                             #(.SIZE(SIZE)) alu_sgt(.a(a), .b(b), .out(sgt));
    ALU_AND                             #(.SIZE(SIZE)) alu_and(.a(a), .b(b), .out(andAB));
    ALU_OR                              #(.SIZE(SIZE)) alu_or(.a(a), .b(b), .out(orAB));
    ALU_XOR                             #(.SIZE(SIZE)) alu_xor(.a(a), .b(b), .out(xorAB));
    ALU_NEGATION                        #(.SIZE(SIZE)) alu_not(.in(a), .out(complementA));
    ALU_Barrel_Left                     #(.N(SIZE)) alu_shift_left(.A(a), .B(b), .Y(a_shift_left_b));
    ALU_Barrel_Right                    #(.N(SIZE)) alu_shift_right(.A(a), .B(b), .Y(a_shift_right_b));
    ALU_Barrel_Arithmetic_Right         #(.N(SIZE)) alu_shift_right_arith(.A(a), .B(b), .Y(a_shift_right_arith_b));
    ALU_Adder                           #(.SIZE(SIZE)) adder_plus_4(.a(a), .b({{(SIZE-3){1'b0}}, 3'b100}), .cin(1'b0), .s(a_plus_4), .c(cout_add4));
    ALU_Subtractor                      #(.SIZE(SIZE)) subtractor_minus_4(.a_in(a), .b_in({{(SIZE-3){1'b0}}, 3'b100}), .cin(1'b0), .diff(a_minus_4), .c(cout_sub4));
    ALU_HAM_32                          alu_ham(.a(a), .count(ham));
    ALU_LUI                             #(.SIZE(SIZE)) alu_lui(.in(a), .out(lui)); 
    ALU_NOR                             #(.SIZE(SIZE)) alu_nor(.a(a), .b(b), .out(norAB));
    
    wire [15:0] alu_bit [SIZE-1:0];
    
    genvar i, j, k;
    generate
            for(j=0; j<SIZE; j=j+1) begin
                assign alu_bit[j][0] = sum[j];
                assign alu_bit[j][1] = diff[j];
                assign alu_bit[j][2] = slt[j];
                assign alu_bit[j][3] = sgt[j];
                assign alu_bit[j][4] = andAB[j];
                assign alu_bit[j][5] = orAB[j];
                assign alu_bit[j][6] = xorAB[j];
                assign alu_bit[j][7] = complementA[j];
                assign alu_bit[j][8] = lui[j];
                assign alu_bit[j][9] = norAB[j];
                assign alu_bit[j][10] = a_shift_left_b[j];
                assign alu_bit[j][11] = a_shift_right_b[j];
                assign alu_bit[j][12] = a_shift_right_arith_b[j];
                assign alu_bit[j][13] = a_plus_4[j];
                assign alu_bit[j][14] = a_minus_4[j];
                assign alu_bit[j][15] = ham[j];
            end     
     
        for(k=0; k<SIZE; k=k+1)begin
            MUX_16to1 alu_first_bit(.in(alu_bit[k]), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[k]));
        end
    endgenerate
endmodule
