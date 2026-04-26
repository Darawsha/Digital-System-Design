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

module LCDDriver_Part3(
    input CLK,
    output reg [7:0] DB,
    output reg E,
    output reg RS,
    output reg RW
);

    reg [7:0] charW = 8'b01010111;
    reg [7:0] charE = 8'b01000101;
    reg [7:0] location  = 8'b00001110;
    reg [7:0] location2 = 8'b10001110; // as loop from 00 to 0f in first line and when it reaches 0f, it goes to 00 and loops from 00 to 0f
    // display "WE" on the lcd and loop it from 00 to 0f in the first line and when it reaches 0f, it goes to 00 and loops from 00 to 0f


    integer counter = 0;

    always @(posedge CLK) begin
        if (counter == 0) begin
            RS <= 0;
            RW <= 0;
            E  <= 0;
            DB <= 8'b00000000;
            location  <= 8'b00001110;
            location2 <= 8'b10001110;
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
            RS <= 0; RW <= 0; E <= 1; DB <= location2;
        end
        else if (counter == 2176500) begin
            E <= 0;
        end

        // write W
        else if (counter == 2180500) begin
            RS <= 1; RW <= 0; E <= 1; DB <= charW;
        end
        else if (counter == 2180600) begin
            E <= 0;
        end

        // write E
        else if (counter == 2184600) begin
            RS <= 1; RW <= 0; E <= 1; DB <= charE;
        end
        else if (counter == 2184700) begin
            E <= 0;
        end
                            ///. start of display loop

        // refresh loop
        else if (counter == 2209200) begin
            RS <= 0;
            RW <= 0;
            E  <= 0;
            if (location == 8'b00000000) begin
                location  <= 8'b00001110;
                location2 <= 8'b10001110;
            end
            else begin
                location  <= location - 1'b1;
                location2 <= location2 - 1'b1;
            end
            counter <= 2012299;
        end
    end

endmodule
