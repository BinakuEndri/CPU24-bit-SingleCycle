`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2023 17:04:55
// Design Name: 
// Module Name: mux2n1_24bit
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



module mux2n1_24bit(
       input [23:0]Input0,
       input [23:0]Input1,
       input Sel,
       output [23:0]Out
    );
    
    assign Out = Sel ? Input1 : Input0;
endmodule
