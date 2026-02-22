`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/15/2026 03:11:25 PM
// Design Name:
// Module Name: bit_part2
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


module bit_part2(
    input up_down,
    input clk,
    input reset,
    output reg [3:0] out
    );

    always@(posedge clk, negedge reset)
    begin
    if(!reset)
        begin
        out = 0;

        end
    else
        begin
        if(!up_down)
            begin
                if(out == 9)
                out = 0;
                else
                out = out + 1;
            end
        else
            begin
            if(out == 0)
                out = 9;
            else
                out = out - 1;
            end

        end
    end
endmodule
