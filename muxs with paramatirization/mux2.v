`timescale 1ns/1ps

module mux2 #(parameter N=3) (input [N-1:0] d1, d0,
	    input 	 s,
	    output [N-1:0] data);

   assign data = s ? d1 : d0;
endmodule // mux2
