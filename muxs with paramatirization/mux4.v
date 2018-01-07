`timescale 1ns/1ps

module mux4 #(parameter N=4) ( input [N-1:0] d0, d1, d2, d3,
	     input [1:0]  s,
	     output [N-1:0] data);

   wire [N-1:0] 		  bhigh, blow;

   mux2 #(N) muxhigh(d3, d2, s[0], bhigh);
   mux2 #(N) muxlow( d1, d0, s[0], blow);
   mux2 #(N) muxfinal(bhigh, blow, s[1], data);
endmodule // mux4
