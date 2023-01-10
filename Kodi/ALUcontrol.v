`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 18:27:50
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(
       input [1:0] AluOp,
       input [3:0] Function,
       input [3:0] opcode,
       output reg [3:0] ALUContr
    );
    
    
always @(AluOp)
begin
case(AluOp)
     2'b00: ALUContr = 4'b0010; //ls, ss 
     2'b01: ALUContr = 4'b1010; //beq bne
     2'b10:
         case(Function)
            4'b0000: ALUContr=4'b0000; //and
            4'b0001: ALUContr=4'b0001; //or
            4'b0010: ALUContr=4'b0010; //add
            4'b0011: ALUContr=4'b1010; //sub
            4'b0100: ALUContr=4'b0011; //slt
            4'b0110: ALUContr=4'b0100; //XOR            
         endcase
      2'b11:
         case(opcode)
            4'b0001: ALUContr = 4'b0010;// addi
         endcase
endcase
end

endmodule
