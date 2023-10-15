/*
*	Author:	Kayleigh Humphrey
*	Date: 	Oct. 10, 2023
*	Name:   	Encoder
*  Encodes 4-bit inputs into 2-bit.
*
*	Inputs:	
*	Y[0], Y[1], Y[2] - corresponding to Pennies, Ha'pennies & Farthings
*
*	Outputs:
*	out[0] & out[1] - the encoded inputs
*
*/ 

module encoder(
	input logic y[2:0] , 
	output logic out[1:0]
);

assign out[0] = y[2] | y[0]; 
assign out[1] = y[2] | y[1];

endmodule
