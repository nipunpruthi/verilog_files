`timescale 1ns/1ps

module snail_mealy_1101( input d,
			 input 	clk,
			 input reset,
			 output y);

   parameter S0 = 3'd0;
   parameter S1 = 3'd1;
   parameter S2 = 3'd2;
   parameter S3 = 3'd3;

   reg [2:0] 			state, nextstate;
   
   //state reg
   always @(posedge clk or posedge reset)
     begin
	if (reset) state <= S0;
	else	   state <= nextstate;
     end

   //next state combitional logic
   always @(*)
     begin
	case (state)
	  S0 :
	    if (d) nextstate = S1;
	    else   nextstate = S0;

	  S1 :
	    if (d) nextstate = S2;
	    else   nextstate = S0;

	  S2 :
	    if (~d) nextstate = S3;
	    else   nextstate = S2;
	  
	  S3 :
	    if (d) nextstate = S1;
	    else   nextstate = S0;

	  default :
		   nextstate = S0;
	endcase // case (state)
     end // always @ (*)

   //output logic
   assign y = (d & state == S3);
endmodule // snail_mealy_1101
