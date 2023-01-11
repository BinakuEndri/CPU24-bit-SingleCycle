`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2023 22:29:19
// Design Name: 
// Module Name: mux2n1_4bit
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

module mux2n1_4bit(
       input [3:0]Input0,
       input [3:0]Input1,
       input Sel,
       output [3:0]Out
    );
    
    assign Out = Sel ? Input1 : Input0;
endmodule
