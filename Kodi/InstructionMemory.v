`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 20:08:10
// Design Name: 
// Module Name: InstructionMemory
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



module InstructionMemory(
        input wire[23:0] PCAddress,
        output wire[23:0] Instruction
    );
    wire cout1, cout2;
    reg[7:0] instrMem[127:0];

    wire [23:0] PCAddress2;
    wire [23:0] PCAddress3;

    RippleCarryAdder addAdress1(PCAddress,24'd1,1'b0,PCAddress2,cout1);
    RippleCarryAdder addAdress2(PCAddress,24'd2,1'b0,PCAddress3,cout2);


    initial
    $readmemb("instructionMemory.mem", instrMem);
    
    assign Instruction[23:16] = instrMem[PCAddress];
    assign Instruction[15:8] = instrMem[PCAddress2];
    assign Instruction[7:0] = instrMem[PCAddress3];
    
endmodule

