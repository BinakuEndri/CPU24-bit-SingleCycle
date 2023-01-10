`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 20:56:08
// Design Name: 
// Module Name: Datapath
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

module XOR(
        input A,
        input B,
        output reg Out
    );
    always @* begin
    case({A,B})
        2'b00: Out = 1'b0;
        2'b01: Out = 1'b1;
        2'b10: Out = 1'b1;
        2'b11: Out = 1'b0;
    endcase
    end
endmodule
