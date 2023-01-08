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
    
    reg[7:0] instrMem[127:0];
    
    initial
    $readmemb("instructionMemory.mem", instrMem);
    
    assign Instruction[23:16] = instrMem[PCAddress];
    assign Instruction[15:8] = instrMem[PCAddress + 32'd1];
    assign Instruction[7:0] = instrMem[PCAddress + 32'd2];
    
endmodule