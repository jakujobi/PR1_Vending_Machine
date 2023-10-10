//
// This module implements the state logic for a vending machine. It takes in the current state (s), 
// the input (y), and outputs the next state (d). The state logic is implemented using a set of 
// Boolean equations that determine the next state based on the current state and input.
//
// Inputs:
// - s[3:0]: current state
// - y[1:0]: input
//
// Outputs:
// - d[3:0]: next state
//
module statelogic(
    input logic s[3:0], // the current state
    input logic y[1:0],
    output logic d[3:0] 
);


// Boolean equations for determining the next state based on the current state and input
assign d[0] = (
    (~s[1] & ~s[0] & ~y[1] & y[0] & ~s[2] & ~s[3]) | 
    (~s[1] & s[0] & ~y[1] & ~y[0] & ~s[2] & ~s[3]) | 
    (~s[1] & s[0] & y[1] & ~s[2] & ~s[3]) |
    (s[1] & s[0] & ~y[1] & y[0] & ~s[2] & ~s[3]) |
    (s[1] & ~s[0] & ~y[1] & ~y[0] & ~s[2] & ~s[3]) |
    (s[1] & ~s[0] & y[1] & ~s[2] & ~s[3]) |
    (~y[1] & y[0] & s[2] & ~s[3]) |
    (~s[1] & ~s[0] & y[0] & ~s[2] & s[3])
);

assign d[1] = (
    (~s[1] & y[1] & y[0] & ~s[2] & ~s[3]) |
    (~s[1] & s[0] & ~y[1] & y[0] & ~s[2] & ~s[3]) |
    (s[1] & ~y[1] & ~y[0] & ~s[2] & ~s[3]) |
    (s[1] & ~s[0] & y[0] & ~s[2] & ~s[3]) |
    (s[1] & ~s[0] & y[1] & y[0] & ~s[2] & ~s[3]) |
    (y[1] & ~y[0] & s[2] & ~s[3]) |
    (~s[1] & ~s[0] & y[1] & ~s[2] & s[3])
);

assign d[2] = (
    (~s[3] & ~s[2] & y[1] & y[0]) |
    (~s[2] & ~s[3] & y[0] & s[1] & s[0]) |
    (~s[2] & ~s[3] & y[1] & s[1]) |
    (s[2] & ~s[3] & ~s[1] & ~s[0] & ~y[1]) |
    (s[2] & ~s[3] & ~s[1] & ~s[0] & y[1] & ~y[0]) |
    (s[2] & ~s[3] & y[1] & y[0] & s[0]) |
    (s[2] & ~s[3] & y[1] & y[0] & s[1])
);

assign d[3] = (
    s[2] & ~s[3] & y[1] & y[0] & ~s[1] & ~s[0]
);

endmodule

// // Boolean equations for determining the next state based on the current state and input
// assign d[0] = (
//     (~s[1]  &   ~s[0]   &   ~y[1]   &   y[0]    &   ~s[2]   &   ~s[3]   ) | 
//     (~s[1]  &   s[0]    &   ~y[1]   &   ~y[0]   &   ~s[2]   &   ~s[3]   ) | 
//     (~s[1]  &   s[0]    &   y[1]    &   ~s[2]   &   ~s[3]   ) |
//     (s[1]&s[0]&~y[1]&y[0]&~s[2]&~s[3]) |
//     (s[1]&~s[0]&~y[1]&~y[0]&~s[2]&~s[3]) |
//     (s[1]&~s[0]&y[1]&~s[2]&~s[3]) |
//     (~y[1]&y[0]&s[2]&~s[3]) |
//     (~s[1]&~s[0]&y[0]&~s[2]&s[3])
// );

// assign d[1] = (
//     (~s[1]&y[1]&y[0]&~s[2]&~s[3]) |
//     (~s[1]&s[0]&~y[1]&y[0]&~s[2]&~s[3]) |
//     (s[1]&~y[1]&~y[0]&~s[2]&~s[3]) |
//     (s[1]&~s[0]&y[0]&~s[2]&~s[3]) |
//     (s[1]&~s[0]&y[1]&y[0]&~s[2]&~s[3]) |
//     (y[1]&~y[0]&s[2]&~s[3]) |
//     (~s[1]&~s[0]&y[1]&~s[2]&s[3])
// );


// assign d[2] = (
//     (~s[3]&~s[2]&y[1]&y[0]) |
//     (~s[2]&~s[3]&y[0]&s[1]&s[0]) |
//     (~s[2]&~s[3]&y[1]&s[1]) |
//     (s[2]&~s[3]&~s[1]&~s[0]&~y[1]) |
//     (s[2]&~s[3]&~s[1]&~s[0]&y[1]&~y[0]) |
//     (s[2]&~s[3]&y[1]&y[0]&s[0]) |
//     (s[2]&~s[3]&y[1]&y[0]&s[1])
// );

// assign d[3] = (
//     s[2]&~s[3]&y[1]&y[0]&~s[1]&~s[0]
// );

//endmodule