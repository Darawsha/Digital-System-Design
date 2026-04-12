module PushButtonDebouncer(
    input wire clk,
    input wire pb,
    output reg pb_debounced = 1'b0
);
    reg pb_old = 1'b0;
    reg debounce_active = 1'b0;
    integer debounce_count = 0;
    integer debounce_max = 1_000_000;

    always @(posedge clk) begin
        if (debounce_active) begin
            debounce_count = debounce_count + 1;
            if (debounce_count == debounce_max) begin
                debounce_active = 1'b0;
            end
        end else if (pb != pb_old) begin
            debounce_active <= 1'b1;
            debounce_count <= 0;
            pb_old <= pb;
            pb_debounced <= ~pb_debounced;
        end
    end
endmodule
