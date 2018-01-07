`timescale 1ns/1ps

module inverter(input [3:0] d,
		output reg [3:0] q);

   always @(*) //* will check all signal after <=
     begin     // in this case, we can also write 'd' in place of '*'
	q <= ~d;
     end
endmodule // inverter
