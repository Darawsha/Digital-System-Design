module SyncUpDownCounter(
    input wire up_down,
    input wire clk,
    input wire reset_n,
    output reg [3:0] count
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 4'd0;
        end else if (!up_down) begin
            if (count == 4'd9) begin
                count <= 4'd0;
            end else begin
                count <= count + 1'b1;
            end
        end else if (count == 4'd0) begin
            count <= 4'd9;
        end else begin
            count <= count - 1'b1;
        end
    end
endmodule
