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
integer HCount = 0;
integer VCount = 0;

reg[18:0] addres = 0;

wire[11:0] RGB_value;

ClkDivider Divider(
    .clk_in(Clk),
    .clk_out(CLK25)
);

imageMemory uut (
  .clka(CLK25),
  .addra(addres),
  .douta(RGB_value)
);





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
        addres = 0;
    end
    else begin
        if(addres == 307200)
        addres = 0;

        if (VCount >= 35 && VCount < 515 &&
            HCount >= 144 && HCount < 784) begin
            BLUE = RGB_value[11:8];
            RED = RGB_value[3:0];
            GREEN = RGB_value[7:4];
            addres = addres + 1;
        end
        else begin
        RED   <= 4'b0000;
        GREEN <= 4'b0000;
        BLUE  <= 4'b0000;
        end
    end
  end
endmodule
