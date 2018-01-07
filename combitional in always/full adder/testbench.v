`timescale 1ns/1ps

module testbench;
   reg a, b, cin;
   wire sum, cout;

   initial
     begin
	a = 0;
	b = 0;
	cin=0;
	#5 a = 1;
	#5 b = 1;
	#5 a = 0;
	#5 b = 0;
	#5 cin = 1;
	#5 a = 1;
	#5 b = 1;
	#5 a = 0;
	  end // initial begin
   fulladder uut(a, b, cin, cout, sum);
endmodule // testbench
