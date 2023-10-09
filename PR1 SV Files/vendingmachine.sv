module vendingmachine(
input logic  coin[3:0],
input logic clk, clk50m,
input logic res,
output logic tom[3:0]
);

logic ei[1:0];
logic d[3:0];
logic d2[3:0];
//debounced clock signal
logic clkde , resde ; 

debouncer clkd( .A_noisy(clk), .CLK50M(clk50m) , .A(clkde) );
debouncer resd( .A_noisy(res), .CLK50M(clk50m) , .A(resde) );
//encoding the inputs to 2 bits which makes it easier to understand 
encoder (.y(coin) , .out(ei)) ;

//this is to call our nextstate logic 

statelogic( .s(d2)  , .y(ei) , .d(d));

D_FF_neg zero(.D(d[0]), .CLKb(clkde), .RSTb(resde), .Q(d2[0]));
D_FF_neg one(.D(d[1]), .CLKb(clkde), .RSTb(resde), .Q(d2[1]));
D_FF_neg two(.D(d[2]), .CLKb(clkde), .RSTb(resde), .Q(d2[2]));
D_FF_neg three(.D(d[3]), .CLKb(clkde), .RSTb(resde), .Q(d2[3]));

assign tom[3:0] = d2[3:0];
endmodule