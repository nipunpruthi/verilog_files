`timescale 1ns/1ps

module tristate(input [3:0] data,
		input 	     s,
		output [3:0] bus);

   assign bus = s ? data : 4'bz;
endmodule // tristate
