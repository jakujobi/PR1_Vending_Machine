// Authors:	John Akujobi, LNU Sukhman Singh
// Date: 	October, Fall, 2023
// Name:   	changesev
// Filename: changesev.sv

// Description: This is the module for the change in Ha'penny and Farthing
//	It takes in a 4 bit input from the state and outputs a 7 bit output to the HEX display.
//	It also outputs two control signals for the LEDs

// Inputs
// - A[3:0]: 4-bit input from the state

// Outputs
// - S[6:0]: 7-bit output to the HEX display showing the change in Farthings
// - h: 1-bit output for Ha'penny LED
// - f: 1-bit output for Farthing LED


module changesev (
	input logic  A[3:0],	// 4 bit input from the state
	output logic S[6:0] ,	// 7 nit output to the Hex display showing the change in Farthings
	output logic h , f //controls the led for Ha'penny and Farthing change
);

logic Y[8:0];	// 9 bit output decoded from the 4 bit input

d416 (
	.a0(A[0]),
	.a1(A[1]),
	.a2(A[2]),
	.a3(A[3]),
	.y(Y)
);

assign S[0] = ~( Y[7] | Y[8] );
assign S[1] = ~( Y[6] | Y[7] | Y[8] );
assign S[2] = ~( Y[6] | Y[8] );
assign S[3] = ~( Y[7] | Y[8] );
assign S[4] = ~( Y[7] );
assign S[5] = 1 ;	// Keeps this set off (It is 1 because the HEX is low enable)
assign S[6] = ~( Y[7] | Y[8]);

assign h = (Y[7] | Y[8]);	// controlls the LED for Ha'penny change
assign f = (Y[6] | Y[8]) ;	// controlls the LED for Farthing change

endmodule