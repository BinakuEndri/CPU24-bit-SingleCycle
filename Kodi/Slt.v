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
  		output reg [23:0] out
    );
    
  always @* begin
       out = (~mA & mB) && (!(mA & ~mB));
   end
 endmodule
