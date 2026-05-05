`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Ameed Darawsha
//
// Create Date: 05/03/2026 02:07:52 PM
// Design Name:
// Module Name: VGA
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


module VGAController_Part3(
    input Clk,
    input Reset,

    input UpBtn,
    input DownBtn,
    input LeftBtn,
    input RightBtn,

    output reg HS,
    output reg VS,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE
);

wire Up, Down, Left, Right;
DeBouncer DB_UP (
    .clk(Clk),
    .pb(UpBtn),
    .pb_debounced(Up)
);

DeBouncer DB_DOWN (
    .clk(Clk),
    .pb(DownBtn),
    .pb_debounced(Down)
);

DeBouncer DB_LEFT (
    .clk(Clk),
    .pb(LeftBtn),
    .pb_debounced(Left)
);

DeBouncer DB_RIGHT (
    .clk(Clk),
    .pb(RightBtn),
    .pb_debounced(Right)
);



wire CLK25;

clkDivider CLkDiv(
    .clk_in(Clk),
    .clk_out(CLK25)
);

reg [9:0] HCount = 0;
reg [9:0] VCount = 0;

parameter H_VISIBLE_START = 144;
parameter H_VISIBLE_END   = 784;
parameter V_VISIBLE_START = 35;
parameter V_VISIBLE_END   = 515;

parameter SCREEN_WIDTH  = 640;
parameter SCREEN_HEIGHT = 480;

parameter SQUARE_SIZE = 50;
parameter STEP_SIZE   = 10;


reg [9:0] SquareX = 295;
reg [9:0] SquareY = 215;


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
        SquareX <= 295;
        SquareY <= 215;
    end
    else begin

        if (HCount == 799 && VCount == 524) begin

            if (Up == 1) begin
                if (SquareY >= STEP_SIZE)
                    SquareY <= SquareY - STEP_SIZE;
                else
                    SquareY <= 0;
            end

            else if (Down == 1) begin
                if (SquareY <= SCREEN_HEIGHT - SQUARE_SIZE - STEP_SIZE)
                    SquareY <= SquareY + STEP_SIZE;
                else
                    SquareY <= SCREEN_HEIGHT - SQUARE_SIZE;
            end

            else if (Left == 1) begin
                if (SquareX >= STEP_SIZE)
                    SquareX <= SquareX - STEP_SIZE;
                else
                    SquareX <= 0;
            end

            else if (Right == 1) begin
                if (SquareX <= SCREEN_WIDTH - SQUARE_SIZE - STEP_SIZE)
                    SquareX <= SquareX + STEP_SIZE;
                else
                    SquareX <= SCREEN_WIDTH - SQUARE_SIZE;
            end
        end
    end
end


always @(negedge Reset or posedge CLK25) begin
    if (Reset == 0) begin
        RED   <= 4'b0000;
        GREEN <= 4'b0000;
        BLUE  <= 4'b0000;
    end
    else begin

        if (HCount >= H_VISIBLE_START && HCount < H_VISIBLE_END &&
            VCount >= V_VISIBLE_START && VCount < V_VISIBLE_END) begin

            RED   <= 4'b1111;
            GREEN <= 4'b1111;
            BLUE  <= 4'b1111;

            if (HCount >= H_VISIBLE_START + SquareX &&
                HCount <  H_VISIBLE_START + SquareX + SQUARE_SIZE &&
                VCount >= V_VISIBLE_START + SquareY &&
                VCount <  V_VISIBLE_START + SquareY + SQUARE_SIZE) begin

                RED   <= 4'b0000;
                GREEN <= 4'b0000;
                BLUE  <= 4'b0000;
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
