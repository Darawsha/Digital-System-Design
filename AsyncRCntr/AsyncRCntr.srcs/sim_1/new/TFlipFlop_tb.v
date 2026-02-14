`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/14/2026 09:29:29 PM
// Design Name:
// Module Name: TFlipFlop_tb
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


module TFlipFlop_tb;

    reg T;
    reg CLK;
    reg Clear;
    wire Q;
    wire QBAR;

    TFlipFlop uut (
        .T(T),
        .CLK(CLK),
        .Clear(Clear),
        .Q(Q),
        .QBAR(QBAR)
    );

    // Clock generation
    always #5 CLK = ~CLK;

    initial begin
        CLK = 0;
        T = 0;
        Clear = 0;

        #10 Clear = 1;

        #20 T = 0;
        #20 T = 1;
        #40 T = 0;

        #20 Clear = 0;
        #10 Clear = 1;

        #30 $finish;
    end

endmodule
