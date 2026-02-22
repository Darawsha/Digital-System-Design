`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/15/2026 03:45:44 PM
// Design Name:
// Module Name: TopPart2
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


module Async4BitCntr_Behav(
    input up_down,
    input clk,
    input reset,
    output [3:0] out
    );

    wire w1;

    ClkDivider div (clk , w1);
    bit_part2(.up_down(up_down), .clk(w1), .reset(reset), .out(out));

endmodule
