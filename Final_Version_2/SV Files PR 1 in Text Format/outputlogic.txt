// Authors:	John Akujobi, LNU Sukhman Singh
// Date: 	October, Fall, 2023
// Name:   	outputlogic
// Filename: outputlogic.sv

// Description: This is the module for the output logic
// This module processes the output of the vending machine
// Inputs
// - A[3:0]: 4-bit input from the state
// Outputs
// - curstate[6:0]: 7-bit output to the HEX showing the state of the machine
// - curchange[6:0]: 7-bit output to the HEX showing the change of the machine
// - far: 1-bit output for Farthing LED
// - halfp: 1-bit output for Ha'penny LED

module outputlogic (
    input logic A[3:0],
    output logic curstate[6:0], // output for state
    output logic curchange[6:0],    // output for change
    output logic far ,  // output for Farthing LED
    output logic halfp  // output for Ha'penny LED
);

//process the states to the current state and show HEX
seven_seg (
    .A(A),
    .S(curstate)    // output for state
);

// module to output the change in Ha'penny and Farthing
changesev (
    .A(A) ,
    .S(curchange),
    .h(halfp),
    .f(far)
) ;

endmodule 