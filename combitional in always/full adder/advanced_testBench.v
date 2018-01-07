`timescale 1ns/1ps

module testbench;
   reg a, b, cin, cout_exp, sum_exp, clk, reset;
   wire cout, sum;
   reg [4:0] i, error;
   reg [4:0] testvector[8:1];

   fulladder uut(a, b, cin, cout, sum);

   always
     begin
	#5 clk = ~clk;
     end

   initial
     begin
	clk = 0;
	i = 1;
	error = 0;
	$readmemb("/media/nipun/789CB1599CB1131C/Nipun Pruthi/Study/IITR/vivado/files/understanding/combitional in always/full adder/test_data.txt", testvector);
	reset = 1;
	#10 reset = 0;
     end

   always @(posedge clk)
     begin
	#1 {a,b,cin,cout_exp,sum_exp} = testvector[i];
     end

   always @(negedge clk)
     begin
	if(~reset)
	  begin
	     if ({cout_exp,sum_exp} !== {cout,sum})
	       begin
		  $display("Error: inputs = %b",{a,b,cin});
		  $display("Output: %b cout,sum(%b expected)",{cout,sum},{cout_exp,sum_exp});
		  error = error + 1;
	       end
	     else
	       begin
	       $display("Passed: inputs = %b",{a,b,cin});
	       end
	     i = i + 1;
	     if(testvector[i] === 5'bx)
	       begin
		  $display("%d tests complete with %d errors", i, error);
		  $finish;
	       end
	  end // if (~reset)
     end // always @ (negedge clk)
endmodule // testbench
