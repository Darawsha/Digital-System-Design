`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ameed Darawsha
//
// Create Date: 05/03/2026 02:09:15 PM
// Design Name:
// Module Name: DeBouncer
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

module DeBouncer(
    input  clk,
    input  pb,
    output reg pb_debounced = 1'b0
);
    reg pb_old = 1'b0;
    reg debounce_active = 1'b0;
    integer debounce_count = 0;
    integer debounce_max = 1_000_000;

    always @(posedge clk) begin
        if (debounce_active) begin
            debounce_count = debounce_count + 1;
            if (debounce_count == debounce_max) begin
                debounce_active = 1'b0;
            end
        end else if (pb != pb_old) begin
            debounce_active <= 1'b1;
            debounce_count <= 0;
            pb_old <= pb;
            pb_debounced <= ~pb_debounced;
        end
    end
endmodule
