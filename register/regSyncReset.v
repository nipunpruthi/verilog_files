`timescale 1ns/1ps

module register(input clk,
		input 		 reset,
		input 		 en,
		input [3:0] 	 data,
		output reg [3:0] q);

   always @(posedge clk)
     begin
	if (reset)
	  q <= 4'b0;
	else if (en)
	  q <= data;
     end
endmodule // register
