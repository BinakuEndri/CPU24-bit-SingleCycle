`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:44:51
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [3:0] OPCODE,
    output reg RegDst,
    output reg AluSrc,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg[1:0] AluOP,
    output reg MemWrite,
    output reg RegWrite
    
    );
 always @ (OPCODE)
begin
case(OPCODE)
6'b0110: //PER R-FORMAT
    begin
    RegDst = 1;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOP[1] = 1;
    AluOP[0] = 0;
    end

6'b0010: //PER LS
    begin
    RegDst = 0;
    AluSrc = 1;
    MemToReg = 1;
    RegWrite = 1;
    MemRead = 1;
    MemWrite = 0;
    Branch = 0;
    AluOP[1] = 0;
    AluOP[0] = 0;
    end 
    
6'b0011: //PER SS
    begin
    RegDst = 1'bX;
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1'bX;
    MemRead = 0;
    MemWrite = 1;
    Branch = 0;
    AluOP[1] = 0;
    AluOP[0] = 0;
    end 
    
6'b0100: //PER BEQ
    begin
    RegDst = 0;
    AluSrc = 0;
    MemToReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 1;
    AluOP[1] = 0;
    AluOP[0] = 1;
    end 
6'b0001: //PER ADDI
    begin
    RegDst = 0;
    AluSrc = 1;
    MemToReg = 0;
    RegWrite = 1;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    AluOP[1] = 0;
    AluOP[0] = 0;
    end 
endcase

end
    
endmodule
