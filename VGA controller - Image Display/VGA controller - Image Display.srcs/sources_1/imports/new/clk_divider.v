`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ameed Darawsha
//
// Create Date: 04/26/2026 03:14:49 PM
// Design Name:
// Module Name: clk_divider
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
    input clk_in,
    output reg clk_out
);

integer counter = 0;

always @(posedge clk_in) begin

if (counter == 1) begin
    counter <= 0;
    clk_out <= ~clk_out;
end
 else begin
    counter <= counter + 1;

end
end
endmodule
