
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 12:12:49 PM
// Design Name: 
// Module Name: cputest
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


module cputesst();


reg Clock;

integer i;
initial
begin
for(i=0; i < 22; i=i+1) //30x nderro nga Clock 0 - 1, 30 tehe pozitive
begin
#10 Clock = 0;
#10 Clock = 1;
end

#10 $stop;
end



CPU cpu24(Clock);
endmodule