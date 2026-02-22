`timescale 1ns/1ps


module Async4BitCntr_tb;

    reg En;
    reg CLK;
    reg Reset;
    wire [3:0] Q;


    Async4BitCntr uut (
        .En(En),
        .CLK(CLK),
        .Reset(Reset),
        .Q(Q)
    );


    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        En = 0;
        Reset = 0;

        #10;
        Reset =1;
        En = 1;

        #150;

        En = 0;
        #20;

        En = 1;
        #50;

        $finish;
    end


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, Async4BitCntr_tb);
    end

endmodule
