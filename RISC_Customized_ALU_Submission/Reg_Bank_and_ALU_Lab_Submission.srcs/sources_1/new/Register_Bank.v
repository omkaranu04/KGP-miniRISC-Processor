`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:35:09 PM
// Design Name: 
// Module Name: Register_Bank
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


`timescale 1ns / 1ps

module RegisterBank (clk, rst, reg_read, reg_write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg);
    input clk, rst;
    input reg_read, reg_write;
    input [4:0] read_reg1, read_reg2, write_reg;
    input [31:0] write_data;
    output reg [31:0] read_data1;
    output reg [31:0] read_data2;

    reg [31:0] reg_file [31:0];

    always @(negedge clk) begin
        if(reg_read) begin
            read_data1 <= reg_file[read_reg1];
            read_data2 <= reg_file[read_reg2];
        end
    end

    initial begin
        $monitor($time, "reg[1]: %b, reg[2]: %b", reg_file[1], reg_file[2]);
//        $monitor($time, "write_data: %b, write_reg: %b", write_data, write_reg);
    end

    integer i, j;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i=0; i<32; i=i+1) begin
                reg_file[i] = 32'd0;
            end
        end
        else if(reg_write) begin
            reg_file[write_reg] = write_data;
        end
        else begin
            for(j=0; j<32; j=j+1) begin
                reg_file[j] = reg_file[j];
            end
        end
    end
endmodule