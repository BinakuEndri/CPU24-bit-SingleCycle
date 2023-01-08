`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:10:52
// Design Name: 
// Module Name: Adder
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


module Adder(
        input mA,
        input mB,
        input CIN,
        output Sum,
        output COUT
    );
    
    assign Sum = mA ^ mB ^ CIN;
    assign COUT = CIN & mA | CIN & mB | mA & mB;
    
endmodule
