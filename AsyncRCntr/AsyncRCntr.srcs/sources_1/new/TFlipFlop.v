`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2026 09:23:46 PM
// Design Name: 
// Module Name: TFlipFlop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TFlipFlop(
    input wire  T,
    input wire  CLK,
    input wire  Clear,
    output reg  Q,
    output wire QBAR
    );
    
    always @ (posedge CLK or negedge Clear ) begin
    
    if (!Clear)
     Q <= 1'b0; 
    else if (T)
     Q <= ~Q;
    end   
    assign QBAR = ~Q;
endmodule
