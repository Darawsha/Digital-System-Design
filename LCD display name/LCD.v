`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2026 01:38:35 PM
// Design Name: 
// Module Name: LCD
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

module LCD(
    input CLK,
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

        // Function Set
        if (counter == 2000000) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00111000;
        end
        else if (counter == 2000100) begin
            E <= 0;
        end

        // Entry Mode Set
        else if (counter == 2004100) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00000110;
        end
        else if (counter == 2004200) begin
            E <= 0;
        end

        // Display ON/OFF
        else if (counter == 2008200) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00001100;
        end
        else if (counter == 2008300) begin
            E <= 0;
        end

        // Clear Display
        else if (counter == 2012300) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b00000001;
        end
        else if (counter == 2012400) begin
            E <= 0;
        end

        // First line, first position
        else if (counter == 2176400) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b10000000;
        end
        else if (counter == 2176500) begin
            E <= 0;
        end

        // AMEED

        // A
        else if (counter == 2180500) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000001;
        end
        else if (counter == 2180600) begin
            E <= 0;
        end

        // M
        else if (counter == 2184600) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01001101;
        end
        else if (counter == 2184700) begin
            E <= 0;
        end

        // E
        else if (counter == 2188700) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000101;
        end
        else if (counter == 2188800) begin
            E <= 0;
        end

        // E
        else if (counter == 2192800) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000101;
        end
        else if (counter == 2192900) begin
            E <= 0;
        end

        // D
        else if (counter == 2196900) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000100;
        end
        else if (counter == 2197000) begin
            E <= 0;
        end

        // second line
        else if (counter == 2201000) begin
            RS <= 0; RW <= 0; E <= 1; DB <= 8'b11000000;
        end
        else if (counter == 2201100) begin
            E <= 0;
        end

        // ABDELKAREEM

        // A
        else if (counter == 2205100) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000001;
        end
        else if (counter == 2205200) begin
            E <= 0;
        end

        // B
        else if (counter == 2209200) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000010;
        end
        else if (counter == 2209300) begin
            E <= 0;
        end

        // D
        else if (counter == 2213300) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000100;
        end
        else if (counter == 2213400) begin
            E <= 0;
        end

        // E
        else if (counter == 2217400) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000101;
        end
        else if (counter == 2217500) begin
            E <= 0;
        end

        // L
        else if (counter == 2221500) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01001100;
        end
        else if (counter == 2221600) begin
            E <= 0;
        end

        // K
        else if (counter == 2225600) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01001011;
        end
        else if (counter == 2225700) begin
            E <= 0;
        end

        // A
        else if (counter == 2229700) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000001;
        end
        else if (counter == 2229800) begin
            E <= 0;
        end

        // R
        else if (counter == 2233800) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01010010;
        end
        else if (counter == 2233900) begin
            E <= 0;
        end

        // E
        else if (counter == 2237900) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000101;
        end
        else if (counter == 2238000) begin
            E <= 0;
        end

        // E
        else if (counter == 2242000) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01000101;
        end
        else if (counter == 2242100) begin
            E <= 0;
        end

        // M
        else if (counter == 2246100) begin
            RS <= 1; RW <= 0; E <= 1; DB <= 8'b01001101;
        end
        else if (counter == 2246200) begin
            E <= 0;
        end
    end

endmodule