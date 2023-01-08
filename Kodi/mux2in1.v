`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 15:45:00
// Design Name: 
// Module Name: mux2in1
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


module mux2in1(
       input Input0,
       input Input1,
       input Sel,
       output Out
    );
    
    assign Out = Sel ? Input1 : Input0;
endmodule
