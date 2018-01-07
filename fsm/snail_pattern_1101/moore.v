`timescale 1ns/1ps

module snailMoore_1101( input d,
			input  clk,
			input reset,
			output y);

   parameter S0 = 3'd0;
   parameter S1 = 3'd1;
   parameter S2 = 3'd2;
   parameter S3 = 3'd3;
   parameter S4 = 3'd4;

   reg [2:0] 		       state, nextstate;

   //state register
   always @(posedge clk, posedge reset)
     begin
	if(reset)
	  state <= S0;
	else
	  state <= nextstate;
     end

   //next state logic
   always @(*)
     begin
	case(state)
	  S0 : if(d) nextstate = S1;
	       else  nextstate = 0;

	  S1 : if(d) nextstate = S2;
	       else  nextstate = S0;

	  S2 : if(~d) nextstate = S3;
	       else   nextstate = S2;

	  S3 : if(d) nextstate = S4;
	       else  nextstate = S0;

	  S4 : if(d) nextstate = S2;
	       else  nextstate = S0;

	  default :  nextstate = S0;

	endcase // case (state)
     end // always @ (*)

   //output logic
   assign y = (state == S4);
endmodule // snailMoore_1101
