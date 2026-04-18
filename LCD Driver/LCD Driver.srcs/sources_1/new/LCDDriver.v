`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/18/2026 05:06:11 PM
// Design Name:
// Module Name: LCDDriver
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

module LCDDriver_Part2(
    input CLK,
    input [3:0] digit0,
    input [3:0] digit1,
    input Timer_Done,
    output reg [7:0] DB,
    output reg E,
    output reg RS,
    output reg RW
);

    integer counter = 0;

    always @(posedge CLK) begin
        if (counter == 0) begin
            RS <= 0;
            RW <= 0;
            E  <= 0;
            DB <= 8'b00000000;
        end

        counter <= counter + 1;

        // 20 ms startup
        if (counter == 2000000) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00111000;   // Function Set
        end
        else if (counter == 2000100) begin
            E <= 0;
        end

        else if (counter == 2004100) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00000110;   // Entry Mode Set
        end
        else if (counter == 2004200) begin
            E <= 0;
        end

        else if (counter == 2008200) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00001100;   // Display ON
        end
        else if (counter == 2008300) begin
            E <= 0;
        end

        else if (counter == 2012300) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00000001;   // Clear Display
        end
        else if (counter == 2012400) begin
            E <= 0;
        end


        else if (counter == 2176400) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b10000111;
        end
        else if (counter == 2176500) begin
            E <= 0;
        end

        // digit1 (tens)
        else if (counter == 2180500) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b00110000 + digit1;
        end
        else if (counter == 2180600) begin
            E <= 0;
        end

        // digit0 (ones)
        else if (counter == 2184600) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b00110000 + digit0;
        end
        else if (counter == 2184700) begin
            E <= 0;
        end

        // second line start
        else if (counter == 2188700) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b11000000;
        end
        else if (counter == 2188800) begin
            E <= 0;
        end

        // D or space
        else if (counter == 2192800) begin
            RS <= 1; RW <= 0; E <= 1;
            if (Timer_Done)
                DB <= 8'b01000100;   // D
            else
                DB <= 8'b00100000;   // space
        end
        else if (counter == 2192900) begin
            E <= 0;
        end

        // O or space
        else if (counter == 2196900) begin
            RS <= 1; RW <= 0; E <= 1;
            if (Timer_Done)
                DB <= 8'b01001111;   // O
            else
                DB <= 8'b00100000;
        end
        else if (counter == 2197000) begin
            E <= 0;
        end

        // N or space
        else if (counter == 2201000) begin
            RS <= 1; RW <= 0; E <= 1;
            if (Timer_Done)
                DB <= 8'b01001110;   // N
            else
                DB <= 8'b00100000;
        end
        else if (counter == 2201100) begin
            E <= 0;
        end

        // E or space
        else if (counter == 2205100) begin
            RS <= 1; RW <= 0; E <= 1;
            if (Timer_Done)
                DB <= 8'b01000101;   // E
            else
                DB <= 8'b00100000;
        end
        else if (counter == 2205200) begin
            E <= 0;
        end

        // refresh loop
        else if (counter == 2209200) begin
            RS <= 0;
            RW <= 0;
            E  <= 0;
            counter <= 2176300;
        end
    end

endmodule
