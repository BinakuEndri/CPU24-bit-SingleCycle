`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 21:58:57
// Design Name: 
// Module Name: CPU
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



module CPU(input Clock);
    wire[3:0] opcode , Function;
    wire RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
    wire [1:0] ALUOp;
    
    Datapath DP (
    Clock,
    RegDst, 
    Branch, 
    MemRead, 
    MemWrite, 
    RegWrite, 
    MemToReg, 
    ALUSrc,
    ALUOp, 
    opcode,
    Function
    );
    
    Controlunit CU(
    opcode,
    Function,
    RegDst, 
    ALUSrc,
    Branch, 
    MemRead,
    MemToReg,
    ALUOp, 
    MemWrite, 
    RegWrite
    );
    
endmodule

