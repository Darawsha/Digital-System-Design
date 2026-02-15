module Async4BitCntr(
    input wire En,
    input wire CLK,
    input wire Reset,
    output wire [3:0] Q
);

wire [3:0] QBAR;

TFlipFlop uut0 (
    .T(En),
    .CLK(CLK),
    .Clear(Reset),
    .Q(Q[0]),
    .QBAR(QBAR[0])
);

TFlipFlop uut1 (
    .T(En),
    .CLK(QBAR[0]),   // ← QBAR used as clock
    .Clear(Reset),
    .Q(Q[1]),
    .QBAR(QBAR[1])
);

TFlipFlop uut2 (
    .T(En),
    .CLK(QBAR[1]),
    .Clear(Reset),
    .Q(Q[2]),
    .QBAR(QBAR[2])
);

TFlipFlop uut3 (
    .T(En),
    .CLK(QBAR[2]),
    .Clear(Reset),
    .Q(Q[3]),
    .QBAR(QBAR[3])
);

endmodule
