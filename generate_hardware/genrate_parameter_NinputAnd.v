`timescale 1ns/1ps

module andN #(parameter N=8)
	     (input [N-1:0] a,
	      output y);

   wire [N-1:1]      x;

   genvar 	     i;

   generate
      for (i=1; i<N; i=i+1)
	begin:ForLoop
	   if (i==1)
	     assign x[1] = a[0] & a[1];
	   else
	     assign x[i] = x[i-1] & a[i];
	end
      endgenerate

   assign y = x[N-1];
endmodule // andN
