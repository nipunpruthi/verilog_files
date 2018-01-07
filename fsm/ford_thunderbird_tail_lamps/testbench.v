`timescale 1ns/1ps

module testbench;
   reg left, right, resetest, reset, clk;
   reg [5:0] y_exp;
   wire [5:0] y;

   reg [10:0] i, error;
   reg [8:0]  vector[100:1];

   ford_thunderbird uut(reset, left, right, clk, y);

   always begin
      #5 clk = ~clk;
   end

   initial
     begin
	clk = 0;
	i = 1;
	error = 0;
	$readmemb("/media/nipun/789CB1599CB1131C/Nipun Pruthi/Study/IITR/vivado/files/understanding/fsm/ford_thunderbird_tail_lamps/test_data.tv",vector);
	resetest = 1;
	#20 resetest = 0;
     end

   always @(negedge clk)
     begin
	#2 {left, right, reset, y_exp} = vector[i];
     end

   always @(negedge clk)
     begin
	if(~resetest)
	  begin
	     if (y_exp !== y)
	       begin
		  $display ("Error : input = %b",{left, right, reset});
		  $display ("Output : %b ( %b expected)",y, y_exp);
		  error = error + 1;
	       end
	     else
	       begin
                  $display("Passed : Input = %b", {left,right,reset});
	          $display("Output : %b (%b expected)",y, y_exp);
	       end
	i = i + 1;
	if (vector[i] === 9'bx)
	  begin
	     $display("%d test complete with %d errors", i-1, error);
	     $finish;
	  end
	  end // if (~resetest)
     end // always @ (negedge clk)
endmodule // testbench
