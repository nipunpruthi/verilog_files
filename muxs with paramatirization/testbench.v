`timescale 1ns/1ps

module testbench;
   reg [1:0] s;
   reg [3:0] a, b, c, d;
   wire [3:0] y;

   initial
     begin
      $monitor (" A = %b  B = %b C = %b D = %b s = %b y = %b",a,b,c,d, s, y);
	a = 1;
	b = 2;
	c = 3;
	d = 4;
	s=0;
	//#10 a = 1;
	//#10 b=2;
	#10 s=1;
	//#10 c=3;
	#10 s=2;
	//#10 d=4;
	#10 s=3;
	#10 $finish;
     end // initial begin

   mux4 uut(a, b, c, d, s, y);
endmodule // testbench
