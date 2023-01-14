`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 20:17:21
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input wire[23:0] Address,
    input wire[23:0] WriteData,
    input wire MemWrite,
    input wire MemRead,
    input wire Clock,
    output wire[23:0] ReadData
    );
    wire [23:0]  Address1,Address2;
    wire carry1,carry2;
    
    reg[7:0] dataMem[127:0];
    RippleCarryAdder p1(Address, 24'd1, 1'b0, Address1, carry1);
    RippleCarryAdder p2(Address, 24'd2, 1'b0, Address2, carry2);

    initial 
    $readmemb("dataMemory.mem", dataMem);    
    
    always@(posedge Clock)
    begin
        if(MemWrite)
            begin    
                dataMem[Address] <= WriteData[23:16];
                dataMem[Address1] <= WriteData[15:8];
                dataMem[Address2] <= WriteData[7:0];
            end
    end
         
    always@(negedge Clock)
    begin
    $writememb("dataMemory.mem", dataMem);
    end
     
     
     
     assign ReadData[23:16] = dataMem[Address];
     assign ReadData[15:8] = dataMem[Address1];
     assign ReadData[7:0] = dataMem[Address2];

endmodule
