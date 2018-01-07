`timescale 1ns/1ps

module fulladder(input a, b, cin,
		 output reg cout, sum);

   reg 			    p, g;

   always @(a,b,cin)
     begin
	p = a ^ b;
	g = a & b;

	cout = g | p & cin;
	sum = p ^ cin;
     end
endmodule // fulladder
