`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 12:54:49
// Design Name: 
// Module Name: RegisterFile_Test
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

module RegisterFile_Test();

reg[3:0] RS, RT, RD;
reg RegWrite, Clock;
reg[23:0] WriteData;
wire[23:0] ReadRS, ReadRT;

initial
begin
#0 Clock=1'b0;
#5 RD=4'd8; WriteData = 24'd5; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0;RegWrite = 1'b1;
#5 RD=4'd9; WriteData = 24'd7; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite=0;
#5 RS=4'd8; RT=4'd9;
#5 $stop;


end
RegisterFile RF(RS, RT, RD, WriteData, RegWrite, Clock, ReadRS, ReadRT);
endmodule
