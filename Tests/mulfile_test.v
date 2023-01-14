`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2023 12:03:19
// Design Name: 
// Module Name: mulfile_test
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


module mulfile_test();
reg[47:0] WriteMul;
reg RegWrite, Clock;
wire[47:0] Readmul;

initial
begin
#0 Clock=1'b0;
#5 WriteMul = 48'd5; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0;RegWrite = 1'b1;
#5 WriteMul = 47'd7; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite=0;
#5 $stop;


end
MulFile MF(WriteMul,RegWrite, Clock, Readmul);
endmodule
