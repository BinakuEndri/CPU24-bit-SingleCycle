`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:29:44
// Design Name: 
// Module Name: mux4in1
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


module mux4in1(
       input andinput,
       input orinput,
       input addinput,
       input lessinput,
       input [1:0] sel,
       output out
    );
    
    assign out = sel[1] ? (sel[0] ? lessinput : addinput ):(sel[0] ? orinput : andinput);
endmodule
