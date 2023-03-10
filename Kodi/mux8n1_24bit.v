`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2023 23:45:26
// Design Name: 
// Module Name: mux8n1_24bit
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


module mux8n1_24bit(
       input [23:0] andinput,
       input [23:0] orinput,
       input [23:0] addinput,
       input [23:0] sltinput,
       input [23:0] mulinput,
       input [23:0] xorinput,
       input [23:0] sllinput,
       input [2:0] sel,
       output reg [23:0] out
    );

    always @* begin
    case(sel)
        3'b000: out = andinput;
        3'b001: out = orinput;
        3'b010: out = addinput;
        3'b011: out = sltinput;
        3'b100: out = mulinput;
        3'b101: out = xorinput; 
        3'b110: out = sllinput;
    endcase
    end
    
  // assign out = sel[2] ? ((sel[1] ? (sel[0] ?   eight : seven ):(sel[0] ? six   : xorinput))):((sel[1] ? (sel[0] ? lessinput : addinput ):(sel[0] ? orinput : andinput)));
endmodule
