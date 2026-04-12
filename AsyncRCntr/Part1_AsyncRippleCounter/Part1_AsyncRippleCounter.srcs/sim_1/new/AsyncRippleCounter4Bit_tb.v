`timescale 1ns / 1ps

module AsyncRippleCounter4Bit_tb;
    reg enable;
    reg clk;
    reg reset_n;
    wire [3:0] count;

    AsyncRippleCounter4Bit uut (
        .enable(enable),
        .clk(clk),
        .reset_n(reset_n),
        .count(count)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        enable = 1'b0;
        reset_n = 1'b0;

        #10 reset_n = 1'b1;
        enable = 1'b1;
        #150 enable = 1'b0;
        #20 enable = 1'b1;
        #50 $finish;
    end
endmodule
