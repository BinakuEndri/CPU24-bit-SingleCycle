`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 15:08:38
// Design Name: 
// Module Name: Sll
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
module Sll (
    input [23:0] A, 
    input [23:0] B, 
    input [23:0] shift_amount, 
    output reg [23:0] result
    );

    wire cout;
    reg [23:0] i;

    wire [23:0] shumaB_Shift;

    RippleCarryAdder add(B,shift_amount,1'b0,shumaB_Shift,cout);

  always @(*) begin
  
    if (shumaB_Shift <= 23) begin
      result = A;
      begin
      for (i = 0; i < shumaB_Shift[4:0]; i = i + 24'b1) 
        result = {result[22:0], 1'b0};
      end
    end else begin
      result = A;
    end
  end
endmodule