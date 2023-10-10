// Author: LNU Sukhman Singh
// Date:
// Description:
// File Name: vendingmachine.sv
// This file contains the top level code for the vending machine


module vendingmachine(
    input logic  coin[3:0],
    // 0 is coin 0
    // 1 is Farthing,
    // 2 is HaPenny,
    // 3 is Penny
    
    input logic clk,    //noisy clock
    input logic clk50m, //50mhz clock
    input logic res,    //reset signal

    output logic tom[3:0]
);

logic ei[1:0];  //encoding
logic d[3:0];
logic d2[3:0];

//!Debounce the clock and reset signals___________________________________________________________________________________________________________________________________________________
//debounced clock signal
logic clkde, resde; 
//clkde = debounced clock signal
//resde = debounced reset signal

//debounce the clock signal
debouncer clkd(
    .A_noisy(clk),
    .CLK50M(clk50m),
    .A(clkde)
);

//debounce the reset signal
debouncer resd(
    .A_noisy(res),
    .CLK50M(clk50m) ,
    .A(resde)
);



//!Encoder the 4 bit coin inputs to 2 bits___________________________________________________________________________________________________________________________________________________________________
//encoding the 4 bit coin inputs to 2 bits which makes it easier to understand 
encoder (
    .y(coin),
    .out(ei)
);

//!State Logic_______________________________________________________________________________________________________________________________________________________________________________________________
//this is to call our nextstate logic 
statelogic(
    .s(d2),
    .y(ei),
    .d(d)
);

D_FF_neg zero(
    .D(d[0]),
    .CLKb(clkde),
    .RSTb(resde),
    .Q(d2[0])
);

//
D_FF_neg one(
    .D(d[1]),
    .CLKb(clkde),
    .RSTb(resde),
    .Q(d2[1])
);

D_FF_neg two(
    .D(d[2]),
    .CLKb(clkde),
    .RSTb(resde),
    .Q(d2[2])
);


D_FF_neg three(
    .D(d[3]),
    .CLKb(clkde),
    .RSTb(resde),
    .Q(d2[3])
);

assign tom[3:0] = d2[3:0]; //output of the state logic

endmodule