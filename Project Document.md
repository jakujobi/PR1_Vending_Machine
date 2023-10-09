
# Vending Machine Project

# **Team Members**

* John Akujobi
* LNU Sukman Singh

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

# **Outputs:**

| Signal                    | DE10-Lite I/O | Pin Assignment |
| :------------------------ | ------------- | -------------- |
| Current State Output      | LEDR [S-1:0]  | PIN_           |
| Least Significant Binary  | LEDR[0]       | PIN_A8         |
|                           | LEDR[1]       | PIN_A9         |
|                           | LEDR[2]       | PIN_A10        |
| Most Significant Binary   | LEDR[3]       | PIN_B10        |
| OUTPUTS                   |               |                |
| Tomato Output             | LEDR[9]       | PIN_B11        |
| Ha’penny Output - Change | LEDR[8]       | PIN_A11        |
| Farthing Output - Change  | LEDR[7]       | PIN_D14        |
| **(State) Farthings**    | HEX5          |                |
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

# States Required

## States:

* IDLE: Initial state where the machine is waiting for coin insertion.
* FARTHING: Machine has received a farthing (0.25d) coin.
* HAPENNY: Machine has received a ha'penny (0.5d) coin.
* PENNY: Machine has received a penny (1d) coin.
* DISPENSE: Machine is dispensing a rotten tomato and change.
* CHANGE_RETURN: Machine is giving change to the user.
* RESET: Machine is being reset by the user.

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

# State Transition Diagram

# State Transition / Output Table

# Required System Verilog Modules

# State Transition Diagram for Vending Machine:

## Code
