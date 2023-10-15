module outputlogic(
 input logic A[3:0],
 output logic curstate[6:0] , curchange[6:0] , far , halfp
);


seven_seg (.A(A) , .S(curstate));
changesev (.A(A) ,.S(curchange) , .h(halfp) , .f(far) ) ;

endmodule 