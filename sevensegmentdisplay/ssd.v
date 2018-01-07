`timescale 1ns/1ps

module ssd( input [3:0] data,
	    output reg [6:0] segments);

   always @(data)
     begin
	case(data)
	  //		   abcd_efg
	  0: segments = 7'b1111_110;
	  1: segments = 7'b0110_000;
	  2: segments = 7'b1101_101;
	  3: segments = 7'b1111_001;
	  4: segments = 7'b0110_011;
	  5: segments = 7'b1011_011;
	  6: segments = 7'b1011_111;
	  7: segments = 7'b1110_000;
	  8: segments = 7'b1111_111;
	  9: segments = 7'b1111_011;
	  default:
	     segments = 7'b0000_000;
	endcase // case (data)
     end // always @ (data)
endmodule // ssd

