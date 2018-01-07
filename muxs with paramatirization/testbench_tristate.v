`timescale 1ns/1ps

module testbench;
   reg s;
   reg [3:0] data;
   wire [3:0]   y;

   initial
     begin
	s=0;
	data=4;
	#5 data=3;
	#5 s=1;
	#5 data=6;
	#5 $finish;
     end
   
   tristate uut(data, s, y);
   
endmodule // testbench
