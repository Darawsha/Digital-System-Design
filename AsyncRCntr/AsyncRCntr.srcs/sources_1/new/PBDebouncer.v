`timescale 1ns / 1ps

// i wanna use  " Center Button BTNC P16 LVCMOS18 "  in synthesis.

module PBDebouncer(
 input CLK,
 input PB,
 output PB_debounced
 );

 reg [1:1]PBOld = 0; // old value of Push Button
 integer TCount = 0;
 reg [1:1] TOn = 0; // 1-bit register to indicate if Push Button is stable or debounced
 integer TMax = 1_000_000; //1ms at 1MHz clock frequency

always @(posedge CLK) begin
    if (TOn)begin // maybe im in Debounced area
    TCount = TCount +1;
        if ( TCount == TMax)begin
            TOn = 0;
            // PB_debounced <= ~PB_debounced; // **(Case2)
        end
    end
    else  begin // maybe im in 0 or in 1 .
        if (PB != PBOld) begin
            TOn <= 1;
            TCount <= 0;
            PBOld <= PB;
            PB_debounced <= ~PB_debounced; // **(Case1)

        end
    end
end
 endmodule

 // case 1 if i do it pb_debounced will be toggle from inital debounce area
 // case 2 if i do it in the end of debouncing area it will be toggle after 1ms of stable state of pb

 // so the case 1 has shift of 1ms in output PBD nither case 2
 // case 1 has more responsiveness but case 2 has more stability in output PBD
