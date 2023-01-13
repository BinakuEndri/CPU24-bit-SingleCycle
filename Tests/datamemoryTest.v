module datamemoryTest();
reg Clock, MemWrite, MemRead;
reg[23:0] Adresa;
reg[23:0] WriteData;
wire[23:0] ReadData;

initial 
begin
#0 Clock=1'b0;
#5 MemWrite=1'b1; Adresa=24'd2; WriteData=24'd30; MemRead=1'b0;
#5 Clock=1'b1;
#5 Clock=1'b0;MemWrite=1'b0;
//#5 MemWrite=1'b0; Adresa=24'd2; MemRead=1'b1;
#5 MemRead=1'b1; Adresa=24'd2;
#5 $stop;
end

DataMemory DM(Adresa, WriteData, MemWrite,MemRead ,Clock, ReadData);
endmodule











