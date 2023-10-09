//this module is used to convert our 4 bit inputs to 2 bits 

module encoder(
input logic y[3:0] , 
output logic out[1:0]
);

assign out[0] = y[3]| y[1] ; 
assign out[1] = y[3]| y[2] ;

endmodule
