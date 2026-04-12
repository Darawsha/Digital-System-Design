`timescale 1ns / 1ps

module TFlipFlop_tb;
    reg t;
    reg clk;
    reg clear_n;
    wire q;
    wire q_bar;

    TFlipFlop uut (
        .t(t),
        .clk(clk),
        .clear_n(clear_n),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        t = 1'b0;
        clear_n = 1'b0;

        #10 clear_n = 1'b1;
        #20 t = 1'b1;
        #40 t = 1'b0;
        #20 clear_n = 1'b0;
        #10 clear_n = 1'b1;
        #30 $finish;
    end
endmodule
