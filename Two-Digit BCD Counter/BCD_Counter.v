module(
input  Reset,
input  clk,
input  upDown,
output Digit0,
output Digit1
);

reg [3:0] count0 = 0;
reg [3:0] count1 = 0;
@always(posedge clk)
begin
if(!Reset) begin
    count0 <= 0;
    count1 <= 0;
end
else if(upDown) begin
    if(count0 == 9) begin
        count0 <= 0;
        if(count1 == 9) begin
            count1 <= 0;
        end
        else begin
            count1 <= count1 + 1;
        end
    end
    else begin
        count0 <= count0 + 1;
    end
end
else begin
    if(count0 == 0) begin
        count0 <= 9;
        if(count1 == 0) begin
            count1 <= 9;
        end
        else begin
            count1 <= count1 - 1;
        end
    end
    else begin
        count0 <= count0 - 1;
    end
end
end
assign Digit0 = count0;
assign Digit1 = count1;
endmodule
