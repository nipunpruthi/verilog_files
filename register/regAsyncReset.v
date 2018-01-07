`timescale 1ns/1ps

module register( input clk,
		 input 		  reset,
		 input 		  en,
		 input [3:0] 	  d,
		 output reg [3:0] q);
//asynchronous reset
   always @(posedge clk, posedge reset) begin
      if (reset)
	begin
	   q <= 4'b0;
	end
      else if (en)
	begin
	   q <= d;
	end
   end
endmodule // register
