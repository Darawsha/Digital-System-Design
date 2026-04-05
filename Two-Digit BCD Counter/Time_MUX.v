module (
input CLK ,
input [3:0] Digit0,
input [3:0] Digit1,
output reg [3:0] BCD_VALUE,
output reg [1:0] select
);
integer counter = 0;
always @(posedge CLK) begin
    if (counter == /*999_999*/)
        counter <= 0;
    else
        counter <= counter + 1;

    if (counter < /*500_000*/) begin
         BCD_VALUE <= Digit0;
        select <= 0;
    end
    else begin
        BCD_VALUE <= Digit1;
        select <= 1;
    end
end
endmodule
