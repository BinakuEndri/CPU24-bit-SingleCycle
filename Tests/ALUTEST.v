// EDA PLAYGROUND

module testALU24bit();

  reg[23:0] A, B; 
	reg AInvert, BInvert;
  reg [2:0] Operation;
  wire [23:0]Result;
  wire COUT, zero, overflow;

  
    initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testALU24bit);
end
  
initial
  $monitor("A=%d, B=%d, AInvert=%b, BInvert=%b, Operation=%b, Result=%d, COUT=%b", A, B, AInvert, BInvert, Operation, Result, COUT);


initial
begin
//AND
  
//XOR
#0 A=24'd0; B=24'd1; AInvert=1'b0; BInvert=1'b0; Operation=3'b100;

#10 $finish;
end

  ALU24bit ALUTest(A, B, AInvert, BInvert, Operation, zero, Result, overflow ,COUT);

endmodule

//VIVALDO

module ALUTEST();

  reg[23:0] A, B; 
  reg AInvert, BInvert;
  reg [2:0] Operation;
  reg [3:0] SHAMT;
  wire [23:0]Result;
  wire COUT, zero, overflow;
  wire [47:0] MulOUT;

  
  
initial
  $display("A=%d, B=%d, AInvert=%b, BInvert=%b, Operation=%b, Result=%d, COUT=%b, MUL=%d, SHAMT=%d", A, B, AInvert, BInvert, Operation, Result, COUT, MulOUT,SHAMT);


initial
begin
//AND
  
//XOR
#0 A=24'd4; B=24'd3; AInvert=1'b0; BInvert=1'b0; Operation=3'b100; SHAMT=4'd2;

#10 $stop;
end

  ALU24bit ALUTest(A, B, AInvert, BInvert, Operation, SHAMT,zero, Result, overflow ,COUT,MulOUT);

endmodule