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
