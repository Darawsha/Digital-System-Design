module AsyncRippleCounter4Bit(
    input wire enable,
    input wire clk,
    input wire reset_n,
    output wire [3:0] count
);
    wire [3:0] q_bar;

    TFlipFlop stage0 (
        .t(enable),
        .clk(clk),
        .clear_n(reset_n),
        .q(count[0]),
        .q_bar(q_bar[0])
    );

    TFlipFlop stage1 (
        .t(enable),
        .clk(q_bar[0]),
        .clear_n(reset_n),
        .q(count[1]),
        .q_bar(q_bar[1])
    );

    TFlipFlop stage2 (
        .t(enable),
        .clk(q_bar[1]),
        .clear_n(reset_n),
        .q(count[2]),
        .q_bar(q_bar[2])
    );

    TFlipFlop stage3 (
        .t(enable),
        .clk(q_bar[2]),
        .clear_n(reset_n),
        .q(count[3]),
        .q_bar(q_bar[3])
    );
endmodule
