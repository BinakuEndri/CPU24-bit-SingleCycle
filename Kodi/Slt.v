`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2023 23:48:16
// Design Name: 
// Module Name: SLT
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


module SLT(
        input [23:0] mA,
        input [23:0] mB,
  		output [23:0] out
    );
    wire cout;
    wire [23:0] out1, out2, rez;
RippleCarryAdder m0(mA, ~mB, 1'b1, rez, cout );
 assign out = {23'b0, rez[23]};
 endmodule
