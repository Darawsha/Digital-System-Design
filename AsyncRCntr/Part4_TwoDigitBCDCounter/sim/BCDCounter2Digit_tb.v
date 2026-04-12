`timescale 1ns / 1ps

module BCDCounter2Digit_tb;
    reg clk;
    reg reset_n;
    reg up_down;
    wire [3:0] digit0;
    wire [3:0] digit1;

    BCDCounter2Digit uut (
        .clk(clk),
        .reset_n(reset_n),
        .up_down(up_down),
        .digit0(digit0),
        .digit1(digit1)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        up_down = 1'b1;
        #10 reset_n = 1'b1;
        #200 up_down = 1'b0;
        #200 $finish;
    end
endmodule
