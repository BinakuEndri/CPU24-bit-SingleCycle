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

module mux8n1(
       input andinput,
       input orinput,
       input addinput,
       input lessinput,
       input xorinput,
       input [2:0] sel,
       output reg out
    );

    always @* begin
    case(sel)
        3'b000: out = andinput;
        3'b001: out = orinput;
        3'b010: out = addinput;
        3'b011: out = lessinput;
        3'b101: out = xorinput; 
    endcase
    end
    
  // assign out = sel[2] ? ((sel[1] ? (sel[0] ?   eight : seven ):(sel[0] ? six   : xorinput))):((sel[1] ? (sel[0] ? lessinput : addinput ):(sel[0] ? orinput : andinput)));
endmodule

