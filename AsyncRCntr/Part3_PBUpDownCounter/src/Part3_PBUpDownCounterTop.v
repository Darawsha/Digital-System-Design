module Part3_PBUpDownCounterTop(
    input wire clk,
    input wire reset_n,
    input wire up_down,
    input wire pb,
    output wire [3:0] count
);
    wire pb_tick;

    PushButtonDebouncer debouncer (
        .clk(clk),
        .pb(pb),
        .pb_debounced(pb_tick)
    );

    SyncUpDownCounter counter (
        .up_down(up_down),
        .clk(pb_tick),
        .reset_n(reset_n),
        .count(count)
    );
endmodule
