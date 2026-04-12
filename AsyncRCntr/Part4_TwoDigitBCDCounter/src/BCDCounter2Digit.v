module BCDCounter2Digit (
    input wire clk,
    input wire reset_n,
    input wire up_down,
    output reg [3:0] digit0,
    output reg [3:0] digit1
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            digit0 <= 4'd0;
            digit1 <= 4'd0;
        end else if (up_down) begin
            if (digit0 == 4'd9) begin
                digit0 <= 4'd0;
                if (digit1 == 4'd9) begin
                    digit1 <= 4'd0;
                end else begin
                    digit1 <= digit1 + 1'b1;
                end
            end else begin
                digit0 <= digit0 + 1'b1;
            end
        end else if (digit0 == 4'd0) begin
            digit0 <= 4'd9;
            if (digit1 == 4'd0) begin
                digit1 <= 4'd9;
            end else begin
                digit1 <= digit1 - 1'b1;
            end
        end else begin
            digit0 <= digit0 - 1'b1;
        end
    end
endmodule
