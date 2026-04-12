module Part1_AsyncRippleCounterTop(
    input wire clk,
    input wire reset_n,
    output wire [3:0] count
);
    wire slow_clk;

    ClockDivider divider (
        .clk_in(clk),
        .clk_out(slow_clk)
    );

    AsyncRippleCounter4Bit counter (
        .enable(1'b1),
        .clk(slow_clk),
        .reset_n(reset_n),
        .count(count)
    );
endmodule
