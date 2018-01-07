`timescale 1ns/1ps

module testbench;
   reg clk, reset;
   wire y;

   reg [1:0] state, nextstate;

   initial
     begin
	reset =  0;
	clk = 0;
	#50 reset = 1;
	#20 reset = 0;
     end

   always
     begin
	#5 clk = ~clk;
     end

   mod3counter uut(clk, reset, y);

endmodule // testbench
