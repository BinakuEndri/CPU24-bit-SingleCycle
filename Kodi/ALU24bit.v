`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 16:53:44
// Design Name: 
// Module Name: ALU24bit
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


module ALU24bit(
       input [23:0] A,
       input [23:0] B,
       input AInvert,
       input BNegate,
       input [2:0] Op,
       input [3:0] SHAMT,
       output Zero,
       output [23:0] Result,
       output Overflow,
       output CarryOut,
       output [47:0]MulOUT

    );
    
    wire [22:0] COUT;
    wire [23:0] Resultalu1bit;
    wire [23:0] Sllwire;
    wire [47:0] MulWire;
    wire [23:0] SltWire;
    wire [5:0] ShiftValueWire;

    
    ALU1bit ALU0(A[0],B[0],BNegate, AInvert, BNegate, Result[23], Op, Resultalu1bit[0],COUT[0]);
    ALU1bit ALU1(A[1],B[1],COUT[0], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[1],COUT[1]);
    ALU1bit ALU2(A[2],B[2],COUT[1], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[2],COUT[2]);
    ALU1bit ALU3(A[3],B[3],COUT[2], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[3],COUT[3]);
    ALU1bit ALU4(A[4],B[4],COUT[3], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[4],COUT[4]);
    ALU1bit ALU5(A[5],B[5],COUT[4], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[5],COUT[5]);
    ALU1bit ALU6(A[6],B[6],COUT[5], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[6],COUT[6]);
    ALU1bit ALU7(A[7],B[7],COUT[6], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[7],COUT[7]);
    ALU1bit ALU8(A[8],B[8],COUT[7], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[8],COUT[8]);
    ALU1bit ALU9(A[9],B[9],COUT[8], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[9],COUT[9]);
    ALU1bit ALU10(A[10],B[10],COUT[9], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[10],COUT[10]);
    ALU1bit ALU11(A[11],B[11],COUT[10], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[11],COUT[11]);
    ALU1bit ALU12(A[12],B[12],COUT[11], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[12],COUT[12]);
    ALU1bit ALU13(A[13],B[13],COUT[12], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[13],COUT[13]);
    ALU1bit ALU14(A[14],B[14],COUT[13], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[14],COUT[14]);
    ALU1bit ALU15(A[15],B[15],COUT[14], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[15],COUT[15]);
    ALU1bit ALU16(A[16],B[16],COUT[15], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[16],COUT[16]);
    ALU1bit ALU17(A[17],B[17],COUT[16], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[17],COUT[17]);
    ALU1bit ALU18(A[18],B[18],COUT[17], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[18],COUT[18]);
    ALU1bit ALU19(A[19],B[19],COUT[18], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[19],COUT[19]);
    ALU1bit ALU20(A[20],B[20],COUT[19], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[20],COUT[20]);
    ALU1bit ALU21(A[21],B[21],COUT[20], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[21],COUT[21]);
    ALU1bit ALU22(A[22],B[22],COUT[21], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[22],COUT[22]);
    ALU1bit ALU23(A[23],B[23],COUT[22], AInvert, BNegate, 1'b0 , Op, Resultalu1bit[23], CarryOut);
    
    
    assign Zero = ~(Result[0] | Result[1] | 
                Result[2] | Result[3] | 
                Result[4] | Result[5] | 
                Result[6] | Result[7] | 
                Result[8] | Result[9] | 
                Result[10] | Result[11] | 
                Result[12] | Result[13] | 
                Result[14] | Result[15] | 
                Result[16] | Result[17] | 
                Result[18] | Result[19] | 
                Result[20] | Result[21] | 
                Result[22] | Result[23]); 
                    
    assign Overflow = COUT[22] ^ CarryOut;

    assign ShiftValueWire = SHAMT + B;

    assign Sllwire = A << ShiftValueWire;

    SLT slt1(A,B,SltWire);
    
    assign MulWire = A * B;


    mux8in1_24bit mux2(Resultalu1bit,Resultalu1bit,Resultalu1bit, SltWire, MulWire, Resultalu1bit,Sllwire, Op, Result,MulOUT);
    
endmodule
