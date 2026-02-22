
`timescale 1ps/1ps
module PBUpDownCounter(
 input CLK,
 input Reset,
 input UpDown,
 input PB,
 output [3:0] cnt
);
    wire w1;
    PBDebouncer debouncer (
     .CLK(CLK),
     .PB(PB),
     .PB_debounced(w1)
    );
   Async4BitCntr_Behav uut(
    .up_down(UpDown),
    .clk(w1),
    .reset(Reset),
    .out(cnt)
    );
endmodule
