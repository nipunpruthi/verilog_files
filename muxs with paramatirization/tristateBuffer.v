`timescale 1ns/1ps

module tristate #(parameter N=4) (input [N-1:0] data,
		input 	     s,
		output [N-1:0] bus);

   assign bus = s ? data : 'bz;
endmodule // tristate
