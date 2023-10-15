// Authors: John Akujobi & LNU Sukhman Singh
// Date: October, Fall 2023
// Description: This module is a 4-to-16 decoder that takes a 4 inputs and generates a 16-bit output. 
module d416 (
	input  logic a0, a1, a2, a3, // 4 inputs
	output logic y[8:0]	// 16-bit output
);

assign y[0]  = ~a3 & ~a2 & ~a1 & ~a0;
assign y[1]  = ~a3 & ~a2 & ~a1 &  a0;
assign y[2]  = ~a3 & ~a2 &  a1 & ~a0;
assign y[3]  = ~a3 & ~a2 &  a1 &  a0;
assign y[4]  = ~a3 &  a2 & ~a1 & ~a0;
assign y[5]  = ~a3 &  a2 & ~a1 &  a0;
assign y[6]  = ~a3 &  a2 &  a1 & ~a0;
assign y[7]  = ~a3 &  a2 &  a1 &  a0;
assign y[8]  =  a3 & ~a2 & ~a1 & ~a0;

endmodule