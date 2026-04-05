module
(
    input [3:0] BCD,
    output reg [6:0] number

);
@always @() begin
    case (BCD)
        4'b0000: number = 7'b1111110; // 0
        4'b0001: number = 7'b0110000; // 1
        4'b0010: number = 7'b1101101; // 2
        4'b0011: number = 7'b1111001; // 3
        4'b0100: number = 7'b0110011; // 4
        4'b0101: number = 7'b1011011; // 5
        4'b0110: number = 7'b1011111; // 6
        4'b0111: number = 7'b1110000; // 7
        4'b1000: number = 7'b1111111; // 8
        4'b1001: number = 7'b1111011; // 9
        default: number = 7'b0000000; // if non
    endcase
end


endmodule
