`timescale 1ns/1ps

module mod3counter( input clk,
		    input  reset,
		    output y);

   reg [1:0] 		   state, nextstate;

   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b01;
   
   //state reg
   always @(posedge clk, reset)
     begin
	if (reset)
	  state <= 2'b00;//non blockling '<=' to declate sequential logic
	else
	  state <= nextstate;
     end

   //next state combitional logic
   always @(*)
     begin
	case (state)
	  S0 : nextstate = S1;//blocking '=' to show combitional
	  S1 : nextstate = S2;
	  S2 : nextstate = S0;
	  default : nextstate = S0;
	endcase // case (state)
     end
   //output logic
   assign y = (state == S0);
   
endmodule // mod3counter
