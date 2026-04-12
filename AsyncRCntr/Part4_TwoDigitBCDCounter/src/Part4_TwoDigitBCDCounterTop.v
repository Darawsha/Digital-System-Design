module Part4_TwoDigitBCDCounterTop (
    input wire clk,
    input wire reset_n,
    input wire up_down,
    output wire [6:0] seg,
    output wire digit_select
);
    wire slow_clk;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [3:0] mux_out;

    ClockDivider divider (
        .clk_in(clk),
        .clk_out(slow_clk)
    );

    BCDCounter2Digit counter (
        .clk(slow_clk),
        .reset_n(reset_n),
        .up_down(up_down),
        .digit0(digit0),
        .digit1(digit1)
    );

    TimeMux2Digit mux (
        .clk(clk),
        .digit0(digit0),
        .digit1(digit1),
        .bcd_out(mux_out),
        .digit_select(digit_select)
    );

    BcdToSevenSeg decoder (
        .bcd(mux_out),
        .seg(seg)
    );
endmodule
