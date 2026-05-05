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
module lcd(
    input CLK,
    output reg [7:0] DB,
    output reg E,
    output reg RS,
    output reg RW
);

reg [31:0] counter = 0;
reg [4:0] shift_count = 0;

always @(posedge CLK) begin

    if(counter == 0) begin
        RS <= 0;
        RW <= 0;
        E  <= 0;
        DB <= 8'h00;
        counter <= counter + 1;
    end

    else if(counter == 2000000) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h38;
        counter <= counter + 1;
    end
    else if(counter == 2000100) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 2004100) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h06;
        counter <= counter + 1;
    end
    else if(counter == 2004200) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 2008200) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h0C;
        counter <= counter + 1;
    end
    else if(counter == 2008300) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 2012300) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h01;
        counter <= counter + 1;
    end
    else if(counter == 2012400) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 2176400) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h80;
        counter <= counter + 1;
    end
    else if(counter == 2176500) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 2180500) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2180600) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2184600) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2184700) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2188700) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2188800) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2192800) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2192900) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2196900) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2197000) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2201000) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2201100) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2205100) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2205200) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2209200) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2209300) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2213300) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2213400) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2217400) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h20; counter <= counter + 1; end
    else if(counter == 2217500) begin E <= 0; counter <= counter + 1; end


    else if(counter == 2221500) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h61; counter <= counter + 1; end
    else if(counter == 2221600) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2225600) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h6d; counter <= counter + 1; end
    else if(counter == 2225700) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2229700) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h65; counter <= counter + 1; end
    else if(counter == 2229800) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2233800) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h65; counter <= counter + 1; end
    else if(counter == 2233900) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2237900) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h64; counter <= counter + 1; end
    else if(counter == 2238000) begin E <= 0; counter <= counter + 1; end

    else if(counter == 2242000) begin RS <= 1; RW <= 0; E <= 1; DB <= 8'h65; counter <= counter + 1; end
    else if(counter == 2242100) begin E <= 0; counter <= counter + 1; end

    else if(counter == 32000000) begin
        RS <= 0;
        RW <= 0;
        E  <= 1;
        DB <= 8'h18;
        counter <= counter + 1;
    end
    else if(counter == 32000100) begin
        E <= 0;
        counter <= counter + 1;
    end

    else if(counter == 32004100) begin
        if(shift_count < 15) begin
            shift_count <= shift_count + 1;
            counter <= 2242100;
        end
        else begin
            shift_count <= 0;
            counter <= 2012300;
        end
    end

    else begin
        counter <= counter + 1;
    end

end
endmodule
