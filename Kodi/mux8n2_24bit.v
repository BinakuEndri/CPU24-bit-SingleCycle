`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2023 23:45:26
// Design Name: 
// Module Name: mux8n1_24bit
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


module mux8n2_24bit(
       input [23:0] andinput,
       input [23:0] orinput,
       input [23:0] addinput,
       input [23:0] sltinput,
       input [47:0] mulinput,
       input [23:0] xorinput,
       input [23:0] sllinput,
       input [2:0] sel,
  		 output reg [23:0] out,
       output reg [47:0] mulout

    );
	  always @* begin
        if (sel == 3'b000) begin out = andinput; mulout = 24'b0; end
        else if (sel == 3'b001) begin out = orinput; mulout = 24'b0; end
        else if (sel == 3'b010) begin out = addinput; mulout =24'b0; end
        else if (sel == 3'b011) begin out = sltinput; mulout =24'b0; end
        else if (sel == 3'b100) begin out = mulinput; mulout = mulinput; end
        else if (sel == 3'b101) begin out = xorinput; mulout =24'b0; end
        else if (sel == 3'b110) begin out = sllinput; mulout =24'b0; end
  end

   // always @* begin
   // case(sel)
     //   3'b000: out = andinput; mulout = 24'b0;
       // 3'b001: out = orinput; mulout = 24'b0;
      //  3'b010: out = addinput; mulout =24'b0;
      //  3'b011: out = sltinput; mulout =24'b0;
      //  3'b100: out = mulinput; mulout =mulinput;
      //  3'b101: out = xorinput; mulout =24'b0;
      //  3'b110: out = sllinput; mulout =24'b0;
    //endcase
    //end
  
  
    
  // assign out = sel[2] ? ((sel[1] ? (sel[0] ?   eight : seven ):(sel[0] ? six   : xorinput))):((sel[1] ? (sel[0] ? lessinput : addinput ):(sel[0] ? orinput : andinput)));
endmodule