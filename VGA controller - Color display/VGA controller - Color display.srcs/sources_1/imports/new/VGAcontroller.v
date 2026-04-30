`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ameed Darawsha
//
// Create Date: 04/26/2026 03:20:11 PM
// Design Name:
// Module Name: VGAcontroller
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

module VGAController(
    input Clk,
    input Reset,
    output reg HS,
    output reg VS,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE
);

wire CLK25;

ClkDivider Divider(
    .clk_in(Clk),
    .clk_out(CLK25)
);

reg [9:0] HCount = 0;
reg [9:0] VCount = 0;


always @(negedge Reset or posedge CLK25) begin
    if (Reset == 0) begin
        HCount <= 0;
        VCount <= 0;
        HS <= 0;
        VS <= 0;
    end
    else begin
        if (HCount == 799) begin
            HCount <= 0;

            if (VCount == 524)
                VCount <= 0;
            else
                VCount <= VCount + 1;
        end
        else begin
            HCount <= HCount + 1;
        end

        if (HCount < 96)
            HS <= 0;
        else
            HS <= 1;

        if (VCount < 2)
            VS <= 0;
        else
            VS <= 1;
    end
end


always @(negedge Reset or posedge CLK25) begin
    if (Reset == 0) begin
        RED   <= 4'b0000;
        GREEN <= 4'b0000;
        BLUE  <= 4'b0000;
    end
    else begin

        if (VCount >= 35 && VCount < 515 &&
            HCount >= 144 && HCount < 784) begin

            if (VCount >= 35 && VCount < 155) begin
                if (HCount < 304) begin
                    RED <= 4'b0000; GREEN <= 4'b1111; BLUE <= 4'b0000;
                end
                else if (HCount < 464) begin
                    RED <= 4'b1111; GREEN <= 4'b1111; BLUE <= 4'b0000;
                end
                else if (HCount < 624) begin
                    RED <= 4'b1111; GREEN <= 4'b1111; BLUE <= 4'b0000;
                end
                else begin
                    RED <= 4'b0000; GREEN <= 4'b0000; BLUE <= 4'b0000;
                end
            end

            else if (VCount >= 155 && VCount < 275) begin
                if (HCount < 304) begin
                    RED <= 4'b1111; GREEN <= 4'b0000; BLUE <= 4'b0000;
                end
                else if (HCount < 624) begin
                    RED <= 4'b1111; GREEN <= 4'b1111; BLUE <= 4'b1111;
                end
                else begin
                    RED <= 4'b1111; GREEN <= 4'b0000; BLUE <= 4'b0000;
                end
            end

            else if (VCount >= 275 && VCount < 395) begin
                if (HCount < 304) begin
                    RED <= 4'b0000; GREEN <= 4'b0000; BLUE <= 4'b1111;
                end
                else if (HCount < 624) begin
                    RED <= 4'b1111; GREEN <= 4'b1111; BLUE <= 4'b1111;
                end
                else begin
                    RED <= 4'b0000; GREEN <= 4'b0000; BLUE <= 4'b1111;
                end
            end

            else begin
                if (HCount < 304) begin
                    RED <= 4'b0000; GREEN <= 4'b1111; BLUE <= 4'b0000;
                end
                else if (HCount < 464) begin
                    RED <= 4'b1111; GREEN <= 4'b0000; BLUE <= 4'b1111;
                end
                else if (HCount < 624) begin
                    RED <= 4'b0000; GREEN <= 4'b1111; BLUE <= 4'b1111;
                end
                else begin
                    RED <= 4'b0000; GREEN <= 4'b0000; BLUE <= 4'b0000;
                end
            end
        end

        else begin
            RED   <= 4'b0000;
            GREEN <= 4'b0000;
            BLUE  <= 4'b0000;
        end
    end
end

endmodule
