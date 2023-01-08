`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:41:20
// Design Name: 
// Module Name: ALU32bit
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


module ALU32bit(
       input [31:0] A,
       input [31:0] B,
       input AInvert,
       input BNegate,
       input [1:0] Op,
       output Zero,
       output [24:0] Result,
       output Overflow,
       output CarryOut
    );
    
    wire [32:0] COUT;
    
    
    
endmodule
