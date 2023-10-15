// Authors:	Kayleigh Humphrey, LNU Sukhman Singh, John Akujobi
// Date: 	October, Fall, 2023
// Name:   	encoder
// Filename: encoder.sv

// The encoder module takes a 3-bit input and encodes it into a 2-bit output.
//    y - 3-bit input corresponding to Pennies, Ha'pennies & Farthings
//    out - 2-bit encoded output

module encoder(
	input logic y[2:0], //- 3-bit input corresponding to Pennies, Ha'pennies & Farthings
	output logic out[1:0] 
);

assign out[0] = y[2] | y[0]; 
assign out[1] = y[2] | y[1];

endmodule
