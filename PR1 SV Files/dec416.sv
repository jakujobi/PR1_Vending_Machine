// Author: John Akujobi
// Date: Sometime in September Fall 2023
// Description: 
// This module is a 4-to-16 decoder that takes a 4-bit input and generates a 16-bit output. 
// The output is a binary number that represents the input value in binary. 
// The enable input is used to enable/disable the output. 
// When enable is low, the output is disabled and set to 0. 
// When enable is high, the output is enabled and set to the binary representation of the input value.
// The module uses a case statement to generate the output based on the input value.
// If the input value is not in the range of 1 to 16, the output is set to 0x8000 (binary 1000000000000000).

module dec416 (
    input logic [3:0] in,
    input enable, // enable signal
    output logic [15:0] out
);    

    // The decoder logic
    always @(*) begin
        case (in)
            4'b0000: out = 16'b0000000000000001;
            4'b0001: out = 16'b0000000000000010;
            4'b0010: out = 16'b0000000000000100;
            4'b0011: out = 16'b0000000000001000;
            4'b0100: out = 16'b0000000000010000;
            4'b0101: out = 16'b0000000000100000;
            4'b0110: out = 16'b0000000001000000;
            4'b0111: out = 16'b0000000010000000;
            4'b1000: out = 16'b0000000100000000;
            4'b1001: out = 16'b0000001000000000;
            4'b1010: out = 16'b0000010000000000;
            4'b1011: out = 16'b0000100000000000;
            4'b1100: out = 16'b0001000000000000;
            4'b1101: out = 16'b0010000000000000;
            4'b1110: out = 16'b0100000000000000;
            4'b1111: out = 16'b1000000000000000;
        endcase
        
        // Output is disabled when enable is low
        if (!enable) begin
            out <= 16'b0000000000000000;
        end
    end

endmodule