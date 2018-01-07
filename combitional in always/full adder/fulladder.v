`timescale 1ns/1ps

module fulladder( input a,b,cin,
		  output reg cout, sum);

   reg 			 p, g;
   always @(*)
     begin
	p <= a ^ b;
	g <= a & b;

	sum <= p ^ cin;
	cout <= g | p & cin;
     end
endmodule // fulladder
