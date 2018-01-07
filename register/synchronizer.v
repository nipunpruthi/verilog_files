`timescale 1ns/1ps

module synchronizer(
		    input      clk,
		    input      d,
		    output reg q);

   reg 			       n1;

   always @(posedge clk)
     begin
	q <= n1;
	n1 <= d;
     end
endmodule // synchronizer
