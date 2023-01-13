`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 19:42:27
// Design Name: 
// Module Name: mux1n1
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


module mux1n1(
       input [2:0]Sel,
       output reg Out
    );


     always @* begin
    case(Sel)
        3'b000: Out = 1'b0;
        3'b001: Out = 1'b0;
        3'b010: Out = 1'b0;
        3'b011: Out = 1'b0;
        3'b100: Out = 1'b1;
        3'b101: Out = 1'b0; 
        3'b110: Out = 1'b0;
    endcase
    end
    
endmodule

