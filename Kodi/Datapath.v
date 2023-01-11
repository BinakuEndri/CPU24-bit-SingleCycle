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


module Datapath(
        input Clock,
        input RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc,
        input [1:0] ALUOp,
        output [3:0] opcode
    );
    
    reg[23:0] pc_initial;
    wire[23:0] pc_next, pc3, pcbeq, pcjump; // T1,T2,T3,T4
    wire[23:0] instruction; //T5
    wire[3:0] muxRegWrite; //T6
    wire[23:0] readData1, readData2, writeData, // T7,T8,T9
    mul_ALU, ALU_Out, Extender, memToMux, // T10.T11,T12,T13
    branchAdderToMux, beqAddress, jumpAddress;//T14,T15,T16,T17,T18
    wire[3:0] ALUCtrl;// T19
    wire zeroof, overflow, carryout; //T20,T21,T22
    wire andMuxBranch;//T23
    
    
    initial 
    begin
        pc_initial = 24'd10;
    end
    
    always@(posedge Clock)
    begin
        pc_initial <= pc_next;
    end
    
    assign pc3 = pc_initial +3;
        
    InstructionMemory IM(pc_initial, instruction);
    
    assign muxRegWrite = (RegDst == 1'b1) ? instruction[11:8] : instruction[15:12];
    
    assign Extender = {{12{instruction[11]}}, instruction[11:0]};
    
    RegisterFile RF(instruction[19:16],instruction[15:12],muxRegWrite,writeData,RegWrite,Clock,readData1,readData2);
    
    assign mux_ALU = (ALUSrc == 1'b1) ? Extender : readData2; 

    ALUcontrol AC(ALUOp, instruction[3:0], instruction[23:20], ALUCtrl); 

    ALU24bit ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2:0], zeroof, ALU_Out, overflow, carryout);

    DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

    assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

    assign andMuxBranch = zeroof & Branch;

    assign beqAddress = pc3 + Extender; 

    assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc3;

    assign opcode = instruction[23:20];
endmodule
