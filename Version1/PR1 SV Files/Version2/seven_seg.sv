module seven_seg
(

	input logic  A[3:0],
	output logic S[6:0]

);

logic Y[8:0];

d416 (.a0(A[0]), .a1(A[1]), .a2(A[2]), .a3(A[3]), .y(Y));

assign S[0] = ~(Y[0] | Y[2] | Y[3] | Y[5] | Y[6] | Y[7] | Y[8] );
assign S[1] =~(Y[0] | Y[1] | Y[2] | Y[3] | Y[4] | Y[7] | Y[8] );
assign S[2] = ~(Y[0] | Y[1] | Y[3] | Y[4] | Y[5] | Y[6] | Y[7] | Y[8] );
assign S[3] = ~(Y[0] | Y[2] | Y[3] | Y[5] | Y[6] | Y[8] );
assign S[4] = ~(Y[0] | Y[2] | Y[6] | Y[8] );
assign S[5] = ~(Y[0] | Y[4] | Y[5] | Y[6] | Y[8] );
assign S[6] = ~(Y[2] | Y[3] | Y[4] | Y[5] | Y[6] | Y[8]);


endmodule