module (
input Reset ,
input upDown ,
input CLK ,
output reg [6:0] sevenSegCode,
output reg [1:0] select
);


wire [3:0] Digit0;
wire [3:0] Digit1;
wire [3:0] BCD_VALUE;
wire CLKDiv ;
@always()begin

    ClkDivider clkDivider(.clk_in(CLK), .clk_out(CLKDiv));

    BCD_Counter bcdCounter(.Reset(Reset), .clk(CLKDiv), .upDown(upDown), .Digit0(Digit0), .Digit1(Digit1));

    Time_MUX timeMux(.CLK(CLK), .Digit0(Digit0), .Digit1(Digit1), .BCD_VALUE(BCD_VALUE), .select(select));

    BCD_To_7Seg bcdTo7Seg(.BCD(BCD_VALUE), .number(sevenSegCode));

end

endmodule
