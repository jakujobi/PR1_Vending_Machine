// Author: John Akujobi
// Data: Sometime in September Fall 2023
// Create an SV file named “seven_seg.sv” that contains one SV module name seven_seg.
// Write structural SV to describe the operation of seven segment display driver.
// The description should include at least one “dec416” sub module.
// The module should have 4 input wires and have outputs so that when it is connected to a seven segment display the hex digits 0-F are displayed.

module seven_seg(
    input [3:0] sevIn,
    input sevEnable,        //enable: enable signal
    output logic [6:0] sevOut     //out: 16-bit output signal
);

logic [15:0] decOut;

//This instantiates a dec416 module with the input, enable, and output ports connected to dec_in, enable, and out respectively.
dec416 dec1(
    .in(sevIn),
    .enable(sevEnable),
    .out(decOut)
);

assign sevOut[0] = sevEnable & ~(decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[12] | decOut[14] | decOut[15]);
assign sevOut[1] = sevEnable & ~(decOut[0] | decOut[1] | decOut[2] | decOut[3] | decOut[4] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[13]);
assign sevOut[2] = sevEnable & ~(decOut[0] | decOut[1] | decOut[3] | decOut[4] | decOut[5] | decOut[6] | decOut[7] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[13]);
assign sevOut[3] = sevEnable & ~(decOut[0] | decOut[2] | decOut[3] | decOut[5] | decOut[6] | decOut[8] | decOut[9] | decOut[11] | decOut[12] | decOut[13] | decOut[14]);
assign sevOut[4] = sevEnable & ~(decOut[0] | decOut[2] | decOut[6] | decOut[8] | decOut[10]| decOut[11]| decOut[12] | decOut[13] | decOut[14] | decOut[15]);
assign sevOut[5] = sevEnable & ~(decOut[0] | decOut[4] | decOut[5] | decOut[6] | decOut[8] | decOut[9] | decOut[10] | decOut[11] | decOut[12] | decOut[14] | decOut[15]);
assign sevOut[6] = sevEnable & ~(decOut[2] | decOut[3] | decOut[4] | decOut[5] | decOut[6] |  decOut[8] |decOut[9] | decOut[10] | decOut[11] | decOut[13] | decOut[14] | decOut[15]);

endmodule