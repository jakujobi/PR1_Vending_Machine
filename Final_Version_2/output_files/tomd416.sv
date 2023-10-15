// Author: LNU Sukhman Singh & John Akujobi
// Date: October, Fall 2023
// Description: This is the module for the Tomato LED
// This helps us decide when a Tomato will be given
// Hence, it controls the LED for Tomato
module tomd416 (
	input  logic a0, a1, a2, a3,	// 4 inputs for the states
	output t 	//Tomato Output LED
);

logic y[8:0];

assign y[0]  = ~a3 & ~a2 & ~a1 & ~a0; 	//First State
assign y[1]  = ~a3 & ~a2 & ~a1 &  a0;	//Second State
assign y[2]  = ~a3 & ~a2 &  a1 & ~a0;	//Third State
assign y[3]  = ~a3 & ~a2 &  a1 &  a0;	//Fourth State
assign y[4]  = ~a3 &  a2 & ~a1 & ~a0;	//Fifth State
assign y[5]  = ~a3 &  a2 & ~a1 &  a0;	//Sixth State
assign y[6]  = ~a3 &  a2 &  a1 & ~a0;	//Seventh State
assign y[7]  = ~a3 &  a2 &  a1 &  a0;	//Eighth State
assign y[8]  =  a3 & ~a2 & ~a1 & ~a0;	//Ninth State

assign t = y[5] + y[6] + y[7] + y[8];	//Tomato LED lights for these states

endmodule