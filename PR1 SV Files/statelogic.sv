module statelogic(
input logic s[3:0],
input logic y[1:0], 
output logic d[3:0]
);

assign d[0] = ((~s[1] & ~s[0] & ~y[1] & y[0] & ~s[2] & ~s[3]) | (~s[1] & s[0] & ~y[1]&~y[0]&~s[2]&~s[3]) | (~s[1]&s[0]&y[1]&~s[2]&~s[3])| (s[1]&s[0]&~y[1]&y[0]&~s[2]&~s[3]) | (s[1]&~s[0]&~y[1]&~y[0]&~s[2]&~s[3]) | (s[1]&~s[0]&y[1]&~s[2]&~s[3]) | (~y[1]&y[0]&s[2]&~s[3]) | (~s[1]&~s[0]&y[0]&~s[2]&s[3]));
assign d[1] = ((~s[1]&y[1]&y[0]&~s[2]&~s[3]) | (~s[1]&s[0]&~y[1]&y[0]&~s[2]&~s[3])| (s[1]&~y[1]&~y[0]&~s[2]&~s[3]) | (s[1]&~s[0]&y[0]&~s[2]&~s[3]) | (s[1]&~s[0]&y[1]&y[0]&~s[2]&~s[3]) | (y[1]&~y[0]&s[2]&~s[3]) | (~s[1]&~s[0]&y[1]&~s[2]&s[3]));
assign d[2] = ((~s[3]&~s[2]&y[1]&y[0]) | (~s[2]&~s[3]&y[0]&s[1]&s[0]) | (~s[2]&~s[3]&y[1]&s[1]) | (s[2]&~s[3]&~s[1]&~s[0]&~y[1]) | (s[2]&~s[3]&~s[1]&~s[0]&y[1]&~y[0]) | (s[2]&~s[3]&y[1]&y[0]&s[0]) | (s[2]&~s[3]&y[1]&y[0]&s[1]));
assign d[3] = (s[2]&~s[3]&y[1]&y[0]&~s[1]&~s[0]);

endmodule