`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 


module Datapath(
input Clock,
input RegDst, Branch, MemRead, 
MemWrite, RegWrite, MemToReg, ALUSrc, 
input [1:0] ALUOp, 
output [3:0] opcode , Function 
);

reg[23:0] pc_initial; 
wire [23:0] pc_next, pc3; 
wire [23:0] instruction; 
wire [3:0] mux_regfile; 
wire[23:0] readData1, readData2, writeData, 
mux_ALU, ALU_Out, Zgjerimi, memToMux, 
beqAddress, beqAddressnegativ, beqAddresspozitiv; 
wire[3:0] ALUCtrl; 
wire zerof, overflow, carryout,carry1, carry2;
wire andMuxBranch, muxtomul; 
wire [47:0] Mulwire, mulout; 


initial
begin
    pc_initial = 24'd10; //inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
    
end

//assign pc3 = pc_initial + 3; 
RippleCarryAdder addpc(pc_initial, 24'd3, 1'b0, pc3, carry);

//Instr mem //inicializimi i IM (PC adresa hyrje, teli instruction dajle)
InstructionMemory IM(pc_initial, instruction); 

//assign mux_regfile = (RegDst == 1'b1) ? instruction[11:8] : instruction[15:12]; 
mux2n1_4bit regfile_MUX(instruction[15:12], instruction[11:8] , RegDst, mux_regfile);
                           // RT                    //RD                    

assign Zgjerimi = {{12{instruction[11]}}, instruction[11:0]};  


RegisterFile RF(instruction[19:16], instruction[15:12], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 

//assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2; 
mux2n1_24bit ALUMux(readData2, Zgjerimi, ALUSrc, mux_ALU);

ALUcontrol AC(ALUOp, instruction[3:0], ALUCtrl); 

ALU24bit ALU(readData1, mux_ALU, 1'b0, ALUCtrl[3],ALUCtrl[2:0],instruction[7:4] ,zerof, ALU_Out,overflow, carryout,Mulwire);

MulFile MF(Mulwire,muxtomul,Clock,mulout);

DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

//assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;
mux2n1_24bit writeDataMux(ALU_Out, memToMux, MemToReg, writeData);

mux1n1 mulwrite(ALUCtrl[2:0],muxtomul);


assign andMuxBranch = zerof & Branch;

//assign beqAddress = pc3 + Zgjerimi; 
RippleCarryAdder addbeqaddresspozitiv(pc3,Zgjerimi,1'b0,beqAddresspozitiv,carry1);

RippleCarryAdder addbeqaddressnegativ(pc3, ~Zgjerimi, 1'b1, beqAddressnegativ, carry2);
mux2n1_24bit mux(beqAddresspozitiv, beqAddressnegativ, Zgjerimi[23], beqAddress);
//assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc3;
//mux2in1_24bit pcbeqmux(pc3,beqAddress,andMuxBranch,pcbeq);

mux2n1_24bit pc_nextMUx(pc3, beqAddress, andMuxBranch, pc_next);

assign opcode = instruction[23:20];
assign Function = instruction[3:0];

endmodule



