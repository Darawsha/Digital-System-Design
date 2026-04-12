# Part 4: Two-Digit BCD Counter

- Required modules: `ClockDivider`, `BCDCounter2Digit`, `TimeMux2Digit`, `BcdToSevenSeg`, `Part4_TwoDigitBCDCounterTop`
- Top module: `Part4_TwoDigitBCDCounterTop`
- Main inputs/outputs: `clk`, `reset_n`, `up_down`, `seg[6:0]`, `digit_select`
- Description: counts from 00 to 99 in BCD, multiplexes the two digits, and drives a seven-segment display.
