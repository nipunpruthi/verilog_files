`timescale 1ns/1ps

module pri_using_casez(input [3:0] a,
		       output reg [3:0] y);

   always @(a)
     begin
	casez (a)
	  4'b1??? : y = 4'b1000;
	  4'b01?? : y = 4'b0100;
	  4'b001? : y = 4'b0010;
	  4'b0001 : y = 4'b0001;
	  default : y = 4'b0000;
	endcase // casez (a)
     end
endmodule // pri_using_casez
