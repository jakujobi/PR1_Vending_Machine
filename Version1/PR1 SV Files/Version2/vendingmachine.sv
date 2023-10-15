/*
*	Author:	Kayleigh Humphrey
*	Date: 	Oct. 10, 2023
*	Name:   	Vending Machine
*  Top Level
*
*	Inputs:	
*	coin[0], coin[1], coin[2] - corresponding to Pennies, Ha'pennies & Farthings
*	clk 	 - clock
*	clk50m - 50 MHz clock
*	res 	 - reset button
*	enc_I  - encoded inputs
*
*	Outputs:
*	out_tom[0], out_tom[1], out_tom[2] & out_tom[3]
*
*/ 

module vendingmachine(
	input  logic coin[2:0], clk, clk50m, res, 
	output logic tom , s[6:0] , c[6:0],outled[3:0],
	output logic HapCH, FarthCH
);

logic enc_I[1:0];
logic d[3:0];
logic d2[3:0];

// debounce clock signal
logic clkde , resde ; 

debouncer clk_db( .A_noisy(clk), .CLK50M(clk50m), .A(clkde) );
debouncer res_db( .A_noisy(res), .CLK50M(clk50m), .A(resde) );

// encode inputs 
encoder (.y(coin), .out(enc_I));

// call nextstate logic 
statelogic( .s(d2), .y(enc_I), .d(d));

D_FF_neg zero (.D(d[0]), .CLKb(clkde), .RSTb(resde), .Q(d2[0]));
D_FF_neg one  (.D(d[1]), .CLKb(clkde), .RSTb(resde), .Q(d2[1]));
D_FF_neg two  (.D(d[2]), .CLKb(clkde), .RSTb(resde), .Q(d2[2]));
D_FF_neg three(.D(d[3]), .CLKb(clkde), .RSTb(resde), .Q(d2[3]));

tomd416(.a0(d2[0]) , .a1(d2[1]) , .a2(d2[2]) , .a3(d2[3]) , .t(tom));
//
outputlogic(.A(d2) , .curstate(s) , .curchange(c) , .far(FarthCH) , .halfp(HapCH));
assign outled = d2;

endmodule 