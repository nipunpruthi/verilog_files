`timescale 1ns/1ps

module ford_thunderbird( input reset,
			 input 	      left,
			 input 	      right,
			 input clk,
			 output [5:0] y);

   parameter S0 = 3'd0;
   parameter S1 = 3'd1;
   parameter S2 = 3'd2;
   parameter S3 = 3'd3;
   parameter S4 = 3'd4;
   parameter S5 = 3'd5;
   parameter S6 = 3'd6;

   reg [2:0] 			      state, nextstate;

   //state reg
   always @(posedge clk)
     if (reset) state <= S0;
   else state <= nextstate;	// non blocking assignment to declare sequential logic

   //combitional nextstate logic
   always @(*)
     begin
	case(state)
	  S0 : if (left) nextstate = S1;
	  else if (right) nextstate = S4;//according to the design of indicator controller, left right and reset are mutually exclusive i.e. 100,010,001
	  else nextstate = S0;
	  
	  S1 : nextstate = S2; 
	  S2 : nextstate = S3;
	  S3 : nextstate = S0;
	  S4 : nextstate = S5;
	  S5 : nextstate = S6;
	  S6 : nextstate = S0;
	  default : nextstate = S0;
	endcase // case (state)
     end // always @ (*)

   //output logic
   assign y[5] = (state === 3'd3);
   assign y[4] = (state === 3'd3 || state === 3'd2);
   assign y[3] = (state === 3'd3 || state === 3'd2 || state === 3'd1);
   assign y[2] = (state === 3'd4 || state === 3'd5 || state === 3'd6);
   assign y[1] = (state === 3'd5 || state === 3'd6);
   assign y[0] = (state === 3'd6);

endmodule // ford_thunderbird
