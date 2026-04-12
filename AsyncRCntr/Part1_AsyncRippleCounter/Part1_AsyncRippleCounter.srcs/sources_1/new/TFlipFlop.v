module TFlipFlop(
    input wire t,
    input wire clk,
    input wire clear_n,
    output reg q,
    output wire q_bar
);
    always @(posedge clk or negedge clear_n) begin
        if (!clear_n) begin
            q <= 1'b0;
        end else if (t) begin
            q <= ~q;
        end
    end

    assign q_bar = ~q;
endmodule
