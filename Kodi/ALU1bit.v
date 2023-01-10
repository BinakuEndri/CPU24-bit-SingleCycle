`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 15:37:03
// Design Name: 
// Module Name: ALU1bit
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


module ALU1bit(
    input A,
    input B,
    input CIN,
    input AInvert,
    input BInvert,
    input Less,
    input [2:0] Op,
    output Result,
    output CarryOut 
    );
    
    wire NA, NB, mA, mB, and_wire, or_wire, add_wire, xor_wire;
    
    assign NA = ~A;
    assign NB = ~B;
    
    mux2in1 muxA(A,NA,AInvert, mA);
    mux2in1 muxB(B,NB,BInvert, mB);
    
    assign and_wire = mA & mB;
    assign or_wire = mA | mB;

    XOR xor1(mA,mB,xor_wire);

    Adder add(mA, mB, CIN, add_wire, CarryOut);
    
    mux8in1 mainMux(and_wire, or_wire, add_wire, Less, xor_wire, 0, 0, 0, Op, Result);
    
endmodule
