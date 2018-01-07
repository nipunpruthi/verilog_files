`timescale 1ns/1ps

module decoder #(parameter N=3) 
		(input [N:0] a,
      		 output reg [2**(N+1)-1:0] y);

   always @(*)
     begin
	y    = 0;
	y[a] = 1;
     end

endmodule // decoder
