`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2023 22:08:20
// Design Name: 
// Module Name: RippleCarryAdder
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


module RippleCarryAdder(
        input [23:0] A,
        input [23:0] B,
        input CIN,
        output [23:0]Sum,
        output COUT

    );

    wire [22:0] bartja;
    
 Adder a0(A[0], B[0], CIN, Sum[0], bartja[0]);
 Adder a1(A[1], B[1], bartja[0], Sum[1], bartja[1]);
 Adder a2(A[2], B[2], bartja[1], Sum[2], bartja[2]);
 Adder a3(A[3], B[3], bartja[2], Sum[3], bartja[3]);
 Adder a4(A[4], B[4], bartja[3], Sum[4], bartja[4]);
 Adder a5(A[5], B[5], bartja[4], Sum[5], bartja[5]);
 Adder a6(A[6], B[6], bartja[5], Sum[6], bartja[6]);
 Adder a7(A[7], B[7], bartja[6], Sum[7], bartja[7]);
 Adder a8(A[8], B[8], bartja[7], Sum[8], bartja[8]);
 Adder a9(A[9], B[9], bartja[8], Sum[9], bartja[9]);
 Adder a10(A[10], B[10], bartja[9], Sum[10], bartja[10]);
 Adder a11(A[11], B[11], bartja[10], Sum[11], bartja[11]);
 Adder a12(A[12], B[12], bartja[11], Sum[12], bartja[12]);
 Adder a13(A[13], B[13], bartja[12], Sum[13], bartja[13]);
 Adder a14(A[14], B[14], bartja[13], Sum[14], bartja[14]);
 Adder a15(A[15], B[15], bartja[14], Sum[15], bartja[15]);
 Adder a16(A[16], B[16], bartja[15], Sum[16], bartja[16]);
 Adder a17(A[17], B[17], bartja[16], Sum[17], bartja[17]);
 Adder a18(A[18], B[18], bartja[17], Sum[18], bartja[18]);
 Adder a19(A[19], B[19], bartja[18], Sum[19], bartja[19]);
 Adder a20(A[20], B[20], bartja[19], Sum[20], bartja[20]);
 Adder a21(A[21], B[21], bartja[20], Sum[21], bartja[21]);
 Adder a22(A[22], B[22], bartja[21], Sum[22], bartja[22]);
 Adder a23(A[23], B[23], bartja[22], Sum[23], COUT);   
    
endmodule
