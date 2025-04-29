`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 10:35:56 PM
// Design Name: 
// Module Name: reg_out_fsm
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


module fsm (clk, reset, write_data, display_data, read1a, read2a, writea);
    input clk, reset;
    output reg read1a, read2a, writea;
    input[31:0] write_data;
    output reg [15:0] display_data;
    
    reg [1:0] state, next_state;
    
    parameter STATE_LOW_16 = 2'b00;
    parameter STATE_HIGH_16 = 2'b01;
    parameter STATE_BLANK = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) 
            state <= STATE_BLANK;
        else 
            state <= next_state;
    end
    
    initial begin
        $monitor("disp = %b", display_data);
    end
    
    always @(state) begin
        case (state)
            STATE_LOW_16: begin
                display_data <= write_data[15:0];
                next_state <= STATE_BLANK;
                read1a <= 0;
                read2a <= 0;
                writea <= 0;
            end
            STATE_HIGH_16: begin
                display_data <= write_data[31:16];
                next_state <= STATE_LOW_16;
                read1a <= 0;
                read2a <= 0;
                writea <= 0;
            end
            STATE_BLANK: begin
                display_data <= 16'b0;
                next_state <= STATE_HIGH_16;
                read1a <= 1;
                read2a <= 1;
                writea <= 1;
            end
            default: begin
                display_data <= 16'b0;
                next_state <= STATE_BLANK;
                read1a <= 0;
                read2a <= 0;
                writea <= 0;
            end
        endcase
    end
    
endmodule
