`timescale 1ns/1ps

module testbench;
   reg [3:0] a, b;
   reg 	     s;
   wire [3:0] y;

   initial
     begin
	s = 0;
	a = 1;
	b = 2;
	#5 a = 4;
	#5 s = 1;
	#5 a = 3;
	#5 s = 0;
	#5 $finish;
     end // initial begin
   
   mux2 uut(a, b, s, y);
endmodule // testbench
