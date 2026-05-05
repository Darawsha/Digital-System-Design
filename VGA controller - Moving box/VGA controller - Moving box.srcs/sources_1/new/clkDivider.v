`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ameed Darawsha
//
// Create Date: 05/03/2026 02:06:58 PM
// Design Name:
// Module Name: clkDivider
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


module clkDivider (
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
