`timescale 1ns/1ps

module latch( input clk,
	      input 	 d,
	      output reg q);

   always @(clk,d)
     begin
	if (clk)
	  q <= d;
     end
endmodule // latch
