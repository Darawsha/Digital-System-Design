module TimeMux2Digit (
    input wire clk,
    input wire [3:0] digit0,
    input wire [3:0] digit1,
    output reg [3:0] bcd_out,
    output reg digit_select = 1'b0
);
    reg [19:0] counter = 20'd0;

    always @(posedge clk) begin
        if (counter == 20'd999_999) begin
            counter <= 20'd0;
            digit_select <= ~digit_select;
        end else begin
            counter <= counter + 1'b1;
        end

        if (digit_select == 1'b0) begin
            bcd_out <= digit0;
        end else begin
            bcd_out <= digit1;
        end
    end
endmodule
