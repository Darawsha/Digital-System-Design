// this code is for a 4-bit asynchronous counter (ripple counter) can synthesize in FPGA zedboard with Y9 100MHz CLK.
module FourBitCounter (
    input wire CLK,
    input wire reset,
    input wire Enable ,
    output reg [3:0] Cntr

);
 wire clk_div_out;
ClkDivider clk_div (
    .clk_in(CLK),
    .clk_out(clk_div_out)
);

Async4BitCntr async_counter (
    .En(Enable),
    .CLK(clk_div_out),
    .Reset(reset),
    .Q(Cntr)
);

endmodule
