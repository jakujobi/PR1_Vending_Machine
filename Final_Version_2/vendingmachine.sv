// Authors:	Kayleigh Humphrey, LNU Sukhman Singh, John Akujobi
// Date: 	Oct. 10, 2023
// Name:   	Vending Machine

/**
 * This module implements the top level module of a vending machine that accepts coins and dispenses tomatoes.
 * 
 * Inputs:
 * - coin[2:0]: 3-bit input representing the coins inserted into the machine. coin[0] represents pennies, coin[1] represents ha'pennies, and coin[2] represents farthings.
 * - clk: clock signal from the button
 * - clk50m: 50 MHz internal clock
 * - res: reset button
 * 
 * Outputs:
 * - tom: output signal to the tomato LED
 * - s[6:0]: 7-bit output signal to the HEX display showing the state of the machine
 * - c[6:0]: 7-bit output signal to the HEX display showing the change
 * - outled[3:0]: 4-bit output signal to the LEDs showing the state of the machine
 * - HapCH: output signal to the LED showing the change in ha'pennies
 * - FarthCH: output signal to the LED showing the change in farthings
 */

module vendingmachine(
	input  logic coin[2:0],	// coin inputs
							// coin[0] = Pennies, coin[1] = Ha'pennies & coin[2] = Farthings
	input  logic clk,	// clock signal from button
	input  logic clk50m,	// 50 MHz internal clock
	input  logic res, 	// reset button

	output logic tom ,	// to tomato LED
	output logic s[6:0] , // to HEX showing the state of the machine
	output logic c[6:0],	// to HEX showing the change
	output logic outled[3:0],	// to LEDs showing the state of the machine
	output logic HapCH, FarthCH	// LEDs showing change in Farthings and Ha'pennies
);

logic enc_I[1:0]; // encoded 2 bit output
logic d[3:0];	// 4 bit output from the state logic to the flip flops
logic d2[3:0];	// 4 bit output from the flip flops to the tomato and outpuy logic

//!Debounce signals_________________________________________________
logic clkde , resde ; // debounced signals
// debounce clock signal
debouncer clk_db(
	.A_noisy(clk),
	.CLK50M(clk50m),
	.A(clkde)
);

// debounce reset signal
debouncer res_db( 
	.A_noisy(res),
	.CLK50M(clk50m),
	.A(resde)
);


//!Encode the coin inputs___________________________________________
// encode inputs 
encoder (.y(coin), .out(enc_I));

// call nextstate logic 
statelogic(
	.s (d2),
	.y (enc_I),
	.d (d)
);

//!Instantiate the flip flops ____________________________________
D_FF_neg zero (
	.D (d[0]),
	.CLKb (clkde),
	.RSTb (resde),
	.Q (d2[0])
);

D_FF_neg one (
	.D (d[1]),
	.CLKb (clkde),
	.RSTb (resde),
	.Q (d2[1])
);

D_FF_neg two (
	.D (d[2]),
	.CLKb (clkde),
	.RSTb (resde),
	.Q (d2[2])
);

D_FF_neg three(
	.D (d[3]),
	.CLKb (clkde),
	.RSTb (resde),
	.Q (d2[3])
);
//LED showing the state of the machine
assign outled = d2;

//!Tomato LED Module________________________________________________
tomd416(
	.a0 (d2[0]) ,
	.a1 (d2[1]) ,
	.a2 (d2[2]) ,
	.a3 (d2[3]) ,
	.t (tom));

//!Output Logic______________________________________________________
outputlogic(
	.A (d2),
	.curstate (s),
	.curchange (c),
	.far (FarthCH),
	.halfp (HapCH)
);

endmodule 