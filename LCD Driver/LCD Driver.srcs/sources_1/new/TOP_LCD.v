`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/18/2026 05:08:11 PM
// Design Name:
// Module Name: TOP_LCD
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

module TOP_LCD(
    input CLK,
    input set,
    input [3:0] TimerDigit0,
    input [3:0] TimerDigit1,
    output RS,
    output RW,
    output E,
    output [7:0] DB
);

    wire tick_1s;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire Timer_Done;

    ClkDivider uut1(
        .clk_in(CLK),
        .clk_out(tick_1s)
    );

    CountdownTimer uut2(
        .clk(CLK),
        .set(set),
        .digit0_in(TimerDigit0),
        .digit1_in(TimerDigit1),
        .digit0(digit0),
        .digit1(digit1),
        .Timer_Done(Timer_Done)
    );

    LCDDriver_Part2 uut3(
        .CLK(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .Timer_Done(Timer_Done),
        .DB(DB),
        .E(E),
        .RS(RS),
        .RW(RW)
    );

endmodule
