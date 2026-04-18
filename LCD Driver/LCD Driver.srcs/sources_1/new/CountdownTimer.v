`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/18/2026 05:01:12 PM
// Design Name:
// Module Name: CountdownTimer
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


module CountdownTimer (
    input clk,
    input set,
    input [3:0] digit0_in,
    input [3:0] digit1_in,
    output [3:0] digit0,
    output [3:0] digit1,
    output Timer_Done
);

    reg [3:0] d0 = 0;
    reg [3:0] d1 = 0;

    always @(posedge clk) begin
        if (set == 1'b1) begin
            d0 <= digit0_in;
            d1 <= digit1_in;
        end
        else begin
            if (d0 == 0 && d1 == 0) begin
            end
            else begin
                if (d0 == 0) begin
                    d0 <= 9;
                    d1 <= d1 - 1;
                end
                else begin
                    d0 <= d0 - 1;
                end
            end
        end
    end

    assign Timer_Done = (d0 == 0 && d1 == 0) ? 1'b1 : 1'b0;

    assign digit0 = d0;
    assign digit1 = d1;

endmodule
