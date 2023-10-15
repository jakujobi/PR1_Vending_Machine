/*
 * Author: Dr. Hansen   
 * Date: Feb. 16, 2022
 *
 * Description: 
 * Implements a negative-edge JK flip-flop.
 * On the negative edge of CLKb, Q := JQ' + KQ  
 * Asynchronous, negative-edge reset
 *
 * Inputs:
 * J - J input
 * K - K input
 * CLKb - Negative edge clock input 
 * RSTb - Asynchronous, negative edge reset
 * 
 * Outputs:
 * Q - Outputs JQ' + KQ on negative edge of CLKb
 * Qb - Outputs Q' on negative edge of CLKb
 * 
 * History: 
 * Feb. 16, 2022 - Created
*/

module JK_FF_neg (
    input logic J, K, CLKb, RSTb,
    output logic Q, Qb
);

always_ff @(negedge CLKb, negedge RSTb)
begin 
    if (RSTb == 1'b0)
        begin
            Q <= 1'b0; 
        end
    else
        begin
            Q <= (J & Qb) | (K & Q);
        end
end

assign Qb = ~Q;

endmodule