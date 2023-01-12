module Sll (
    input [23:0] A, 
    input [23:0] B, 
    input [23:0] shift_amount, 
    output reg [23:0] result
    );

    wire cout;
    reg [23:0] i;

    wire [23:0] shumaB_Shift;

    RippleCarryAdder add(B,shift_amount,1'b0,shumaB_Shift,cout);

  always @(*) begin
    if (shumaB_Shift <= 23) begin
      result = A;
      for (i = 0; i < shumaB_Shift[4:0]; i = i + 1) begin
        result = {result[22:0], 1'b0};
      end
    end else begin
      result = A;
    end
  end
endmodule

