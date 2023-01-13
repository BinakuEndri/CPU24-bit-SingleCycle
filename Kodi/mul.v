`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 22:19:26
// Design Name: 
// Module Name: mul
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

module mul(
  input [23:0] a,
  input [23:0] b,
  output [47:0] prod
    );
  reg [47:0] prod;
  reg [23:0] b_reg;
  reg [23:0] count;
always @*
begin
b_reg = b;
prod = 0;
count = 24'd24;
if ((a!=0) && (b!=0))
while (count)
begin

 prod = {(({24{b_reg[0]}} & a) + prod[47:24]),prod[23:1]};

b_reg = b_reg >> 1;
count = count - 1;
end
end    
    
endmodule