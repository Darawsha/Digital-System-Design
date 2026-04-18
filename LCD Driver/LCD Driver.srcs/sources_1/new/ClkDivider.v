`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/18/2026 05:05:11 PM
// Design Name:
// Module Name: ClkDivider
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


module ClkDivider (
    input wire clk_in,
    output reg clk_out
);

reg [26:0] counter = 0;

always @(posedge clk_in) begin

if (counter == 49_999_999) begin
    counter <= 0;
    clk_out <= ~clk_out;
end
 else begin
    counter <= counter + 1;

end
end
endmodule

