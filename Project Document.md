
# Vending Machine Project

# **Team Members**

* John Akujobi
* LNU Sukman Singh

---

# **Inputs:**

| Signal                | DE10-Lite I/O | Pin Assignment |
| --------------------- | ------------- | -------------- |
| Farthing (0.25d) - F  | SW 0          | PIN_C10        |
| Half-Penny (0.5d) - H | SW 1          | PIN_C11        |
| Penny (1d) - P        | SW 2          | PIN_D12        |
| CLK Input             | KEY0          | PIN_B8         |
| RES Input             | KEY1          | PIN_A7         |

1. **Farthing (0.25d)** :
   * Lowest value input to the vending machine.
2. **Ha'penny (0.5d)** :
   * Another coin input to the vending machine.
3. **Penny (1d)** :
   * The highest value coin input to the vending machine.
4. **Raw Clock Input (CLK)** :
   * This is the clock signal for the state machine.
   * It will be passed through [debouncer.sv](http://debouncer.sv/)
   * Connected to KEY0
   * Connects into CLK_deb
5. **Reset Input (RES)** :
   * This is an asynchronous reset signal that can reset the total back to zero.

---

# **Outputs:**

| Signal                    | DE10-Lite I/O | Pin Assignment |
| ------------------------- | ------------- | -------------- |
| Current State Output      | LEDR [S-1:0]  | PIN_           |
| Least Significant Binary  | LEDR[0]       | PIN_A8         |
|                           | LEDR[1]       | PIN_A9         |
|                           | LEDR[2]       | PIN_A10        |
| Most Significant Binary   | LEDR[3]       | PIN_B10        |
| OUTPUTS                   |               |                |
| Tomato Output             | LEDR[9]       | PIN_B11        |
| Ha’penny Output - Change | LEDR[8]       | PIN_A11        |
| Farthing Output - Change  | LEDR[7]       | PIN_D14        |
| (State) Farthings         | HEX5          |                |
| a                         | HEX50         | PIN_J20        |
| b                         | HEX51         | PIN_K20        |
| c                         | HEX52         | PIN_L18        |
| d                         | HEX53         | PIN_N18        |
| e                         | HEX54         | PIN_M20        |
| f                         | HEX55         | PIN_N19        |
| g                         | HEX56         | PIN_N20        |
| (Change) Farthings        | HEX0          |                |
| a                         | HEX00         | PIN_C14        |
| b                         | HEX01         | PIN_E15        |
| c                         | HEX02         | PIN_C15        |
| d                         | HEX03         | PIN_C16        |
| e                         | HEX04         | PIN_E16        |
| f                         | HEX05         | PIN_D17        |
| g                         | HEX06         | PIN_C17        |

1. **Rotten Tomato Dispense Signal** :
   * This signal is activated when the vending machine dispenses a rotten tomato.
2. **Change Dispense Signals** :
   * These signals are activated when the vending machine dispenses change in the form of farthings and ha'pennies.
3. **Current State Display** :
   * This is a 7-segment display showing the current amount of money in the machine (in farthings).
4. **Change Display** :
   * This is another 7-segment display showing the amount of change dispensed by the machine (in dollars).
5. **State Indicator LEDs** :
   * These LEDs indicate the current state of the machine.

---

# Assumptions

1. **Coin Input** : It's assumed that the coins are inserted one at a time and the machine can correctly identify each coin type (farthing, ha'penny, penny).
   That is, two coins are not inserted at the same time
2. **User Interaction** : It's assumed that users will wait for their change and the dispensed rotten tomato before inserting more coins for the next purchase.
3. **Reset Function** : It's assumed that the reset function, when activated, will successfully reset the machine to its initial state.
4. **Display Readability** : It's assumed that the 7-segment displays are clear and readable, allowing users to understand the current state of the machine and the amount of change. And that they work.
   For our DE-10 Lite boards, we don’t have to worry much about this
5. **Change Availability** : It's assumed that the machine always has enough farthings and ha'pennies to give change.
6. **Rotten Tomato Availability** : It's assumed that the machine is always stocked with rotten tomatoes to dispense. Though our DE-10 Lite boards don’t have tomatoes.
7. **Clock Signal** : It's assumed that the clock signal is stable and reliable for the operation of the state machine.
8. **Power Supply** : It's assumed that the machine has a continuous and stable power supply. That there are no blackouts
9. **Environment** : It's assumed that the machine is used in an environment that does not affect its operation (e.g., no extreme temperatures, humidity, etc.).

---

# States Required

| Nn | State         | State Bit | Description                                                    |
| -- | ------------- | --------- | -------------------------------------------------------------- |
| 0  | IDLE          |           | Initial state where the machine is waiting for coin insertion. |
| 1  | FARTHING      |           | Machine has received a farthing (0.25d) coin.                  |
| 2  | HAPENNY       |           | Machine has received a ha'penny (0.5d) coin.                   |
| 3  | PENNY         |           | Machine has received a penny (1d) coin.                        |
| 4  | DISPENSE      |           | The machine is dispensing a rotten tomato and change.          |
| 5  | CHANGE_RETURN |           | Machine is giving change to the user.                          |
| 6  | RESET         |           | Machine is being reset by the user.                            |
| 7  |               |           |                                                                |
| 8  |               |           |                                                                |

## Transitions:

1. `IDLE` -> `FARTHING`: When a farthing coin is inserted.
2. `IDLE` -> `HAPENNY`: When a ha'penny coin is inserted.
3. `IDLE` -> `PENNY`: When a penny coin is inserted.
4. `FARTHING`, `HAPENNY`, `PENNY` -> DISPENSE: When the total reaches 1.25d (penny and farthing received).
5. `DISPENSE` -> `CHANGE_RETURN`: After dispensing a rotten tomato, if change is required.
6. `CHANGE_RETURN` -> `IDLE`: After giving change, returning to the idle state.
7. `CHANGE_RETURN` -> `FARTHING`, `HAPENNY`, `PENNY`: If more coins are inserted after change is given.
8. `CHANGE_RETURN` -> `RESET`: If the user initiates a reset after receiving change.
9. `RESET` -> `IDLE`: Resetting the machine to the initial state.

## Explanations:

* The machine starts in the IDLE state, waiting for a coin to be inserted
  * Most likely, this is a long time before Shakespeare takes to the stage.
* Coins can be inserted in any order (farthing, ha'penny, penny), and the machine transitions to the corresponding states.
* When the total reaches 1.25d (penny and farthing received), the machine moves to the DISPENSE state.
* After dispensing a rotten tomato and change, it transitions to CHANGE_RETURN if more coins are inserted or back to IDLE if the user doesn't insert more coins.
* If the user initiates a reset, the machine goes to the RESET state and can return to IDLE after the reset is complete.

---

# State Transition Diagram

.

---

# State Transition / Output Table

.

---

# Required System Verilog Modules

## Vending Machine

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

## Encoder 4:2

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

## Debouncer

### Name

* debouncer

### Filename

* [debouncer.sv](http://debouncer.sv)

### Description

* We use this to clean up the signals from the clock and reset buttons

### Inputs

* `**A_noisy`** - signal to be debounced
* `**CLK50M`** - 50 MHz clock from the DE10 board (PIN_P11)

### Outputs

* `**A**` - debounced signal to be used in your circuit

### Module Function Call

```verilog
debouncer mod1 (
	.A_noisy(#), //noisy signal input
	.CLK50M(#), //internal clock of
	.A(#) //clean output signal
);
```

### Module Code

```verilog
/*
Author: Dr. Hansen
Date: Feb. 9, 2022
Description: takes a 1-bit noisy input and outputs a 1-bit clean signal

Inputs:
	A_noisy - signal to be debounced
	CLK50M  - 50 MHz clock from the DE10 board (PIN_P11)

Outputs:
	A	     - debounced signal to be used in your circuit
*/

module debouncer(
	input logic A_noisy,
	input logic CLK50M, 
	output logic A
);

	logic [15:0] COUNT;
	parameter [15:0] COMPARE = 50_000; //1 millisecond

	logic t_d, t_r, Anext;

	/*
	1 ms timer
	*/
	always_ff@(posedge CLK50M)
	begin
		if(t_r)
			COUNT <= 16'd0;
		else
			COUNT <= COUNT + 16'd1;
	end
	assign t_d = (COUNT >= COMPARE);

	//next-state logic 
	assign Anext = (A_noisy & t_d) | (A & ~t_d);

	//state
	always_ff@(posedge CLK50M)
		A <= Anext;

	//output logic 
	assign t_r = t_d | (~A & ~A_noisy) | (A & A_noisy);

endmodule
```

.

## Next State Logic

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

## State Memory

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

## Decoder 4:16

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Module Function Call

```verilog
//This instantiates a dec416 module with the input, enable, and output ports connected to dec_in, enable, and out respectively.
dec416 dec1(
    .in(#), //input 4 bit output
    .enable(#), //enable
    .out(#) //output 16 bit 
);
```

### Code

```verilog
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
```

.

## Output Logic

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

## Seven Segment Display

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Module Function Call

```verilog
seven_seg seg1(
    .sevIn(#),    //in: 4-bit input signal (connected to in)
    .sevEnable(#),    //enable: enable signal (connected to enable)
    .sevOut(#)   //out: 7-bit output signal
);
```

### Code

```verilog
// Author: John Akujobi
// Data: Sometime in September Fall 2023
// Create an SV file named “seven_seg.sv” that contains one SV module name seven_seg.
// Write structural SV to describe the operation of seven segment display driver.
// The description should include at least one “dec416” sub module.
// The module should have 4 input wires and have outputs so that when it is connected to a seven segment display the hex digits 0-F are displayed.

module seven_seg(
    input [3:0] sevIn,
    input sevEnable,        //enable: enable signal
    output logic [6:0] sevOut     //out: 7-bit output signal
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
```

.

## JK_FF_neg

### Name

### Filename

### Description

* .
* Implements a negative-edge JK flip-flop.
* On the negative edge of CLKb, Q := JQ' + KQ
* Asynchronous, negative-edge reset

### Inputs

* .

### Outputs

* .

### Code

```verilog
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
```

.

## Mod Temp

### Name

### Filename

### Description

* .

### Inputs

* .

### Outputs

* .

### Code

```verilog

```

.

---

# State Transition Diagram for Vending Machine:
