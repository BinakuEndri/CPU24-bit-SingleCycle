`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 18:04:27
// Design Name: 
// Module Name: MulFile
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


module MulFile(
     
        input wire[47:0] WriteMul,
        input wire Mulwrite,
        input wire Clock,
        output wire[47:0] ReadMul
    );
    
    reg[47:0] Register;
    initial
    begin
    Register <= 47'd0;
    end
   
     always @(posedge Clock)
     begin
     Register <= WriteMul;
     end
     
     assign ReadMul = Register;
      
endmodule