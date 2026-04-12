module ClockDivider (
    input wire clk_in,
    output reg clk_out = 1'b0
);
    reg [26:0] counter = 27'd0;

    always @(posedge clk_in) begin
        if (counter == 27'd49_999_999) begin
            counter <= 27'd0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1'b1;
        end
    end
endmodule
