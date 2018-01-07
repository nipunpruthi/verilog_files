`timescale 1ns/1ps

module mux2 #(parameter N=4) (input [N-1:0] d1, d0,
	    input 	 s,
	    output [N-1:0] data);

   tristate #(N) l1(d0, ~s, data);
   tristate #(N) l2(d1, s, data);
endmodule // mux2
